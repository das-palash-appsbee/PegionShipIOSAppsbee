//
//  ForGot_Password_ViewController.h
//  PigeonShip
//
//  Created by Bhushan Bawa on 01/07/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
@interface ForGot_Password_ViewController : UIViewController<UITextFieldDelegate,UIAlertViewDelegate>
{
    UIScrollView *scrollview;
    UILabel *MTitle;
    
     AppDelegate *appDelegate;
    
    UIButton *Back_BTN;
    UIView *TopView;
    UILabel *textlable;
    UIButton *scan_BTN;
    UIView *facke_view;
    
    
    UITextField *Email_number_TXT;
    UITextField *Verification_code_TXT;
    UITextField *Set_PSW_TXT;
    
    
    UIButton *Next_BTN;
    UIButton *Skip_BTN;
    
    UILabel *Email_number_LB;
    UILabel *Verification_code_LB;
    UILabel *Set_PSW_LB;
    
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    NSMutableDictionary *dict;
    
    UIImage *chosenImage;
    
    BOOL checkactionSheet;
    UIActionSheet *actionSheets;
    
    UIImageView *livImage;
    
    
    NSString *PUser_image_str;
    
    UIButton *Resend_PSW;
    
    
    
}

@property(strong, nonatomic) UIView *activeTextView;
@property(strong, nonatomic) NSString *Email_phone_numbers;
@property(strong, nonatomic) NSString *Code_number;

@end
