//
//  MyOrderViewController.m
//  ParkingShare
//
//  Created by Xinda Lin on 4/25/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import "MyOrderViewController.h"
#import "AppContext.h"
#import "ParkingLotModel.h"

@interface MyOrderViewController ()

@property (strong, nonatomic) ReservationModel *lastReservation;
@property (strong, nonatomic) ParkingLotModel *lastParkingLot;

@end

@implementation MyOrderViewController

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"DetailCell";
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"停车场";
            break;
        case 1:
            cell.textLabel.text = [NSString stringWithFormat: @"地址：%@", _lastParkingLot.address];
            break;
        case 2:
            cell.textLabel.text = [NSString stringWithFormat: @"停车时间"];
            
            break;
        case 3:
            cell.textLabel.text = @"停车费";
            break;
        case 4:
            cell.textLabel.text = @"押金";
            break;
        default:
            cell.textLabel.text = @"历史订单";
            break;
    }
    

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [self setupView];
    [self.detailTableView reloadData];
}

- (void)setupView {
    self.navigationItem.title = @"我的订单";
    self.lastReservation = [[AppContext instance].userInfo.userReservation lastObject];
    self.lastParkingLot = [ParkingLotModel parkingLotModelWithId: self.lastReservation.parkingLotId];
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
