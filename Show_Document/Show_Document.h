//
//  Show_Document.h
//  PigeonShip
//
//  Created by Bhushan Bawa on 23/06/16.
//  Copyright © 2016 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Show_Document : UIViewController
{
    UILabel *MTitle;
    UIButton *Slider_Button;
    
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    UITextView *txtview;

}
@property(nonatomic,retain)NSString *pick_up_photo;


@end
