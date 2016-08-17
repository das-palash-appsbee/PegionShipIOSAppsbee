//
//  Edit_Profile_Pic_ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 13/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "API.h"
#import "JSON.h"
#import "AppDelegate.h"
@interface Edit_Profile_Pic_ViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
     AppDelegate *appDelegate;
    UIScrollView *scrollview;
    
    
    UIImageView *Selfi_image;
    
    UIView *facke_view;
    
    
    UILabel *MTitle;
    
    UIButton *Upload_BTN;
    UIButton *Next_BTN;
    UIButton *Skip_BTN;
    
    UIButton *Back_BTN;
    UIImage *chosenImage;
    BOOL CHeck_image;
    
    NSMutableArray *mValide_key;
    NSData *imageData;
    UIImage* image ;
    NSString *Svalues;
    
    
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    NSMutableDictionary *dict;
    
}


@end
