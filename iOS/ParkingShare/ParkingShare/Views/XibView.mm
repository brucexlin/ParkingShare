//
//  XibView.m
//  ParkingShare
//
//  Created by Qing Sun on 4/11/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import "XibView.h"

@implementation XibView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self loadFromXib];
    }
    return self;
}


- (void)loadFromXib {
    NSArray *nibObjects = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    UIView *view = [nibObjects objectAtIndex:0];
    [self addSubview:view];
}

@end
