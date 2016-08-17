//
//  Close_items_Deatils.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 11/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "API.h"
#import "JSON.h"
#import "HCSStarRatingView.h"
#import "AXRatingView.h"
#import "AppDelegate.h"

@interface Close_items_Deatils : UIViewController<UITextFieldDelegate,UITextViewDelegate>
{
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
    
    
    UILabel *Update_package_Status_LB;
    UILabel *Deliver_order_LB;
    UILabel *Package_Code_LB;
    UITextField *Code_Text_TXT;
    UIButton *Accept_Radio_Btn;
    
    UIButton *Cancel_Radio_Btn;
    UILabel *Cancel_order_LB;
    UILabel *Note_LB;
    
    NSString *States_Key;
    UITextView *FeedBack_TXTVIEW;
    HCSStarRatingView *objHCSStarRatingView;
      AXRatingView *ratingView;
    
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
    
    
    
    NSString *string_Package_price;
    NSMutableAttributedString *str_Package_price;
    NSString *string_Our_fees;
    NSMutableAttributedString *str_Our_fees;
    NSString *string_Total;
    NSMutableAttributedString *str_Total;
    
    
    UILabel *Bonus;
    
    NSString *string_Bonus;
    NSMutableAttributedString *str_Bonus_fee;

    
    AppDelegate *appDelegate;

}
@property(nonatomic,retain)NSString *Pack_Key;


@end
