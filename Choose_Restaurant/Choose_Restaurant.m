//
//  Choose_Restaurant.m
//  PigeonShip
//
//  Created by Bhushan Bawa on 05/05/16.
//  Copyright © 2016 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Choose_Restaurant.h"
#import "Drop_Address.h"
@interface Choose_Restaurant ()

@end

@implementation Choose_Restaurant

-(void)Back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *backGround=[[UIImageView alloc]init];
    backGround.image=[UIImage imageNamed:@"main_slider_bg.jpg"];
    backGround.frame=CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height);
    backGround.userInteractionEnabled=YES;
    [self.view addSubview:backGround];
    
    
    ///////////////////////////// Back Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Back_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [Back_BTN addTarget:self
                 action:@selector(Back:)
       forControlEvents:UIControlEventTouchUpInside];
    [Back_BTN setImage:[UIImage imageNamed:@"back_.png"] forState:UIControlStateNormal];
    
    
     Back_BTN.frame = CGRectMake(10,10,49,26);
    [self.view addSubview:Back_BTN];
    
    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    sMTitle = [[UILabel alloc] init];
    sMTitle.textColor = [UIColor blackColor];
    [sMTitle setFrame:CGRectMake(0,10,self.view.frame.size.width, 40)];
    sMTitle.backgroundColor=[UIColor clearColor];
    sMTitle.textColor=[UIColor whiteColor];
    sMTitle.userInteractionEnabled=NO;
    [sMTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    sMTitle.text= @"Step 1-Choose Restaurant";
    sMTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    sMTitle.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:sMTitle];
    
    mySearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 50)];
    mySearchBar.delegate = self;
    [mySearchBar setBackgroundColor:[UIColor colorWithRed:63.0f/255.0f green:63.0f/255.0f blue:63.0f/255.0f alpha:1.0]];
    [mySearchBar setBackgroundImage:[UIImage new]];
    mySearchBar.placeholder=@"Enter Web Address";
    [mySearchBar setTranslucent:YES];
    [self.view addSubview:mySearchBar];
    

}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
   
    
    
    Drop_Address *objItem_Detail_ViewController=[[Drop_Address alloc]init];
    [self.navigationController pushViewController:objItem_Detail_ViewController animated:YES];

    
    
    
    
    
    [searchBar resignFirstResponder];
    
    

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
