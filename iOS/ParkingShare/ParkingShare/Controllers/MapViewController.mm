//
//  MapViewController.m
//  ParkingShare
//
//  Created by Qing Sun on 4/11/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import "MapViewController.h"
#import "MasterViewController.h"
#import "RootViewController.h"
#import "ParkingLotModel.h"
#import "ParkingLotDetailViewController.h"
#import "AppContext.h"
#import "ReserveViewController.h"
#import <BaiduMapAPI/BMapKit.h>

#define MAP_DEFAULT_ZOOM_LEVEL 17

@interface MapViewController ()

@property (strong, nonatomic) ParkingLotModel *selectedParkingLotModel;
@property (nonatomic) CLLocationCoordinate2D currentLocation;

@end

@implementation MapViewController


- (instancetype)init {
    self = [super init];
    if (self) {
        self.mapManager = [[BMKMapManager alloc] init];
        BOOL ret = [self.mapManager start:@"WeWAtQAZxb9a92QvhPbdbFk5"  generalDelegate:nil];
        if (!ret) {
            NSLog(@"manager start failed!");
        }
        self.poiSearch = [[BMKPoiSearch alloc] init];
        self.poiSearch.delegate = self;
        self.searchBar.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentLocation = self.mapView.centerCoordinate;
    self.mapView.trafficEnabled = YES;
    self.mapView.zoomLevel = MAP_DEFAULT_ZOOM_LEVEL;
    self.detailView.transform = CGAffineTransformMakeTranslation(0, 80);
}

- (BOOL)wantsFullScreenLayout {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [MasterViewController instance].navigationBarHidden = YES;
    [self.mapView viewWillAppear];
    self.mapView.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [MasterViewController instance].navigationBarHidden = NO;
    [self.mapView viewWillDisappear];
    self.mapView.delegate = nil;
    [self.mapManager stop];
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar resignFirstResponder];
    [self processSearch];
}

- (void)processSearch {
    [self.mapView removeAnnotations:self.mapView.annotations];
    
    CLLocationCoordinate2D centerCoord = CLLocationCoordinate2DMake(39.979613, 116.408477);
    ParkingLotModel *plModel1 = [ParkingLotModel parkingLotModelWithId:@"PL001"];
    ParkingLotModel *plModel2 = [ParkingLotModel parkingLotModelWithId:@"PL002"];
    [self.mapView setCenterCoordinate:centerCoord animated:YES];
    
    NSArray *parkingLots = @[plModel1, plModel2];
    
    [self.mapView addAnnotations:parkingLots];
}

- (void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view {
    ParkingLotModel *plModel = view.annotation;
    self.selectedParkingLotModel = plModel;
    self.parkingLotNameLabel.text = plModel.name;
    self.slotCountLabel.text = [NSString stringWithFormat:@"%ld", (long)plModel.availableSlots];
    self.priceLabel.text = [NSString stringWithFormat:@"%0.2f", (float)plModel.hourlyRate / 100];
    
    [UIView animateWithDuration:0.2f animations:^{
        self.detailView.transform = CGAffineTransformIdentity;
    }];
}

- (void)mapView:(BMKMapView *)mapView didDeselectAnnotationView:(BMKAnnotationView *)view {
    self.selectedParkingLotModel = nil;
    [UIView animateWithDuration:0.2f animations:^{
        self.detailView.transform = CGAffineTransformMakeTranslation(0, 80);
    }];
}

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation {
    ParkingLotModel *plModel = annotation;
    BMKPinAnnotationView *annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:plModel.parkingLotId];
    annotationView.pinColor = BMKPinAnnotationColorGreen;
    annotationView.animatesDrop = YES;
    annotationView.draggable = NO;
    LocationHUDView *hudView = [[LocationHUDView alloc] initWithParkingLot:plModel userInfo:[AppContext instance].userInfo delegate:self];
    BMKActionPaopaoView *paopaoView = [[BMKActionPaopaoView alloc] initWithCustomView:hudView];
    annotationView.paopaoView = paopaoView;
    return annotationView;
}

- (void)menuButtonPressed:(id)sender {
    RootViewController *rootViewController = VC(RootViewController);
    [rootViewController showViewController:rootViewController.leftViewController];
}

- (void)listViewButtonPressed:(id)sender {
    
}

- (void)detailViewButtonPressed:(id)sender {
    ParkingLotDetailViewController *parkingLotDetailViewController = VC(ParkingLotDetailViewController);
    parkingLotDetailViewController.parkingLotModel = self.selectedParkingLotModel;
    [[MasterViewController instance] jumpToViewController:parkingLotDetailViewController];
}

- (void)hudReservePressed:(LocationHUDView *)sender {
    ReserveViewController *reserveViewController = VC(ReserveViewController);
    reserveViewController.parkingLotModel = self.selectedParkingLotModel;
    [[MasterViewController instance] jumpToViewController:reserveViewController];
}

- (void)hudCancelPressed:(LocationHUDView *)sender {
    
}

- (void)hudNavigatePressed:(LocationHUDView *)sender {
    NSString *directionsRequest;
    if ([[UIApplication sharedApplication] canOpenURL:
         [NSURL URLWithString:@"comgooglemaps://"]]) {
        directionsRequest = [NSString stringWithFormat: @"comgooglemaps://?daddr=%f,%f&saddr=%f,%f", self.selectedParkingLotModel.coordinate.latitude, self.selectedParkingLotModel.coordinate.longitude, self.currentLocation.latitude, self.currentLocation.longitude];
    } else {
        directionsRequest = [NSString stringWithFormat: @"http://maps.apple.com/maps?daddr=%f,%f&saddr=%f,%f", self.selectedParkingLotModel.coordinate.latitude, self.selectedParkingLotModel.coordinate.longitude, self.currentLocation.latitude, self.currentLocation.longitude];
    }
    NSURL *directionsURL = [NSURL URLWithString:directionsRequest];
    [[UIApplication sharedApplication] openURL:directionsURL];
}

- (void)hudInfoPressed:(LocationHUDView *)sender {
    ParkingLotDetailViewController *parkingLotDetailViewController = VC(ParkingLotDetailViewController);
    parkingLotDetailViewController.parkingLotModel = self.selectedParkingLotModel;
    [[MasterViewController instance] jumpToViewController:parkingLotDetailViewController];
}

@end
