//
//  UserInfoModel.h
//  ParkingShare
//
//  Created by Qing Sun on 4/11/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReservationModel.h"

@interface UserInfoModel : NSObject

@property (strong, nonatomic) NSMutableArray *userReservation;

- (void)addReservation:(ReservationModel *)reservation;

- (ReservationModel *)reservationForParkingLot:(NSString *)parkingLotId;

@end
