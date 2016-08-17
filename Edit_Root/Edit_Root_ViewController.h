//
//  Edit_Root_ViewController.h
//  PigeonShip
//
//  Created by Bhushan Bawa on 03/07/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "API.h"
#import "JSON.h"
#import "Utility.h"
#import "AppDelegate.h"

@interface Edit_Root_ViewController : UIViewController<UITextFieldDelegate>
{
    
   
    
    UIScrollView *scrollview;
    UILabel *MTitle;
    UIToolbar *Pptoolbar_card;
    
    
    UILabel *ORIGEN_ZIP_LB;
    UITextField *ORIGEN_ZIP_TXT;
    
    
    UILabel *Radius_LB;
    UITextField *Radius_TXT;
    
    UILabel *DESTINATION_ZIP_LB;
    UITextField *DESTINATION_ZIP_TXT;
    
    
    
    UILabel *Radiues_LB;
    UITextField *Radiues_TXT;
    
    
    UILabel *Additional_info_LB;
    UITextField *Additional_info_TXT;
    
    
    UIButton *Plues_BTN;
     UIButton *Sub_BTN;
    
    UIButton *Back_BTN;
    
    
    
    UIView  *facke_view;
    UIButton *Next_BTN;
    UIButton  *Skip_BTN;
    
    
    NSInteger frames_LB;
    NSInteger frames_TX;
    NSInteger frames_Tag_value;
    
    
    NSMutableArray *arrr;
    
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    NSMutableDictionary *dict;
    
    NSInteger frames_LB_X;
    NSInteger frames_TX_X;
    int tag_value;
    
       NSMutableArray *arrayTextFields;
       NSMutableArray *arrayTextFields_lable;
       NSMutableArray *arrayTextFields_button;
    
    
}
@property(strong, nonatomic) UIView *activeTextView;


@end
