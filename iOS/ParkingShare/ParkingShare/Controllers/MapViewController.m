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

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)menuButtonPressed:(id)sender {
    RootViewController *rootViewController = VC(RootViewController);
    [VC(RootViewController) showViewController:rootViewController.leftViewController];
}

- (void)listViewButtonPressed:(id)sender {
    
}

@end
