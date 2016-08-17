//
//  Edit_License_ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 13/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "API.h"
#import "JSON.h"
#import "AppDelegate.h"
@interface Edit_License_ViewController : UIViewController<UITextFieldDelegate,UIAlertViewDelegate>
{
    UIScrollView *scrollview;
    UILabel *MTitle;
     AppDelegate *appDelegate;
    
    
    UIButton *Back_BTN;
    UIView *TopView;
    UILabel *textlable;
    UIButton *scan_BTN;
    UIView *facke_view;
    
    
    UITextField *Fname_TXT;
    UITextField *Lname_TXT;
    
    UITextField *Address_TXT;
    UITextField *City_TXT;
    UITextField *State_TXT;
    
    
    UIButton *Next_BTN;
    UIButton *Skip_BTN;
    
    UILabel *Fname_LB;
    UILabel *Lname_LB;
    
    UILabel *Address_LB;
    UILabel *City_LB;
    UILabel *State_LB;
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    NSMutableDictionary *dict;
    
    UIImage *chosenImage;
    
    BOOL checkactionSheet;
    UIActionSheet *actionSheets;
    
     UIImageView *livImage;
    
    
    NSString *PUser_image_str;
    
    
}

@property(strong, nonatomic) UIView *activeTextView;
@end
