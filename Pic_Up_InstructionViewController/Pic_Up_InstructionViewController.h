//
//  Pic_Up_InstructionViewController.h
//  PigeonShip
//
//  Created by Bhushan Bawa on 16/06/16.
//  Copyright © 2016 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Pic_Up_InstructionViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITextViewDelegate>
{
     UILabel *MTitle;
    UIButton *Slider_Button;
    NSMutableArray *list_Instruction;
    
    UIButton *take_Photo;
    UIButton *Upload_Button;
    
    UIImage *chosenImage;
    BOOL CHeck_image;

    
    UIImageView *Pick_Up_Photo;
    
    NSMutableDictionary *dict;
    
    NSString *image_base_64;
    
       
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    UITextView *txtview;

    
}
@property(retain,nonatomic)NSString *Pack_Key;


@end