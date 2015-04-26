//
//  ReservationModel.m
//  ParkingShare
//
//  Created by Qing Sun on 4/11/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import "ReservationModel.h"

@implementation ReservationModel

- (instancetype)initWithParkingLotId:(NSString *)parkingLotId startDate:(NSDate *)startDate endDate:(NSDate *)endDate hourlyRate:(NSInteger)hourlyRate totalPrice:(NSInteger)totalPrice {
    self = [super init];
    if (self) {
        self.parkingLotId = parkingLotId;
        self.startDate = startDate;
        self.endDate = endDate;
        self.hourlyRate = hourlyRate;
        self.totalPrice = totalPrice;
    }
    return self;
}

@end
