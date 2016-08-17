//
//  SetPrice_ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 15/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "API.h"
#import "JSON.h"
#import "AppDelegate.h"
@interface SetPrice_ViewController : UIViewController<UITextFieldDelegate>
{
     AppDelegate *appDelegate;
    UIScrollView *scrollview;
    
    UIButton *Back_BTN;
    UILabel *MTitle;
     UILabel *SUB_Title;
    UILabel *SUB_Title_Price;
    
     UILabel *Wtext_lable;
    
    UITextField *Price_TXT;

    UIButton *Plues;
    UIButton *mines;


    
    UIButton *Check_Uncheck;
    UILabel *Demo_LB;
    
    
    UIButton *RIGHT_Check_Uncheck;
    UILabel *RIGHT_Demo_LB;
 UILabel *Fastertext_lable;
    
        UILabel *increPrice_LB;
    UITextField *code_value_TXT;
    UIButton *CodeApple;

    UIButton *Deliver_by;
    
    
    
    UILabel *What_should_i_pay_LB;
float vvalue;
    
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    NSMutableDictionary *dict;
    
    BOOL check_value;
    
    
}

@property(strong, nonatomic) UIView *activeTextView;

@end
