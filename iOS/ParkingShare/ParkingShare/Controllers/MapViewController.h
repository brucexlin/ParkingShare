//
//  MapViewController.h
//  ParkingShare
//
//  Created by Qing Sun on 4/11/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationHUDView.h"

@interface MapViewController : UIViewController <UISearchBarDelegate, LocationHUDDelegate>

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UIButton *menuButton;
@property (strong, nonatomic) IBOutlet UIButton *listViewButton;


- (IBAction)menuButtonPressed:(id)sender;

- (IBAction)listViewButtonPressed:(id)sender;


@end
