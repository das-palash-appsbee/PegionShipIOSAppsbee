//
//  new_item_notification.m
//  PigeonShip
//
//  Created by Bhushan Bawa on 02/03/16.
//  Copyright © 2016 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "new_item_notification.h"

@interface new_item_notification ()

@end

@implementation new_item_notification
@synthesize post_id;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIAlertView *malterview=[[UIAlertView alloc]initWithTitle:@"Testing" message:post_id delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [malterview show];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
