//
//  Item_Detail_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 16/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Item_Detail_ViewController.h"
#import "Utility.h"
#import "See_Bundle_Packages_action.h"
@interface Item_Detail_ViewController ()

@end

@implementation Item_Detail_ViewController
@synthesize Pack_Key;
@synthesize post_id;
@synthesize post_type;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
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
    [topLeft_LB setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
    topLeft_LB.text= @"Pick-up origin";
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
    
    // Middle_Left_Address_LB.backgroundColor=[UIColor purpleColor];

     [Middle_Left_Address_LB setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
    
   
    
    
    
    
    //    ////////////////////////////   Top Right   Lable \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    topRight_LB = [[UILabel alloc] init];
    topRight_LB.textColor = [UIColor blackColor];
    [topRight_LB setFrame:CGRectMake(scrollview.frame.size.width-120,MTitle.frame.origin.y+MTitle.frame.size.height+20,100, 30)];
    topRight_LB.backgroundColor=[UIColor clearColor];
    topRight_LB.textColor=[UIColor whiteColor];
    topRight_LB.userInteractionEnabled=NO;
    [topRight_LB setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
    topRight_LB.text= @"Drop Destination";
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
    [Middle_Right_Address_LB setFrame:CGRectMake(self.view.frame.size.width-90,Middle_Line_IMG.frame.origin.y+20,80, 30)];
    Middle_Right_Address_LB.backgroundColor=[UIColor clearColor];
    Middle_Right_Address_LB.textColor=[UIColor whiteColor];
    Middle_Right_Address_LB.userInteractionEnabled=NO;
    [Middle_Right_Address_LB setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
    Middle_Right_Address_LB.numberOfLines=0;
    Middle_Right_Address_LB.lineBreakMode = NSLineBreakByWordWrapping;
   // Middle_Right_Address_LB.backgroundColor=[UIColor redColor];
    
    
    
    
    [scrollview addSubview:Middle_Right_Address_LB];
    
    
    
    
    
    //////////////////////////// Left Side View///////////////////////////////////////////////

    ///////////////////////////// Created_on Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Created_on = [[UILabel alloc] init];
    Created_on.textColor = [UIColor blackColor];
    [Created_on setFrame:CGRectMake(20,Middle_Left_Address_LB.frame.origin.y+Middle_Left_Address_LB.frame.size.height+30,200, 22)];
    Created_on.backgroundColor=[UIColor clearColor];
    Created_on.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Created_on.userInteractionEnabled=NO;
    [Created_on setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    
    Created_on.text=@"Created on";
      Created_on.textAlignment=NSTextAlignmentLeft;
       [scrollview addSubview:Created_on];
    

    
    
    Created_on_DYN  = [[UILabel alloc] init];
    Created_on_DYN.textColor = [UIColor whiteColor];
    [Created_on_DYN setFrame:CGRectMake(20,Created_on.frame.origin.y+Created_on.frame.size.height,200, 22)];
    Created_on_DYN.backgroundColor=[UIColor clearColor];
    Created_on_DYN.userInteractionEnabled=NO;
    [Created_on_DYN setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Created_on_DYN.textAlignment=NSTextAlignmentLeft;
    Created_on_DYN.text=@"";
    Created_on_DYN.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:Created_on_DYN];

    
    ///////////////////////////// Status Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Status = [[UILabel alloc] init];
    Status.textColor = [UIColor blackColor];
    [Status setFrame:CGRectMake(20,Created_on_DYN.frame.origin.y+Created_on_DYN.frame.size.height,200, 22)];
    Status.backgroundColor=[UIColor clearColor];
    Status.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Status.userInteractionEnabled=NO;
    [Status setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    
    Status.text=@"Status";
    
     Status.textAlignment=NSTextAlignmentLeft;
  
    [scrollview addSubview:Status];
    
    
    Status_DYN  = [[UILabel alloc] init];
    Status_DYN.textColor = [UIColor whiteColor];
    [Status_DYN setFrame:CGRectMake(20,Status.frame.origin.y+Status.frame.size.height,200, 22)];
    Status_DYN.backgroundColor=[UIColor clearColor];
    Status_DYN.userInteractionEnabled=NO;
    [Status_DYN setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Status_DYN.textAlignment=NSTextAlignmentLeft;
    Status_DYN.text=@"";
    Status_DYN.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:Status_DYN];

    
    
    
    ///////////////////////////// Sender_Name Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Sender_Name = [[UILabel alloc] init];
    Sender_Name.textColor = [UIColor blackColor];
    [Sender_Name setFrame:CGRectMake(20,Status_DYN.frame.origin.y+Status_DYN.frame.size.height,200, 22)];
    Sender_Name.backgroundColor=[UIColor clearColor];
    Sender_Name.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Sender_Name.userInteractionEnabled=NO;
    [Sender_Name setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    
    Sender_Name.text=@"Sender Name";
     Sender_Name.textAlignment=NSTextAlignmentLeft;
       [scrollview addSubview:Sender_Name];
    
    
    
    Sender_Name_DYN  = [[UILabel alloc] init];
    Sender_Name_DYN.textColor = [UIColor whiteColor];
    [Sender_Name_DYN setFrame:CGRectMake(20,Sender_Name.frame.origin.y+Sender_Name.frame.size.height,200, 22)];
    Sender_Name_DYN.backgroundColor=[UIColor clearColor];
    Sender_Name_DYN.userInteractionEnabled=NO;
    [Sender_Name_DYN setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Sender_Name_DYN.textAlignment=NSTextAlignmentLeft;
    Sender_Name_DYN.text=@"";
    Sender_Name_DYN.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:Sender_Name_DYN];


    
    //////////////////////////// Right Side Side View///////////////////////////////////////////////
    
    ///////////////////////////// To_delivery Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    To_delivery = [[UILabel alloc] init];
    To_delivery.textColor = [UIColor blackColor];
    [To_delivery setFrame:CGRectMake(self.view.frame.size.width-220,Middle_Left_Address_LB.frame.origin.y+Middle_Left_Address_LB.frame.size.height+30,200, 22)];
    To_delivery.backgroundColor=[UIColor clearColor];
    To_delivery.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    To_delivery.userInteractionEnabled=NO;
    [To_delivery setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    
    To_delivery.text=@"To be delivered before";
    To_delivery.textAlignment=NSTextAlignmentRight;
    
       [scrollview addSubview:To_delivery];
    
    
    
    
    To_delivery_DYN  = [[UILabel alloc] init];
    To_delivery_DYN.textColor = [UIColor whiteColor];
    [To_delivery_DYN setFrame:CGRectMake(self.view.frame.size.width-220,To_delivery.frame.origin.y+To_delivery.frame.size.height,200, 22)];
    To_delivery_DYN.backgroundColor=[UIColor clearColor];
    To_delivery_DYN.userInteractionEnabled=NO;
    [To_delivery_DYN setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    To_delivery_DYN.textAlignment=NSTextAlignmentRight;
    To_delivery_DYN.text=@"";
    To_delivery_DYN.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:To_delivery_DYN];

    
    
    
    ///////////////////////////// Pigeon_type Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Pigeon_type = [[UILabel alloc] init];
    Pigeon_type.textColor = [UIColor blackColor];
    [Pigeon_type setFrame:CGRectMake(self.view.frame.size.width-220,To_delivery_DYN.frame.origin.y+To_delivery_DYN.frame.size.height,200, 22)];
    Pigeon_type.backgroundColor=[UIColor clearColor];
    Pigeon_type.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Pigeon_type.userInteractionEnabled=NO;
    [Pigeon_type setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    
    Pigeon_type.text=@"Pigeon type";
    Pigeon_type.textAlignment=NSTextAlignmentRight;
   
    [scrollview addSubview:Pigeon_type];
    
    
    
    
    
    Pigeon_type_DYN  = [[UILabel alloc] init];
    Pigeon_type_DYN.textColor = [UIColor whiteColor];
    [Pigeon_type_DYN setFrame:CGRectMake(self.view.frame.size.width-220,Pigeon_type.frame.origin.y+Pigeon_type.frame.size.height,200, 22)];
    Pigeon_type_DYN.backgroundColor=[UIColor clearColor];
    Pigeon_type_DYN.userInteractionEnabled=NO;
    [Pigeon_type_DYN setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Pigeon_type_DYN.textAlignment=NSTextAlignmentRight;
    Pigeon_type_DYN.text=@"";
    Pigeon_type_DYN.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:Pigeon_type_DYN];

    
    
    ///////////////////////////// Distance_Mile Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Distance_Mile = [[UILabel alloc] init];
    Distance_Mile.textColor = [UIColor blackColor];
    [Distance_Mile setFrame:CGRectMake(self.view.frame.size.width-220,Pigeon_type_DYN.frame.origin.y+Pigeon_type_DYN.frame.size.height,200, 22)];
    Distance_Mile.backgroundColor=[UIColor clearColor];
    Distance_Mile.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Distance_Mile.userInteractionEnabled=NO;
    [Distance_Mile setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    
    
    Distance_Mile.text=@"Distance in Miles(aprx)";
    
     Distance_Mile.textAlignment=NSTextAlignmentRight;
       [scrollview addSubview:Distance_Mile];
    
    
    
    
    Distance_Mile_DYN  = [[UILabel alloc] init];
    Distance_Mile_DYN.textColor = [UIColor whiteColor];
    [Distance_Mile_DYN setFrame:CGRectMake(self.view.frame.size.width-220,Distance_Mile.frame.origin.y+Distance_Mile.frame.size.height,200, 22)];
    Distance_Mile_DYN.backgroundColor=[UIColor clearColor];
    Distance_Mile_DYN.userInteractionEnabled=NO;
    [Distance_Mile_DYN setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Distance_Mile_DYN.textAlignment=NSTextAlignmentRight;
    Distance_Mile_DYN.text=@"";
    Distance_Mile_DYN.backgroundColor=[UIColor clearColor];
       [scrollview addSubview:Distance_Mile_DYN];

    
    
    
    ///////////////////////////// Bottom_MTitle \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Bottom_MTitle = [[UILabel alloc] init];
    Bottom_MTitle.textColor = [UIColor blackColor];
    [Bottom_MTitle setFrame:CGRectMake(0,Distance_Mile_DYN.frame.origin.y+Distance_Mile_DYN.frame.size.height+15,self.view.frame.size.width, 40)];
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
    [Type setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
    
    
    NSString *string_Type=@"Type :";
    
      Type.text = string_Type;
    
    
    Type.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Type];
    
    
    
    ///////////////////////////// Type Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Width = [[UILabel alloc] init];
    Width.textColor = [UIColor blackColor];
    [Width setFrame:CGRectMake(20,Type.frame.origin.y+Type.frame.size.height,150, 22)];
    Width.backgroundColor=[UIColor clearColor];
    Width.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Width.userInteractionEnabled=NO;
    [Width setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
    
    
    NSString *string_Width=@"Pick info :";
    
 
    
     Width.text = string_Width;
     Width.numberOfLines = 0;
    
    Width.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Width];

    
    
    //////////////////////////// Bottom right Side View///////////////////////////////////////////////
    
    ///////////////////////////// height Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    height = [[UILabel alloc] init];
    height.textColor = [UIColor blackColor];
    [height setFrame:CGRectMake(scrollview.frame.size.width-220,Bottom_MTitle.frame.origin.y+Bottom_MTitle.frame.size.height+15,200, 22)];
    height.backgroundColor=[UIColor clearColor];
    height.textColor=[UIColor whiteColor];
    height.userInteractionEnabled=NO;
    [height setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
    
    
   
   // height.text=@"Height(inches) :";
    
    
    height.textAlignment=NSTextAlignmentRight;
    [scrollview addSubview:height];
    
    
    
    ///////////////////////////// right_Width Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    right_Width = [[UILabel alloc] init];
    right_Width.textColor = [UIColor blackColor];
    [right_Width setFrame:CGRectMake(scrollview.frame.size.width-150,Type.frame.origin.y+Type.frame.size.height,150, 22)];
    right_Width.backgroundColor=[UIColor clearColor];
    right_Width.textColor=[UIColor whiteColor];
    right_Width.userInteractionEnabled=NO;
    [right_Width setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
    right_Width.numberOfLines = 0;
     right_Width.text=@"Drop info";
  
    
    
    right_Width.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:right_Width];
    
    
    
    ////////////////////////////////////// Bottom Right side terxt////////////////////////////////
    
   
    
    ///////////////////////////// Package_price Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Package_price = [[UILabel alloc] init];
    Package_price.textColor = [UIColor blackColor];
    [Package_price setFrame:CGRectMake(scrollview.frame.size.width-320,right_Width.frame.origin.y+right_Width.frame.size.height+15,300, 22)];
    Package_price.backgroundColor=[UIColor clearColor];
    Package_price.textColor=[UIColor whiteColor];
    Package_price.userInteractionEnabled=NO;
    [Package_price setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
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
    [Our_fees setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
    
    Our_fees.text=@"PigeonShip Fees() :";
   
    
    
    Our_fees.textAlignment=NSTextAlignmentRight;
    [scrollview addSubview:Our_fees];
    
    
    
    
    
    ///////////////////////////// Bonus Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Bonus = [[UILabel alloc] init];
    Bonus.textColor = [UIColor blackColor];
   // [Bonus setFrame:CGRectMake(scrollview.frame.size.width-320,Our_fees.frame.origin.y+Our_fees.frame.size.height,300, 22)];
    Bonus.backgroundColor=[UIColor clearColor];
    Bonus.textColor=[UIColor whiteColor];
    Bonus.userInteractionEnabled=NO;
    [Bonus setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
    Bonus.textAlignment=NSTextAlignmentRight;
    [scrollview addSubview:Bonus];

    
    
    ///////////////////////////// Total Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Total = [[UILabel alloc] init];
    Total.textColor = [UIColor blackColor];
    [Total setFrame:CGRectMake(self.view.frame.size.width-320,Our_fees.frame.origin.y+Our_fees.frame.size.height,300, 22)];
    Total.backgroundColor=[UIColor clearColor];
    Total.textColor=[UIColor whiteColor];
    Total.userInteractionEnabled=NO;
    [Total setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
    Total.text=@"TOTAL(you will get upon delivering the package) :";
    
    
    
    Total.textAlignment=NSTextAlignmentRight;
    [scrollview addSubview:Total];
    
    
    
    //    ////////////////////////////   Accept Button \\\\\\\\\\\\\\\\\\\\\\\
    
    Accept_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Accept_BTN addTarget:self
                   action:@selector(Accept_action:)
         forControlEvents:UIControlEventTouchUpInside];
    Accept_BTN.backgroundColor=[UIColor colorWithRed:228.0f/255.0f green:183.0f/255.0f blue:44.0f/255.0f alpha:1.0];
    [Accept_BTN setTitle:@"Accept" forState:UIControlStateNormal];
    [Accept_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    [Accept_BTN setTitleColor:[UIColor colorWithRed:225.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    
    
    Accept_BTN.layer.cornerRadius=20;
    Accept_BTN.clipsToBounds = YES;
    Accept_BTN.frame = CGRectMake((scrollview.frame.size.width-138)/2, Total.frame.origin.y+Total.frame.size.height+20,138, 38.0);
    [scrollview addSubview:Accept_BTN];


    
 scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 600);

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
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&package_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],Pack_Key]:[NSString stringWithFormat:@"%@package_accept",[Utility API_link_url]]];
        
        NSLog(@"%@",responseString);
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        DEMOdict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        
        if ([[DEMOdict valueForKey:@"status2"] isEqualToString:@"true"]) {
            
            
            
            alert = [[UIAlertView alloc] initWithTitle:@"Accepted" message:@"Item Successfully Accepted. Sender will be notified." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            alert.tag=1007;
            [alert show];

            
            
         
            
        }
        
        else
        {
            
            
            
            
            if ([[DEMOdict valueForKey:@"error_type"]isEqualToString:@"0"]) {
                
                
                
                alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[DEMOdict valueForKey:@"message2"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                alert.tag=1005;
                [alert show];
                
            }
            else
            {
                
                alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[DEMOdict valueForKey:@"message2"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
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
#pragma mark  Login _ With _ Email _Id
#pragma mark - -*********************


-(void)CalltheServer
{
    
    
    
    
    
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&package_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],Pack_Key]:[NSString stringWithFormat:@"%@package_detail",[Utility API_link_url]]];
        
        NSLog(@"%@",responseString);
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
           NSLog(@"%@",[dict valueForKey:@"post_data"]);
         NSLog(@"%@",[[dict valueForKey:@"post_data"]valueForKey:@"Source_address"]);
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            NSMutableParagraphStyle *style  = [[NSMutableParagraphStyle alloc] init];
            style.minimumLineHeight = 12.f;
            style.maximumLineHeight = 12.f;
            attributtes = @{NSParagraphStyleAttributeName : style,};
            
            Middle_Left_Address_LB.attributedText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@ %@ %@",[[dict valueForKey:@"post_data"]valueForKey:@"Source_address"],[[dict valueForKey:@"post_data"]valueForKey:@"Source_city"],[[dict valueForKey:@"post_data"]valueForKey:@"Source_state"],[[dict valueForKey:@"post_data"]valueForKey:@"Source_zip"]] attributes:attributtes];
            
            
            Middle_Left_Address_LB.textColor=[UIColor whiteColor];
            Middle_Left_Address_LB.textAlignment=NSTextAlignmentLeft;
            [Middle_Left_Address_LB sizeToFit];
            
            [scrollview addSubview:Middle_Left_Address_LB];

            
            NSMutableParagraphStyle *styles  = [[NSMutableParagraphStyle alloc] init];
            styles.minimumLineHeight = 12.f;
            styles.maximumLineHeight = 12.f;
            attributtess = @{NSParagraphStyleAttributeName : styles,};

                                                     
            
            Middle_Right_Address_LB.attributedText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@ %@ %@",[[dict valueForKey:@"post_data"]valueForKey:@"Destination_address"],[[dict valueForKey:@"post_data"]valueForKey:@"Destination_city"],[[dict valueForKey:@"post_data"]valueForKey:@"Destination_state"],[[dict valueForKey:@"post_data"]valueForKey:@"Destination_zip"]]attributes:attributtess];
            
            // Middle_Right_Address_LB.text= @"#801 Pleasant Grove Los Alamitos California 90720";
            Middle_Right_Address_LB.textColor=[UIColor whiteColor];
            Middle_Right_Address_LB.textAlignment=NSTextAlignmentRight;
            [Middle_Right_Address_LB sizeToFit];

            
            
            
            
            Created_on_DYN.text=[[dict valueForKey:@"post_data"]valueForKey:@"Created_date"];
            
            Status_DYN.text=[[dict valueForKey:@"post_data"]valueForKey:@"Package_status"];
            Sender_Name_DYN.text=[[dict valueForKey:@"post_data"]valueForKey:@"Sender_name"];
            To_delivery_DYN.text=[[dict valueForKey:@"post_data"]valueForKey:@"Delivery_date"];
            Pigeon_type_DYN.text=[[dict valueForKey:@"post_data"]valueForKey:@"pigeon_type"];
            Distance_Mile_DYN.text=[[dict valueForKey:@"post_data"]valueForKey:@"Distance"];
            
            
            if ([[[dict valueForKey:@"post_data"]valueForKey:@"Package_type"]isEqualToString:@"other"]) {
                
                string_Type=[NSString stringWithFormat:@"Type:  %@(TRUCK REQUIRED)",[[dict valueForKey:@"post_data"]valueForKey:@"Package_type"]];
                
            }
            else
            {
                
                string_Type=[NSString stringWithFormat:@"Type:  %@",[[dict valueForKey:@"post_data"]valueForKey:@"Package_type"]];
            }

            
            
            NSMutableAttributedString *str_Type = [[NSMutableAttributedString alloc] initWithString:string_Type];
            
            [str_Type addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 7)];
            [str_Type addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(7, [string_Type length]-7)];
            
            Type.attributedText = str_Type;
            
            
            Type.textAlignment=NSTextAlignmentLeft;
            
            
            NSString *string_Width=[NSString stringWithFormat:@"%@",[[dict valueForKey:@"post_data"]valueForKey:@"Pick_info"]];
            
            
             if (![string_Width isEqualToString:@""]) {
            
            NSMutableAttributedString *str_Width = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"Pick info :  %@",[[dict valueForKey:@"post_data"]valueForKey:@"Pick_info"]]];
            
            [str_Width addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 14)];
            [str_Width addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(13, [str_Width length]-14)];
            
            Width.attributedText = str_Width;
            
            
            Width.textAlignment=NSTextAlignmentLeft;
                 
                 [Width sizeToFit];

                 
                 
             }
            
            
              NSString *string_right_Width=[NSString stringWithFormat:@"%@",[[dict valueForKey:@"post_data"]valueForKey:@"Drop_info"]];
            
            
             if (![string_right_Width isEqualToString:@""]) {
                 
                 
                 NSMutableAttributedString *str_Width = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"Drop info :  %@",[[dict valueForKey:@"post_data"]valueForKey:@"Drop_info"]]];
                 
                 [str_Width addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 14)];
                 [str_Width addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(13, [str_Width length]-14)];
                 
                 right_Width.attributedText = str_Width;
                 
                 
                 right_Width.textAlignment=NSTextAlignmentLeft;

                 
                 [right_Width sizeToFit];
                


                 
             }
            ///////////////////////////////////////////////////////////////////////////////////
            
            
            
            if ( [[[dict valueForKey:@"post_data"]valueForKey:@"pick_ready"]isEqualToString:@"yes"])
            {
                ///////////////////////////// Pick_ready Text lable\\\\\\\\\\\\\\\\\\\\\
                
                
                Pick_ready = [[UILabel alloc] init];
                Pick_ready.textColor = [UIColor blackColor];
                [Pick_ready setFrame:CGRectMake(scrollview.frame.size.width-220,right_Width.frame.origin.y+right_Width.frame.size.height,200, 22)];
                Pick_ready.backgroundColor=[UIColor clearColor];
                Pick_ready.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
                Pick_ready.userInteractionEnabled=NO;
                [Pick_ready setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
                
                Pick_ready.textAlignment=NSTextAlignmentRight;
                [scrollview addSubview:Pick_ready];
                
                
                
                
                NSString *string_Width=[NSString stringWithFormat:@"Pick ready :  %@",[[dict valueForKey:@"post_data"]valueForKey:@"pick_ready"]];
                
                NSMutableAttributedString *str_Width = [[NSMutableAttributedString alloc] initWithString:string_Width];
                
                [str_Width addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 15)];
                [str_Width addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(14, [string_Width length]-14)];
                
                Pick_ready.attributedText = str_Width;
                
                
                [Package_price setFrame:CGRectMake(scrollview.frame.size.width-320,Pick_ready.frame.origin.y+Pick_ready.frame.size.height+15,300, 22)];
                
                
                scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 630);
                
                
            }
            else
            {
                ///////////////////////////// Pick_ready Text lable\\\\\\\\\\\\\\\\\\\\\
                
                
                Pick_ready = [[UILabel alloc] init];
                Pick_ready.textColor = [UIColor blackColor];
                [Pick_ready setFrame:CGRectMake(20,right_Width.frame.origin.y+right_Width.frame.size.height,200, 22)];
                Pick_ready.backgroundColor=[UIColor clearColor];
                Pick_ready.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
                Pick_ready.userInteractionEnabled=NO;
                [Pick_ready setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
                
                Pick_ready.textAlignment=NSTextAlignmentLeft;
                [scrollview addSubview:Pick_ready];
                
                NSString *string_Width=[NSString stringWithFormat:@"Pick ready :  %@",[[dict valueForKey:@"post_data"]valueForKey:@"pick_ready"]];
                
                NSMutableAttributedString *str_Width = [[NSMutableAttributedString alloc] initWithString:string_Width];
                
                [str_Width addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 15)];
                [str_Width addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(14, [string_Width length]-14)];
                
                Pick_ready.attributedText = str_Width;
                
                
                
                
                
                
                
                ///////////////////////////// Max_pic_date Text lable\\\\\\\\\\\\\\\\\\\\\
                
                
                pic_date = [[UILabel alloc] init];
                pic_date.textColor = [UIColor blackColor];
                
                
                
                [pic_date setFrame:CGRectMake(scrollview.frame.size.width-220,right_Width.frame.origin.y+right_Width.frame.size.height,200, 22)];
                pic_date.backgroundColor=[UIColor clearColor];
                pic_date.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
                pic_date.userInteractionEnabled=NO;
                [pic_date setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
                
                
                pic_date.textAlignment=NSTextAlignmentRight;
                [scrollview addSubview:pic_date];
                
                
                NSString *string_Widthsss=[NSString stringWithFormat:@"Pick Date :  %@",[[dict valueForKey:@"post_data"]valueForKey:@"pick_date"]];
                
                NSMutableAttributedString *str_Widthsss = [[NSMutableAttributedString alloc] initWithString:string_Widthsss];
                
                
                [str_Widthsss addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 15)];
                [str_Widthsss addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(13, [str_Widthsss length]-14)];
                
                pic_date.attributedText = str_Widthsss;
                
                
                
                
                
                ///////////////////////////// Max_pic_date Text lable\\\\\\\\\\\\\\\\\\\\\
                
                
                Max_pic_date = [[UILabel alloc] init];
                Max_pic_date.textColor = [UIColor blackColor];
                [Max_pic_date setFrame:CGRectMake(20,Pick_ready.frame.origin.y+Pick_ready.frame.size.height,200, 22)];
                Max_pic_date.backgroundColor=[UIColor clearColor];
                Max_pic_date.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
                Max_pic_date.userInteractionEnabled=NO;
                [Max_pic_date setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
                
                
                Max_pic_date.textAlignment=NSTextAlignmentLeft;
                [scrollview addSubview:Max_pic_date];
                
                
                
                
                NSString *string_Max_pic_date=[NSString stringWithFormat:@"Pick before :  %@",[[dict valueForKey:@"post_data"]valueForKey:@"pick_before"]];
                
                if (![[[dict valueForKey:@"post_data"]valueForKey:@"pick_before"] isEqualToString:@"0000-00-00 00:00:00"]) {
                    
               
                
                NSMutableAttributedString *str_Max_pic_date = [[NSMutableAttributedString alloc] initWithString:string_Max_pic_date];
                
                [str_Max_pic_date addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 15)];
                [str_Max_pic_date addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(15, [string_Max_pic_date length]-16)];
                
                Max_pic_date.attributedText = str_Max_pic_date;
                    
                    
                }
                
                [Package_price setFrame:CGRectMake(scrollview.frame.size.width-320,Max_pic_date.frame.origin.y+Max_pic_date.frame.size.height+20,300, 22)];
                
               
                
                
               // scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 730);
                
                
            }
            
            
            
            if ( [[[dict valueForKey:@"post_data"]valueForKey:@"Bundle"]isEqualToString:@"yes"])
            {
                
                
                //    ///////////////////////////// Type Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
                //
                //
                //
                Bundle_item = [[UILabel alloc] init];
                Bundle_item.textColor = [UIColor blackColor];
                [Bundle_item setFrame:CGRectMake(20,Pick_ready.frame.origin.y+Pick_ready.frame.size.height,200, 22)];
                Bundle_item.backgroundColor=[UIColor clearColor];
                Bundle_item.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
                Bundle_item.userInteractionEnabled=NO;
                [Bundle_item setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
                Bundle_item.textAlignment=NSTextAlignmentLeft;
                [scrollview addSubview:Bundle_item];
                
                
                
                
                NSString *string_Bundle_item=[NSString stringWithFormat:@"Bundle items :  %@",[[dict valueForKey:@"post_data"]valueForKey:@"Bundle"]];
                
                NSMutableAttributedString *str_Bundle_item = [[NSMutableAttributedString alloc] initWithString:string_Bundle_item];
                
                [str_Bundle_item addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 15)];
                [str_Bundle_item addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(16, [string_Bundle_item length]-17)];
                
                Bundle_item.attributedText = str_Bundle_item;
                
                
                
                
                
                //    ///////////////////////////// Type Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
                //
                //
                //
                Bundle_item_count = [[UILabel alloc] init];
                Bundle_item_count.textColor = [UIColor blackColor];
                [Bundle_item_count setFrame:CGRectMake(scrollview.frame.size.width-220,Pick_ready.frame.origin.y+Pick_ready.frame.size.height,200, 22)];
                Bundle_item_count.backgroundColor=[UIColor clearColor];
                Bundle_item_count.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
                Bundle_item_count.userInteractionEnabled=NO;
                [Bundle_item_count setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
                Bundle_item_count.textAlignment=NSTextAlignmentRight;
                [scrollview addSubview:Bundle_item_count];
                
                
                
                NSString *string_Bundle_item_count=[NSString stringWithFormat:@"Bundle items count :  %@",[[dict valueForKey:@"post_data"]valueForKey:@"Bundle_items"]];
                
                NSMutableAttributedString *str_Bundle_item_count = [[NSMutableAttributedString alloc] initWithString:string_Bundle_item_count];
                
                [str_Bundle_item_count addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 15)];
                [str_Bundle_item_count addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(22, [string_Bundle_item_count length]-23)];
                
                Bundle_item_count.attributedText = str_Bundle_item_count;
                
                
                
                //    ////////////////////////////   Accept Button \\\\\\\\\\\\\\\\\\\\\\\
                
                See_Bundle_Packages = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                [See_Bundle_Packages addTarget:self
                                        action:@selector(See_Bundle_Packages_action:)
                              forControlEvents:UIControlEventTouchUpInside];
                See_Bundle_Packages.backgroundColor=[UIColor clearColor];
                [See_Bundle_Packages setTitle:@"See Bundle Packages" forState:UIControlStateNormal];
                See_Bundle_Packages.tag=1;
                [See_Bundle_Packages setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
                [See_Bundle_Packages setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
                See_Bundle_Packages.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
                See_Bundle_Packages.frame = CGRectMake(scrollview.frame.size.width-160, Package_price.frame.origin.y+40,150, 30);
                [scrollview addSubview:See_Bundle_Packages];
                
                
                
                [Package_price setFrame:CGRectMake(scrollview.frame.size.width-320,See_Bundle_Packages.frame.origin.y+See_Bundle_Packages.frame.size.height+30,300, 22)];
                
                scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 730);
                
                
            }

            
            
            
            
            
            ////////////////////////////////////////////////////////////////////////////////////
            
//            [Package_price setFrame:CGRectMake(scrollview.frame.size.width-320,right_Width.frame.origin.y+right_Width.frame.size.height+15,300, 22)];
            
            [Our_fees setFrame:CGRectMake(scrollview.frame.size.width-320,Package_price.frame.origin.y+Package_price.frame.size.height,300, 22)];
            [Total setFrame:CGRectMake(self.view.frame.size.width-320,Our_fees.frame.origin.y+Our_fees.frame.size.height,300, 22)];
            
            Accept_BTN.frame = CGRectMake((scrollview.frame.size.width-138)/2, Total.frame.origin.y+Total.frame.size.height+20,138, 38.0);
            
            
            NSLog(@"hight of view %f",Accept_BTN.frame.origin.y+Accept_BTN.frame.size.height);
            
           scrollview.contentSize = CGSizeMake(self.view.frame.size.width, Accept_BTN.frame.origin.y+Accept_BTN.frame.size.height+10);
            

            if ([[[dict valueForKey:@"post_data"]valueForKey:@"classified"]isEqualToString:@"TRUE"])
            {
                
                MTitle.text= @"CLASSIFIED ITEM DETAIL";
                
                
                [Bonus setFrame:CGRectMake(scrollview.frame.size.width-320,Our_fees.frame.origin.y+Our_fees.frame.size.height,300, 22)];
                [Total setFrame:CGRectMake(self.view.frame.size.width-320,Bonus.frame.origin.y+Bonus.frame.size.height,300, 22)];
                
                
                string_Package_price=[NSString stringWithFormat:@"Classified Item Price Set By Buyer :   %@",[[dict valueForKey:@"post_data"]valueForKey:@"Package_price"]];
                
                str_Package_price = [[NSMutableAttributedString alloc] initWithString:string_Package_price];
                
                [str_Package_price addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0,38)];
                [str_Package_price addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(39, [string_Package_price length]-40)];
                
                Package_price.attributedText = str_Package_price;
                
                string_Bonus=[NSString stringWithFormat:@"Bonus :  %@",[[dict valueForKey:@"post_data"]valueForKey:@"bonus"]];
                
                str_Bonus_fee = [[NSMutableAttributedString alloc] initWithString:string_Bonus];
                
                [str_Bonus_fee addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 10)];
                [str_Bonus_fee addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(11, [str_Bonus_fee length]-12)];
                
                Bonus.attributedText = str_Bonus_fee;
                
                
                
                
                
                
                
                string_Our_fees=[NSString stringWithFormat:@"PigeonShip Fees%@ :  %@",[NSString stringWithFormat:@" (%@ %%)",[[dict valueForKey:@"post_data"]valueForKey:@"Commision_rate"]],[[dict valueForKey:@"post_data"]valueForKey:@"Package_fee"]];
                
                str_Our_fees = [[NSMutableAttributedString alloc] initWithString:string_Our_fees];
                
                [str_Our_fees addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 26)];
                [str_Our_fees addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(27, [string_Our_fees length]-28)];
                
                Our_fees.attributedText = str_Our_fees;
                

                
                
                string_Total=[NSString stringWithFormat:@"Total You Receive :  %@",[[dict valueForKey:@"post_data"]valueForKey:@"Total_amount"]];
                
                str_Total = [[NSMutableAttributedString alloc] initWithString:string_Total];
                
                [str_Total addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 21)];
                [str_Total addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(22, [str_Total length]-23)];
                
                Total.attributedText = str_Total;
                
                
              
                
                
                
            }
            else
            {
                MTitle.text= @"ITEM DETAIL";
                
                
                string_Package_price=[NSString stringWithFormat:@"Package price set by Sender:  %@",[[dict valueForKey:@"post_data"]valueForKey:@"Package_price"]];
                
                str_Package_price = [[NSMutableAttributedString alloc] initWithString:string_Package_price];
                
                [str_Package_price addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0,28)];
                [str_Package_price addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(29, [string_Package_price length]-30)];
                
                Package_price.attributedText = str_Package_price;
                
                string_Our_fees=[NSString stringWithFormat:@"PigeonShip Fees%@ :  %@",[NSString stringWithFormat:@" (%@ %%)",[[dict valueForKey:@"post_data"]valueForKey:@"Commision_rate"]],[[dict valueForKey:@"post_data"]valueForKey:@"Package_fee"]];
                
                str_Our_fees = [[NSMutableAttributedString alloc] initWithString:string_Our_fees];
                
                [str_Our_fees addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 26)];
                [str_Our_fees addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(27, [string_Our_fees length]-28)];
                
                Our_fees.attributedText = str_Our_fees;
                
                
                string_Total=[NSString stringWithFormat:@"TOTAL(you will get upon delivering the package) :  %@",[[dict valueForKey:@"post_data"]valueForKey:@"Total_amount"]];
                
                str_Total = [[NSMutableAttributedString alloc] initWithString:string_Total];
                
                [str_Total addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 48)];
                [str_Total addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(49, [str_Total length]-50)];
                
                Total.attributedText = str_Total;

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
            
            if ([[dict valueForKey:@"error_type"]isEqualToString:@"0"]) {
                
                
                
                alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                alert.tag=1005;
                [alert show];
                
            }
            else
            {
                
                alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [alert show];
            }
            
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

-(void)See_Bundle_Packages_action:(UIButton *)sender
{
    See_Bundle_Packages_action *obj_Accepted_items_sender_ViewController=[[See_Bundle_Packages_action alloc]init];
    
    obj_Accepted_items_sender_ViewController.Bundle_package=[dict valueForKey:@"Bundle"];
    
    
    [self.navigationController pushViewController:obj_Accepted_items_sender_ViewController animated:YES];
    
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

    
  else  if (alertView.tag==1005) {
        
        NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
        NSDictionary * dicts = [defs dictionaryRepresentation];
        for (id key in dicts) {
            [defs removeObjectForKey:key];
        }
        [defs synchronize];
        [appDelegate LogOut_Method];
        [[NSUserDefaults standardUserDefaults]setObject:@"Logout" forKey:@"LoginStatues"];
        [[NSUserDefaults standardUserDefaults]synchronize];

        }
    else if (alert.tag==1007)
    {
        [self.navigationController popViewControllerAnimated:YES];

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
    
    if ([post_type isEqualToString:@"Notification"]) {
        
        [self dismissViewControllerAnimated:YES completion:nil];

    }
    else
    {
    
    [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)Next:(UIButton *)sender
{
    
    //    Profile_ViewController *OBJProfile_ViewController=[[Profile_ViewController alloc]init];
    //    [self.navigationController pushViewController:OBJProfile_ViewController animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end