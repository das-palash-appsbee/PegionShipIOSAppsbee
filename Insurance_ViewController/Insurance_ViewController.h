//
//  Insurance_ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 04/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "API.h"
#import "JSON.h"


@interface Insurance_ViewController : UIViewController<UITextFieldDelegate>
{
    UIScrollView *scrollview;
    UILabel *MTitle;
    
    
    UIButton *Next_BTN;
    UIButton *Skip_BTN;
    UIButton *Back_BTN;
    UIView *TopView;
    UILabel *textlable;
    UIButton *scan_BTN;
    
    
    UITextField *Insurance_name_TXT;
    UITextField *Insurance_Provider_TXT;
    
    UITextField *Policy_Number_TXT;
    UITextField *Expiration_TXT;
    UITextField *Insurance_phone_number_TXT;
    
    
    
    
    UILabel *Insurance_name_LB;
    UILabel *Insurance_Provider_LB;
    
    UILabel *Policy_Number_LB;
    UILabel *Expiration_LB;
    UILabel *Insurance_phone_number_LB;
    UIView *facke_view;
    CGRect pickerFrame;
    UIDatePicker *myPicker_select;
    NSMutableDictionary *Dic_Insurance;
    
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
     NSMutableDictionary *dict;

    
}

@property(strong, nonatomic) UIView *activeTextView;


@end
