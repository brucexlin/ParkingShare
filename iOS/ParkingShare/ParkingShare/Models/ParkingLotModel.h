//
//  ParkingLotModel.h
//  ParkingShare
//
//  Created by Qing Sun on 4/11/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReservationModel.h"

@interface ParkingLotModel : NSObject

@property (nonatomic) NSInteger parkingLotId;
@property (strong, nonatomic) ReservationModel *userReservation;
@property (strong, nonatomic) NSString *address;
@property (nonatomic) NSInteger availableSlots;
@property (nonatomic) NSInteger hourlyRate;


@end
