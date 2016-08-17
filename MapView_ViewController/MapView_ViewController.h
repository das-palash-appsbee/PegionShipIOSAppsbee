//
//  MapView_ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 08/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "REMarkerClusterer.h"
#import "MapViewAnnotation.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"

@interface MapView_ViewController : UIViewController<REMarkerClusterDelegate,UITableViewDataSource,UITableViewDelegate,MKMapViewDelegate,UIAlertViewDelegate>
{
    
    AppDelegate *appDelegate;

    
    UIScrollView *scrollview;
    UILabel *MTitle;
    
    
    UIButton *Next_BTN;
    UIButton *Back_BTN;
    UIView *TopView;
    
    UIButton *Map_view_BTN;
    UIButton *Table_view_BTN;
    
    
    UILabel *textlable;
    
    UIButton *Finder_BTN;
    UIButton *Pigeon_ship;
   /// MKMapView *mapView;
     UITableView *mtableview;
    
    
    
    UIView *mtable_bacground;
    UILabel *topLeft_LB;
    UIImageView *topLeft_location_IMG;
     UILabel *Middle_Left_Address_LB;
    
    
    
    UIImageView *Middle_Line_IMG;
    
    UILabel *Middle_Round_LB;
    
    UILabel *topRight_LB;
    UIImageView *topRight_location_IMG;
    UILabel *Middle_Right_Address_LB;

   
    
     UILabel *Pack_type_str_LB;
      UILabel *Pack_type_dyn_LB;
    
    
    UILabel *Delivered_Before_str_LB;
    UILabel *Delivered_Before_dyn_LB;

    
    UIButton *View_Detail_BTN;
    UIButton *Accept_BTN;
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    
    
    NSMutableDictionary *dict;
    
    
    NSMutableDictionary *DEMOdict;
    
    NSString *PACKAGE_ID;
    
    NSMutableArray *annotations ;
    MKCoordinateRegion region;

}

@property (strong, readonly, nonatomic) REMarkerClusterer *clusterer;

@end
