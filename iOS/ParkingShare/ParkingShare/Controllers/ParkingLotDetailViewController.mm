//
//  ParkingLotDetailViewController.m
//  ParkingShare
//
//  Created by Qing Sun on 4/24/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import "ParkingLotDetailViewController.h"
#import "MasterViewController.h"
#import "RootViewController.h"
#import "ParkingLotModel.h"
#import "ReserveViewController.h"

typedef enum : NSUInteger {
    SectionRate,
    SectionHour,
    TotalSectionCount,
} Section;

@interface ParkingLotDetailViewController ()

@end

@implementation ParkingLotDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"DetailCell";
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if (indexPath.section == Section::SectionRate) {
        cell.textLabel.text = [NSString stringWithFormat:@"%0.2f 元/小时", (float)_parkingLotModel.hourlyRate / 100];
    }
    if (indexPath.section == Section::SectionHour) {
        if (_parkingLotModel.openAllDay) {
            cell.textLabel.text = @"全天开放";
        } else {
            cell.textLabel.text = [NSString stringWithFormat:@"%02ld:%02ld - %02ld:%02ld",
                                   (long)_parkingLotModel.openTimeHour,
                                   (long)_parkingLotModel.openTimeMinute,
                                   (long)_parkingLotModel.closeTimeHour,
                                   (long)_parkingLotModel.closeTimeMinute];
        }
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case Section::SectionRate:
            return 1;
            break;
        case Section::SectionHour:
            return 1;
        default:
            break;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return Section::TotalSectionCount;
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case Section::SectionRate:
            return @"收费标准";
            break;
        case Section::SectionHour:
            return @"营业时间";
        default:
            break;
    }
    return nil;
}


- (IBAction)reserveButtonPressed:(id)sender {
    ReserveViewController *reserveViewController = VC(ReserveViewController);
    [MasterViewController instance].navigationBar.topItem.title = @"详情";
    reserveViewController.parkingLotModel = self.parkingLotModel;
    [[MasterViewController instance] jumpToViewController: reserveViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [self setupView];
    [self.detailTableView reloadData];
}

- (void)setupView {
    self.navigationItem.title = self.parkingLotModel.title;
    [self.parkingLotDisplayView setupWithParkingLot:self.parkingLotModel];
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
