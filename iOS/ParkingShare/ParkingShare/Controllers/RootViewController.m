//
//  RootViewController.m
//  ParkingShare
//
//  Created by Qing Sun on 4/11/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import "RootViewController.h"
#import "MasterViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        [[MasterViewController instance] registerViewController:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
