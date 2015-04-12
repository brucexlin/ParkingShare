//
//  ReservationModel.h
//  ParkingShare
//
//  Created by Qing Sun on 4/11/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReservationModel : NSObject

@property (strong, nonatomic) NSDate *startDate;
@property (strong, nonatomic) NSDate *endDate;
@property (nonatomic) NSInteger hourlyRate;
@property (nonatomic) NSInteger totalPrice;

@end
