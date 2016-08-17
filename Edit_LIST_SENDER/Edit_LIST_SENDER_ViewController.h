//
//  Edit_LIST_SENDER_ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 20/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface Edit_LIST_SENDER_ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{
     AppDelegate *appDelegate;
    //    UIImageView *Selfi_image;
    UILabel *EDIT_VIEW_Name;
    //    UILabel *User_Email_ID;
    //    UILabel *User_Number;
    //
    UITableView *mtableview ;
    
    NSMutableArray *List_item;
    UILabel *MTitle;
    
    UIButton *Slider_Button;
    
}



@end
