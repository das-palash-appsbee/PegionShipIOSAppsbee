//
//  Edit_multi_vechile_detail_ViewController.h
//  PigeonShip
//
//  Created by Bhushan Bawa on 25/08/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "API.h"
#import "JSON.h"
#import "AppDelegate.h"
@interface Edit_multi_vechile_detail_ViewController : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    AppDelegate *appDelegate;
    UIScrollView *scrollview;
    UILabel *MTitle;
    
    
    UIButton *ADD_MORE;
    UIButton *SHOW_ADD_MORE_DETAIL;
    
    UIButton *Next_BTN;
    UIButton *Back_BTN;
    UIView *TopView;
    UILabel *textlable;
    UIButton *scan_BTN;
    
    
    UITextField *Car_Make_TXT;
    UITextField *Car_Modal_TXT;
    
    UITextField *Year_TXT;
    UITextField *Color_TXT;
    
    
    UITextField *Type_TXT;
    UITextField *Sub_Type_TXT;
    
    UILabel *Car_Make_LB;
    UILabel *Car_Modal_LB;
    
    
    UILabel *Type_LB;
    UILabel *Sub_Type_LB;
    
    UILabel *Year_LB;
    UILabel *Color_LB;
    UIView *facke_view;
    
    
    UIButton *Skip_BTN;
    
    NSMutableArray *Type_array;
    NSMutableArray *Demo_array;
    NSMutableArray *years;
    NSMutableArray *Sub_Type_array;
    UIPickerView *pPickerState;
    NSString *pickre_STR;
    
    UIToolbar *ptoolbar;
    NSInteger tagvale;
    
    NSMutableDictionary *Dic_Vechile_info;
    
    
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    NSMutableDictionary *dict;
    NSMutableDictionary *dict2;
    
    
    NSMutableArray *arrr;
    NSMutableDictionary *MARRAYS;
    
    UITableView *mtableview;
    
    UILabel *topLeft_LB;
    NSString  *ALL_DATA;
    
}
@property(strong, nonatomic) UIView *activeTextView;




@end
