//
//  MapViewController.h
//  ParkingShare
//
//  Created by Qing Sun on 4/11/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI/BMapKit.h>
#import "LocationHUDView.h"

@interface MapViewController : UIViewController <UISearchBarDelegate, LocationHUDDelegate, BMKMapViewDelegate, BMKPoiSearchDelegate, BMKLocationServiceDelegate>

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet BMKMapView *mapView;
@property (strong, nonatomic) IBOutlet UIView *detailView;
@property (strong, nonatomic) IBOutlet UILabel *parkingLotNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *slotCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;

@property (strong, nonatomic) BMKMapManager *mapManager;
@property (strong, nonatomic) BMKPoiSearch *poiSearch;
@property (strong, nonatomic) BMKLocationService *locService;
@property (strong, nonatomic) IBOutlet UIButton *menuButton;
@property (strong, nonatomic) IBOutlet UIButton *listViewButton;


- (IBAction)menuButtonPressed:(id)sender;

- (IBAction)locateButtonPressed:(id)sender;

- (IBAction)zoomInButtonPressed:(id)sender;

- (IBAction)zoomOutButtonPressed:(id)sender;

- (IBAction)listViewButtonPressed:(id)sender;

- (IBAction)detailViewButtonPressed:(id)sender;

@end
