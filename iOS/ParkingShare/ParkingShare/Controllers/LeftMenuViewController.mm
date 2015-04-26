//
//  LeftMenuViewController.m
//  ParkingShare
//
//  Created by Qing Sun on 4/11/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "RootViewController.h"
#import "MasterViewController.h"
#import "MyOrderViewController.h"


@interface LeftMenuViewController ()

@end

@implementation LeftMenuViewController
@synthesize menuData;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuListView.delegate = self;
    self.menuListView.dataSource = self;
    menuData = [[NSMutableArray alloc] initWithObjects: @"我的账户", @"我的订单", @"寻找爱车", @"出租车位", @"系统设置", @"邀请好友", nil];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];

    cell.textLabel.text = [menuData objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    RootViewController *rootViewController = VC(RootViewController);
    [rootViewController showViewController:rootViewController.frontViewController];
    
    switch (indexPath.row) {
        case 1:
            MyOrderViewController *myOrderViewController = VC(MyOrderViewController);
            [[MasterViewController instance] jumpToViewController: myOrderViewController];
            break;
    }
    
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
