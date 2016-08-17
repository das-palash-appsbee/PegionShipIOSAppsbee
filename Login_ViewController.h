//
//  Login_ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 01/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "UITextField+Shake.h"
#import "DashBoard_ViewController.h"
#import "Utility.h"

#import "CoreLocation/CoreLocation.h"

@class GPPSignInButton;

@interface Login_ViewController : UIViewController<UITextFieldDelegate,UINavigationControllerDelegate,CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    CLLocation *currentLocation;

    UILabel *email_LB;
    UILabel *Passwprd_LB;
    
    UITextField *email_TXT;
     UITextField *Passwprd_TXT;
    UIButton *BTN_sign_In;
    UIButton *BTN_Facebook;
  //  UIButton *BTN_Google_Plues;
    
      UIButton *BTN_Dont_account;
    
    UIScrollView *scrollview;
    
    UILabel *Mlable;
     UILabel *MTitle;
    
    AppDelegate *appDelegate;
    
    UIButton *BTN_Google_Plues;
    
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    
    
    NSMutableDictionary *dict;
    
    NSString *dataValue;
    
    
    UIButton *BTN_Forgot;
    
    UITextField *mEmail_id;
    
}

@end
