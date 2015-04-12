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

@interface LocationHUDView : XibView

@property (strong, nonatomic) IBOutlet UIButton *reserveButton;
@property (strong, nonatomic) IBOutlet UIButton *cancelButton;
@property (strong, nonatomic) IBOutlet UIButton *navigateButton;
@property (strong, nonatomic) IBOutlet UIButton *infoButton;


@end
