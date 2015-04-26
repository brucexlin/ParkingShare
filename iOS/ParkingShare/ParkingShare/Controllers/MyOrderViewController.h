//
//  MyOrderViewController.h
//  ParkingShare
//
//  Created by Xinda Lin on 4/25/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyOrderViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *detailTableView;

@end
