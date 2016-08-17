//
//  Pigeon_Posting_PIGEON_ViewController.h
//  PigeonShip
//
//  Created by Bhushan Bawa on 28/09/15.
//  Copyright © 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "API.h"
#import "JSON.h"
#import <MapKit/MapKit.h>
#import "REMarkerClusterer.h"
#import "MapViewAnnotation.h"
#import "AppDelegate.h"


@interface Pigeon_Posting_PIGEON_ViewController : UIViewController<MKMapViewDelegate>
{
    AppDelegate *appDelegate;
      NSMutableArray *Demo_array;
    UIScrollView *scrollview;
    UILabel *MTitle;
    UILabel *sMTitle;
    UIButton *Back_BTN;
    
    UIView *TopView;
    UILabel *textlable;
    
    UISwitch *mySwitch;
    
    UILabel *DemoText;
    
    
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    NSMutableDictionary *dict;
    NSMutableDictionary *dict2;

    NSString *statues;


    NSMutableDictionary *DEMOdict;
    
    NSString *PACKAGE_ID;
    
    NSMutableArray *annotations ;
}

@property (strong, readonly, nonatomic) REMarkerClusterer *clusterer;


@property (strong, readwrite, nonatomic) MKMapView *mapper;

@end
