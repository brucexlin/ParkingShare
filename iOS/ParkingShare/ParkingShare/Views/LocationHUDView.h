//
//  LocationHUDView.h
//  ParkingShare
//
//  Created by Qing Sun on 4/11/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParkingLotModel.h"
#import "UserInfoModel.h"

@class LocationHUDView;
@protocol LocationHUDDelegate <NSObject>

- (void)hudReservePressed:(LocationHUDView *)sender;
- (void)hudCancelPressed:(LocationHUDView *)sender;
- (void)hudNavigatePressed:(LocationHUDView *)sender;
- (void)hudInfoPressed:(LocationHUDView *)sender;


@end

@interface LocationHUDView : UIView

@property (strong, nonatomic) UIButton *reserveButton;
@property (strong, nonatomic) UIButton *cancelButton;
@property (strong, nonatomic) UIButton *navigateButton;
@property (strong, nonatomic) UIButton *infoButton;

- (instancetype)initWithParkingLot:(ParkingLotModel *)parkingLot userInfo:(UserInfoModel *)userInfo delegate:(id<LocationHUDDelegate>)delegate;

@end
