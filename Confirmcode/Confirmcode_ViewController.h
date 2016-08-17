//
//  Confirmcode_ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 03/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface Confirmcode_ViewController : UIViewController<UIGestureRecognizerDelegate,UITextFieldDelegate>
{
    AppDelegate *appDelegate;
    UIScrollView *scrollview;
    
      UILabel *MTitle;
     UILabel *Wrong_number;
     UILabel *Resend_verification_number;
    
    UITextField *Confir_code_TXT;
    UILabel *Confir_code_LB;
    UILabel *TermCondision;
   
    
    UIButton *BTN_sign_In;
    UIImageView *Check_Box;
    
    BOOL check_value;
    
    NSMutableDictionary *dict;
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    
    
}
@property(nonatomic,retain)NSString *PhoneVerify_code;
@property(nonatomic,retain)NSString *Phone_number;


@end
