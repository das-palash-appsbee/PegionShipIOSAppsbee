//
//  3Steps.h
//  PigeonShip
//
//  Created by Bhushan Bawa on 21/03/16.
//  Copyright © 2016 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface ThreeSteps : UIViewController<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    
    UIButton *Lets_Go;
    
    NSMutableArray *Images_array;
    NSMutableArray *name_array;
    UILabel *mCount_LB;
    UILabel *mBlack_LB;
    
    
    UIImageView *mimages;
    UITableView *mtableview;
    AppDelegate *appDelegate;
    
    
    UIScrollView *scrollview;
    UILabel *MTitle;
    UILabel *sMTitle;
    UIButton *Back_BTN;
    

}

@end
