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

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}


- (instancetype)initWithParkingLot:(ParkingLotModel *)parkingLot userInfo:(UserInfoModel *)userInfo delegate:(id<LocationHUDDelegate>)delegate {
    self = [self init];
    if (self) {
        self.delegate = delegate;
        if ([userInfo.userReservation objectForKey:parkingLot.parkingLotId]) {
            self.reserveButton.hidden = YES;
            self.cancelButton.hidden = NO;
        } else {
            self.reserveButton.hidden = NO;
            self.cancelButton.hidden = YES;
        }
    }
    return self;
}


- (void)setupView {
    [self setFrame:CGRectMake(0, 0, 105, 40)];
    self.backgroundColor = [UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.7f];
    self.layer.cornerRadius = 5;
    self.reserveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_reserveButton setBackgroundImage:[UIImage imageNamed:@"Reserve.png"] forState:UIControlStateNormal];
    [_reserveButton setFrame:CGRectMake(5, 5, 30, 30)];
    [_reserveButton addTarget:self action:@selector(reservePressed) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_reserveButton];
    self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_cancelButton setBackgroundImage:[UIImage imageNamed:@"Cancel.png"] forState:UIControlStateNormal];
    [_cancelButton setFrame:CGRectMake(5, 5, 30, 30)];
    [_cancelButton addTarget:self action:@selector(cancelPressed) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_cancelButton];
    self.navigateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_navigateButton setBackgroundImage:[UIImage imageNamed:@"Navigate.png"] forState:UIControlStateNormal];
    [_navigateButton setFrame:CGRectMake(40, 5, 30, 30)];
    [_navigateButton addTarget:self action:@selector(navigatePressed) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_navigateButton];
    self.infoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_infoButton setBackgroundImage:[UIImage imageNamed:@"Info.png"] forState:UIControlStateNormal];
    [_infoButton setFrame:CGRectMake(75, 5, 30, 30)];
    [_infoButton addTarget:self action:@selector(infoPressed) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_infoButton];
}

- (void)reservePressed {
    [self.delegate hudReservePressed:self];
}

- (void)cancelPressed {
    [self.delegate hudCancelPressed:self];
}

- (void)navigatePressed {
    [self.delegate hudNavigatePressed:self];
}

- (void)infoPressed {
    [self.delegate hudInfoPressed:self];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
