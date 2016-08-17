//
//  ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 31/03/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALScrollViewPaging.h"
@interface ViewController : UIViewController<UINavigationControllerDelegate>
{
    NSMutableArray *Title_array;
    NSMutableArray *image_array;

    NSMutableArray *lab_array;
    
    UILabel *Title;
    UILabel *lab;
    
    UIButton *_New_user;
    UIButton *_Returning_user;

   
}

-(void)controll:(int)valuespage;
@end

