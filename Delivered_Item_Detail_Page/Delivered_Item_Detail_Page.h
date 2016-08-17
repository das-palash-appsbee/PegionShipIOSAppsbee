//
//  Delivered_Item_Detail_Page.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 11/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "API.h"
#import "JSON.h"
#import "AppDelegate.h"
@interface Delivered_Item_Detail_Page : UIViewController{
    UIScrollView *scrollview;
    UILabel *MTitle;
    AppDelegate *appDelegate;
    
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
    
    
    
    UILabel *Created_on;
    UILabel *Status;
    UILabel *Sender_Name;
    
    
    UILabel *To_delivery;
    UILabel *Pigeon_type;
    UILabel *Distance_Mile;
    
    
    UILabel *Bottom_MTitle;
    
    UILabel *Type;
    UILabel *Width;
    
    UILabel *height;
    UILabel *right_Width;
    
    
    UILabel *Package_price;
    UILabel *Our_fees;
    UILabel *Total;
    
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
    
    
    UILabel *Delivery_Before_LB_ST;
    UILabel *Delivery_Before_LB_DY;
    
    
    UILabel *Posted_On_LB_ST;
    UILabel *Posted_On_LB_DY;
    
    UILabel *Status_LB_ST;
    UILabel *Status_LB_DYT;
    
    
    
    NSString *string_Package_price;
    NSMutableAttributedString *str_Package_price;
    NSString *string_Our_fees;
    NSMutableAttributedString *str_Our_fees;
    NSString *string_Total;
    NSMutableAttributedString *str_Total;
    
    
    UILabel *Bonus;
    
    NSString *string_Bonus;
    NSMutableAttributedString *str_Bonus_fee;

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
