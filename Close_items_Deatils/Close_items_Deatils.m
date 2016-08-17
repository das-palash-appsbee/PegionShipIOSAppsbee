//
//  Close_items_Deatils.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 11/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Close_items_Deatils.h"
#import "HCSStarRatingView.h"
#import "Utility.h"

@interface Close_items_Deatils ()

@end

@implementation Close_items_Deatils

@synthesize Pack_Key;

- (void)viewDidLoad {
    [super viewDidLoad];
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    States_Key=@"true";
    
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
    
    //    ///////////////////////////// Next Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    //
    //    Next_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [Next_BTN addTarget:self
    //                 action:@selector(Next:)
    //       forControlEvents:UIControlEventTouchUpInside];
    //    [Next_BTN setImage:[UIImage imageNamed:@"next.png"] forState:UIControlStateNormal];
    //
    //
    //    Next_BTN.frame = CGRectMake(self.view.frame.size.width-50,10,37,14);
    //    [scrollview addSubview:Next_BTN];
    //
    
    
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
    [topLeft_LB setFrame:CGRectMake(10,MTitle.frame.origin.y+MTitle.frame.size.height+20,100, 30)];
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
    [Middle_Left_Address_LB setFrame:CGRectMake(10,Middle_Line_IMG.frame.origin.y+20,80, 30)];
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
    [Middle_Right_Address_LB setFrame:CGRectMake(self.view.frame.size.width-110,Middle_Line_IMG.frame.origin.y+25,100, 30)];
    Middle_Right_Address_LB.backgroundColor=[UIColor clearColor];
    Middle_Right_Address_LB.textColor=[UIColor whiteColor];
    Middle_Right_Address_LB.userInteractionEnabled=NO;
    [Middle_Right_Address_LB setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
    Middle_Right_Address_LB.numberOfLines=0;
    Middle_Right_Address_LB.lineBreakMode = NSLineBreakByWordWrapping;
    
    
    
    
    
    [scrollview addSubview:Middle_Right_Address_LB];
    
    
    
    
    
    //////////////////////////// Left Side View///////////////////////////////////////////////
    
    ///////////////////////////// Delivery_Before_LB_ST Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Delivery_Before_LB_ST  = [[UILabel alloc] init];
    Delivery_Before_LB_ST.textColor = [UIColor blackColor];
    [Delivery_Before_LB_ST setFrame:CGRectMake(20,Middle_Right_Address_LB.frame.origin.y+Middle_Right_Address_LB.frame.size.height+35,150, 22)];
    Delivery_Before_LB_ST.backgroundColor=[UIColor clearColor];
    Delivery_Before_LB_ST.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Delivery_Before_LB_ST.userInteractionEnabled=NO;
    [Delivery_Before_LB_ST setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Delivery_Before_LB_ST.text=@"Accepted On";
    Delivery_Before_LB_ST.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:Delivery_Before_LB_ST];
    
    Delivery_Before_LB_ST.textAlignment=NSTextAlignmentLeft;
    
    
    
    
    Delivery_Before_LB_DY  = [[UILabel alloc] init];
    Delivery_Before_LB_DY.textColor = [UIColor whiteColor];
    [Delivery_Before_LB_DY setFrame:CGRectMake(20,Delivery_Before_LB_ST.frame.origin.y+Delivery_Before_LB_ST.frame.size.height,200, 22)];
    Delivery_Before_LB_DY.backgroundColor=[UIColor clearColor];
    Delivery_Before_LB_DY.userInteractionEnabled=NO;
    [Delivery_Before_LB_DY setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Delivery_Before_LB_DY.textAlignment=NSTextAlignmentLeft;
    Delivery_Before_LB_DY.text=@"";
    Delivery_Before_LB_DY.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:Delivery_Before_LB_DY];
    
    
    
    
    
    ///////////////////////////// Posted_On_LB_ST Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Posted_On_LB_ST  = [[UILabel alloc] init];
    Posted_On_LB_ST.textColor = [UIColor blackColor];
    [Posted_On_LB_ST setFrame:CGRectMake(self.view.frame.size.width-190,Middle_Left_Address_LB.frame.origin.y+Middle_Left_Address_LB.frame.size.height+35,175, 22)];
    Posted_On_LB_ST.backgroundColor=[UIColor clearColor];
    Posted_On_LB_ST.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Posted_On_LB_ST.userInteractionEnabled=NO;
    [Posted_On_LB_ST setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Posted_On_LB_ST.text=@"Marked As Delivered On";
    Posted_On_LB_ST.backgroundColor=[UIColor clearColor];
    Posted_On_LB_ST.textAlignment=NSTextAlignmentRight;
    [scrollview addSubview:Posted_On_LB_ST];
    
    
    
    
    
    
    Posted_On_LB_DY  = [[UILabel alloc] init];
    Posted_On_LB_DY.textColor = [UIColor whiteColor];
    [Posted_On_LB_DY setFrame:CGRectMake(self.view.frame.size.width-190,Posted_On_LB_ST.frame.origin.y+Posted_On_LB_ST.frame.size.height,175, 22)];
    Posted_On_LB_DY.backgroundColor=[UIColor clearColor];
    Posted_On_LB_DY.userInteractionEnabled=NO;
    [Posted_On_LB_DY setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Posted_On_LB_DY.textAlignment=NSTextAlignmentRight;
    Posted_On_LB_DY.text=@"";
    Posted_On_LB_DY.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:Posted_On_LB_DY];
    
    
    
    
    
    
    
    ///////////////////////////// Status_LB_ST Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Status_LB_ST  = [[UILabel alloc] init];
    Status_LB_ST.textColor = [UIColor blackColor];
    [Status_LB_ST setFrame:CGRectMake(20,Delivery_Before_LB_ST.frame.origin.y+Delivery_Before_LB_ST.frame.size.height+35,150, 22)];
    Status_LB_ST.backgroundColor=[UIColor clearColor];
    Status_LB_ST.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Status_LB_ST.userInteractionEnabled=NO;
    [Status_LB_ST setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Status_LB_ST.text=@"Status";
    Status_LB_ST.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:Status_LB_ST];
    
    Status_LB_ST.textAlignment=NSTextAlignmentLeft;
    
    
    
    
    Status_LB_DYT  = [[UILabel alloc] init];
    Status_LB_DYT.textColor = [UIColor whiteColor];
    [Status_LB_DYT setFrame:CGRectMake(20,Status_LB_ST.frame.origin.y+Status_LB_ST.frame.size.height,200, 22)];
    Status_LB_DYT.backgroundColor=[UIColor clearColor];
    Status_LB_DYT.userInteractionEnabled=NO;
    [Status_LB_DYT setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Status_LB_DYT.textAlignment=NSTextAlignmentLeft;
    Status_LB_DYT.text=@"";
    Status_LB_DYT.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:Status_LB_DYT];
    
    
    
    
    
    ///////////////////////////// Accepted_On_LB_DYT Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Accepted_On_LB_ST  = [[UILabel alloc] init];
    Accepted_On_LB_ST.textColor = [UIColor blackColor];
    [Accepted_On_LB_ST setFrame:CGRectMake(self.view.frame.size.width-190,Delivery_Before_LB_ST.frame.origin.y+Delivery_Before_LB_ST.frame.size.height+35,175, 22)];
    Accepted_On_LB_ST.backgroundColor=[UIColor clearColor];
    Accepted_On_LB_ST.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Accepted_On_LB_ST.userInteractionEnabled=NO;
    [Accepted_On_LB_ST setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Accepted_On_LB_ST.text=@"Confirmation Date";
    Accepted_On_LB_ST.backgroundColor=[UIColor clearColor];
    Accepted_On_LB_ST.textAlignment=NSTextAlignmentRight;
    [scrollview addSubview:Accepted_On_LB_ST];
    
    
    
    
    
    
    Accepted_On_LB_DYT  = [[UILabel alloc] init];
    Accepted_On_LB_DYT.textColor = [UIColor whiteColor];
    [Accepted_On_LB_DYT setFrame:CGRectMake(self.view.frame.size.width-190,Accepted_On_LB_ST.frame.origin.y+Accepted_On_LB_ST.frame.size.height,175, 22)];
    Accepted_On_LB_DYT.backgroundColor=[UIColor clearColor];
    Accepted_On_LB_DYT.userInteractionEnabled=NO;
    [Accepted_On_LB_DYT setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Accepted_On_LB_DYT.textAlignment=NSTextAlignmentRight;
    Accepted_On_LB_DYT.text=@"";
    Accepted_On_LB_DYT.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:Accepted_On_LB_DYT];
    
    
    
    
    
    
    
    ///////////////////////////// Bottom_MTitle \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Bottom_MTitle = [[UILabel alloc] init];
    Bottom_MTitle.textColor = [UIColor blackColor];
    [Bottom_MTitle setFrame:CGRectMake(0,Accepted_On_LB_DYT.frame.origin.y+Accepted_On_LB_DYT.frame.size.height+15,self.view.frame.size.width, 40)];
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
    [Type setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    
    
    NSString *string_Type=@"Type :";
    
    Type.text = string_Type;
    
    
    Type.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Type];
    
    
    
//    ///////////////////////////// Type Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//    
//    
//    
//    Width = [[UILabel alloc] init];
//    Width.textColor = [UIColor blackColor];
//    [Width setFrame:CGRectMake(20,Type.frame.origin.y+Type.frame.size.height,200, 22)];
//    Width.backgroundColor=[UIColor clearColor];
//    Width.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
//    Width.userInteractionEnabled=NO;
//    [Width setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
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
//    
//    
//    
//    //////////////////////////// Bottom right Side View///////////////////////////////////////////////
//    
//    ///////////////////////////// height Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//    
//    
//    
//    height = [[UILabel alloc] init];
//    height.textColor = [UIColor blackColor];
//    [height setFrame:CGRectMake(scrollview.frame.size.width-220,Bottom_MTitle.frame.origin.y+Bottom_MTitle.frame.size.height+15,200, 22)];
//    height.backgroundColor=[UIColor clearColor];
//    height.textColor=[UIColor whiteColor];
//    height.userInteractionEnabled=NO;
//    [height setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
//    
//    
//    
//    height.text=@"Height(inches) :";
//    
//    
//    height.textAlignment=NSTextAlignmentRight;
//    [scrollview addSubview:height];
//    
//    
//    
//    ///////////////////////////// right_Width Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//    
//    
//    
//    right_Width = [[UILabel alloc] init];
//    right_Width.textColor = [UIColor blackColor];
//    [right_Width setFrame:CGRectMake(scrollview.frame.size.width-220,Type.frame.origin.y+Type.frame.size.height,200, 22)];
//    right_Width.backgroundColor=[UIColor clearColor];
//    right_Width.textColor=[UIColor whiteColor];
//    right_Width.userInteractionEnabled=NO;
//    [right_Width setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
//    
//    right_Width.text=@"Weight(In lbs)";
//    
//    
//    
//    right_Width.textAlignment=NSTextAlignmentRight;
//    [scrollview addSubview:right_Width];
    
    
    
    ////////////////////////////////////// Bottom Right side terxt////////////////////////////////
    
    
    
    ///////////////////////////// Package_price Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Package_price = [[UILabel alloc] init];
    Package_price.textColor = [UIColor blackColor];
    [Package_price setFrame:CGRectMake(scrollview.frame.size.width-320,Type.frame.origin.y+Type.frame.size.height+15,300, 22)];
    Package_price.backgroundColor=[UIColor clearColor];
    Package_price.textColor=[UIColor whiteColor];
    Package_price.userInteractionEnabled=NO;
    [Package_price setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Package_price.text=@"Package price set by Sender:";
    
    
    
    
    Package_price.textAlignment=NSTextAlignmentRight;
    [scrollview addSubview:Package_price];
    
    
    
    ///////////////////////////// Our_fees Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Our_fees = [[UILabel alloc] init];
    Our_fees.textColor = [UIColor blackColor];
    [Our_fees setFrame:CGRectMake(scrollview.frame.size.width-320,Package_price.frame.origin.y+Package_price.frame.size.height,300, 22)];
    Our_fees.backgroundColor=[UIColor clearColor];
    Our_fees.textColor=[UIColor whiteColor];
    Our_fees.userInteractionEnabled=NO;
    [Our_fees setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    
    Our_fees.text=@"PigeonShip Fees(%) :";
    
    
    
    Our_fees.textAlignment=NSTextAlignmentRight;
    [scrollview addSubview:Our_fees];
    
    
    
    
    ///////////////////////////// Bonus Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Bonus = [[UILabel alloc] init];
    Bonus.textColor = [UIColor blackColor];
    // [Bonus setFrame:CGRectMake(scrollview.frame.size.width-320,Our_fees.frame.origin.y+Our_fees.frame.size.height,300, 22)];
    Bonus.backgroundColor=[UIColor clearColor];
    Bonus.textColor=[UIColor whiteColor];
    Bonus.userInteractionEnabled=NO;
    [Bonus setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Bonus.textAlignment=NSTextAlignmentRight;
    [scrollview addSubview:Bonus];

    
    
    ///////////////////////////// Total Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Total = [[UILabel alloc] init];
    Total.textColor = [UIColor blackColor];
    [Total setFrame:CGRectMake(self.view.frame.size.width-320,Our_fees.frame.origin.y+Our_fees.frame.size.height,300, 22)];
    Total.backgroundColor=[UIColor clearColor];
    Total.textColor=[UIColor whiteColor];
    Total.userInteractionEnabled=NO;
    [Total setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Total.text=@"TOTAL :";
    
    
    
    Total.textAlignment=NSTextAlignmentRight;
    [scrollview addSubview:Total];
    
    
    
    ///////////////////////////// Update_package_Status_LB \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Update_package_Status_LB = [[UILabel alloc] init];
    Update_package_Status_LB.textColor = [UIColor blackColor];
    [Update_package_Status_LB setFrame:CGRectMake(0,Total.frame.origin.y+Total.frame.size.height+15,self.view.frame.size.width, 40)];
    Update_package_Status_LB.backgroundColor=[UIColor clearColor];
    Update_package_Status_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Update_package_Status_LB.userInteractionEnabled=NO;
    [Update_package_Status_LB setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Update_package_Status_LB.text= @"FEEDBACK PROVIDED BY SENDER";
    Update_package_Status_LB.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    Update_package_Status_LB.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:Update_package_Status_LB];
    
    
    
//   objHCSStarRatingView=[[HCSStarRatingView alloc]init];
//    
//    objHCSStarRatingView.frame=CGRectMake((self.view.frame.size.width-100)/2, Update_package_Status_LB.frame.origin.y+Update_package_Status_LB.frame.size.height-7, 100, 40);
//    objHCSStarRatingView.userInteractionEnabled=NO;
//    [scrollview addSubview:objHCSStarRatingView] ;
    
    
    
//    ratingView = [[AXRatingView alloc] init];
//    ratingView.frame=CGRectMake((self.view.frame.size.width-100)/2, Update_package_Status_LB.frame.origin.y+Update_package_Status_LB.frame.size.height-7, 100, 40);
//
//    ratingView.stepInterval = 0.0;
//    ratingView.value = 0.0;
//    ratingView.userInteractionEnabled = YES;
//  //[ratingView addTarget:self action:@selector(ratingChanged:) forControlEvents:UIControlEventValueChanged];
//    [ratingView sizeToFit];
//    [scrollview addSubview:ratingView];

    
    FeedBack_TXTVIEW = [[UITextView alloc] initWithFrame:CGRectMake(10, Update_package_Status_LB.frame.origin.y+Update_package_Status_LB.frame.size.height-5,self.view.frame.size.width-20, 100)]; //Frame: : 0, 20, 320, 548
    CGRect textViewFrame =FeedBack_TXTVIEW.frame;
    FeedBack_TXTVIEW.font = [UIFont fontWithName:@"bariol-regular" size:16.0];
    FeedBack_TXTVIEW.backgroundColor = [UIColor clearColor];
    FeedBack_TXTVIEW.scrollEnabled = YES;
    FeedBack_TXTVIEW.textAlignment=NSTextAlignmentCenter;
     FeedBack_TXTVIEW.editable = NO;
    FeedBack_TXTVIEW.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    
     [scrollview addSubview:FeedBack_TXTVIEW];

    
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 670);
    
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
        
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 670);
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
        
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 670);
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
#pragma mark  ****   AlertView  ***
#pragma mark - -*********************

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
    
    
}


#pragma mark - -*********************
#pragma mark  Login _ With _ Email _Id
#pragma mark - -*********************


-(void)CalltheServer
{
    
    
    
    
    
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&package_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],Pack_Key]:[NSString stringWithFormat:@"%@close_viewpackages",[Utility API_link_url]]];
        
        
        
        
        NSLog(@"%@",responseString);
        
        
               
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
                NSLog(@"%@",[dict valueForKey:@"Package_Closed_viewDetail"]);
        NSLog(@"%@",[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_Pickaddress"]);
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            FeedBack_TXTVIEW.text=[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_feedback"];
            
            //objHCSStarRatingView.value=[[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_rating"]floatValue];
          
            
            
            [self performSelectorInBackground:@selector(rating:) withObject:[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_rating"]];
            
            
            
            
         //   [ratingView setValue:[[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_rating"]floatValue]];
            
            NSMutableParagraphStyle *style  = [[NSMutableParagraphStyle alloc] init];
            style.minimumLineHeight = 12.f;
            style.maximumLineHeight = 12.f;
            attributtes = @{NSParagraphStyleAttributeName : style,};
            
            Middle_Left_Address_LB.attributedText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@ %@ %@",[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_Pickaddress"],[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_Pickcity"],[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_Pickstate"],[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_Pickzip"]] attributes:attributtes];
            
            
            Middle_Left_Address_LB.textColor=[UIColor whiteColor];
            Middle_Left_Address_LB.textAlignment=NSTextAlignmentLeft;
            [Middle_Left_Address_LB sizeToFit];
            
            [scrollview addSubview:Middle_Left_Address_LB];
            
            
            NSMutableParagraphStyle *styles  = [[NSMutableParagraphStyle alloc] init];
            styles.minimumLineHeight = 12.f;
            styles.maximumLineHeight = 12.f;
            attributtess = @{NSParagraphStyleAttributeName : styles,};
            
            
            
            Middle_Right_Address_LB.attributedText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@ %@ %@",[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_Dropaddress"],[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_Dropcity"],[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_Dropstate"],[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_Dropzip"]]attributes:attributtess];
            
            // Middle_Right_Address_LB.text= @"#801 Pleasant Grove Los Alamitos California 90720";
            Middle_Right_Address_LB.textColor=[UIColor whiteColor];
            Middle_Right_Address_LB.textAlignment=NSTextAlignmentRight;
            [Middle_Right_Address_LB sizeToFit];
            
            
            Delivery_Before_LB_DY.text=[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_accepted_On"];
            Posted_On_LB_DY.text=[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_DeliveryDate"];
            Status_LB_DYT.text=[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_Status"];
            Accepted_On_LB_DYT.text=[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_confirmationDate"];
            
            
            
            
            string_Our_fees=[NSString stringWithFormat:@"PigeonShip Fees%@ :  %@",[NSString stringWithFormat:@" (%@ %%)",[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_commision"]],[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_fee"]];
            
            str_Our_fees = [[NSMutableAttributedString alloc] initWithString:string_Our_fees];
            
            [str_Our_fees addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 26)];
            [str_Our_fees addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(27, [string_Our_fees length]-28)];
            
            Our_fees.attributedText = str_Our_fees;

            
            
            
            int Frame_size;
            
            if (Middle_Left_Address_LB.frame.origin.y+Middle_Left_Address_LB.frame.size.height+35<Middle_Right_Address_LB.frame.origin.y+Middle_Right_Address_LB.frame.size.height+35) {
                Frame_size=Middle_Right_Address_LB.frame.origin.y+Middle_Right_Address_LB.frame.size.height+20;
            }
            else
            {
                Frame_size = Middle_Left_Address_LB.frame.origin.y+Middle_Left_Address_LB.frame.size.height+20;
            }
            
            
            
            [Delivery_Before_LB_ST setFrame:CGRectMake(20,Frame_size,150, 22)];
            [Delivery_Before_LB_DY setFrame:CGRectMake(20,Delivery_Before_LB_ST.frame.origin.y+Delivery_Before_LB_ST.frame.size.height,200, 22)];
            
            [Posted_On_LB_ST setFrame:CGRectMake(self.view.frame.size.width-190,Frame_size,175, 22)];
            [Posted_On_LB_DY setFrame:CGRectMake(self.view.frame.size.width-190,Posted_On_LB_ST.frame.origin.y+Posted_On_LB_ST.frame.size.height,175, 22)];
            
            [Status_LB_ST setFrame:CGRectMake(20,Delivery_Before_LB_DY.frame.origin.y+Delivery_Before_LB_DY.frame.size.height+35,150, 22)];
            [Status_LB_DYT setFrame:CGRectMake(20,Status_LB_ST.frame.origin.y+Status_LB_ST.frame.size.height,200, 22)];
            
            [Bottom_MTitle setFrame:CGRectMake(0,Status_LB_DYT.frame.origin.y+Status_LB_DYT.frame.size.height+15,self.view.frame.size.width, 40)];
            
            
            [Type setFrame:CGRectMake(20,Bottom_MTitle.frame.origin.y+Bottom_MTitle.frame.size.height+15,200, 22)];
            [Package_price setFrame:CGRectMake(scrollview.frame.size.width-320,Type.frame.origin.y+Type.frame.size.height+15,300, 22)];
            [Our_fees setFrame:CGRectMake(scrollview.frame.size.width-320,Package_price.frame.origin.y+Package_price.frame.size.height,300, 22)];
            [Total setFrame:CGRectMake(self.view.frame.size.width-320,Our_fees.frame.origin.y+Our_fees.frame.size.height,300, 22)];
            
            
            

            
            
            
            
            if ([[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"classified"]isEqualToString:@"TRUE"])
            {
                MTitle.text= @"CLASSIFIED ITEM DETAIL";
                
                [Our_fees setFrame:CGRectMake(scrollview.frame.size.width-320,Package_price.frame.origin.y+Package_price.frame.size.height,300, 22)];
                
                [Bonus setFrame:CGRectMake(scrollview.frame.size.width-320,Our_fees.frame.origin.y+Our_fees.frame.size.height,300, 22)];
                
                [Total setFrame:CGRectMake(self.view.frame.size.width-320,Bonus.frame.origin.y+Bonus.frame.size.height,300, 22)];
                

                
                string_Package_price=[NSString stringWithFormat:@"Classified Item Price Set By Buyer :   %@",[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_price"]];
                
                str_Package_price = [[NSMutableAttributedString alloc] initWithString:string_Package_price];
                
                [str_Package_price addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0,38)];
                [str_Package_price addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(39, [string_Package_price length]-40)];
                
                Package_price.attributedText = str_Package_price;
                
                
                
                
                if ([[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"return"]isEqualToString:@"FALSE"]) {
                    
                    
                    
                    
                    string_Bonus=[NSString stringWithFormat:@"Bonus :  %@",[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"bonus"]];
                    
                    str_Bonus_fee = [[NSMutableAttributedString alloc] initWithString:string_Bonus];
                    
                    [str_Bonus_fee addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 9)];
                    
                    [str_Bonus_fee addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(10, [string_Bonus length]-11)];
                    
                    Bonus.attributedText = str_Bonus_fee;

                    
                    
//                    string_Our_fees=[NSString stringWithFormat:@"Bonus :  %@",[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"bonus"]];
//                    
//                    str_Our_fees = [[NSMutableAttributedString alloc] initWithString:string_Our_fees];
//                    
//                    [str_Our_fees addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 9)];
//                    [str_Our_fees addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(10, [string_Our_fees length]-11)];
//                    
//                    Our_fees.attributedText = str_Our_fees;
                    
                }
                else
                {
                    
                    
                    string_Our_fees=[NSString stringWithFormat:@"Return fee :  %@",[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"return_fee"]];
                    
                    str_Our_fees = [[NSMutableAttributedString alloc] initWithString:string_Our_fees];
                    
                    [str_Our_fees addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 14)];
                    
                    [str_Our_fees addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(15, [str_Our_fees length]-16)];
                    
                    Bonus.attributedText = str_Our_fees;
                    
                    
                    
//                    string_Our_fees=[NSString stringWithFormat:@"Return fee :  %@",[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"return_fee"]];
//                    
//                    str_Our_fees = [[NSMutableAttributedString alloc] initWithString:string_Our_fees];
//                    
//                    [str_Our_fees addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 14)];
//                    [str_Our_fees addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(15, [string_Our_fees length]-16)];
//                    
//                    Our_fees.attributedText = str_Our_fees;
                    
                }

        
                string_Total=[NSString stringWithFormat:@"Total You Receive :  %@",[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_total"]];
                
                str_Total = [[NSMutableAttributedString alloc] initWithString:string_Total];
                
                [str_Total addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 21)];
                [str_Total addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(22, [str_Total length]-23)];
                
                Total.attributedText = str_Total;
            
        }
        else
        {
            MTitle.text= @"ITEM DETAIL";
            
            
            string_Package_price=[NSString stringWithFormat:@"Package price set by Sender:  %@",[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_price"]];
            
            str_Package_price = [[NSMutableAttributedString alloc] initWithString:string_Package_price];
            
            [str_Package_price addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0,28)];
            [str_Package_price addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(29, [string_Package_price length]-30)];
            
            Package_price.attributedText = str_Package_price;
            
            
            
            
           string_Total=[NSString stringWithFormat:@"TOTAL :  %@",[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_total"]];
            
            str_Total = [[NSMutableAttributedString alloc] initWithString:string_Total];
            
            [str_Total addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 9)];
            [str_Total addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(9, [str_Total length]-10)];
            
            Total.attributedText = str_Total;
            
        }

        
            NSString *string_Pigeon_type=[NSString stringWithFormat:@"Pigeon type:  %@",[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"pigeon_type"]];
            
            NSMutableAttributedString *str_Pigeon_type = [[NSMutableAttributedString alloc] initWithString:string_Pigeon_type];
            
            [str_Pigeon_type addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 13)];
            [str_Pigeon_type addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(14, [string_Pigeon_type length]-14)];
            
            Pigeon_type.attributedText = str_Pigeon_type;
            
            
            Pigeon_type.textAlignment=NSTextAlignmentRight;
            
        
            NSString *string_Type=[NSString stringWithFormat:@"Type:  %@",[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_type"]];
            
            NSMutableAttributedString *str_Type = [[NSMutableAttributedString alloc] initWithString:string_Type];
            
            [str_Type addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 7)];
            
            [str_Type addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(7, [string_Type length]-7)];
            
            Type.attributedText = str_Type;
            
            
            Type.textAlignment=NSTextAlignmentLeft;
            
            
            
            
            NSString *string_Width=[NSString stringWithFormat:@"Width(inches) : %@",[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_width"]];
            
            NSMutableAttributedString *str_Width = [[NSMutableAttributedString alloc] initWithString:string_Width];
            
            [str_Width addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 15)];
            
            [str_Width addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(15, [string_Width length]-16)];
            
            Width.attributedText = str_Width;
            
            
            Width.textAlignment=NSTextAlignmentLeft;
            
            
            
            NSString *string_height=[NSString stringWithFormat:@"Height(inches) :  %@",[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_height"]];
            
            NSMutableAttributedString *str_height = [[NSMutableAttributedString alloc] initWithString:string_height];
            
            [str_height addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 16)];
            [str_height addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(17, [string_height length]-18)];
            
            height.attributedText = str_height;
            
            
            
            
            NSString *string_right_Width=[NSString stringWithFormat:@"Weight(In lbs) :  %@",[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Package_weight"]];
            
            
            
            NSMutableAttributedString *str_right_Width = [[NSMutableAttributedString alloc] initWithString:string_right_Width];
            
            [str_right_Width addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 16)];
            [str_right_Width addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(17, [string_right_Width length]-18)];
            
            right_Width.attributedText = str_right_Width;
            
        
            
            
            Note_LB.text=[NSString stringWithFormat:@"(NOTE:You will lose %@ from your account as penalty)",[[dict valueForKey:@"Package_Closed_viewDetail"]valueForKey:@"Penality_price"]];
            
            
            
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

            
            alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[dict valueForKey:@"message"] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
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


-(void)rating:(NSString *)rating_value
{
    
    
    ratingView = [[AXRatingView alloc] init];
    ratingView.frame=CGRectMake((self.view.frame.size.width-100)/2, Update_package_Status_LB.frame.origin.y+Update_package_Status_LB.frame.size.height-7, 100, 40);
    
    ratingView.stepInterval = 0.0;
    ratingView.value = 0.0;
    ratingView.userInteractionEnabled = YES;
    //[ratingView addTarget:self action:@selector(ratingChanged:) forControlEvents:UIControlEventValueChanged];
    [ratingView sizeToFit];
    [scrollview addSubview:ratingView];
    
    
    FeedBack_TXTVIEW.frame = CGRectMake(10, ratingView.frame.origin.y+ratingView.frame.size.height,self.view.frame.size.width-20, 100); //Frame: : 0, 20, 320, 548
    

    
    ratingView.value =[rating_value floatValue];
    
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
    [self.navigationController popViewControllerAnimated:YES];
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
        
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 670);
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
        
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 670);
        [UIView commitAnimations];
    });
    
    
    
    return YES;
}


@end
