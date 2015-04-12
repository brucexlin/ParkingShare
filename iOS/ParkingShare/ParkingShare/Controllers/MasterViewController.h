//
//  MasterViewController.h
//  ParkingShare
//
//  Created by Qing Sun on 4/11/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

#define VC(X) \
((X *)[[MasterViewController instance] getViewController:@#X])

@interface MasterViewController : UIViewController

@property (readonly, strong, nonatomic) UIViewController *currentViewController;

@property (strong, nonatomic) UIViewController *rootViewController;

+ (MasterViewController *)instance;

- (void)registerViewController:(UIViewController *)viewController;

- (void)jumpToViewController:(NSString *)viewControllerName;

- (UIViewController *)getViewController:(NSString *)viewControllerName;

@end
