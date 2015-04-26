//
//  ParkingLotModel.m
//  ParkingShare
//
//  Created by Qing Sun on 4/11/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import "ParkingLotModel.h"

@implementation ParkingLotModel

+ (ParkingLotModel *)parkingLotModelWithId:(NSString *)parkingLotId {
    static NSDictionary *dict = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ParkingLotModel *plModel1 = [[ParkingLotModel alloc] init];
        plModel1.parkingLotId = @"PL001";
        plModel1.name = @"安贞里小区";
        plModel1.address = @"朝阳安贞路,与北三环中路路口以北约100米路东";
        plModel1.telephone = @"(010)64418903";
        plModel1.availableSlots = 16;
        plModel1.hourlyRate = 800;
        plModel1.openAllDay = NO;
        plModel1.openTimeHour = 9;
        plModel1.openTimeMinute = 0;
        plModel1.closeTimeHour = 19;
        plModel1.closeTimeMinute = 0;
        plModel1.coord = CLLocationCoordinate2DMake(39.978324, 116.411791);
        
        ParkingLotModel *plModel2 = [[ParkingLotModel alloc] init];
        plModel2.parkingLotId = @"PL002";
        plModel2.name = @"安贞西里小区(东门)";
        plModel2.address = @"安贞西里小区";
        plModel2.telephone = @"(010)64418903";
        plModel2.availableSlots = 10;
        plModel2.hourlyRate = 950;
        plModel2.openAllDay = NO;
        plModel2.openTimeHour = 8;
        plModel2.openTimeMinute = 30;
        plModel2.closeTimeHour = 18;
        plModel2.closeTimeMinute = 30;
        plModel2.coord = CLLocationCoordinate2DMake(39.979989, 116.407971);
        dict = @{plModel1.parkingLotId : plModel1,
                 plModel2.parkingLotId : plModel2};
    });
    return [dict objectForKey:parkingLotId];
}

- (CLLocationCoordinate2D)coordinate {
    return _coord;
}

- (NSString *)title {
    return _name;
}

@end
