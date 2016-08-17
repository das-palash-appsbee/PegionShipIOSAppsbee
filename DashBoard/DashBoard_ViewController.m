//
//  DashBoard_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 21/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "DashBoard_ViewController.h"
#import "AppDelegate.h"
#import "UIImageView+WebCache.h"


@interface DashBoard_ViewController ()

@end

@implementation DashBoard_ViewController

@synthesize Class_name;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,[[UIScreen mainScreen]bounds].size.width,[[UIScreen mainScreen]bounds].size.height)];
    scrollview.showsVerticalScrollIndicator=YES;
    scrollview.scrollEnabled=YES;
    scrollview.userInteractionEnabled=YES;
    scrollview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"main_slider_bg.jpg"]];
    [self.view addSubview:scrollview];
    
    
    self.navigationController.navigationBarHidden=YES;
    
    
    
    ///////////////////////////// Back Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
//    Back_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
//    [Back_BTN addTarget:self
//                 action:@selector(back:)
//       forControlEvents:UIControlEventTouchUpInside];
//    [Back_BTN setImage:[UIImage imageNamed:@"back_.png"] forState:UIControlStateNormal];
//    
//    
//    Back_BTN.frame = CGRectMake(10,10,49,26);
//    [scrollview addSubview:Back_BTN];
    
    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    MTitle = [[UILabel alloc] init];
    MTitle.textColor = [UIColor blackColor];
    [MTitle setFrame:CGRectMake(0,20,self.view.frame.size.width, 40)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:MTitle];
    
    
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
    
    
    ///////////////////////////// profile Pic\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Selfi_image = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-170)/2, MTitle.frame.origin.y+55, 170, 170)];
    Selfi_image.layer.cornerRadius=170*0.5;
    Selfi_image.layer.borderColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0].CGColor;
    Selfi_image.layer.borderWidth=5;
    Selfi_image.clipsToBounds=YES;
    
   //// Selfi_image.image = [UIImage imageNamed:@"170b467.jpg"];
    
    [scrollview addSubview:Selfi_image];
    
    
    
    
    [Selfi_image sd_setImageWithURL:[NSURL URLWithString:[[NSUserDefaults standardUserDefaults] valueForKey:@"picture"]]
                   placeholderImage:[UIImage imageNamed:@"default_pic.png"]];
    
    ///////////////////////////// User Name\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    User_Name = [[UILabel alloc] init];
    User_Name.textColor = [UIColor blackColor];
    [User_Name setFrame:CGRectMake(0,Selfi_image.frame.origin.y+170,self.view.frame.size.width, 40)];
    User_Name.backgroundColor=[UIColor clearColor];
    User_Name.textColor=[UIColor whiteColor];
    User_Name.userInteractionEnabled=NO;
    [User_Name setFont:[UIFont fontWithName:@"bariol-regular" size:25.0]];
    User_Name.text= [[NSUserDefaults standardUserDefaults]valueForKey:@"User_name"];
    User_Name.textAlignment=NSTextAlignmentCenter;
    
    User_Name.textColor=[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0];
    User_Name.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:User_Name];
    
    ///////////////////////////// User Email id\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    User_Email_ID = [[UILabel alloc] init];
    User_Email_ID.textColor = [UIColor blackColor];
    [User_Email_ID setFrame:CGRectMake(0,User_Name.frame.origin.y+25,self.view.frame.size.width, 40)];
    User_Email_ID.backgroundColor=[UIColor clearColor];
    User_Email_ID.textColor=[UIColor whiteColor];
    User_Email_ID.userInteractionEnabled=NO;
    [User_Email_ID setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    User_Email_ID.text= [[NSUserDefaults standardUserDefaults]valueForKey:@"User_Email_Id"];
    User_Email_ID.textAlignment=NSTextAlignmentCenter;
    User_Email_ID.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    User_Email_ID.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:User_Email_ID];
    
    
    ///////////////////////////// User Phone number \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    User_Number = [[UILabel alloc] init];
    User_Number.textColor = [UIColor blackColor];
    [User_Number setFrame:CGRectMake(40,User_Email_ID.frame.origin.y+25,self.view.frame.size.width-80, 40)];
    User_Number.backgroundColor=[UIColor clearColor];
    User_Number.textColor=[UIColor whiteColor];
    User_Number.userInteractionEnabled=NO;
    [User_Number setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    User_Number.text= @"";
    User_Number.textAlignment=NSTextAlignmentCenter;
    
    User_Number.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    User_Number.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:User_Number];
    
    
    
//    ///////////////////////////// profile Pic\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//    
//    map_image = [[UIImageView alloc] initWithFrame:CGRectMake(15,User_Number.frame.origin.y+70, 15, 19)];
//    map_image.image = [UIImage imageNamed:@"location.png"];
//    [scrollview addSubview:map_image];
//    
//    
//    
//    
//    ///////////////////////////// User Address \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//    
//    User_Address = [[UILabel alloc] init];
//    User_Address.textColor = [UIColor blackColor];
//    [User_Address setFrame:CGRectMake(40,User_Number.frame.origin.y+50,self.view.frame.size.width-80, 70)];
//    User_Address.backgroundColor=[UIColor clearColor];
//    User_Address.textColor=[UIColor whiteColor];
//    User_Address.userInteractionEnabled=NO;
//    User_Address.textAlignment=NSTextAlignmentCenter;
//    User_Address.numberOfLines=0;
//    [User_Address setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
//    
//    
//    NSMutableParagraphStyle *style  = [[NSMutableParagraphStyle alloc] init];
//    style.minimumLineHeight = 25.f;
//    style.maximumLineHeight = 25.f;
//    NSDictionary *attributtes = @{NSParagraphStyleAttributeName : style,};
//    
//    User_Address.attributedText = [[NSAttributedString alloc] initWithString:[[NSUserDefaults standardUserDefaults]valueForKey:@"Location"]
//                                                                  attributes:attributtes];
//    User_Address.textAlignment=NSTextAlignmentCenter;
//    
//    
//    User_Address.textColor=[UIColor colorWithRed:121.0f/255.0f green:194.0f/255.0f blue:233.0f/255.0f alpha:1.0];
//    User_Address.textAlignment=NSTextAlignmentCenter;
//    [scrollview addSubview:User_Address];
//    
    
    Sender_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Sender_BTN addTarget:self
                   action:@selector(Sender:)
         forControlEvents:UIControlEventTouchUpInside];
    Sender_BTN.backgroundColor=[UIColor colorWithRed:218.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1.0];
    
    
    
        Sender_BTN.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
      Sender_BTN.titleLabel.textAlignment = NSTextAlignmentCenter;
    [Sender_BTN setTitle:@"PigeonShip Your Item\n(Sender Dashboard)" forState:UIControlStateNormal];
    [Sender_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    [Sender_BTN setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    
    
    Sender_BTN.layer.cornerRadius=20;
    Sender_BTN.clipsToBounds = YES;
    Sender_BTN.frame =CGRectMake(30, User_Number.frame.origin.y+80,self.view.frame.size.width-60, 45.0); ;
    [scrollview addSubview:Sender_BTN];
    
    
    
    
    pigen_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pigen_BTN addTarget:self
                  action:@selector(Pigen:)
        forControlEvents:UIControlEventTouchUpInside];
    pigen_BTN.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    pigen_BTN.titleLabel.textAlignment = NSTextAlignmentCenter;
    pigen_BTN.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0];
    
    
    
   [pigen_BTN setTitle:@"Deliver Items\n(Pigeon Dashboard)" forState:UIControlStateNormal];
    [pigen_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    [pigen_BTN setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    pigen_BTN.layer.cornerRadius=20;
    pigen_BTN.clipsToBounds = YES;
    pigen_BTN.frame =CGRectMake(30, Sender_BTN.frame.origin.y+70,self.view.frame.size.width-60, 45.0);
    [scrollview addSubview:pigen_BTN];

    
    
    facke_view=[[UIView alloc]init];
    facke_view.frame= CGRectMake(30, pigen_BTN.frame.origin.y+100,self.view.frame.size.width-60, 60.0);
    facke_view.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:facke_view];
    
    
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"LoginVlaues"]isEqualToString:@""] ||[[[NSUserDefaults standardUserDefaults]valueForKey:@"LoginVlaues"]isEqualToString:@""]) {
        
    }
    else
    {
        
    }
    
    
}

-(void)back:(UIButton *)sender
{
   
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)Pigen:(UIButton *)sender
{
    
    [[NSUserDefaults standardUserDefaults]setObject:@"pigeon" forKey:@"Pro_userrole"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    [appDelegate Add_Slider_View_App_Delegate];

  
   }

-(void)Sender:(UIButton *)sender
{
    [[NSUserDefaults standardUserDefaults]setObject:@"Sender" forKey:@"Pro_userrole"];
    [[NSUserDefaults standardUserDefaults]synchronize];
 
      [appDelegate Add_Slider_View_App_Delegate];

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
