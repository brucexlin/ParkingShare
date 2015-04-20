//
//  AppContext.m
//  ParkingShare
//
//  Created by Qing Sun on 4/19/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import "AppContext.h"
#import "ReservationModel.h"

@implementation AppContext

+ (AppContext *)instance {
    static AppContext *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[AppContext alloc] init];
    });
    return instance;
}


- (instancetype)init {
    self = [super init];
    if (self) {
        [self loadDummyData];
    }
    return self;
}

- (void)loadDummyData {
    self.userInfo = [[UserInfoModel alloc] init];
    NSMutableDictionary *dummyReservations = [NSMutableDictionary dictionary];
    ReservationModel *res1 = [[ReservationModel alloc] init];
    NSTimeInterval oneHour = 3600;
    res1.startDate = [NSDate dateWithTimeIntervalSinceNow:oneHour];
    res1.endDate = [NSDate dateWithTimeIntervalSinceNow:4 * oneHour];
    res1.hourlyRate = 800;
    res1.totalPrice = [res1.endDate timeIntervalSinceDate:res1.startDate] / oneHour * res1.hourlyRate;
    [dummyReservations setObject:res1 forKey:@"PL001"];
    self.userInfo.userReservation = dummyReservations;
}


@end
