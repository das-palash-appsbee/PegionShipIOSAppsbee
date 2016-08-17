//
//  Delivery_Charged_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 13/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Delivery_Charged_ViewController.h"

@interface Delivery_Charged_ViewController ()

@end

@implementation Delivery_Charged_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    UIImageView *backGround=[[UIImageView alloc]init];
    backGround.image=[UIImage imageNamed:@"main_slider_bg.jpg"];
    backGround.frame=CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height);
    backGround.userInteractionEnabled=YES;
    [self.view addSubview:backGround];
    self.navigationController.navigationBarHidden=YES;
    
    ///////////////////////////// Back Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
   

    
    Back_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [Back_BTN addTarget:self
                 action:@selector(Back:)
       forControlEvents:UIControlEventTouchUpInside];
    [Back_BTN setImage:[UIImage imageNamed:@"back_.png"] forState:UIControlStateNormal];
    Back_BTN.frame = CGRectMake(10,10,49,26);
    [self.view addSubview:Back_BTN];
    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    MTitle = [[UILabel alloc] init];
    MTitle.textColor = [UIColor blackColor];
    [MTitle setFrame:CGRectMake(0,20,self.view.frame.size.width, 40)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"TODAY";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:MTitle];
    
    
    ///////////////////////////// Radio  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Check_Uncheck = [UIButton buttonWithType:UIButtonTypeCustom];
    [Check_Uncheck addTarget:self action:@selector(Check_Btn:)forControlEvents:UIControlEventTouchUpInside];
    Check_Uncheck.frame = CGRectMake(30,MTitle.frame.origin.y+MTitle.frame.size.height+2,11,11);
    Check_Uncheck.backgroundColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Check_Uncheck.layer.cornerRadius=11*0.5;
    Check_Uncheck.clipsToBounds=YES;
    Check_Uncheck.layer.borderColor=[UIColor whiteColor].CGColor;
    Check_Uncheck.layer.borderWidth=1;
    
    [self.view addSubview:Check_Uncheck];
    
    
    
    ///////////////////////////// Text for Radsio BUtton\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Demo_LB = [[UILabel alloc] init];
    Demo_LB.textColor = [UIColor blackColor];
    [Demo_LB setFrame:CGRectMake(60,MTitle.frame.origin.y+MTitle.frame.size.height-3,100, 22)];
    Demo_LB.backgroundColor=[UIColor clearColor];
    Demo_LB.textColor=[UIColor whiteColor];
    Demo_LB.userInteractionEnabled=NO;
    [Demo_LB setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
    Demo_LB.text= @"ANYTIME (preferred)";
    Demo_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Demo_LB.textAlignment=NSTextAlignmentLeft;
    [self.view addSubview:Demo_LB];
    
    
    
    ///////////////////////////// Upon_LB Text\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Upon_LB = [[UILabel alloc] init];
    Upon_LB.textColor = [UIColor blackColor];
    [Upon_LB setFrame:CGRectMake(30,Demo_LB.frame.origin.y+Demo_LB.frame.size.height+40,300, 22)];
    Upon_LB.backgroundColor=[UIColor clearColor];
    Upon_LB.textColor=[UIColor whiteColor];
    Upon_LB.userInteractionEnabled=NO;
    [Upon_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Upon_LB.text= @"Upon delivery you will be charged";
    Upon_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Upon_LB.textAlignment=NSTextAlignmentLeft;
    [self.view addSubview:Upon_LB];

      ///////////////////////////// payment Text\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Payment_text_LB = [[UILabel alloc] init];
    Payment_text_LB.textColor = [UIColor blackColor];
    [Payment_text_LB setFrame:CGRectMake(0,Upon_LB.frame.origin.y+Upon_LB.frame.size.height+50,self.view.frame.size.width, 22)];
    Payment_text_LB.backgroundColor=[UIColor clearColor];
    Payment_text_LB.textColor=[UIColor whiteColor];
    Payment_text_LB.userInteractionEnabled=NO;
    [Payment_text_LB setFont:[UIFont fontWithName:@"bariol-regular" size:26.0]];
    Payment_text_LB.text= @"$40";
    Payment_text_LB.textColor=[UIColor whiteColor];
    Payment_text_LB.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:Payment_text_LB];
    
    ///////////////////////////// PigenShip IT Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

    
    PigenShip_it = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [PigenShip_it addTarget:self
                   action:@selector(PigenShip_it:)
         forControlEvents:UIControlEventTouchUpInside];
    PigenShip_it.backgroundColor=[UIColor colorWithRed:228.0f/255.0f green:183.0f/255.0f blue:44.0f/255.0f alpha:1.0];
    [PigenShip_it setTitle:@"PigeonShip-it" forState:UIControlStateNormal];
    [PigenShip_it setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    [PigenShip_it setTitleColor:[UIColor colorWithRed:225.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    
    
    PigenShip_it.layer.cornerRadius=20;
    PigenShip_it.clipsToBounds = YES;
    PigenShip_it.frame = CGRectMake(30, Payment_text_LB.frame.origin.y+70,self.view.frame.size.width-60, 40.0);
    [self.view addSubview:PigenShip_it];
    



}

-(void)Back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)Check_Btn:(UIButton *)sender
{

}

-(void)PigenShip_it:(UIButton *)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
