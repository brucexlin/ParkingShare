//
//  MapListViewController.m
//  ParkingShare
//
//  Created by Qing Sun on 5/31/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import "MapListViewController.h"
#import "ParkingLotModel.h"

@interface MapListViewController ()

@end

@implementation MapListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.sortingControl addTarget:self action:@selector(sortList) forControlEvents:UIControlEventValueChanged];
}

- (void)viewWillAppear:(BOOL)animated {
    [self sortList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"MapListViewCell";
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    ParkingLotModel *plModel = [self.parkingLotsList objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ 空闲:%ld 价格:%0.2f元/小时", plModel.name, (long)plModel.availableSlots, (float)plModel.hourlyRate / 100];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return self.parkingLotsList.count;
}

- (void)sortList {
    if (self.sortingControl.selectedSegmentIndex == 0) {
        // Distance
        CLLocationCoordinate2D loc = self.currentLocation.location.coordinate;
        self.parkingLotsList = [self.parkingLotsList sortedArrayUsingFunction:distanceSort context:&loc];
    } else if (self.sortingControl.selectedSegmentIndex == 1) {
        self.parkingLotsList = [self.parkingLotsList sortedArrayUsingFunction:priceSort context:NULL];
    }
    [self.tableView reloadData];
}

NSInteger distanceSort(id obj1, id obj2, void *context)
{
    ParkingLotModel *model1 = obj1;
    ParkingLotModel *model2 = obj2;
    CLLocationCoordinate2D *coord = (CLLocationCoordinate2D *)context;
    
    
    double latDiff1 = model1.coordinate.latitude - coord->latitude;
    double longDiff1 = model1.coordinate.longitude - coord->longitude;
    double latDiff2 = model2.coordinate.latitude - coord->latitude;
    double longDiff2 = model2.coordinate.longitude - coord->longitude;
    double dist1 = latDiff1 * latDiff1 + longDiff1 * longDiff1;
    double dist2 = latDiff2 * latDiff2 + longDiff2 * longDiff2;
    if (dist1 < dist2)
        return NSOrderedAscending;
    else if (dist1 > dist2)
        return NSOrderedDescending;
    else
        return NSOrderedSame;
}

NSInteger priceSort(id obj1, id obj2, void *context)
{
    ParkingLotModel *model1 = obj1;
    ParkingLotModel *model2 = obj2;
    NSInteger v1 = model1.hourlyRate;
    NSInteger v2 = model2.hourlyRate;
    if (v1 < v2)
        return NSOrderedAscending;
    else if (v1 > v2)
        return NSOrderedDescending;
    else
        return NSOrderedSame;
}
@end
