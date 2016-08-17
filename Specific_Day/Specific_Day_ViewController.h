//
//  Specific_Day_ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 15/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "API.h"
#import "JSON.h"
#import "AppDelegate.h"
AppDelegate *appDelegate;
@interface Specific_Day_ViewController : UIViewController<UITextFieldDelegate,UIAlertViewDelegate>
{
    
     UIToolbar *ptoolbar;
    UIButton *Back_BTN;
    UILabel *MTitle;
    UILabel *SUB_Title;

    UIButton *Check_Uncheck;
    UILabel *Demo_LB;
    
    
    UIButton *RIGHT_Check_Uncheck;
    UILabel *RIGHT_Demo_LB;
    
    UILabel *Upon_LB;
    UILabel *Payment_text_LB;
    
    UIButton *PigenShip_it;

    UITextField *SELECT_TIME;
    
    UIDatePicker *TIMEmyPicker;
    
    
    
    NSString *TIME_VALUE;
    
    
    
    NSString *DATE_VALUE;
    
    UIDatePicker *myPicker ;
    
    UIImageView *Check_Box;
    
    UILabel *TermCondision;
    
    
    BOOL check_value;
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    NSMutableDictionary *dict;
    
UIScrollView *scrollview;
}

@end
