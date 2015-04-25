//
//  ParkingLotDetailViewController.h
//  ParkingShare
//
//  Created by Qing Sun on 4/24/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParkingLotModel.h"

@interface ParkingLotDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *detailTableView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UILabel *telephoneLabel;

@property (weak, nonatomic) ParkingLotModel *parkingLotModel;


@end
