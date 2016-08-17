//
//  Selfi_ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 03/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Selfi_ViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
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
    
}

@end
