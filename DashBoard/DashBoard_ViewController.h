//
//  DashBoard_ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 21/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface DashBoard_ViewController : UIViewController{
    UIImageView *Selfi_image;
    UIScrollView *scrollview;
    
    
    
    UIView *facke_view;
    UILabel *MTitle;
    UIButton *pigen_BTN;
    UIButton *Sender_BTN;
    UILabel *User_Name;
    UILabel *User_Email_ID;
    UILabel *User_Number;
    
    
    
    UIImageView *map_image;
    UILabel *User_Address;
    
    UIButton *Back_BTN;
    
    AppDelegate *appDelegate;
    
    
}

@property(nonatomic,retain)NSString *Class_name;


@end
