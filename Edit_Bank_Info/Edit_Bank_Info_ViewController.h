//
//  Edit_Bank_Info_ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 13/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "API.h"
#import "JSON.h"
#import "AppDelegate.h"

@interface Edit_Bank_Info_ViewController : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
     AppDelegate *appDelegate;
    UIScrollView *scrollview;
    UILabel *MTitle;
    
    
    UIButton *Next_BTN;
    UIButton *Skip_BTN;
    UIButton *Back_BTN;
    
    UIView *facke_view;
    
    
    
    
    UIView *TopView;
    UILabel *textlable;
    UIButton *scan_BTN;
    
    
    UITextField *Account_name_TXT;
    UITextField *Routing_Number_TXT;
    
    UITextField *Account_Number_TXT;
    
    UITextField *Account_Type_TXT;
    
    UITextField *Date_Birth_TXT;
    
    
    UILabel *Account_name_LB;
    UILabel *Routing_Number_LB;
    
    UILabel *Account_Number_LB;
    
    
    UILabel *Account_Type_LB;
    UILabel *Date_Birth_LB;
    NSInteger tagvale;
    
    NSMutableArray *Account_Type_array;
    NSMutableArray *Demo_array;
    NSString *pickre_STR;
    UIPickerView *pPickerState;
    
   
    
    NSMutableDictionary *Dic_Bank_info;
    
    
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    NSMutableDictionary *dict;
    
}

@property(strong, nonatomic) UIView *activeTextView;


@end
