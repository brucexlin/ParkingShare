//
//  ReserveViewController.h
//  ParkingShare
//
//  Created by Xinda Lin on 4/25/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParkingLotModel.h"
#import "ParkingLotDisplayView.h"

@interface ReserveViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet ParkingLotDisplayView *parkingLotDisplayView;
@property (strong, nonatomic) IBOutlet UITextField *startDateField;
@property (strong, nonatomic) IBOutlet UITextField *endDateField;


@property (strong, nonatomic) IBOutlet UILabel *totalTimeHourField;
@property (strong, nonatomic) IBOutlet UILabel *totalTimeMinuteField;

@property (strong, nonatomic) IBOutlet UILabel *totalPriceField;

@property (strong, nonatomic) IBOutlet UIButton *dismissPickerButton;

@property (weak, nonatomic) ParkingLotModel *parkingLotModel;

- (IBAction)reservePressed:(id)sender;

@end
