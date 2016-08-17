//
//  Sign_Up_ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 02/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextField+Shake.h"
#import "CoreLocation/CoreLocation.h"

#import <GoogleOpenSource/GoogleOpenSource.h>
#import <GooglePlus/GooglePlus.h>
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"
@class GPPSignInButton;

@interface Sign_Up_ViewController : UIViewController<UITextFieldDelegate,UINavigationControllerDelegate,CLLocationManagerDelegate,GPPSignInDelegate>
{
    
    AppDelegate *appDelegate;
    
    CLLocationManager *locationManager;
    CLLocation *currentLocation;

    
    UITextField *Fname_TXT;
    UITextField *Lname_TXT;
    UITextField *email_TXT;
    UITextField *Passwprd_TXT;
    UITextField *Cpassword_TXT;
     UITextField *Pnumber_TXT;
    UITextField *Confir_code_TXT;

    
    
    UILabel *Fname_LB;
    UILabel *Lname_LB;
    UILabel *email_LB;
    UILabel *Passwprd_LB;
    UILabel *Cpassword_LB;
    UILabel *Pnumber_LB;
 UILabel *Show_text;
       UILabel *Confir_code_LB;
     UILabel *TermCondision;
    
    UIButton *BTN_sign_In;
    UIButton *BTN_Facebook;
    UIButton *BTN_Google_Plues;
    
    UIButton *BTN_Dont_account;
    
    UIScrollView *scrollview;
    
    UILabel *Mlable;
    UILabel *MTitle;
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    
    
    NSMutableDictionary *dict;
}

@property(strong, nonatomic) UIView *activeTextView;


@end
