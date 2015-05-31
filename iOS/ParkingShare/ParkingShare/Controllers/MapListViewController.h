//
//  MapListViewController.h
//  ParkingShare
//
//  Created by Qing Sun on 5/31/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI/BMapKit.h>

@interface MapListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *parkingLotsList;
@property (strong, nonatomic) BMKUserLocation *currentLocation;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *sortingControl;

@end
