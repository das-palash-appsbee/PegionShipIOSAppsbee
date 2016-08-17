//
//  ANY_TIME_ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 27/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "API.h"
#import "JSON.h"
#import "AppDelegate.h"

@interface ANY_TIME_ViewController : UIViewController<UIAlertViewDelegate>
{
    UIButton *Back_BTN;
    UILabel *MTitle;
    
    UILabel *Upon_LB;
    
    UILabel *Payment_text_LB;
    
    
 UILabel *TermCondision;
    
    UIImageView *Check_Box;
    
  
    BOOL check_value;
    
    UIButton *PigenShip_it;
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    NSMutableDictionary *dict;
    
    AppDelegate *appDelegate;
    NSString *responseString;
    
}

@end
