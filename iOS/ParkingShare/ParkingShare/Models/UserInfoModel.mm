//
//  UserInfoModel.m
//  ParkingShare
//
//  Created by Qing Sun on 4/11/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import "UserInfoModel.h"

@implementation UserInfoModel

- (void)addReservation:(ReservationModel *)reservation {
    [self.userReservation addObject:reservation];
}

- (ReservationModel *)reservationForParkingLot:(NSString *)parkingLotId {
    for (ReservationModel *reservation in self.userReservation) {
        if ([reservation.parkingLotId isEqualToString:parkingLotId]) {
            return reservation;
        }
    }
    return nil;
}

@end
