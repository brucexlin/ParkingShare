//
//  LocationHUDView.h
//  ParkingShare
//
//  Created by Qing Sun on 4/11/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XibView.h"
#import "ParkingLotModel.h"
#import "UserInfoModel.h"

@class LocationHUDView;
@protocol LocationHUDDelegate <NSObject>

- (void)hudReservePressed:(LocationHUDView *)sender;
- (void)hudCancelPressed:(LocationHUDView *)sender;
- (void)hudNavigatePressed:(LocationHUDView *)sender;
- (void)hudInfoPressed:(LocationHUDView *)sender;


@end

@interface LocationHUDView : XibView

@property (strong, nonatomic) IBOutlet UIButton *reserveButton;
@property (strong, nonatomic) IBOutlet UIButton *cancelButton;
@property (strong, nonatomic) IBOutlet UIButton *navigateButton;
@property (strong, nonatomic) IBOutlet UIButton *infoButton;

- (instancetype)initWithParkingLot:(ParkingLotModel *)parkingLot userInfo:(UserInfoModel *)userInfo delegate:(id<LocationHUDDelegate>)delegate;

@end
