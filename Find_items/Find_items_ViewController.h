//
//  Find_items_ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 07/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "API.h"
#import "JSON.h"
#import "MapKit/MapKit.h"
#import "CoreLocation/CoreLocation.h"
#import  <MobileCoreServices/MobileCoreServices.h>
#import "AppDelegate.h"
@interface Find_items_ViewController : UIViewController<UITextFieldDelegate,MKReverseGeocoderDelegate,CLLocationManagerDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
    AppDelegate *appDelegate;

    
    UIScrollView *scrollview;
    UILabel *MTitle;
    
    
    UIButton *Next_BTN;
    UIButton *Back_BTN;
    UIView *TopView;
    UILabel *textlable;
    UIButton *scan_BTN;
    
    
    UITextField *Current_Location_TXT;
    UITextField *Add_location_TXT;
    
    
    UITextField *Add_Zip_TXT;
    UITextField *Add_Radius_TXT;

    
    UITextField *Add_Zip_TXT2;
    UITextField *Add_Radius_TXT2;
    
    
    UITextField *Add_Zip_TXT3;
    UITextField *Add_Radius_TXT3;
    
    UITextField *Add_Zip_TXT4;
    UITextField *Add_Radius_TXT4;
    
    
    UITextField *Add_Zip_TXT5;
    UITextField *Add_Radius_TXT5;
    
    
    
    
    
    
    UILabel *Price_will_LB;
    UITextField *Price_will_TX;
    
    
    UILabel *Current_Location_LB;
    UILabel *Add_location_LB;
    
    UILabel *Add_Zip_LB;
    UILabel *Add_Radius_LB;
    
    
    UILabel *Add_Zip_LB2;
    UILabel *Add_Radius_LB2;
    
    UILabel *Add_Zip_LB3;
    UILabel *Add_Radius_LB3;
    
    UILabel *Add_Zip_LB4;
    UILabel *Add_Radius_LB4;
    
    
    UILabel *Add_Zip_LB5;
    UILabel *Add_Radius_LB5;

    
     UIButton *Plues_BTN;
    UIButton *Finder_BTN;
    UIButton *Pigeon_ship;
    NSInteger Frame;
    
      NSInteger ScrollFrame;
    
    
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    NSMutableDictionary *dict;
    
 NSInteger CountValue;
    
    NSString *Zipcode;
    
    UIToolbar *ptoolbar_card;
    
    UIPickerView *pPickerState;
    
    
    NSMutableArray *Any_price_array;
    
    NSString *pickre_STR;
    
    UIButton *Tiny_Check_Uncheck;
    UILabel *Tiny_Check_text;
    
    UIButton *Small_Check_Uncheck;
    UILabel *Small_Check_text;
    
    
    UIButton *Medium_Check_Uncheck;
    UILabel *Medium_Check_text;
    
    
    UIButton *Large_Check_Uncheck;
    UILabel *Large_Check_text;
    
    
    UIButton *Extra_Check_Uncheck;
    UILabel *Extra_Check_text;
    
    
    UIButton *Other_Check_Uncheck;
    UILabel *Other_Check_text;

    
    UILabel *SUB_Title;
    
    NSMutableArray *array2;

    NSInteger count_value;
    
    NSString *price_value;
    
    
}
@property(strong, nonatomic) UIView *activeTextView;


@end
