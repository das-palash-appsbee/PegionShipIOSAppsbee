//
//  Pending_items_sender_deatil.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 20/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "API.h"
#import "JSON.h"
#import "AppDelegate.h"
@interface Pending_items_sender_deatil : UIViewController<UITextFieldDelegate>
{
     AppDelegate *appDelegate;
    UIScrollView *scrollview;
    UILabel *MTitle;
    
    
    UIButton *Next_BTN;
    UIButton *Back_BTN;
    UIView *TopView;
    
    
    UILabel *topLeft_LB;
    UIImageView *topLeft_location_IMG;
    UILabel *Middle_Left_Address_LB;
    UIImageView *Middle_Line_IMG;
    UILabel *Middle_Round_LB;
    UILabel *topRight_LB;
    UIImageView *topRight_location_IMG;
    UILabel *Middle_Right_Address_LB;
    
    UILabel *Delivery_Before_LB_ST;
    UILabel *Delivery_Before_LB_DY;
    
    
    UILabel *Posted_On_LB_ST;
    UILabel *Posted_On_LB_DY;
    
    UILabel *Status_LB_ST;
    UILabel *Status_LB_DYT;
    
    UILabel *Accepted_On_LB_ST;
    UILabel *Accepted_On_LB_DYT;
    
    
    
    UILabel *Total_Distance_LB_ST;
    UILabel *Total_Distance_LB_DYT;
    
    
    UILabel *Accepted_By_Pigeon_LB_ST;
    UILabel *Accepted_By_Pigeon_LB_DYT;
    
    UILabel *Package_Password_LB_ST;
    UILabel *Package_Password_LB_DYT;
    
    UILabel *Bottom_MTitle;
    
    UILabel *Type;
    UILabel *Width;
    
    UILabel *height;
    UILabel *right_Width;
    
   
    
    
    UIButton *Accept_BTN;
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    
    NSDictionary *attributtes ;
    NSDictionary *attributtess ;
    
    
    NSMutableDictionary *dict;
    NSMutableDictionary *DEMOdict;
    
    
    UILabel *Update_package_Status_LB;
    UILabel *Deliver_order_LB;
    UILabel *Package_Code_LB;
    UITextField *Code_Text_TXT;
    UIButton *Accept_Radio_Btn;
    
    UIButton *Cancel_Radio_Btn;
    UILabel *Cancel_order_LB;
    UILabel *Note_LB;
    
    NSString *States_Key;
    
     UILabel *Package_price;
     UILabel *Shipping_Price;
     UILabel *Item_price;
    
    
    
    NSString *string_Package_price;
    NSMutableAttributedString *str_Package_price;
    
    NSString *string_Shipping_Price;
    NSMutableAttributedString *str_Shipping_Price;

    
    NSString *string_Item_price;
    NSMutableAttributedString *str_Item_price;
    
    
    UILabel *Bundle_item;
    UILabel *Pick_ready;
    UILabel *pic_date;
    UILabel *Max_pic_date;
    UILabel *Item_type;
    UILabel *Bundle_item_count;
    UIButton *See_Bundle_Packages;

}
@property(nonatomic,retain)NSString *Pack_Key;
@property(nonatomic,retain)NSString *post_type;



@end
