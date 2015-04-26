//
//  ParkingLotDisplayView.h
//  ParkingShare
//
//  Created by Qing Sun on 4/25/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import "XibView.h"
#import "ParkingLotModel.h"

@interface ParkingLotDisplayView : XibView

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UILabel *telephoneLabel;

- (void)setupWithParkingLot:(ParkingLotModel *)plModel;

@end
