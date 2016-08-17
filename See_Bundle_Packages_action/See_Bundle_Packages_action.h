//
//  See_Bundle_Packages_action.h
//  PigeonShip
//
//  Created by Bhushan Bawa on 07/03/16.
//  Copyright © 2016 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface See_Bundle_Packages_action : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UILabel *address;
    UILabel *city;
    UILabel *state;
    UILabel *zip;
    
    UILabel *address_TX;
    UILabel *city_TX;
    UILabel *state_TX;
    UILabel *zip_TX;
    
    
    UITableView  *mtableview;
    UIButton *Back_BTN;
    
}

@property(nonatomic,retain)NSMutableDictionary *Bundle_package;


@end
