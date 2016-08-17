//
//  SliderView_ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 16/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "API.h"
#import "JSON.h"
@interface SliderView_ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{
     UIImageView *Selfi_image;
    UILabel *User_Name;
    UILabel *User_Email_ID;
    UILabel *User_Number;
    
    UITableView *mtableview ;
    
    NSMutableArray *List_item;
     NSMutableArray *List_item_images;
    
    
    UIImageView *List_image;
    UILabel *List_Name;
    
    AppDelegate *appDelegate;

    
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    NSMutableDictionary *dict;
    

}

@end
