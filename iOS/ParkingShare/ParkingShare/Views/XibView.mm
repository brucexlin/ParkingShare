//
//  XibView.m
//  ParkingShare
//
//  Created by Qing Sun on 4/11/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import "XibView.h"

@interface XibView ()

@property (strong, nonatomic) UIView *loadedView;

@end

@implementation XibView


- (instancetype)init {
    self = [super init];
    if (self) {
        [self loadFromXib];
        self.frame = self.loadedView.frame;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self loadFromXib];
        self.frame = self.loadedView.frame;
    }
    return self;
}

- (void)loadFromXib {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
    NSArray *nibObjects = [nib instantiateWithOwner:self options:nil];
    self.loadedView = [nibObjects objectAtIndex:0];
    self.backgroundColor  = [UIColor clearColor];
    self.autoresizingMask = _loadedView.autoresizingMask;
    
    _loadedView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSubview:_loadedView];
}

- (void)setFrame:(CGRect)frame_ {
    [super setFrame:frame_];
    self.loadedView.frame = CGRectMake(0, 0, frame_.size.width, frame_.size.height);
}

@end
