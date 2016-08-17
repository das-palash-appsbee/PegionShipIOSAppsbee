//
//  Item_Detail_ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 16/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "API.h"
#import "JSON.h"
#import "AppDelegate.h"

@interface Item_Detail_ViewController : UIViewController
{
    
    
    UILabel *Pick_ready;
    UILabel *pic_date;
    UILabel *Max_pic_date;
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
    
    
    
    UILabel *Created_on;
    UILabel *Created_on_DYN;
    
    
    UILabel *Status;
    UILabel *Status_DYN;
    
    
    
    UILabel *Sender_Name;
    UILabel *Sender_Name_DYN;
    
    
    UILabel *To_delivery;
    UILabel *To_delivery_DYN;
    
    
    UILabel *Pigeon_type;
    UILabel *Pigeon_type_DYN;
    
    
    UILabel *Distance_Mile;
    UILabel *Distance_Mile_DYN;
    
    
     UILabel *Bottom_MTitle;
    
    UILabel *Type;
    UILabel *Width;
    
    UILabel *height;
    UILabel *right_Width;
    
    
    UILabel *Package_price;
    UILabel *Our_fees;
     UILabel *Bonus;
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
    
    
    NSString *string_Package_price;
    NSMutableAttributedString *str_Package_price;
    NSString *string_Total;
    NSMutableAttributedString *str_Total;
    
    NSString *string_Our_fees;
    NSMutableAttributedString *str_Our_fees;
    
    
     NSString *string_Bonus;
     NSMutableAttributedString *str_Bonus_fee;
    
    NSString *string_Pigeon_type;
    NSString *string_Type;
    
    
    UILabel *Bundle_item;
   // UILabel *Pick_ready;
    //UILabel *pic_date;
    UILabel *Bundle_item_count;
    UIButton *See_Bundle_Packages;
    
   // UILabel *Max_pic_date;
    


}



@property(nonatomic,retain)NSString *Pack_Key;
@property(nonatomic,retain)NSString *post_id;
@property(nonatomic,retain)NSString *post_type;

@end
