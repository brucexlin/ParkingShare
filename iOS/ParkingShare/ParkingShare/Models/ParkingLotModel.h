//
//  ParkingLotModel.h
//  ParkingShare
//
//  Created by Qing Sun on 4/11/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BaiduMapAPI/BMapKit.h>
#import "ReservationModel.h"


@interface ParkingLotModel : NSObject <BMKAnnotation>

@property (strong, nonatomic) NSString *parkingLotId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *telephone;
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic) NSInteger availableSlots;
@property (nonatomic) NSInteger hourlyRate;
@property (nonatomic) BOOL openAllDay;
@property (nonatomic) NSInteger openTimeHour;
@property (nonatomic) NSInteger openTimeMinute;
@property (nonatomic) NSInteger closeTimeHour;
@property (nonatomic) NSInteger closeTimeMinute;

+ (ParkingLotModel *)parkingLotModelWithId:(NSString *)parkingLotId;

@end
