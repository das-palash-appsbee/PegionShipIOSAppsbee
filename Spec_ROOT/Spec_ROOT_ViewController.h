//
//  Spec_ROOT_ViewController.h
//  PigeonShip
//
//  Created by Bhushan Bawa on 23/06/15.
//  Copyright (c) 2015

//

#import <UIKit/UIKit.h>

@interface Spec_ROOT_ViewController : UIViewController<UITextFieldDelegate>
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
    
    UIButton *Back_BTN;
    
    
    
    UIView  *facke_view;
    UIButton *Next_BTN;
    UIButton  *Skip_BTN;
    
    
      NSInteger frames_LB;
        NSInteger frames_TX;
    NSInteger frames_Tag_value;
    
    
    NSMutableArray *arrr;
    

    

}
@property(strong, nonatomic) UIView *activeTextView;
@end
