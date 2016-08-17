//
//  Pigeon_Posting_ViewController.h
//  PigeonShip
//
//  Created by Bhushan Bawa on 02/09/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFSideMenu.h"
#import "CoreLocation/CoreLocation.h"
#import "AutocompletionTableView.h"
#import  <MobileCoreServices/MobileCoreServices.h>
#import "MapKit/MapKit.h"
#import "API.h"
#import "JSON.h"
#import "AppDelegate.h"

AppDelegate *appDelegate;

@interface Pigeon_Posting_ViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate,MKReverseGeocoderDelegate,CLLocationManagerDelegate,UIPickerViewDelegate,UIPickerViewDataSource,AutocompletionTableViewDelegate,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,UIAlertViewDelegate>

{
    
       AppDelegate *appDelegate;
    CLLocationManager *locationManager;
    CLLocation *currentLocation;

    UILabel *MTitle;
     UILabel *sMTitle;
    UIButton *Back_BTN;
     UIScrollView *scrollview;
    
    UIView *TopView;
    UILabel *textlable;
    
    UISwitch *mySwitch;
    
     UILabel *DemoText;
    
    UILabel *Chosse_Pick_Up_address_LB;
    UITextField *Chosse_Pick_Up_address_TF;
    
    
    UILabel *Busines_name_LB;
    UITextField *Busines_name_TF;
    
    
    UIImageView *imgView_Busines_name;
    UIImageView *imgView_Lname_drop;
    
    UILabel *Full_address_LB;
    UITextField *Full_address_TF;
    
    
    
    
    UILabel *App_setp_LB;
    UILabel *City_LB;
    
    
    UITextField *App_setp_TXT;
    UITextField *City_TXT;
    
    
    UILabel *State_LB;
    UILabel *Zip_LB;
    
    
    UITextField *State_TXT;
    UITextField *Zip_TXT;
    
    UILabel *Meet_With_Pigeon;
    
    
    
    UIButton *Me_BTN;
    UILabel *Me_LB;
    
    UIButton *Other_BTN;
    UILabel *Other_LB;
    
    
    UILabel *other_pic_up_LB;
    UITextField *other_pic_up_name;
    
    UILabel *Addition_info;
    
    
    UITextView *Addition_info_TXT_View;
    
    
    
    ////////////////// Drop Up Address\\\\\\\\\\\\\\\\\\\\
    
    
    
    UILabel *MTitle_Drop;
    
    UILabel *Chosse_Pick_Up_address_LB_Drop;
    UITextField *Chosse_Pick_Up_address_TF_Drop;
    
    
    UILabel *Busines_name_LB_Drop;
    UITextField *Busines_name_TF_Drop;
    
    
    UILabel *Full_address_LB_Drop;
    UITextField *Full_address_TF_Drop;
    
    
    
    
    UILabel *App_setp_LB_Drop;
    UILabel *City_LB_Drop;
    
    
    UITextField *App_setp_TXT_Drop;
    UITextField *City_TXT_Drop;
    
    
    UILabel *State_LB_Drop;
    UILabel *Zip_LB_Drop;
    
    
    UITextField *State_TXT_Drop;
    UITextField *Zip_TXT_Drop;
    
    UILabel *Meet_With_Pigeon_Drop;
    
    
    
    UIButton *Me_BTN_Drop;
    UILabel *Me_LB_Drop;
    
    UIButton *Other_BTN_Drop;
    UILabel *Other_LB_Drop;
    
    UILabel *other_drop_down_LB;
    UITextField *other_drop_down_name;
    
    
    UILabel *Addition_info_Drop_Drop;
    
    
    UITextView *Addition_info_TXT_View_Drop;
    
    
    //////////////// Bottom Part //////////////////
    
    
    UIView *facke_view;
    
    
    UIButton *Reset;
    UIButton *Choose_size;
    
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    NSMutableDictionary *dict;
    NSMutableDictionary *dict2;
    
    
    UIPickerView *pPickerState;
    UIToolbar *ptoolbar;
    
    NSMutableArray *Demo_array;
    
    
    NSString  *pickre_STR;
    NSInteger tagvale;
    
    NSInteger pickre_row;
    
    
    
    BOOL check_Who_meet_pick;
    
    BOOL check_Who_meet_drop;
    
    NSMutableDictionary *google_api;
    
    
    BOOL TestfildBoolvalue;;
    
    
    UITableView *mtableview;
    
    BOOL check_feils;
    
    BOOL keyboardIsShown;
    
}
@property(strong, nonatomic) UIView *activeTextView;



@property (nonatomic, strong) AutocompletionTableView *autoCompleter;
@end

