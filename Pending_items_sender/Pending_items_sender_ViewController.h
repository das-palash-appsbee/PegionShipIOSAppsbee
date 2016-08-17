//
//  Pending_items_sender_ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 20/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface Pending_items_sender_ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
     AppDelegate *appDelegate;    UIButton *Slider_Button;
    
    UILabel *MTitle;
    UIView *TopView;
    UILabel *textlable;
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    
    
    NSMutableDictionary *dict;
    UITableView *mtableview;
    
    
    UIView *mtable_bacground;
    UILabel *topLeft_LB;
    UIImageView *topLeft_location_IMG;
    UILabel *Middle_Left_Address_LB;
    
    
    
    UIImageView *Middle_Line_IMG;
    
    UILabel *Middle_Round_LB;
    
    UILabel *topRight_LB;
    UIImageView *topRight_location_IMG;
    UILabel *Middle_Right_Address_LB;
    
    
    
    UILabel *Pack_type_str_LB;
    UILabel *Pack_type_dyn_LB;
    
    
    UILabel *Delivered_Before_str_LB;
    UILabel *Delivered_Before_dyn_LB;
    
    
    UIButton *View_Detail_BTN;
    UIButton *Accept_BTN;
    
    NSString *PACKAGE_ID;
    
    NSInteger indexvalue;
    
    
    NSMutableDictionary *DEMOdict;
    
    
}



@end
