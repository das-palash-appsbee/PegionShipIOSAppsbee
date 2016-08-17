//
//  Change_Password_ViewController.h
//  PigeonShip
//
//  Created by Bhushan Bawa on 29/06/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface Change_Password_ViewController : UIViewController<UITextFieldDelegate,UINavigationControllerDelegate>
{
    UITextField *Old_password_TXT;
    UITextField *New_password_TXT;
    UITextField *Confirem_password_TXT;
    
    
    
    UILabel *Old_password_LB;
    UILabel *New_password_LB;
    UILabel *Confirem_password_LB;
   
    
    UIButton *BTN_Change_password;
   
    
   
    
    UIScrollView *scrollview;
    
    UILabel *Mlable;
    UILabel *MTitle;
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    UIButton *Back_BTN;
    
    NSMutableDictionary *dict;
    
    AppDelegate *appDelegate;
}


@end
