//
//  ParkingLotDetailViewController.m
//  ParkingShare
//
//  Created by Qing Sun on 4/24/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import "ParkingLotDetailViewController.h"

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [self setUpWithParkingLotModel:self.parkingLotModel];
    [self.detailTableView reloadData];
}

- (void)setUpWithParkingLotModel:(ParkingLotModel *)plModel {
    self.navigationController.navigationBar.topItem.title = plModel.title;
    self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];
    self.navigationController.navigationBar.translucent = NO;
//    self.navigationItem.title = plModel.title;
    self.addressLabel.text = plModel.address;
    self.telephoneLabel.text = plModel.telephone;
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
