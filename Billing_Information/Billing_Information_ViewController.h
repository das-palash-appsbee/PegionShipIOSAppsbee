//
//  Billing_Information_ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 21/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "API.h"
#import "JSON.h"

@interface Billing_Information_ViewController : UIViewController<UITextFieldDelegate,UIAlertViewDelegate>
{
    UIScrollView *scrollview;
    UILabel *MTitle;
    
    
    UIButton *Next_BTN;
    UIButton *Skip_BTN;
    UIButton *Back_BTN;
    UIView *TopView;
    UILabel *textlable;
    UIButton *scan_BTN;
    
    
    UITextField *Business_name_TXT;
     UILabel *Business_name_LB;
    
    
    
    UITextField *Last_name_TXT;
      UILabel *Last_name_LB;
    
    
    
    UITextField *Address1_TXT;
     UILabel *Address1_LB;
    
    
    UITextField *Address2_TXT;
    UILabel *Address2_LB;
    
    
    
    
    UITextField *City_TXT;
    UILabel *City_LB;
    
    
    UITextField *State_TXT;
    UILabel *State_LB;

    
    UITextField *Zip_code_TXT;
    UILabel *Zip_code_LB;

  
    UITextField *Country_TXT;
    UILabel *Country_LB;

   
   
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
    
    
    UIToolbar *ptoolbar;
    
    
  
    
}

@property(strong, nonatomic) UIView *activeTextView;

@property(nonatomic,retain)NSString *Business_name_STR;
@property(nonatomic,retain)NSString *Last_name_STR;
@property(nonatomic,retain)NSString *Address1_STR;
@property(nonatomic,retain)NSString *Address2_STR;
@property(nonatomic,retain)NSString *City_STR;
@property(nonatomic,retain)NSString *State_STR;
@property(nonatomic,retain)NSString *Zip_code_STR;
@property(nonatomic,retain)NSString *Country_STR;



@property(nonatomic,retain)NSString *Card_name_STR;
@property(nonatomic,retain)NSString *card_number_STR;
@property(nonatomic,retain)NSString *card_type_STR;
@property(nonatomic,retain)NSString *CVV_STR;
@property(nonatomic,retain)NSString *Expiary_Month_STR;
@property(nonatomic,retain)NSString *Expiary_Year_STR;


@end
