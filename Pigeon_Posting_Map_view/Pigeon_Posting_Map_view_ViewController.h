//
//  Pigeon_Posting_Map_view_ViewController.h
//  PigeonShip
//
//  Created by Bhushan Bawa on 15/10/15.
//  Copyright © 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "API.h"
#import "JSON.h"
#import <MapKit/MapKit.h>
#import "REMarkerClusterer.h"
#import "MapViewAnnotation.h"
#import "CSMapRouteLayerView.h"
#import "AppDelegate.h"
@interface Pigeon_Posting_Map_view_ViewController : UIViewController<MKMapViewDelegate,UISearchBarDelegate>
{
    AppDelegate *appDelegate;

     NSTimer *timer;
    UIScrollView *scrollview;
    UILabel *MTitle;
    UILabel *sMTitle;
    UIButton *Back_BTN;
    
    UIView *TopView;
    
    UILabel *DROP_OFF_addresslable;
    UILabel *DROP_OFFlable;
    
    
    UILabel *Pick_addresslable;
    UILabel *Addresslable;
    UILabel *Blacklable;
    UIView *Bottom_view;
    
    UIButton *Done_BTN;
    
    
    
    
    UILabel *Nmae_LB;
    UILabel *Phone_Number_LB;
    UIImageView *user_image;
    
    
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
NSMutableDictionary *dict;
    
    
     NSString *mstring_last_LAT;
     NSString *mstring_last_LON;
    
    
    NSString *mstring_NEW_LAT;
    NSString *mstring_NEW_LON;

    
    

}



@property (strong, readwrite, nonatomic) NSString *Pack_Key;

@property (strong, readwrite, nonatomic) MKMapView *mapper;
@property (nonatomic, retain) MKPolyline *routeLine; //your line
@property (nonatomic, retain) MKPolylineView *routeLineView; //overlay view

@property (nonatomic, retain) NSMutableDictionary *Fetch_data; //overlay view

@end
