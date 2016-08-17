//
//  Edit_Account_Info_ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 13/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "API.h"
#import "JSON.h"
#import "AppDelegate.h"
@interface Edit_Account_Info_ViewController : UIViewController<UITextFieldDelegate,UINavigationControllerDelegate>
{
    AppDelegate *appDelegate;
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
    UIButton *Back_BTN;
    
    NSMutableDictionary *dict;
    
    
    BOOL Email_alter_check;
     BOOL Sms_alter_check;
     BOOL Newsletter_alter_check;

    
    
    
    UIButton *Email_alter_BTN;
    UIButton *Sms_alter_BTN;
    UIButton *Newsletter_alter_BTN;
    
    
    UILabel *Email_alter_LB;
    UILabel *Sms_alter_LB;
    UILabel *Newsletter_alter_LB;
    
    
    UILabel *textlable;
    
}


@end
