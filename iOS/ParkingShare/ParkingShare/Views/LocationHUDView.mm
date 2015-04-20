//
//  LocationHUDView.m
//  ParkingShare
//
//  Created by Qing Sun on 4/11/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import "LocationHUDView.h"

@interface LocationHUDView ()

@property (weak, nonatomic) id<LocationHUDDelegate> delegate;
@property (weak, nonatomic) ParkingLotModel *parkingLot;
@property (weak, nonatomic) UserInfoModel *userInfo;

@end

@implementation LocationHUDView

- (instancetype)initWithParkingLot:(ParkingLotModel *)parkingLot userInfo:(UserInfoModel *)userInfo delegate:(id<LocationHUDDelegate>)delegate {
    self = [super init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}


- (void)setupView {
    
}

- (void)setupDelegate {
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
