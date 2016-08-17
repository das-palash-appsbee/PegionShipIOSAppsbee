//
//  Today_ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 27/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "API.h"
#import "JSON.h"
#import "AppDelegate.h"
AppDelegate *appDelegate;

@interface Today_ViewController : UIViewController<UIAlertViewDelegate,UITextFieldDelegate>
{
    UIToolbar *ptoolbar;
    UIDatePicker *TIMEmyPicker;
    UITextField *SELECT_TIME;
    
    
    UIButton *Back_BTN;
    UILabel *MTitle;
    UIButton *Check_Uncheck;
    UILabel *Demo_LB;
    
    
    UIButton *RIGHT_Check_Uncheck;
    UILabel *RIGHT_Demo_LB;
    UIDatePicker *myPicker;
    UILabel *Upon_LB;
    UILabel *Payment_text_LB;
    
    UIButton *PigenShip_it;
    
    
    UILabel *TermCondision;
    
    UIImageView *Check_Box;
    
    
    BOOL check_value;
    
    NSString *TIME_VALUE;
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    NSMutableDictionary *dict;
   UIScrollView *scrollview;

}

@end
