//
//  SELECT_ITEM_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 15/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "SELECT_ITEM_ViewController.h"
#import "Set_Date_Time_ViewController.h"

#import "SetPrice_ViewController.h"

@interface SELECT_ITEM_ViewController ()

@end

@implementation SELECT_ITEM_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [[NSUserDefaults standardUserDefaults]setValue:@"tiny" forKey:@"type"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    [[NSUserDefaults standardUserDefaults]setValue:@"tiny" forKey:@"Select_item"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    UIImageView *backGround=[[UIImageView alloc]init];
    backGround.image=[UIImage imageNamed:@"main_slider_bg.jpg"];
    backGround.frame=CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height);
    backGround.userInteractionEnabled=YES;
    [self.view addSubview:backGround];
    self.navigationController.navigationBarHidden=YES;
    
    
    scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,[[UIScreen mainScreen]bounds].size.width,[[UIScreen mainScreen]bounds].size.height)];
    scrollview.showsVerticalScrollIndicator=YES;
    scrollview.scrollEnabled=YES;
    scrollview.userInteractionEnabled=YES;
    scrollview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:scrollview];
    
    ///////////////////////////// Back Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Back_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [Back_BTN addTarget:self
                 action:@selector(Back:)
       forControlEvents:UIControlEventTouchUpInside];
    [Back_BTN setImage:[UIImage imageNamed:@"back_.png"] forState:UIControlStateNormal];
    Back_BTN.frame = CGRectMake(10,10,49,26);
    [scrollview addSubview:Back_BTN];
    
      ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    MTitle = [[UILabel alloc] init];
    MTitle.textColor = [UIColor blackColor];
    [MTitle setFrame:CGRectMake(0,50,scrollview.frame.size.width, 40)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"Select Approximate Item Size";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:MTitle];
    
    
    ///////////////////////////// Suggested price Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    SUB_Title = [[UILabel alloc] init];
    SUB_Title.textColor = [UIColor blackColor];
    [SUB_Title setFrame:CGRectMake(0,MTitle.frame.origin.y+MTitle.frame.size.height+20,scrollview.frame.size.width, 50)];
    SUB_Title.backgroundColor=[UIColor clearColor];
    SUB_Title.textColor=[UIColor whiteColor];
    SUB_Title.userInteractionEnabled=NO;
    [SUB_Title setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    SUB_Title.numberOfLines=0;
    NSMutableParagraphStyle *style  = [[NSMutableParagraphStyle alloc] init];
    style.minimumLineHeight = 25.f;
    style.maximumLineHeight = 25.f;
    NSDictionary *attributtes = @{NSParagraphStyleAttributeName : style,};
    
    SUB_Title.attributedText = [[NSAttributedString alloc] initWithString:@"This ain’t the post office. \n Take your best guess."
                                                           attributes:attributtes];
    SUB_Title.textAlignment=NSTextAlignmentCenter;
    
    SUB_Title.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
   
  //
    [scrollview addSubview:SUB_Title];
    
    
    
    ///////////////////////////// Tiny_Check_Uncheck  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Tiny_Check_Uncheck = [UIButton buttonWithType:UIButtonTypeCustom];
    [Tiny_Check_Uncheck addTarget:self action:@selector(Tiny_Btn_action:)forControlEvents:UIControlEventTouchUpInside];
    Tiny_Check_Uncheck.frame = CGRectMake(10,SUB_Title.frame.origin.y+SUB_Title.frame.size.height+15,25,25);
    [Tiny_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"check_radio.png"] forState:UIControlStateNormal];
    [scrollview addSubview:Tiny_Check_Uncheck];
    
    
    
    ///////////////////////////// Tiny Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Tiny_Check_text = [[UILabel alloc] init];
    Tiny_Check_text.textColor = [UIColor blackColor];
    [Tiny_Check_text setFrame:CGRectMake(37,SUB_Title.frame.origin.y+SUB_Title.frame.size.height+15,200, 22)];
    Tiny_Check_text.backgroundColor=[UIColor clearColor];
    Tiny_Check_text.textColor=[UIColor whiteColor];
    Tiny_Check_text.userInteractionEnabled=NO;
    [Tiny_Check_text setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
    
    
    NSString *string_value=@"Tiny example: Football";
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:string_value];
    
                                      [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0] range:NSMakeRange(0, 4)];
    
    
    
    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"bariol-regular" size:16.0] range:NSMakeRange(5, [string_value length]-5)];
    
Tiny_Check_text.attributedText = str;
    
    Tiny_Check_text.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Tiny_Check_text.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Tiny_Check_text];
    
    
    
    ///////////////////////////// Small_Check_Uncheck  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Small_Check_Uncheck = [UIButton buttonWithType:UIButtonTypeCustom];
    [Small_Check_Uncheck addTarget:self action:@selector(Small_Check_action:)forControlEvents:UIControlEventTouchUpInside];
    Small_Check_Uncheck.frame = CGRectMake(10,Tiny_Check_text.frame.origin.y+Tiny_Check_text.frame.size.height+17,25,25);
    [Small_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    [scrollview addSubview:Small_Check_Uncheck];
    
    
    
    ///////////////////////////// Small_Check_text  lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Small_Check_text = [[UILabel alloc] init];
    Small_Check_text.textColor = [UIColor blackColor];
    [Small_Check_text setFrame:CGRectMake(37,Tiny_Check_text.frame.origin.y+Tiny_Check_text.frame.size.height+18,200, 22)];
    Small_Check_text.backgroundColor=[UIColor clearColor];
    Small_Check_text.textColor=[UIColor whiteColor];
    Small_Check_text.userInteractionEnabled=NO;
    [Small_Check_text setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    
    
    NSString *Small_Check_text_value=@"Small example: Duffle Bag";
    
    NSMutableAttributedString *str_Small_Check_text= [[NSMutableAttributedString alloc] initWithString:Small_Check_text_value];
    
    [str_Small_Check_text addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0] range:NSMakeRange(0, 5)];
    
    
    
    [str_Small_Check_text addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"bariol-regular" size:16.0] range:NSMakeRange(5, [string_value length]-6)];
    
    Small_Check_text.attributedText = str_Small_Check_text;
    
    Small_Check_text.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Small_Check_text.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Small_Check_text];
    
    
    
    ///////////////////////////// Medium_Check_Uncheck  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Medium_Check_Uncheck = [UIButton buttonWithType:UIButtonTypeCustom];
    [Medium_Check_Uncheck addTarget:self action:@selector(Medium_Btn_action:)forControlEvents:UIControlEventTouchUpInside];
    Medium_Check_Uncheck.frame = CGRectMake(10,Small_Check_text.frame.origin.y+Small_Check_text.frame.size.height+17,25,25);
    [Medium_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    [scrollview addSubview:Medium_Check_Uncheck];
    
    
    
    ///////////////////////////// Medium_text  lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Medium_Check_text = [[UILabel alloc] init];
    Medium_Check_text.textColor = [UIColor blackColor];
    [Medium_Check_text setFrame:CGRectMake(37,Small_Check_text.frame.origin.y+Small_Check_text.frame.size.height+18,300, 22)];
    Medium_Check_text.backgroundColor=[UIColor clearColor];
    Medium_Check_text.textColor=[UIColor whiteColor];
    Medium_Check_text.userInteractionEnabled=NO;
    [Medium_Check_text setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    
    
    NSString *Medium_Check_text_value=@"Medium example: T.V. or Microwave";
    
    NSMutableAttributedString *str_Medium_Check_text= [[NSMutableAttributedString alloc] initWithString:Medium_Check_text_value];
    
    [str_Medium_Check_text addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0] range:NSMakeRange(0, 6)];
    
    
    
    [str_Medium_Check_text addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"bariol-regular" size:16.0] range:NSMakeRange(6, [string_value length]-7)];
    
    Medium_Check_text.attributedText = str_Medium_Check_text;
    
    Medium_Check_text.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Medium_Check_text.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Medium_Check_text];

    ///////////////////////////// Large_Check_Uncheck  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Large_Check_Uncheck = [UIButton buttonWithType:UIButtonTypeCustom];
    [Large_Check_Uncheck addTarget:self action:@selector(Large_Check_Btn_action:)forControlEvents:UIControlEventTouchUpInside];
    Large_Check_Uncheck.frame = CGRectMake(10,Medium_Check_text.frame.origin.y+Medium_Check_text.frame.size.height+17,25,25);
    [Large_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    [scrollview addSubview:Large_Check_Uncheck];
    
    
    
    ///////////////////////////// Large_text  lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Large_Check_text = [[UILabel alloc] init];
    Large_Check_text.textColor = [UIColor blackColor];
    [Large_Check_text setFrame:CGRectMake(37,Medium_Check_text.frame.origin.y+Medium_Check_text.frame.size.height+18,300, 22)];
    Large_Check_text.backgroundColor=[UIColor clearColor];
    Large_Check_text.textColor=[UIColor whiteColor];
    Large_Check_text.userInteractionEnabled=NO;
    [Large_Check_text setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    
    
    NSString *Large_Check_text_value=@"Large example: Large Suitcase";
    
    NSMutableAttributedString *str_Large_Check_text= [[NSMutableAttributedString alloc] initWithString:Large_Check_text_value];
    
    [str_Large_Check_text addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0] range:NSMakeRange(0, 5)];
    
    
    
    [str_Large_Check_text addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"bariol-regular" size:16.0] range:NSMakeRange(6, [string_value length]-6)];
    
    Large_Check_text.attributedText = str_Large_Check_text;
    
    Large_Check_text.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Large_Check_text.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Large_Check_text];

   
    
    
    ///////////////////////////// Extra_Check_Uncheck  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Extra_Check_Uncheck = [UIButton buttonWithType:UIButtonTypeCustom];
    [Extra_Check_Uncheck addTarget:self action:@selector(Extra_Btn_action:)forControlEvents:UIControlEventTouchUpInside];
    Extra_Check_Uncheck.frame = CGRectMake(10,Large_Check_text.frame.origin.y+Large_Check_text.frame.size.height+17,25,25);
    [Extra_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    [scrollview addSubview:Extra_Check_Uncheck];
    
    
    
    ///////////////////////////// Extra_text  lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Extra_Check_text = [[UILabel alloc] init];
    Extra_Check_text.textColor = [UIColor blackColor];
    [Extra_Check_text setFrame:CGRectMake(37,Large_Check_text.frame.origin.y+Large_Check_text.frame.size.height+18,300, 22)];
    Extra_Check_text.backgroundColor=[UIColor clearColor];
    Extra_Check_text.textColor=[UIColor whiteColor];
    Extra_Check_text.userInteractionEnabled=NO;
    [Extra_Check_text setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    
    
    NSString *Extra_Check_text_value=@"Extra Large example: Golf Clubs, Skis, Bike";
    
    NSMutableAttributedString *str_Extra_Check_text= [[NSMutableAttributedString alloc] initWithString:Extra_Check_text_value];
    
    [str_Extra_Check_text addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0] range:NSMakeRange(0, 12)];
    
    
    
    [str_Extra_Check_text addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"bariol-regular" size:16.0] range:NSMakeRange(13, [string_value length]-13)];
    
    Extra_Check_text.attributedText = str_Extra_Check_text;
    
    Extra_Check_text.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Extra_Check_text.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Extra_Check_text];
    
    
    
    ///////////////////////////// Other_Check_Uncheck  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Other_Check_Uncheck = [UIButton buttonWithType:UIButtonTypeCustom];
    [Other_Check_Uncheck addTarget:self action:@selector(Other_Check_action:)forControlEvents:UIControlEventTouchUpInside];
    Other_Check_Uncheck.frame = CGRectMake(10,Extra_Check_text.frame.origin.y+Extra_Check_text.frame.size.height+17,25,25);
    [Other_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    [scrollview addSubview:Other_Check_Uncheck];
    
    
    
    ///////////////////////////// Other_Text  lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Other_Check_text = [[UILabel alloc] init];
    Other_Check_text.textColor = [UIColor blackColor];
    [Other_Check_text setFrame:CGRectMake(37,Extra_Check_text.frame.origin.y+Extra_Check_text.frame.size.height+18,270, 22)];
    Other_Check_text.backgroundColor=[UIColor clearColor];
    Other_Check_text.textColor=[UIColor whiteColor];
    Other_Check_text.userInteractionEnabled=NO;
    [Other_Check_text setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Other_Check_text.lineBreakMode = NSLineBreakByWordWrapping;
    Other_Check_text.numberOfLines = 0;
    NSString *Other_Check_text_value=@"Other I’m going to need a truck";
    
 
    
    NSMutableAttributedString *str_Other_Check_text= [[NSMutableAttributedString alloc] initWithString:Other_Check_text_value];
    
    [str_Other_Check_text addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0] range:NSMakeRange(0, 5)];
    
    
    
    [str_Other_Check_text addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"bariol-regular" size:16.0] range:NSMakeRange(6, [string_value length]-13)];
    
    
    NSMutableParagraphStyle *paragraphStyles = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyles setLineSpacing:10];
    [str_Other_Check_text addAttribute:NSParagraphStyleAttributeName value:paragraphStyles range:NSMakeRange(0, [@"Other I’m going to need a truck" length])];
  
    
    Other_Check_text.attributedText = str_Other_Check_text;
    
    Other_Check_text.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Other_Check_text.textAlignment=NSTextAlignmentLeft;
    
    [Other_Check_text sizeToFit];
    [scrollview addSubview:Other_Check_text];
    
    
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
    Next_BTN.frame = CGRectMake(30, Other_Check_text.frame.origin.y+70,self.view.frame.size.width-60, 41.0);
    [scrollview addSubview:Next_BTN];
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 600);

}

-(void)Other_Check_action:(UIButton *)sender
{
      [[NSUserDefaults standardUserDefaults]setValue:@"other" forKey:@"type"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
      [Tiny_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    [Small_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];


    [Medium_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    
      [Large_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    
    [Other_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"check_radio.png"] forState:UIControlStateNormal];
    
    
     [Extra_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    
    UIAlertView *ALTER=[[UIAlertView alloc]initWithTitle:nil message:@"If seems you need a Pigeon with a truck." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [ALTER show];
    
  }

-(void)Small_Check_action:(UIButton *)sender
{
   
       
    [[NSUserDefaults standardUserDefaults]setValue:@"small" forKey:@"type"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
   
    
    [Tiny_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    [Small_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"check_radio.png"] forState:UIControlStateNormal];
    
    
    [Medium_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    
    [Large_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    
    [Other_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    
    [Extra_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];

}

-(void)Extra_Btn_action:(UIButton *)sender
{
    
    
    [[NSUserDefaults standardUserDefaults]setValue:@"extra-large" forKey:@"type"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
   
    
    [Tiny_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    [Small_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    
    [Medium_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    
    [Large_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    
    [Other_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    
    [Extra_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"check_radio.png"] forState:UIControlStateNormal];

    
    
    UIAlertView *ALTER=[[UIAlertView alloc]initWithTitle:nil message:@"If your item does not fit in a 4 door sedan, select 'Other'" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [ALTER show];
    
    
}

-(void)Large_Check_Btn_action:(UIButton *)sender
{
    
   

    
    [[NSUserDefaults standardUserDefaults]setValue:@"large" forKey:@"type"];
    [[NSUserDefaults standardUserDefaults]synchronize];

    [Tiny_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    [Small_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    
    [Medium_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    
    [Large_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"check_radio.png"] forState:UIControlStateNormal];
    
    
    [Other_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    
    [Extra_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];

}

-(void)Medium_Btn_action:(UIButton *)sender
{
   
  
    [[NSUserDefaults standardUserDefaults]setValue:@"medium" forKey:@"type"];
    [[NSUserDefaults standardUserDefaults]synchronize];

    
    [Tiny_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    [Small_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    
    [Medium_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"check_radio.png"] forState:UIControlStateNormal];
    
    
    [Large_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    
    [Other_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    
    [Extra_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];

}

-(void)Tiny_Btn_action:(UIButton *)sender
{
    
    [[NSUserDefaults standardUserDefaults]setValue:@"tiny" forKey:@"type"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    [Tiny_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"check_radio.png"] forState:UIControlStateNormal];
    
    [Small_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    
    [Medium_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    
    [Large_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    
    [Other_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    
    [Extra_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
}
-(void)Back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)Next:(UIButton *)sender
{
    
       SetPrice_ViewController *OBJProfile_ViewController=[[SetPrice_ViewController alloc]init];
       [self.navigationController pushViewController:OBJProfile_ViewController animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
     [super didReceiveMemoryWarning];
 }


@end
