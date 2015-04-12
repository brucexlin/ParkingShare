//
//  MasterViewController.h
//  ParkingShare
//
//  Created by Qing Sun on 4/11/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UIViewController

@property (readonly, strong, nonatomic) UIViewController *currentViewController;

- (void)jumpToViewController:(NSString *)viewControllerName;

@end
