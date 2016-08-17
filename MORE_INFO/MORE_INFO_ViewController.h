//
//  MORE_INFO_ViewController.h
//  PigeonShip
//
//  Created by Bhushan Bawa on 16/06/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "API.h"
#import "JSON.h"
#import <MessageUI/MFMailComposeViewController.h>

@interface MORE_INFO_ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate,MFMailComposeViewControllerDelegate>
{
  
       UILabel *EDIT_VIEW_Name;
       UITableView *mtableview ;
    
    NSMutableArray *List_item;
    UILabel *MTitle;
    
    UIButton *Slider_Button;
    
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;

    
    NSMutableDictionary *dict;
    
    
}


@end
