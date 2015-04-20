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
#import "AppContext.h"
#import <BaiduMapAPI/BMapKit.h>

#define MAP_DEFAULT_ZOOM_LEVEL 17

@interface MapViewController ()

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
    
    self.mapView.trafficEnabled = YES;
    self.mapView.zoomLevel = MAP_DEFAULT_ZOOM_LEVEL;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [self.mapView viewWillAppear];
    self.mapView.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.mapView viewWillDisappear];
    self.mapView.delegate = nil;
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar resignFirstResponder];
    [self processSearch];
}

- (void)processSearch {
    CLLocationCoordinate2D centerCoord = CLLocationCoordinate2DMake(39.979613, 116.408477);
    ParkingLotModel *plModel1 = [[ParkingLotModel alloc] init];
    plModel1.parkingLotId = @"PL001";
    plModel1.name = @"安贞里小区";
    plModel1.address = @"朝阳安贞路,与北三环中路路口以北约100米路东";
    plModel1.telephone = @"(010)64418903";
    plModel1.availableSlots = 16;
    plModel1.hourlyRate = 800;
    plModel1.coord = CLLocationCoordinate2DMake(39.978324, 116.411791);
    
    ParkingLotModel *plModel2 = [[ParkingLotModel alloc] init];
    plModel2.parkingLotId = @"PL002";
    plModel2.name = @"安贞西里小区(东门)";
    plModel2.address = @"安贞西里小区";
    plModel2.telephone = @"";
    plModel2.availableSlots = 10;
    plModel2.hourlyRate = 950;
    plModel2.coord = CLLocationCoordinate2DMake(39.979989, 116.407971);
    [self.mapView setCenterCoordinate:centerCoord animated:YES];
    
    NSArray *parkingLots = @[plModel1, plModel2];
    
    [self.mapView addAnnotations:parkingLots];
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
    [VC(RootViewController) showViewController:rootViewController.leftViewController];
}

- (void)listViewButtonPressed:(id)sender {
    
}

- (void)hudReservePressed:(LocationHUDView *)sender {
    
}

- (void)hudCancelPressed:(LocationHUDView *)sender {
    
}

- (void)hudNavigatePressed:(LocationHUDView *)sender {
    
}

- (void)hudInfoPressed:(LocationHUDView *)sender {
    
}

@end
