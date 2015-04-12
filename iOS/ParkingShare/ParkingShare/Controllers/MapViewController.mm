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
#import <BaiduMapAPI/BMapKit.h>

@interface MapViewController ()

@end

@implementation MapViewController


- (instancetype)init {
    self = [super init];
    if (self) {
        self.mapManager = [[BMKMapManager alloc]init];
        BOOL ret = [self.mapManager start:@"WeWAtQAZxb9a92QvhPbdbFk5"  generalDelegate:nil];
        if (!ret) {
            NSLog(@"manager start failed!");
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
