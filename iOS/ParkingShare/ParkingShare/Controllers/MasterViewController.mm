//
//  MasterViewController.m
//  ParkingShare
//
//  Created by Qing Sun on 4/11/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import "MasterViewController.h"
#import "MapViewController.h"

@interface MasterViewController ()

@property (strong, nonatomic) UIViewController *currentViewController;
@property (strong, nonatomic) NSMutableDictionary *viewControllerDict;

@end

@implementation MasterViewController

+ (MasterViewController *)instance {
    static MasterViewController *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[MasterViewController alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.viewControllerDict = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)registerViewController:(UIViewController *)viewController {
    [self.viewControllerDict setObject:viewController forKey:NSStringFromClass([viewController class])];
}

- (UIViewController *)getViewController:(NSString *)viewControllerName {
    UIViewController *viewController = [_viewControllerDict objectForKey:viewControllerName];
    if (!viewController) {
        if ([NSClassFromString(viewControllerName) isSubclassOfClass:[UIViewController class]]) {
            viewController = [[NSClassFromString(viewControllerName) alloc] init];
            [_viewControllerDict setObject:viewController forKey:viewControllerName];
        }
    }
    return viewController;
}

- (void)jumpToViewController:(NSString *)viewControllerName {
    UIViewController *viewController = [self getViewController:viewControllerName];
    if (viewController) {
        [self.view addSubview:viewController.view];
        [self.view bringSubviewToFront:viewController.view];
        self.currentViewController = viewController;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
