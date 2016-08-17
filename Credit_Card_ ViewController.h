//
//  Credit_Card_ ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 21/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "API.h"
#import "JSON.h"
#import "AppDelegate.h"
#import "CardIOPaymentViewControllerDelegate.h"

@interface Credit_Card__ViewController : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    
    UIScrollView *scrollview;
    UILabel *MTitle;
    
    AppDelegate *appDelegate;
    
    UIButton *Back_BTN;
    UIView *TopView;
    UILabel *textlable;
    UIButton *scan_BTN;
    UIView *facke_view;
    
    UILabel *Card_name_LB;
    UITextField *Card_name_TXT;
    
     UILabel *card_number_LB;
    UITextField *card_number_TXT;
    
     UILabel *card_type_LB;
    UITextField *card_type_TXT;
    
    
    
    UILabel *CVV_LB;
    UITextField *CVV_TXT;
    UITextField *State_TXT;
    
    
    UIButton *Next_BTN;
    UIButton *Skip_BTN;
    
     UIButton *Edit_BTN;
    
    
    
   
    
    UILabel *State_LB;
    
    
    
    
    UILabel *Expiary_Month_STR;
    
     UITextField *Expiary_Month_TXT;
    
    
    UILabel *Expiary_Year_STR;
    
    UITextField *Expiary_Year_TXT;
    
    
    NSMutableArray *exp_month_array;
     NSMutableArray *exp_Year_array;
    
     NSMutableArray *card_type_array;
    
    
    
    NSMutableArray *Demo_array;
    
    NSString * pickre_STR;
    
    UIPickerView *pPickerState;
    UIToolbar *ptoolbar;
    
    NSInteger tagvale;
    
    
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    
    
    NSMutableDictionary *dict;
    
    UIToolbar *ptoolbar_card;
    
    BOOL check_card_value;
    
    
}

@property(strong, nonatomic) UIView *activeTextView;


@end
