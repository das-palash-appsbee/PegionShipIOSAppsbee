//
//  Profile_ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 03/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "CoreLocation/CoreLocation.h"
@interface Profile_ViewController : UIViewController<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
    
    UIImageView *Selfi_image;
    UIScrollView *scrollview;
    

    
    UIView *facke_view;
    UILabel *MTitle;
    UIButton *pigen_BTN;
    UIButton *Sender_BTN;
    UILabel *User_Name;
     UILabel *User_Email_ID;
     UILabel *User_Number;

    
    
     UIImageView *map_image;
     UILabel *User_Address;
    
    UIButton *Back_BTN;
    
    AppDelegate *appDelegate;
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    NSMutableDictionary *dict;
    
    NSData* imageData;
    
     NSData* Licence_imageData;
    
    UIImage* image ;
    
    NSMutableArray *mValide_key;
    
     NSMutableArray *Licence_mValide_key;
    
}

@property(nonatomic,retain)NSString *Class_name;


@end
