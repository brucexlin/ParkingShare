//
//  ParkingLotDisplayView.m
//  ParkingShare
//
//  Created by Qing Sun on 4/25/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import "ParkingLotDisplayView.h"

@implementation ParkingLotDisplayView

- (void)setupWithParkingLot:(ParkingLotModel *)plModel {
    self.addressLabel.text = plModel.address;
    self.telephoneLabel.text = plModel.telephone;
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", plModel.parkingLotId]];
}

@end
