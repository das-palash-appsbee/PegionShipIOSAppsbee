//
//  Pigeon_posting_detail_ViewController.m
//  PigeonShip
//
//  Created by Bhushan Bawa on 02/09/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Pigeon_posting_detail_ViewController.h"
#import "Utility.h"
#import "Post_package_ViewController.h"
#import "MFSideMenu.h"
#import "Pigeon_Posting_ViewController.h"
@interface Pigeon_posting_detail_ViewController ()

@end

@implementation Pigeon_posting_detail_ViewController
@synthesize Pack_Key;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    States_Key=@"true";
    
    check_value=false;
    
    UIImageView *backGround=[[UIImageView alloc]init];
    backGround.image=[UIImage imageNamed:@"main_slider_bg.jpg"];
    backGround.frame=CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height);
    backGround.userInteractionEnabled=YES;
    [self.view addSubview:backGround];
    
    scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,[[UIScreen mainScreen]bounds].size.width,[[UIScreen mainScreen]bounds].size.height)];
    scrollview.showsVerticalScrollIndicator=YES;
    scrollview.scrollEnabled=YES;
    scrollview.userInteractionEnabled=YES;
    scrollview.backgroundColor = [UIColor clearColor];
    [backGround addSubview:scrollview];
    
    
    
    
    self.navigationController.navigationBarHidden=YES;
    
    ///////////////////////////// Back Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Back_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [Back_BTN addTarget:self
                 action:@selector(Back:)
       forControlEvents:UIControlEventTouchUpInside];
    [Back_BTN setImage:[UIImage imageNamed:@"back_.png"] forState:UIControlStateNormal];
    
    
    Back_BTN.frame = CGRectMake(10,10,49,26);
    [scrollview addSubview:Back_BTN];
    
    
    
    Refress_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [Refress_BTN addTarget:self
                    action:@selector(Refress_BTN)
          forControlEvents:UIControlEventTouchUpInside];
    [Refress_BTN setImage:[UIImage imageNamed:@"avx.png"] forState:UIControlStateNormal];
    
    
    Refress_BTN.frame = CGRectMake(self.view.frame.size.width-40,
                                   13,24,24);
    [scrollview addSubview:Refress_BTN];

    
    
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad:)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad:)],
                           nil];
    [numberToolbar sizeToFit];
    
    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    MTitle = [[UILabel alloc] init];
    MTitle.textColor = [UIColor blackColor];
    [MTitle setFrame:CGRectMake(0,20,self.view.frame.size.width, 40)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"ITEM DETAIL";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:MTitle];
    
    
    
    
    
    //    ////////////////////////////   Top Left   Lable \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    topLeft_LB = [[UILabel alloc] init];
    topLeft_LB.textColor = [UIColor blackColor];
    [topLeft_LB setFrame:CGRectMake(10,MTitle.frame.origin.y+MTitle.frame.size.height+20,120, 30)];
    topLeft_LB.backgroundColor=[UIColor clearColor];
    topLeft_LB.textColor=[UIColor whiteColor];
    topLeft_LB.userInteractionEnabled=NO;
    [topLeft_LB setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    topLeft_LB.text= @"Origin City";
    topLeft_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    topLeft_LB.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:topLeft_LB];
    
    
    
    
    //    ////////////////////////////   Top Left   Location Image \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    topLeft_location_IMG = [[UIImageView alloc] initWithFrame:CGRectMake(50,MTitle.frame.origin.y+MTitle.frame.size.height+48, 19, 19)];
    topLeft_location_IMG.image = [UIImage imageNamed:@"map.png"];
    topLeft_location_IMG.layer.cornerRadius=19*0.5;
    [scrollview addSubview:topLeft_location_IMG];
    
    
    
    //    ////////////////////////////   Middle Line Image \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Middle_Line_IMG = [[UIImageView alloc] initWithFrame:CGRectMake(65,MTitle.frame.origin.y+MTitle.frame.size.height+58, self.view.frame.size.width-135, 0.5)];
    Middle_Line_IMG.image = [UIImage imageNamed:@"line__.png"];
    [scrollview addSubview:Middle_Line_IMG];
    
    
    
    
    //    ////////////////////////////   Middle Left Address \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Middle_Left_Address_LB = [[UILabel alloc] init];
    Middle_Left_Address_LB.textColor = [UIColor blackColor];
    [Middle_Left_Address_LB setFrame:CGRectMake(20,Middle_Line_IMG.frame.origin.y+20,80, 30)];
    Middle_Left_Address_LB.backgroundColor=[UIColor clearColor];
    Middle_Left_Address_LB.textColor=[UIColor whiteColor];
    Middle_Left_Address_LB.userInteractionEnabled=NO;
    Middle_Left_Address_LB.numberOfLines=0;
    Middle_Left_Address_LB.lineBreakMode = UILineBreakModeWordWrap;
    
    [Middle_Left_Address_LB setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
    
    
    
    
    
    
    //    ////////////////////////////   Top Right   Lable \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    topRight_LB = [[UILabel alloc] init];
    topRight_LB.textColor = [UIColor blackColor];
    [topRight_LB setFrame:CGRectMake(scrollview.frame.size.width-120,MTitle.frame.origin.y+MTitle.frame.size.height+20,100, 30)];
    topRight_LB.backgroundColor=[UIColor clearColor];
    topRight_LB.textColor=[UIColor whiteColor];
    topRight_LB.userInteractionEnabled=NO;
    [topRight_LB setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    topRight_LB.text= @"Destination City";
    topRight_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    topRight_LB.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:topRight_LB];
    
    
    
    //    ////////////////////////////   Top Right   Location Image \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    topRight_location_IMG = [[UIImageView alloc] initWithFrame:CGRectMake(scrollview.frame.size.width-70,MTitle.frame.origin.y+MTitle.frame.size.height+48, 19, 19)];
    topRight_location_IMG.image = [UIImage imageNamed:@"map.png"];
    topRight_location_IMG.layer.cornerRadius=19*0.5;
    [scrollview addSubview:topRight_location_IMG];
    
    
    //    ////////////////////////////   Middle Right Address \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Middle_Right_Address_LB = [[UILabel alloc] init];
    Middle_Right_Address_LB.textColor = [UIColor blackColor];
    [Middle_Right_Address_LB setFrame:CGRectMake(self.view.frame.size.width-120,Middle_Line_IMG.frame.origin.y+20,120, 30)];
    Middle_Right_Address_LB.backgroundColor=[UIColor clearColor];
    Middle_Right_Address_LB.textColor=[UIColor whiteColor];
    Middle_Right_Address_LB.userInteractionEnabled=NO;
    [Middle_Right_Address_LB setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
    Middle_Right_Address_LB.numberOfLines=0;
    Middle_Right_Address_LB.lineBreakMode = NSLineBreakByWordWrapping;
    
    
    
    
    
    [scrollview addSubview:Middle_Right_Address_LB];
    
    
    
    
    
    
    ///////////////////////////// Delivery_Before_LB_ST Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Delivery_Before_LB_ST  = [[UILabel alloc] init];
    Delivery_Before_LB_ST.textColor = [UIColor blackColor];
    [Delivery_Before_LB_ST setFrame:CGRectMake(20,Middle_Left_Address_LB.frame.origin.y+Middle_Left_Address_LB.frame.size.height+35,150, 22)];
    Delivery_Before_LB_ST.backgroundColor=[UIColor clearColor];
    Delivery_Before_LB_ST.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Delivery_Before_LB_ST.userInteractionEnabled=NO;
    [Delivery_Before_LB_ST setFont:[UIFont fontWithName:@"bariol-Bold" size:12.0]];
    Delivery_Before_LB_ST.text=@"Posted On";
    Delivery_Before_LB_ST.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:Delivery_Before_LB_ST];
    
    Delivery_Before_LB_ST.textAlignment=NSTextAlignmentLeft;
    
    
    
    
    Delivery_Before_LB_DY  = [[UILabel alloc] init];
    Delivery_Before_LB_DY.textColor = [UIColor whiteColor];
    [Delivery_Before_LB_DY setFrame:CGRectMake(20,Delivery_Before_LB_ST.frame.origin.y+Delivery_Before_LB_ST.frame.size.height,200, 22)];
    Delivery_Before_LB_DY.backgroundColor=[UIColor clearColor];
    Delivery_Before_LB_DY.userInteractionEnabled=NO;
    [Delivery_Before_LB_DY setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
    Delivery_Before_LB_DY.textAlignment=NSTextAlignmentLeft;
    Delivery_Before_LB_DY.text=@"";
    Delivery_Before_LB_DY.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:Delivery_Before_LB_DY];
    
    
    
    
//    
//    ///////////////////////////// Posted_On_LB_ST Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//    
//    
//    
//    Posted_On_LB_ST  = [[UILabel alloc] init];
//    Posted_On_LB_ST.textColor = [UIColor blackColor];
//    [Posted_On_LB_ST setFrame:CGRectMake(self.view.frame.size.width-140,Middle_Left_Address_LB.frame.origin.y+Middle_Left_Address_LB.frame.size.height+35,120, 22)];
//    Posted_On_LB_ST.backgroundColor=[UIColor clearColor];
//    Posted_On_LB_ST.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
//    Posted_On_LB_ST.userInteractionEnabled=NO;
//    [Posted_On_LB_ST setFont:[UIFont fontWithName:@"bariol-Bold" size:12.0]];
//    Posted_On_LB_ST.text=@"Posted On";
//    Posted_On_LB_ST.backgroundColor=[UIColor clearColor];
//    Posted_On_LB_ST.textAlignment=NSTextAlignmentRight;
//    [scrollview addSubview:Posted_On_LB_ST];
//    
//    
//    
//    
//    
//    
//    Posted_On_LB_DY  = [[UILabel alloc] init];
//    Posted_On_LB_DY.textColor = [UIColor whiteColor];
//    [Posted_On_LB_DY setFrame:CGRectMake(self.view.frame.size.width-140,Posted_On_LB_ST.frame.origin.y+Posted_On_LB_ST.frame.size.height,120, 22)];
//    Posted_On_LB_DY.backgroundColor=[UIColor clearColor];
//    Posted_On_LB_DY.userInteractionEnabled=NO;
//    [Posted_On_LB_DY setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
//    Posted_On_LB_DY.textAlignment=NSTextAlignmentRight;
//    Posted_On_LB_DY.text=@"";
//    Posted_On_LB_DY.backgroundColor=[UIColor clearColor];
//    [scrollview addSubview:Posted_On_LB_DY];
//    
//    
//    
    
    
    
    
    ///////////////////////////// Status_LB_ST Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Status_LB_ST  = [[UILabel alloc] init];
    Status_LB_ST.textColor = [UIColor blackColor];
    [Status_LB_ST setFrame:CGRectMake(self.view.frame.size.width-160,Middle_Left_Address_LB.frame.origin.y+Middle_Left_Address_LB.frame.size.height+35,120, 22)];
        Status_LB_ST.backgroundColor=[UIColor clearColor];
    Status_LB_ST.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Status_LB_ST.userInteractionEnabled=NO;
    [Status_LB_ST setFont:[UIFont fontWithName:@"bariol-Bold" size:12.0]];
    Status_LB_ST.text=@"Status";
    Status_LB_ST.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:Status_LB_ST];
    
    Status_LB_ST.textAlignment=NSTextAlignmentLeft;
    
    
    
    
    Status_LB_DYT  = [[UILabel alloc] init];
    Status_LB_DYT.textColor = [UIColor whiteColor];
    [Status_LB_DYT setFrame:CGRectMake(self.view.frame.size.width-160,Status_LB_ST.frame.origin.y+Status_LB_ST.frame.size.height,120, 22)];

    Status_LB_DYT.backgroundColor=[UIColor clearColor];
    Status_LB_DYT.userInteractionEnabled=NO;
    [Status_LB_DYT setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
    Status_LB_DYT.textAlignment=NSTextAlignmentLeft;
    Status_LB_DYT.text=@"";
    Status_LB_DYT.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:Status_LB_DYT];
    
    
    
    
    
//    ///////////////////////////// Accepted_On_LB_DYT Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//    
//    
//    
//    Accepted_On_LB_ST  = [[UILabel alloc] init];
//    Accepted_On_LB_ST.textColor = [UIColor blackColor];
//    [Accepted_On_LB_ST setFrame:CGRectMake(self.view.frame.size.width-140,Middle_Left_Address_LB.frame.origin.y+Middle_Left_Address_LB.frame.size.height+35,120, 22)];
//   
//
//    Accepted_On_LB_ST.backgroundColor=[UIColor clearColor];
//    Accepted_On_LB_ST.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
//    Accepted_On_LB_ST.userInteractionEnabled=NO;
//    [Accepted_On_LB_ST setFont:[UIFont fontWithName:@"bariol-Bold" size:12.0]];
//    Accepted_On_LB_ST.text=@"Accepted On";
//    Accepted_On_LB_ST.backgroundColor=[UIColor clearColor];
//    Accepted_On_LB_ST.textAlignment=NSTextAlignmentRight;
//    [scrollview addSubview:Accepted_On_LB_ST];
//    
//    
//    
//    
//    
//    
//    Accepted_On_LB_DYT  = [[UILabel alloc] init];
//    Accepted_On_LB_DYT.textColor = [UIColor whiteColor];
//     [Accepted_On_LB_ST setFrame:CGRectMake(self.view.frame.size.width-140,Posted_On_LB_ST.frame.origin.y+Posted_On_LB_ST.frame.size.height,120, 22)];
//    Accepted_On_LB_DYT.backgroundColor=[UIColor clearColor];
//    Accepted_On_LB_DYT.userInteractionEnabled=NO;
//    [Accepted_On_LB_DYT setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
//    Accepted_On_LB_DYT.textAlignment=NSTextAlignmentRight;
//    Accepted_On_LB_DYT.text=@"";
//    Accepted_On_LB_DYT.backgroundColor=[UIColor clearColor];
//    [scrollview addSubview:Accepted_On_LB_DYT];
//    
//    
//    
    
    
    
    
    ///////////////////////////// Total Distance Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Total_Distance_LB_ST  = [[UILabel alloc] init];
    Total_Distance_LB_ST.textColor = [UIColor blackColor];
    [Total_Distance_LB_ST setFrame:CGRectMake(20,Delivery_Before_LB_DY.frame.origin.y+Delivery_Before_LB_DY.frame.size.height,120, 22)];
   

    Total_Distance_LB_ST.backgroundColor=[UIColor clearColor];
    Total_Distance_LB_ST.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Total_Distance_LB_ST.userInteractionEnabled=NO;
    [Total_Distance_LB_ST setFont:[UIFont fontWithName:@"bariol-Bold" size:12.0]];
    Total_Distance_LB_ST.text=@"Total Distance";
    Total_Distance_LB_ST.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:Total_Distance_LB_ST];
    
    Total_Distance_LB_ST.textAlignment=NSTextAlignmentLeft;
    
    
    
    
    Total_Distance_LB_DYT  = [[UILabel alloc] init];
    Total_Distance_LB_DYT.textColor = [UIColor whiteColor];
    [Total_Distance_LB_DYT setFrame:CGRectMake(20,Total_Distance_LB_ST.frame.origin.y+Total_Distance_LB_ST.frame.size.height,120, 22)];
    Total_Distance_LB_DYT.backgroundColor=[UIColor clearColor];
    Total_Distance_LB_DYT.userInteractionEnabled=NO;
    [Total_Distance_LB_DYT setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
    Total_Distance_LB_DYT.textAlignment=NSTextAlignmentLeft;
    Total_Distance_LB_DYT.text=@"";
    Total_Distance_LB_DYT.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:Total_Distance_LB_DYT];
    
    
    
    
    
//    ///////////////////////////// Accepted By Pigeon  Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//    
//    
//    
//    Accepted_By_Pigeon_LB_ST  = [[UILabel alloc] init];
//    Accepted_By_Pigeon_LB_ST.textColor = [UIColor blackColor];
//    [Accepted_By_Pigeon_LB_ST setFrame:CGRectMake(self.view.frame.size.width-140,Status_LB_ST.frame.origin.y+Status_LB_ST.frame.size.height+35,120, 22)];
//    
//    Accepted_By_Pigeon_LB_ST.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
//    Accepted_By_Pigeon_LB_ST.userInteractionEnabled=NO;
//    [Accepted_By_Pigeon_LB_ST setFont:[UIFont fontWithName:@"bariol_bold-webfont" size:15.0]];
//    Accepted_By_Pigeon_LB_ST.text=@"Accepted By";
//    Accepted_By_Pigeon_LB_ST.backgroundColor=[UIColor clearColor];
//    Accepted_By_Pigeon_LB_ST.textAlignment=NSTextAlignmentRight;
//    [scrollview addSubview:Accepted_By_Pigeon_LB_ST];
//    
//    
//    
//    
//    
//    
//    Accepted_By_Pigeon_LB_DYT  = [[UILabel alloc] init];
//    Accepted_By_Pigeon_LB_DYT.textColor = [UIColor whiteColor];
//    [Accepted_By_Pigeon_LB_DYT setFrame:CGRectMake(self.view.frame.size.width-140,Accepted_By_Pigeon_LB_ST.frame.origin.y+Accepted_By_Pigeon_LB_ST.frame.size.height,120, 22)];
//    Accepted_By_Pigeon_LB_DYT.backgroundColor=[UIColor clearColor];
//    Accepted_By_Pigeon_LB_DYT.userInteractionEnabled=NO;
//    [Accepted_By_Pigeon_LB_DYT setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
//    Accepted_By_Pigeon_LB_DYT.textAlignment=NSTextAlignmentRight;
//    Accepted_By_Pigeon_LB_DYT.text=@"";
//    Accepted_By_Pigeon_LB_DYT.backgroundColor=[UIColor clearColor];
//    [scrollview addSubview:Accepted_By_Pigeon_LB_DYT];
//    
//    
//    
//    
    
    
    
    ///////////////////////////// Package_Password_LB_ST Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Package_Password_LB_ST  = [[UILabel alloc] init];
    Package_Password_LB_ST.textColor = [UIColor blackColor];
    [Package_Password_LB_ST setFrame:CGRectMake(self.view.frame.size.width-160,Status_LB_DYT.frame.origin.y+Status_LB_DYT.frame.size.height,150, 22)];
   

    Package_Password_LB_ST.backgroundColor=[UIColor clearColor];
    Package_Password_LB_ST.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Package_Password_LB_ST.userInteractionEnabled=NO;
    [Package_Password_LB_ST setFont:[UIFont fontWithName:@"bariol-Bold" size:12.0]];
    Package_Password_LB_ST.text=@"Confirmation Code";
    Package_Password_LB_ST.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:Package_Password_LB_ST];
    
    Package_Password_LB_ST.textAlignment=NSTextAlignmentLeft;
    
    
    
    
    Package_Password_LB_DYT  = [[UILabel alloc] init];
    Package_Password_LB_DYT.textColor = [UIColor whiteColor];
     [Package_Password_LB_DYT setFrame:CGRectMake(self.view.frame.size.width-160,Package_Password_LB_ST.frame.origin.y+Package_Password_LB_ST.frame.size.height,120, 22)];
    Package_Password_LB_DYT.backgroundColor=[UIColor clearColor];
    Package_Password_LB_DYT.userInteractionEnabled=NO;
    [Package_Password_LB_DYT setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
    Package_Password_LB_DYT.textAlignment=NSTextAlignmentLeft;
    Package_Password_LB_DYT.text=@"";
    Package_Password_LB_DYT.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:Package_Password_LB_DYT];
    
    
    
    
    
    
//    ///////////////////////////// Accepted_On_LB_DYT Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//    
//    
//    
//    Sender_Mobile_number_LB_ST  = [[UILabel alloc] init];
//    Sender_Mobile_number_LB_ST.textColor = [UIColor blackColor];
//    [Sender_Mobile_number_LB_ST setFrame:CGRectMake(self.view.frame.size.width-190,Total_Distance_LB_ST.frame.origin.y+Total_Distance_LB_ST.frame.size.height+35,175, 22)];
//    Sender_Mobile_number_LB_ST.backgroundColor=[UIColor clearColor];
//    Sender_Mobile_number_LB_ST.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
//    Sender_Mobile_number_LB_ST.userInteractionEnabled=NO;
//    [Sender_Mobile_number_LB_ST setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
//    Sender_Mobile_number_LB_ST.text=@"Pigeon Contect";
//    Sender_Mobile_number_LB_ST.backgroundColor=[UIColor clearColor];
//    Sender_Mobile_number_LB_ST.textAlignment=NSTextAlignmentRight;
//    [scrollview addSubview:Sender_Mobile_number_LB_ST];
//    
//    
//    
//    
//    
//    
//    Sender_Mobile_number_LB_DYT  = [[UILabel alloc] init];
//    Sender_Mobile_number_LB_DYT.textColor = [UIColor whiteColor];
//    [Sender_Mobile_number_LB_DYT setFrame:CGRectMake(self.view.frame.size.width-190,Sender_Mobile_number_LB_ST.frame.origin.y+Sender_Mobile_number_LB_ST.frame.size.height,175, 22)];
//    Sender_Mobile_number_LB_DYT.backgroundColor=[UIColor clearColor];
//    Sender_Mobile_number_LB_DYT.userInteractionEnabled=NO;
//    [Sender_Mobile_number_LB_DYT setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
//    Sender_Mobile_number_LB_DYT.textAlignment=NSTextAlignmentRight;
//    Sender_Mobile_number_LB_DYT.text=@"";
//    Sender_Mobile_number_LB_DYT.backgroundColor=[UIColor clearColor];
//    [scrollview addSubview:Sender_Mobile_number_LB_DYT];
//    
    
    
    ///////////////////////////// Bottom_MTitle \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Bottom_MTitle = [[UILabel alloc] init];
    Bottom_MTitle.textColor = [UIColor blackColor];
    [Bottom_MTitle setFrame:CGRectMake(0,Package_Password_LB_DYT.frame.origin.y+Package_Password_LB_DYT.frame.size.height+15,self.view.frame.size.width, 40)];
    Bottom_MTitle.backgroundColor=[UIColor clearColor];
    Bottom_MTitle.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Bottom_MTitle.userInteractionEnabled=NO;
    [Bottom_MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    Bottom_MTitle.text= @"ITEM DETAIL";
    Bottom_MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    Bottom_MTitle.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:Bottom_MTitle];
    
    //////////////////////////// Bottom Left Side View///////////////////////////////////////////////
    
    ///////////////////////////// Type Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Type = [[UILabel alloc] init];
    Type.textColor = [UIColor blackColor];
    [Type setFrame:CGRectMake(20,Bottom_MTitle.frame.origin.y+Bottom_MTitle.frame.size.height+15,200, 22)];
    Type.backgroundColor=[UIColor clearColor];
    Type.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Type.userInteractionEnabled=NO;
    [Type setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
    
    
    NSString *string_Type=@"Type :";
    
    Type.text = string_Type;
    
    
    Type.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Type];
//    //
//    //
//    //
//    //    ///////////////////////////// Type Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//    //
//    //
//    //
//    Width = [[UILabel alloc] init];
//    Width.textColor = [UIColor blackColor];
//    [Width setFrame:CGRectMake(20,Type.frame.origin.y+Type.frame.size.height,200, 22)];
//    Width.backgroundColor=[UIColor clearColor];
//    Width.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
//    Width.userInteractionEnabled=NO;
//    [Width setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
//    
//    
//    NSString *string_Width=@"Width(inches) :";
//    
//    
//    
//    Width.text = string_Width;
//    
//    
//    Width.textAlignment=NSTextAlignmentLeft;
//    [scrollview addSubview:Width];
//    //
//    //
//    //
//    //    //////////////////////////// Bottom right Side View///////////////////////////////////////////////
//    //
//    //    ///////////////////////////// height Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//    //
//    //
//    //
//    height = [[UILabel alloc] init];
//    height.textColor = [UIColor blackColor];
//    [height setFrame:CGRectMake(scrollview.frame.size.width-220,Bottom_MTitle.frame.origin.y+Bottom_MTitle.frame.size.height+15,200, 22)];
//    height.backgroundColor=[UIColor clearColor];
//    height.textColor=[UIColor whiteColor];
//    height.userInteractionEnabled=NO;
//    [height setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
//    //
//    //
//    //
//    height.text=@"Height(inches) :";
//    //
//    //
//    height.textAlignment=NSTextAlignmentRight;
//    [scrollview addSubview:height];
//    //
//    //
//    //
//    //    ///////////////////////////// right_Width Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//    //
//    //
//    //
//    right_Width = [[UILabel alloc] init];
//    right_Width.textColor = [UIColor blackColor];
//    [right_Width setFrame:CGRectMake(scrollview.frame.size.width-220,Type.frame.origin.y+Type.frame.size.height,200, 22)];
//    right_Width.backgroundColor=[UIColor clearColor];
//    right_Width.textColor=[UIColor whiteColor];
//    right_Width.userInteractionEnabled=NO;
//    [right_Width setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
//    
//    right_Width.text=@"Weight(In lbs)";
//    
//    
//    
//    right_Width.textAlignment=NSTextAlignmentRight;
//    [scrollview addSubview:right_Width];
//    //
    //
    //
    //    ////////////////////////////////////// Bottom Right side terxt////////////////////////////////
    //
    //
    //
    //    ///////////////////////////// Package_price Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    //
    //
    //
    Package_price = [[UILabel alloc] init];
    Package_price.textColor = [UIColor blackColor];
    [Package_price setFrame:CGRectMake(scrollview.frame.size.width-320,Type.frame.origin.y+Type.frame.size.height+15,300, 22)];
    Package_price.backgroundColor=[UIColor clearColor];
    Package_price.textColor=[UIColor whiteColor];
    Package_price.userInteractionEnabled=NO;
    [Package_price setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
    Package_price.text=@"Price Set For Delivery :";
    
    //
    //
    //
    Package_price.textAlignment=NSTextAlignmentRight;
    [scrollview addSubview:Package_price];
    //
    
    
    
    
    Accept_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Accept_BTN addTarget:self
                   action:@selector(Delete_action:)
         forControlEvents:UIControlEventTouchUpInside];
    Accept_BTN.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0];
    //[Accept_BTN setTitle:@"Delete" forState:UIControlStateNormal];
    [Accept_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    [Accept_BTN setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    
    
    Accept_BTN.layer.cornerRadius=12;
    Accept_BTN.clipsToBounds = YES;
    Accept_BTN.hidden=YES;
    Accept_BTN.frame = CGRectMake((scrollview.frame.size.width-110)/2, Package_price.frame.origin.y+40,110,35);
    [scrollview addSubview:Accept_BTN];

    
    
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 600);
    
}

-(void)Refress_BTN
{

[self performSelector:@selector(CalltheServer) withObject:nil afterDelay:0.5];
[self mActivityIndicater];
}


-(void)Delete_action:(UIButton *)sender
{
  
    
    
    if (sender.tag==00) {
        
        [self performSelector:@selector(CalltheServer_Delete) withObject:nil afterDelay:0.5];
        [self mActivityIndicater];

        
    }
    else
    {
        
    }
    
    
}


#pragma mark - -*********************
#pragma mark  CalltheServer_ACCEPT
#pragma mark - -*********************


-(void)CalltheServer_Delete
{
    
    
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&package_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_id"]]:[NSString stringWithFormat:@"%@deletepackage",[Utility API_link_url]]];
        
        NSLog(@"%@",responseString);
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        DEMOdict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        
        if ([[DEMOdict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:[DEMOdict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            alert.tag=00213;
            [alert show];

            
//            Pigeon_Posting_ViewController *demoController = [[ Pigeon_Posting_ViewController alloc] init];
//            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
//            NSArray *controllers = [NSArray arrayWithObject:demoController];
//            navigationController.viewControllers = controllers;
//            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];

        }
        
        else
        {
            
            if ([[DEMOdict valueForKey:@"message"] isEqualToString:@"Access token expired"] || [[DEMOdict valueForKey:@"message"] isEqualToString:@"Security token mismatch ,Contact admin"]) {
                
                
                alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[DEMOdict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                alert.tag=786;
                [alert show];
                
            }
            else
            {

            
            alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[DEMOdict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
            }
            
        }
        
        
        
    }
    
    else
    {
        alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Not connected to the internet" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
    
    [loader removeFromSuperview];
    
    
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (alert.tag==786) {
        NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
        NSDictionary * dict = [defs dictionaryRepresentation];
        for (id key in dict) {
            [defs removeObjectForKey:key];
        }
        [defs synchronize];
        
        [appDelegate LogOut_Method];
        
        
        [[NSUserDefaults standardUserDefaults]setObject:@"Logout" forKey:@"LoginStatues"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
    }
    

    
  else  if (alertView.tag==00213) {
        
        
                    Pigeon_Posting_ViewController *demoController = [[ Pigeon_Posting_ViewController alloc] init];
                    UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
                    NSArray *controllers = [NSArray arrayWithObject:demoController];
                    navigationController.viewControllers = controllers;
                    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
        
    }

}





- (void)cancelNumberPad:(UIBarButtonItem *)sender
{
    Code_Text_TXT.text=@"";
    
    // hide the picker view
    [self.view endEditing:YES];
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 630);
        [UIView commitAnimations];
    });
    
}

- (void)doneWithNumberPad:(UIBarButtonItem *)sender
{
    
    [self.view endEditing:YES];
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 630);
        [UIView commitAnimations];
    });
    
}




-(void)Cancel_Radio_Btn:(UIButton *)sender
{
    
    States_Key=@"false";
    Code_Text_TXT.text=@"";
    Code_Text_TXT.userInteractionEnabled=NO;
    Code_Text_TXT.alpha=0.3;
    
    [Cancel_Radio_Btn setBackgroundImage:[UIImage imageNamed:@"check_radio.png"] forState:UIControlStateNormal];
    [Accept_Radio_Btn setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
}

-(void)Accept_Radio_Btn:(UIButton *)sender
{
    States_Key=@"true";
    Code_Text_TXT.userInteractionEnabled=YES;
    Code_Text_TXT.alpha=1.0;
    
    [Cancel_Radio_Btn setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    [Accept_Radio_Btn setBackgroundImage:[UIImage imageNamed:@"check_radio.png"] forState:UIControlStateNormal];
}


-(void)viewWillAppear:(BOOL)animated
{
    [self performSelector:@selector(CalltheServer) withObject:nil afterDelay:0.5];
    [self mActivityIndicater];
    
}

-(void)Accept_action:(UIButton *)sender
{
    [self performSelector:@selector(CalltheServer_ACCEPT) withObject:nil afterDelay:0.5];
    [self mActivityIndicater];
    
}


#pragma mark - -*********************
#pragma mark  CalltheServer_ACCEPT
#pragma mark - -*********************


-(void)CalltheServer_ACCEPT
{
    
    
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&package_id=%@&package_code=%@&package_status=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],Pack_Key,Code_Text_TXT.text,States_Key]:[NSString stringWithFormat:@"%@update_package",[Utility API_link_url]]];
        
        NSLog(@"%@",responseString);
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        DEMOdict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        
        if ([[DEMOdict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            [self.navigationController popViewControllerAnimated:YES];
            
            
            
        }
        
        else
        {
            
            if ([[DEMOdict valueForKey:@"message"] isEqualToString:@"Access token expired"] || [[DEMOdict valueForKey:@"message"] isEqualToString:@"Security token mismatch ,Contact admin"]) {
                
                
                alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[DEMOdict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                alert.tag=786;
                [alert show];
                
            }
            else
            {

            
            alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[DEMOdict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
            }
            
        }
        
        
        
    }
    
    else
    {
        
        
        
        alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Not connected to the internet" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
    
    [loader removeFromSuperview];
    
    
    
}


#pragma mark - -*********************
#pragma mark  Update CalltheServer
#pragma mark - -*********************


-(void)Update_CalltheServer
{
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&package_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],Pack_Key]:[NSString stringWithFormat:@"%@returnclassified",[Utility API_link_url]]];
        
        NSLog(@"%@",responseString);
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        NSLog(@"%@",[dict valueForKey:@"Package_Detail"]);
        NSLog(@"%@",[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_Pickaddress"]);
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            [self.navigationController popViewControllerAnimated:YES];
            
        }
        
        else
        {
            
            if ([[dict valueForKey:@"message"] isEqualToString:@"Access token expired"] || [[dict valueForKey:@"message"] isEqualToString:@"Security token mismatch ,Contact admin"]) {
                
                
                alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                alert.tag=786;
                [alert show];
                
            }
            else
            {

            
            alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
            }
            
        }
    }
    else
    {
        
        alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Not connected to the internet" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
    
    [loader removeFromSuperview];
    
    
}




#pragma mark - -*********************
#pragma mark  CalltheServer
#pragma mark - -*********************


-(void)CalltheServer
{
    
    
    
    
    
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"]]:[NSString stringWithFormat:@"%@package_detail",[Utility Pigeon_post_link_url]]];
        
        NSLog(@"%@",responseString);
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        NSLog(@"%@",[dict valueForKey:@"Package_Detail"]);
        NSLog(@"%@",[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_Pickaddress"]);
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            NSMutableParagraphStyle *style  = [[NSMutableParagraphStyle alloc] init];
            style.minimumLineHeight = 12.f;
            style.maximumLineHeight = 12.f;
            attributtes = @{NSParagraphStyleAttributeName : style,};
            
            Middle_Left_Address_LB.attributedText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@ %@ %@",[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_Pickaddress"],[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_Pickcity"],[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_Pickstate"],[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_Pickzip"]] attributes:attributtes];
            
            
            Middle_Left_Address_LB.textColor=[UIColor whiteColor];
            Middle_Left_Address_LB.textAlignment=NSTextAlignmentLeft;
            [Middle_Left_Address_LB sizeToFit];
            
            [scrollview addSubview:Middle_Left_Address_LB];
            
            
            NSMutableParagraphStyle *styles  = [[NSMutableParagraphStyle alloc] init];
            styles.minimumLineHeight = 12.f;
            styles.maximumLineHeight = 12.f;
            attributtess = @{NSParagraphStyleAttributeName : styles,};
            
            
            
            Middle_Right_Address_LB.attributedText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@ %@ %@",[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_Dropaddress"],[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_Dropcity"],[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_Dropstate"],[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_Dropzip"]]attributes:attributtess];
            
            // Middle_Right_Address_LB.text= @"#801 Pleasant Grove Los Alamitos California 90720";
            Middle_Right_Address_LB.textColor=[UIColor whiteColor];
            Middle_Right_Address_LB.textAlignment=NSTextAlignmentRight;
            [Middle_Right_Address_LB sizeToFit];
            
            
            Delivery_Before_LB_DY.text=[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_posted_On"];
            
            Posted_On_LB_DY.text=[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_posted_On"];
            Status_LB_DYT.text=[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_Status"];
            Accepted_On_LB_DYT.text=[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_accepted_On"];
            Total_Distance_LB_DYT.text=[[dict valueForKey:@"Package_Detail"]valueForKey:@"Distance"];
            Accepted_By_Pigeon_LB_DYT.text=[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_Acceptedby"];
            Package_Password_LB_DYT.text=[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_Password"];
            
            
            
            Accept_BTN.hidden=NO;
            
            if ([[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_Status"]isEqualToString:@"Pending"]) {
                 [Accept_BTN setTitle:@"Delete" forState:UIControlStateNormal];
                Accept_BTN.tag=00;
            }
            else
            {
                 [Accept_BTN setTitle:@"Track" forState:UIControlStateNormal];
                Accept_BTN.tag=11;
            }
            
            
            
            NSString *string_Type=[NSString stringWithFormat:@"Type:  %@",[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_type"]];
            
            NSMutableAttributedString *str_Type = [[NSMutableAttributedString alloc] initWithString:string_Type];
            
            [str_Type addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 7)];
            [str_Type addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(7, [string_Type length]-7)];
            
            Type.attributedText = str_Type;
            
            
            Type.textAlignment=NSTextAlignmentLeft;
            
            
            
            
            NSString *string_Width=[NSString stringWithFormat:@"Width(inches) :  %@",[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_width"]];
            
            NSMutableAttributedString *str_Width = [[NSMutableAttributedString alloc] initWithString:string_Width];
            
            [str_Width addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 15)];
            [str_Width addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(16, [string_Width length]-17)];
            
            Width.attributedText = str_Width;
            
            
            Width.textAlignment=NSTextAlignmentLeft;
            
            
            
            NSString *string_height=[NSString stringWithFormat:@"Height(inches) :  %@",[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_height"]];
            
            NSMutableAttributedString *str_height = [[NSMutableAttributedString alloc] initWithString:string_height];
            
            [str_height addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 16)];
            [str_height addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(17, [string_height length]-18)];
            
            height.attributedText = str_height;
            
            
            
            
            NSString *string_right_Width=[NSString stringWithFormat:@"Weight(In lbs) :  %@",[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_weight"]];
            
            
            
            NSMutableAttributedString *str_right_Width = [[NSMutableAttributedString alloc] initWithString:string_right_Width];
            
            [str_right_Width addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 16)];
            [str_right_Width addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(17, [string_right_Width length]-18)];
            
            right_Width.attributedText = str_right_Width;
            
            
            
            if ([[[dict valueForKey:@"Package_Detail"]valueForKey:@"classified"]isEqualToString:@"TRUE"])
            {
                MTitle.text= @"CLASSIFIED ITEM DETAIL";
                
                
                
                if ([[[dict valueForKey:@"Package_Detail"]valueForKey:@"return"]isEqualToString:@"FALSE"]) {
                    
                    
                    
                    Shipping_Price = [[UILabel alloc] init];
                    Shipping_Price.textColor = [UIColor blackColor];
                    [Shipping_Price setFrame:CGRectMake(scrollview.frame.size.width-320,Type.frame.origin.y+Type.frame.size.height+15,300, 22)];
                    Shipping_Price.backgroundColor=[UIColor clearColor];
                    Shipping_Price.textColor=[UIColor whiteColor];
                    Shipping_Price.userInteractionEnabled=NO;
                    [Shipping_Price setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
                    Shipping_Price.textAlignment=NSTextAlignmentRight;
                    [scrollview addSubview:Shipping_Price];
                    
                    string_Shipping_Price=[NSString stringWithFormat:@"Shipping Price :  %@",[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_price"]];
                    
                    str_Shipping_Price = [[NSMutableAttributedString alloc] initWithString:string_Shipping_Price];
                    
                    [str_Shipping_Price addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0,18)];
                    [str_Shipping_Price addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(19, [string_Shipping_Price length]-20)];
                    
                    Shipping_Price.attributedText = str_Shipping_Price;
                    
                    
                    
                    
                    
                    //    ////////////////////////////  Bottom Radio Button \\\\\\\\\\\\\\\\\\\\\\\
                    
                    Cancel_Radio_Btn_classified = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                    [Cancel_Radio_Btn_classified addTarget:self
                                                    action:@selector(Cancel_Radio_classified_Btn:)
                                          forControlEvents:UIControlEventTouchUpInside];
                    [Cancel_Radio_Btn_classified setBackgroundImage:[UIImage imageNamed:@"uncheck_checkbox.png"] forState:UIControlStateNormal];
                    
                    Cancel_Radio_Btn_classified.frame = CGRectMake(5, Type.frame.origin.y+Type.frame.size.height+16,30, 30);
                    [scrollview addSubview:Cancel_Radio_Btn_classified];
                    
                    
                    ///////////////////////////// Deliver_order_LB Lable \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
                    
                    Cancel_order_LB_classified = [[UILabel alloc] init];
                    Cancel_order_LB_classified.textColor = [UIColor blackColor];
                    [Cancel_order_LB_classified setFrame:CGRectMake(40,Type.frame.origin.y+Type.frame.size.height+20,self.view.frame.size.width, 20)];
                    Cancel_order_LB_classified.backgroundColor=[UIColor clearColor];
                    Cancel_order_LB_classified.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
                    Cancel_order_LB_classified.userInteractionEnabled=NO;
                    [Cancel_order_LB_classified setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
                    Cancel_order_LB_classified.text= @"I don’t want to buy this Item.";
                    Cancel_order_LB_classified.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
                    Cancel_order_LB_classified.textAlignment=NSTextAlignmentLeft;
                    [scrollview addSubview:Cancel_order_LB_classified];
                    
                    
                    
                    
                    ///////////////////////////// Code apply  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
                    
                    Update_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
                    [Update_BTN addTarget:self action:@selector(Update_Btn:)forControlEvents:UIControlEventTouchUpInside];
                    Update_BTN.frame = CGRectMake(30,Cancel_order_LB_classified.frame.origin.y+25,80,40);
                    
                    [Update_BTN setTitleColor:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
                    [Update_BTN setTitle:@"Update" forState:UIControlStateNormal];
                    [Update_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
                    Update_BTN.layer.cornerRadius=20;
                    Update_BTN.clipsToBounds = YES;
                    Update_BTN.layer.borderWidth=1;
                    Update_BTN.layer.borderColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0].CGColor;
                    Update_BTN.userInteractionEnabled=NO;
                    Update_BTN.alpha=0.4;
                    [scrollview addSubview:Update_BTN];
                    
                    
                    
                    
                    
                    
                    
                    Item_price = [[UILabel alloc] init];
                    Item_price.textColor = [UIColor blackColor];
                    [Item_price setFrame:CGRectMake(scrollview.frame.size.width-320,Shipping_Price.frame.origin.y+Shipping_Price.frame.size.height+10,300, 22)];
                    Item_price.backgroundColor=[UIColor clearColor];
                    Item_price.textColor=[UIColor whiteColor];
                    Item_price.userInteractionEnabled=NO;
                    [Item_price setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
                    Item_price.textAlignment=NSTextAlignmentRight;
                    [scrollview addSubview:Item_price];
                    
                    string_Item_price=[NSString stringWithFormat:@"Item Price :  %@",[[dict valueForKey:@"Package_Detail"]valueForKey:@"classified_price"]];
                    
                    str_Item_price = [[NSMutableAttributedString alloc] initWithString:string_Item_price];
                    
                    [str_Item_price addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0,14)];
                    [str_Item_price addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(15, [string_Item_price length]-16)];
                    
                    Item_price.attributedText = str_Item_price;
                    
                    
                    
                    [Package_price setFrame:CGRectMake(scrollview.frame.size.width-320,Item_price.frame.origin.y+Item_price.frame.size.height+10,300, 22)];
                    
                    
                    
                    
                    string_Package_price=[NSString stringWithFormat:@"Total You Will Pay :  %@",[[dict valueForKey:@"Package_Detail"]valueForKey:@"total"]];
                    
                    str_Package_price = [[NSMutableAttributedString alloc] initWithString:string_Package_price];
                    
                    [str_Package_price addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0,22)];
                    [str_Package_price addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(23, [string_Package_price length]-24)];
                    
                    Package_price.attributedText = str_Package_price;
                    
                    
                    
                    
                    ///////////////////////////// Deliver_order_LB Lable \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
                    
                    Note_LB_classified = [[UILabel alloc] init];
                    Note_LB_classified.textColor = [UIColor blackColor];
                    [Note_LB_classified setFrame:CGRectMake(10,Package_price.frame.origin.y+Package_price.frame.size.height+5,self.view.frame.size.width, 20)];
                    Note_LB_classified.backgroundColor=[UIColor clearColor];
                    Note_LB_classified.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
                    Note_LB_classified.userInteractionEnabled=NO;
                    [Note_LB_classified setFont:[UIFont fontWithName:@"bariol-regular" size:11.0]];
                    Note_LB_classified.text= [NSString stringWithFormat:@"(%@)",[[dict valueForKey:@"Package_Detail"]valueForKey:@"note"]];
                    Note_LB_classified.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
                    Note_LB_classified.textAlignment=NSTextAlignmentLeft;
                    [scrollview addSubview:Note_LB_classified];
                    
                    
                    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 680);
                    
                    
                }
                else
                {
                    
                    Shipping_Price = [[UILabel alloc] init];
                    Shipping_Price.textColor = [UIColor blackColor];
                    [Shipping_Price setFrame:CGRectMake(scrollview.frame.size.width-320,Type.frame.origin.y+Type.frame.size.height+10,300, 22)];
                    Shipping_Price.backgroundColor=[UIColor clearColor];
                    Shipping_Price.textColor=[UIColor whiteColor];
                    Shipping_Price.userInteractionEnabled=NO;
                    [Shipping_Price setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
                    Shipping_Price.textAlignment=NSTextAlignmentRight;
                    [scrollview addSubview:Shipping_Price];
                    
                    string_Shipping_Price=[NSString stringWithFormat:@"Shipping Price :  %@",[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_price"]];
                    
                    str_Shipping_Price = [[NSMutableAttributedString alloc] initWithString:string_Shipping_Price];
                    
                    [str_Shipping_Price addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0,18)];
                    [str_Shipping_Price addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(19, [string_Shipping_Price length]-20)];
                    
                    Shipping_Price.attributedText = str_Shipping_Price;
                    
                    
                    
                    
                    
                    
                    Item_price = [[UILabel alloc] init];
                    Item_price.textColor = [UIColor blackColor];
                    [Item_price setFrame:CGRectMake(scrollview.frame.size.width-320,Shipping_Price.frame.origin.y+Shipping_Price.frame.size.height+10,300, 22)];
                    Item_price.backgroundColor=[UIColor clearColor];
                    Item_price.textColor=[UIColor whiteColor];
                    Item_price.userInteractionEnabled=NO;
                    [Item_price setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
                    Item_price.textAlignment=NSTextAlignmentRight;
                    [scrollview addSubview:Item_price];
                    
                    string_Item_price=[NSString stringWithFormat:@"Item Price :  %@",[[dict valueForKey:@"Package_Detail"]valueForKey:@"classified_price"]];
                    
                    str_Item_price = [[NSMutableAttributedString alloc] initWithString:string_Item_price];
                    
                    [str_Item_price addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0,14)];
                    [str_Item_price addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(15, [string_Item_price length]-16)];
                    
                    Item_price.attributedText = str_Item_price;
                    
                    
                    
                    
                    [Package_price setFrame:CGRectMake(scrollview.frame.size.width-320,Item_price.frame.origin.y+Item_price.frame.size.height+10,300, 22)];
                    
                    
                    
                    
                    string_Package_price=[NSString stringWithFormat:@"Refund :  %@ (%@ - %@ Return fee)",[[dict valueForKey:@"Package_Detail"]valueForKey:@"total"],[[dict valueForKey:@"Package_Detail"]valueForKey:@"classified_price"],[[dict valueForKey:@"Package_Detail"]valueForKey:@"return_fee"]];
                    
                    str_Package_price = [[NSMutableAttributedString alloc] initWithString:string_Package_price];
                    
                    [str_Package_price addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0,10)];
                    [str_Package_price addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(11, [string_Package_price length]-12)];
                    
                    Package_price.attributedText = str_Package_price;
                    
                    
                    
                    
                    
                    Returen_price = [[UILabel alloc] init];
                    Returen_price.textColor = [UIColor blackColor];
                    [Returen_price setFrame:CGRectMake(scrollview.frame.size.width-320,Package_price.frame.origin.y+Package_price.frame.size.height+10,300, 22)];
                    Returen_price.backgroundColor=[UIColor clearColor];
                    Returen_price.textColor=[UIColor whiteColor];
                    Returen_price.userInteractionEnabled=NO;
                    [Returen_price setFont:[UIFont fontWithName:@"bariol-regular" size:11.0]];
                    Returen_price.textAlignment=NSTextAlignmentRight;
                    Returen_price.text=[[dict valueForKey:@"Package_Detail"]valueForKey:@"note"];
                    
                    [scrollview addSubview:Returen_price];
                    
                    
                    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 680);
                }
                
            }
            else
            {
                MTitle.text= @"ITEM DETAIL";
                
                string_Package_price=[NSString stringWithFormat:@"Price Willing To Pay:  %@",[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_price"]];
                
                str_Package_price = [[NSMutableAttributedString alloc] initWithString:string_Package_price];
                
                [str_Package_price addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0,23)];
                [str_Package_price addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(24, [string_Package_price length]-25)];
                
                Package_price.attributedText = str_Package_price;
                
                
                
            }
            
            
            
            
            
        }
        
        else
        {
            if ([[dict valueForKey:@"message"] isEqualToString:@"Access token expired"] || [[dict valueForKey:@"message"] isEqualToString:@"Security token mismatch ,Contact admin"]) {
                
                
                alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                alert.tag=786;
                [alert show];
                
            }
            else
            {
            
            alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
            }
            
        }
        
        
        
    }
    
    else
    {
        
        
        
        alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Not connected to the internet" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
    
    [loader removeFromSuperview];
    
    
    
}






-(void)Update_Btn:(UIButton *)sender
{
    [self performSelector:@selector(Update_CalltheServer) withObject:nil afterDelay:0.2];
    [self mActivityIndicater];
}


-(void)Cancel_Radio_classified_Btn:(UIButton *)sender
{
    
    States_Key=@"return";
    Code_Text_TXT.text=@"";
    Code_Text_TXT.userInteractionEnabled=NO;
    Code_Text_TXT.alpha=0.3;
    
    
    if (check_value==false) {
        
        [Cancel_Radio_Btn_classified setBackgroundImage:[UIImage imageNamed:@"check_checkbox.png"] forState:UIControlStateNormal];
        
        Update_BTN.userInteractionEnabled=YES;
        Update_BTN.alpha=1;
        
        check_value=true;
    }
    else
    {
        [Cancel_Radio_Btn_classified setBackgroundImage:[UIImage imageNamed:@"uncheck_checkbox.png"] forState:UIControlStateNormal];
        check_value=false;
        Update_BTN.userInteractionEnabled=NO;
        Update_BTN.alpha=0.4;
    }
    
    
    
    
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





-(void)Back:(UIButton *)sender
{
    Post_package_ViewController *demoController = [[Post_package_ViewController alloc] init];
   
    
    UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
    NSArray *controllers = [NSArray arrayWithObject:demoController];
    navigationController.viewControllers = controllers;
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
    

}

-(void)Next:(UIButton *)sender
{
    
    //    Profile_ViewController *OBJProfile_ViewController=[[Profile_ViewController alloc]init];
    //    [self.navigationController pushViewController:OBJProfile_ViewController animated:YES];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 630);
        [UIView commitAnimations];
    });
    
    [self.view endEditing:YES];
    
    return YES;
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        scrollview.frame=CGRectMake(0, -180, self.view.frame.size.width, self.view.frame.size.height);
        
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 630);
        [UIView commitAnimations];
    });
    
    
    
    return YES;
}

@end


