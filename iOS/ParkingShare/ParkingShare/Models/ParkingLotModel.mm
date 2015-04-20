//
//  ParkingLotModel.m
//  ParkingShare
//
//  Created by Qing Sun on 4/11/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import "ParkingLotModel.h"

@implementation ParkingLotModel

- (CLLocationCoordinate2D)coordinate {
    return _coord;
}

- (NSString *)title {
    return _name;
}

@end
