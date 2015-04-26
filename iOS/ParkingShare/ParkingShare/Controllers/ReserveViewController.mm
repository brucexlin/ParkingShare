//
//  ReserveViewController.m
//  ParkingShare
//
//  Created by Xinda Lin on 4/25/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import "ReserveViewController.h"
#import "ReservationModel.h"
#import "AppContext.h"

@interface ReserveViewController ()

@property (strong, nonatomic) NSDateFormatter *dateFormatter;

@property (strong, nonatomic) UIDatePicker *datePicker;
@property (weak, nonatomic) UITextField *editingField;

@property (strong, nonatomic) NSDate *startDate;
@property (strong, nonatomic) NSDate *endDate;

@property (nonatomic) NSInteger totalPrice;

@end

@implementation ReserveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    self.datePicker   = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 210, 320, 160)];
    [self.datePicker addTarget:self action:@selector(datePickerValueChanged) forControlEvents:UIControlEventValueChanged];
    self.startDateField.inputView  = self.datePicker;
    self.startDateField.delegate = self;
    self.endDateField.inputView = self.datePicker;
    self.endDateField.delegate = self;
    
    [self.dismissPickerButton addTarget:self action:@selector(dismissDatePicker) forControlEvents:UIControlEventTouchDown];
    self.dismissPickerButton.hidden = YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [self setupView];
}

- (void)datePickerValueChanged {
    if (self.editingField == self.startDateField) {
        self.startDate = self.datePicker.date;
    } else if (self.editingField == self.endDateField) {
        self.endDate = self.datePicker.date;
    }
}

- (void)dismissDatePicker {
    [self.editingField resignFirstResponder];
    self.editingField = nil;
    self.dismissPickerButton.hidden = YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == self.startDateField) {
        self.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
        self.datePicker.date = self.startDate;
        self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:0];
    } else if (textField == self.endDateField) {
        self.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
        self.datePicker.date = self.endDate;
        self.datePicker.minimumDate = self.startDate;
    }
    self.dismissPickerButton.hidden = NO;
    self.editingField = textField;
    return YES;
}

- (void)setupView {
    self.navigationItem.title = self.parkingLotModel.title;
    [self.parkingLotDisplayView setupWithParkingLot:self.parkingLotModel];
    
    int initTotalTime = 2 * 3600;
    
    self.startDate = [NSDate dateWithTimeIntervalSinceNow:0];
    self.endDate = [self.startDate dateByAddingTimeInterval:initTotalTime];
    
}

- (void)setStartDate:(NSDate *)startDate {
    if (_startDate != startDate) {
        _startDate = startDate;
        self.startDateField.text = [self.dateFormatter stringFromDate:_startDate];
        if ([self.endDate timeIntervalSinceDate:startDate] < 0) {
            self.endDate = [self.startDate dateByAddingTimeInterval:3600];
        }
        [self refreshInfo];
    }
}

- (void)setEndDate:(NSDate *)endDate {
    if (_endDate != endDate) {
        _endDate = endDate;
        self.endDateField.text = [self.dateFormatter stringFromDate:_endDate];
        [self refreshInfo];
    }
}

- (void)refreshInfo {
    NSTimeInterval timeInterval = [self.endDate timeIntervalSinceDate:self.startDate];
    self.totalTimeHourField.text = [NSString stringWithFormat:@"%d", (int)timeInterval / 3600];
    self.totalTimeMinuteField.text = [NSString stringWithFormat:@"%d", (int)timeInterval % 60];
    
    self.totalPrice = (float)timeInterval / 3600.f * self.parkingLotModel.hourlyRate;
    
    self.totalPriceField.text = [NSString stringWithFormat:@"%0.2f", (float)self.parkingLotModel.hourlyRate * timeInterval / 3600.f / 100];
}

- (void)reservePressed:(id)sender {
    ReservationModel *reservation = [[ReservationModel alloc] initWithParkingLotId:self.parkingLotModel.parkingLotId startDate:self.startDate endDate:self.endDate hourlyRate:self.parkingLotModel.hourlyRate totalPrice:self.totalPrice];
    [[AppContext instance].userInfo addReservation:reservation];
    UIAlertView *successView =  [[UIAlertView alloc] initWithTitle:@"谢谢惠顾"
                                                           message:@"恭喜！您的订单已经生成！"
                                                          delegate:self
                                                 cancelButtonTitle:@"知道了"
                                                 otherButtonTitles:nil];
    [successView show];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
