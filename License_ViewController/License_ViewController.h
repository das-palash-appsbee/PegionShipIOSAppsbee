//
//  License_ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 04/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface License_ViewController : UIViewController<UITextFieldDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate>
{
    UIScrollView *scrollview;
    UILabel *MTitle;

    
   
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

    
    
    UIImage *chosenImage;
    
    BOOL checkactionSheet;
    UIActionSheet *actionSheets;
    
    
    UIImageView *livImage;

}

@property(strong, nonatomic) UIView *activeTextView;


@end
