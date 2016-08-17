//
//  Set_Date_Time_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 15/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Set_Date_Time_ViewController.h"

#import "Tomorrow_Day_ViewController.h"
#import "ANY_TIME_ViewController.h"
#import "Today_ViewController.h"
#import "Specific_Day_ViewController.h"

@interface Set_Date_Time_ViewController ()

@end

@implementation Set_Date_Time_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
       
    [[NSUserDefaults standardUserDefaults]setValue:@"anytime" forKey:@"select_date"];
    [[NSUserDefaults standardUserDefaults]synchronize];

    
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
    [MTitle setFrame:CGRectMake(0,50,self.view.frame.size.width, 40)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"Set Date & Time";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:MTitle];
    
    ///////////////////////////// SUB Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    SUB_Title = [[UILabel alloc] init];
    SUB_Title.textColor = [UIColor blackColor];
    [SUB_Title setFrame:CGRectMake(30,MTitle.frame.origin.y+MTitle.frame.size.height+20,self.view.frame.size.width, 40)];
    SUB_Title.backgroundColor=[UIColor clearColor];
    SUB_Title.textColor=[UIColor whiteColor];
    SUB_Title.userInteractionEnabled=NO;
    [SUB_Title setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    SUB_Title.text= @"I want this item delivered by:";
    SUB_Title.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    SUB_Title.textAlignment=NSTextAlignmentLeft;
    [self.view addSubview:SUB_Title];
    
    
    ///////////////////////////// ANYtime  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    ANYtime_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [ANYtime_BTN addTarget:self action:@selector(ANYtime_Btn:)forControlEvents:UIControlEventTouchUpInside];
    ANYtime_BTN.frame = CGRectMake(30,SUB_Title.frame.origin.y+SUB_Title.frame.size.height+5,25,25);
    [ANYtime_BTN setBackgroundImage:[UIImage imageNamed:@"check_radio.png"] forState:UIControlStateNormal];
    [self.view addSubview:ANYtime_BTN];
    
    
    
    ///////////////////////////// ANYtime UILable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    ANYtime_TEXT = [[UILabel alloc] init];
    ANYtime_TEXT.textColor = [UIColor blackColor];
    [ANYtime_TEXT setFrame:CGRectMake(60,SUB_Title.frame.origin.y+SUB_Title.frame.size.height+6,200, 22)];
    ANYtime_TEXT.backgroundColor=[UIColor clearColor];
    ANYtime_TEXT.textColor=[UIColor whiteColor];
    ANYtime_TEXT.userInteractionEnabled=NO;
    [ANYtime_TEXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    ANYtime_TEXT.text= @"ANYTIME (preferred)";
    ANYtime_TEXT.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    ANYtime_TEXT.textAlignment=NSTextAlignmentLeft;
    [self.view addSubview:ANYtime_TEXT];
    
    
    
    ///////////////////////////// TOMORROW  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    TOMORROW_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [TOMORROW_BTN addTarget:self action:@selector(TOMORROW_Btn:)forControlEvents:UIControlEventTouchUpInside];
    TOMORROW_BTN.frame = CGRectMake(30,ANYtime_TEXT.frame.origin.y+ANYtime_TEXT.frame.size.height+15,25,25);
    [TOMORROW_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];

    
    [self.view addSubview:TOMORROW_BTN];
    
    
    
    ///////////////////////////// TOMORROW UILable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    TOMORROW_TEXT = [[UILabel alloc] init];
    TOMORROW_TEXT.textColor = [UIColor blackColor];
    [TOMORROW_TEXT setFrame:CGRectMake(60,ANYtime_TEXT.frame.origin.y+ANYtime_TEXT.frame.size.height+16,200, 22)];
    TOMORROW_TEXT.backgroundColor=[UIColor clearColor];
    TOMORROW_TEXT.textColor=[UIColor whiteColor];
    TOMORROW_TEXT.userInteractionEnabled=NO;
    [TOMORROW_TEXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    TOMORROW_TEXT.text= @"TOMORROW";
    TOMORROW_TEXT.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    TOMORROW_TEXT.textAlignment=NSTextAlignmentLeft;
    [self.view addSubview:TOMORROW_TEXT];

    
    
    
    
 
    
    
    ///////////////////////////// TODAY  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    TODAY_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [TODAY_BTN addTarget:self action:@selector(TODAY_Btn:)forControlEvents:UIControlEventTouchUpInside];
    TODAY_BTN.frame = CGRectMake(30,TOMORROW_TEXT.frame.origin.y+TOMORROW_TEXT.frame.size.height+15,25,25);
    [TODAY_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    [self.view addSubview:TODAY_BTN];
    
    
    
    ///////////////////////////// TODAY UILable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    TODAY_TEXT = [[UILabel alloc] init];
    TODAY_TEXT.textColor = [UIColor blackColor];
    [TODAY_TEXT setFrame:CGRectMake(60,TOMORROW_TEXT.frame.origin.y+TOMORROW_TEXT.frame.size.height+16,200, 22)];
    TODAY_TEXT.backgroundColor=[UIColor clearColor];
    TODAY_TEXT.textColor=[UIColor whiteColor];
    TODAY_TEXT.userInteractionEnabled=NO;
    [TODAY_TEXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    TODAY_TEXT.text= @"TODAY";
    TODAY_TEXT.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    TODAY_TEXT.textAlignment=NSTextAlignmentLeft;
    [self.view addSubview:TODAY_TEXT];
    

    /////////////////////////////  Choose Day  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Choose_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [Choose_BTN addTarget:self action:@selector(Choose_Btn:)forControlEvents:UIControlEventTouchUpInside];
    Choose_BTN.frame = CGRectMake(30,TODAY_BTN.frame.origin.y+TODAY_BTN.frame.size.height+15,25,25);
    [Choose_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    [self.view addSubview:Choose_BTN];
    
    
    
    /////////////////////////////  Choose Day UILable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Choose_TEXT = [[UILabel alloc] init];
    Choose_TEXT.textColor = [UIColor blackColor];
    [Choose_TEXT setFrame:CGRectMake(60,TODAY_BTN.frame.origin.y+TODAY_BTN.frame.size.height+16,200, 22)];
    Choose_TEXT.backgroundColor=[UIColor clearColor];
    Choose_TEXT.textColor=[UIColor whiteColor];
    Choose_TEXT.userInteractionEnabled=NO;
    [Choose_TEXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Choose_TEXT.text= @"CHOOSE A DAY";
    Choose_TEXT.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Choose_TEXT.textAlignment=NSTextAlignmentLeft;
    [self.view addSubview:Choose_TEXT];
    
    
    
    //////////////////// Sign In Button\\\\\\\\\\\\\\
    
    Next_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Next_BTN addTarget:self
                 action:@selector(Next:)
       forControlEvents:UIControlEventTouchUpInside];
    Next_BTN.backgroundColor=[UIColor colorWithRed:228.0f/255.0f green:183.0f/255.0f blue:44.0f/255.0f alpha:1.0];
    [Next_BTN setTitle:@"Next" forState:UIControlStateNormal];
    [Next_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    [Next_BTN setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    
    
    
    
    Next_BTN.layer.cornerRadius=20;
    Next_BTN.clipsToBounds = YES;
    Next_BTN.frame = CGRectMake(30, Choose_TEXT.frame.origin.y+70,self.view.frame.size.width-60, 41.0);
    [self.view addSubview:Next_BTN];


    small_text = [[UILabel alloc] init];
    small_text.textColor = [UIColor blackColor];
    [small_text setFrame:CGRectMake(35,Next_BTN.frame.origin.y+Next_BTN.frame.size.height+25,270, 22)];
    small_text.backgroundColor=[UIColor clearColor];
    small_text.textColor=[UIColor whiteColor];
    small_text.userInteractionEnabled=NO;
    [small_text setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
    small_text.lineBreakMode = NSLineBreakByWordWrapping;
    small_text.numberOfLines = 0;
    
    NSMutableAttributedString *str_Other_Check_text= [[NSMutableAttributedString alloc] initWithString:@"This item needs to be delivered no later than when? (allowing more time attracts more Pigeons)"];
    
    
    NSMutableParagraphStyle *paragraphStyles = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyles setLineSpacing:10];
    [str_Other_Check_text addAttribute:NSParagraphStyleAttributeName value:paragraphStyles range:NSMakeRange(0, [@"This item needs to be delivered no later than when? (allowing more time attracts more Pigeons)" length])];
    
    
    small_text.attributedText = str_Other_Check_text;
    
    small_text.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    small_text.textAlignment=NSTextAlignmentLeft;
    
    [small_text sizeToFit];
    [self.view addSubview:small_text];


}



-(void)Next:(UIButton *)sender
{
    
    
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"select_date"]isEqualToString:@"anytime"]) {
        
        ANY_TIME_ViewController *objTomorrow_Day_ViewController=[[ANY_TIME_ViewController alloc]init];
        
        [self.navigationController pushViewController:objTomorrow_Day_ViewController animated:YES];

        
    }
    
    else if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"select_date"]isEqualToString:@"tommorow"])
    {
        Tomorrow_Day_ViewController *objTomorrow_Day_ViewController=[[Tomorrow_Day_ViewController alloc]init];
        
        [self.navigationController pushViewController:objTomorrow_Day_ViewController animated:YES];

    }
    
    else if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"select_date"]isEqualToString:@"today"])
    {
        Today_ViewController *objTomorrow_Day_ViewController=[[Today_ViewController alloc]init];
        
        [self.navigationController pushViewController:objTomorrow_Day_ViewController animated:YES];
 
    }
    
    else if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"select_date"]isEqualToString:@"specific_date"])
    {
        Specific_Day_ViewController *objTomorrow_Day_ViewController=[[Specific_Day_ViewController alloc]init];
        
        [self.navigationController pushViewController:objTomorrow_Day_ViewController animated:YES];

    }
    
    
    
}

-(void)ANYtime_Btn:(UIButton *)sender
{

    [[NSUserDefaults standardUserDefaults]setValue:@"anytime" forKey:@"select_date"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    
    [ANYtime_BTN setBackgroundImage:[UIImage imageNamed:@"check_radio.png"] forState:UIControlStateNormal];
    [TOMORROW_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    [TODAY_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
     [Choose_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
}


-(void)TOMORROW_Btn:(UIButton *)sender
{
    
    [[NSUserDefaults standardUserDefaults]setValue:@"tommorow" forKey:@"select_date"];
    [[NSUserDefaults standardUserDefaults]synchronize];

    
    [ANYtime_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    [TOMORROW_BTN setBackgroundImage:[UIImage imageNamed:@"check_radio.png"] forState:UIControlStateNormal];
    [TODAY_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    [Choose_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];

}


-(void)TODAY_Btn:(UIButton *)sender
{
    
    [[NSUserDefaults standardUserDefaults]setValue:@"today" forKey:@"select_date"];
    [[NSUserDefaults standardUserDefaults]synchronize];

    
    [ANYtime_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    [TOMORROW_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    [TODAY_BTN setBackgroundImage:[UIImage imageNamed:@"check_radio.png"] forState:UIControlStateNormal];
    [Choose_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];

    
}


-(void)Choose_Btn:(UIButton *)sender
{
    
    [[NSUserDefaults standardUserDefaults]setValue:@"specific_date" forKey:@"select_date"];
    [[NSUserDefaults standardUserDefaults]synchronize];

    
    [ANYtime_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    [TOMORROW_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    [TODAY_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    [Choose_BTN setBackgroundImage:[UIImage imageNamed:@"check_radio.png"] forState:UIControlStateNormal];

}

-(void)Back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
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
