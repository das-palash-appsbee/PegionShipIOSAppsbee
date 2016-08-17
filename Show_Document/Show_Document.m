//
//  Show_Document.m
//  PigeonShip
//
//  Created by Bhushan Bawa on 23/06/16.
//  Copyright © 2016 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Show_Document.h"
#import "UIImageView+WebCache.h"
@interface Show_Document ()

@end

@implementation Show_Document
@synthesize pick_up_photo;

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *backGround=[[UIImageView alloc]init];
    backGround.image=[UIImage imageNamed:@"main_slider_bg.jpg"];
    backGround.frame=CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height);
    backGround.userInteractionEnabled=YES;
    [self.view addSubview:backGround];
    
    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    MTitle = [[UILabel alloc] init];
    MTitle.textColor = [UIColor blackColor];
    [MTitle setFrame:CGRectMake(0,0,self.view.frame.size.width, 64)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"Pick Up Photo";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:MTitle];
    
    
    ///////////////////////////// Back Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Slider_Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [Slider_Button addTarget:self
                      action:@selector(Slider_Back:)
            forControlEvents:UIControlEventTouchUpInside];
    [Slider_Button setImage:[UIImage imageNamed:@"back_.png"] forState:UIControlStateNormal];
    Slider_Button.frame =CGRectMake(10,15,49,26);
    [self.view addSubview:Slider_Button];
    
    
    
    
    
    UIImageView *Document_pick_up_pic=[[UIImageView alloc]init];
    [Document_pick_up_pic sd_setImageWithURL:[NSURL URLWithString:pick_up_photo]
                            placeholderImage:[UIImage imageNamed:@"logo.png.png"]];
    
    Document_pick_up_pic.frame=CGRectMake(25, 64, self.view.frame.size.width-50, self.view.frame.size.width-50);
    Document_pick_up_pic.userInteractionEnabled=YES;
    [self.view addSubview:Document_pick_up_pic];

    

    
    
    
}

-(void)Slider_Back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
    
}


#pragma mark - -*********************
#pragma mark Activity Indicater
#pragma mark - -*********************

-(void)mActivityIndicater
{
    loader = [[UIView alloc] initWithFrame:CGRectMake(([[UIScreen mainScreen]bounds].size.width-64)/2,[[UIScreen mainScreen]bounds].size.height/2,64,64)];
    
    loader.backgroundColor=[UIColor colorWithRed:61.0f/255.0f green:61.0f/255.0f blue:61.0f/255.0f alpha:1.0];
    loader.layer.cornerRadius=5;
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    CGRect frame = spinner.frame;
    frame.origin.x = loader.frame.size.width / 2 - frame.size.width / 2;
    frame.origin.y = loader.frame.size.height / 2 - frame.size.height / 2;
    spinner.frame = frame;
    [loader addSubview:spinner];
    [spinner startAnimating];
    [self.view addSubview:loader];
}

@end
