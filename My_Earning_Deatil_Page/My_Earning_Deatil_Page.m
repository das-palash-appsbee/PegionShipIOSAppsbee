//
//  My_Earning_Deatil_Page.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 15/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "My_Earning_Deatil_Page.h"
#import "Utility.h"

@interface My_Earning_Deatil_Page ()

@end

@implementation My_Earning_Deatil_Page

@synthesize Pack_Key;

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
    
    
    
    
    
    [scrollview addSubview:Middle_Right_Address_LB];
    
    
    
    
    
    //////////////////////////// Left Side View///////////////////////////////////////////////
    
    ///////////////////////////// Created_on Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
//    
//    Created_on = [[UILabel alloc] init];
//    Created_on.textColor = [UIColor blackColor];
//    [Created_on setFrame:CGRectMake(20,Middle_Left_Address_LB.frame.origin.y+Middle_Left_Address_LB.frame.size.height+15,200, 22)];
//    Created_on.backgroundColor=[UIColor clearColor];
//    Created_on.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
//    Created_on.userInteractionEnabled=NO;
//    [Created_on setFont:[UIFont fontWithName:@"bariol-regular" size:8.0]];
//    
//    Created_on.text=@"Origin City :";
//    [scrollview addSubview:Created_on];
//    
    
    
    ///////////////////////////// Status Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Status = [[UILabel alloc] init];
    Status.textColor = [UIColor blackColor];
    [Status setFrame:CGRectMake(20,Middle_Left_Address_LB.frame.origin.y+Middle_Left_Address_LB.frame.size.height+30,200, 22)];
    Status.backgroundColor=[UIColor clearColor];
    Status.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Status.userInteractionEnabled=NO;
    [Status setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
     Status.textAlignment=NSTextAlignmentLeft;
    Status.text=@"Status";
    
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
    [Sender_Name setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
     Sender_Name.textAlignment=NSTextAlignmentLeft;
    Sender_Name.text=@"Accepted On";
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

    
    
    
    
    ///////////////////////////// Pigeon_type Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Pigeon_type = [[UILabel alloc] init];
    Pigeon_type.textColor = [UIColor blackColor];
    [Pigeon_type setFrame:CGRectMake(self.view.frame.size.width-220,Middle_Right_Address_LB.frame.origin.y+Middle_Right_Address_LB.frame.size.height+30,200, 22)];
    Pigeon_type.backgroundColor=[UIColor clearColor];
    Pigeon_type.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Pigeon_type.userInteractionEnabled=NO;
    [Pigeon_type setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    Pigeon_type.text=@"Marked As Delivered On";
    Pigeon_type.textAlignment=NSTextAlignmentRight;
    [scrollview addSubview:Pigeon_type];
    
    
    
    
    
    
    
    Pigeon_type_DYN  = [[UILabel alloc] init];
    Pigeon_type_DYN.textColor = [UIColor whiteColor];
    [Pigeon_type_DYN setFrame:CGRectMake(self.view.frame.size.width-220,Pigeon_type.frame.origin.y+Pigeon_type.frame.size.height,200, 22)];
    Pigeon_type_DYN.backgroundColor=[UIColor clearColor];
    Pigeon_type_DYN.userInteractionEnabled=NO;
    [Pigeon_type_DYN setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Pigeon_type_DYN.textAlignment=NSTextAlignmentLeft;
    Pigeon_type_DYN.text=@"";
    Pigeon_type_DYN.backgroundColor=[UIColor clearColor];
      Pigeon_type_DYN.textAlignment=NSTextAlignmentRight;
    [scrollview addSubview:Pigeon_type_DYN];

    
    
    ///////////////////////////// Distance_Mile Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Distance_Mile = [[UILabel alloc] init];
    Distance_Mile.textColor = [UIColor blackColor];
    [Distance_Mile setFrame:CGRectMake(self.view.frame.size.width-220,Pigeon_type_DYN.frame.origin.y+Pigeon_type_DYN.frame.size.height,200, 22)];
    Distance_Mile.backgroundColor=[UIColor clearColor];
    Distance_Mile.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Distance_Mile.userInteractionEnabled=NO;
    [Distance_Mile setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    
    Distance_Mile.text=@"Feedback Date ";
    Distance_Mile.textAlignment=NSTextAlignmentRight;
    [scrollview addSubview:Distance_Mile];
    
    
    
    
    Distance_Mile_DYN  = [[UILabel alloc] init];
    Distance_Mile_DYN.textColor = [UIColor whiteColor];
    [Distance_Mile_DYN setFrame:CGRectMake(self.view.frame.size.width-220,Distance_Mile.frame.origin.y+Distance_Mile.frame.size.height,200, 22)];
    Distance_Mile_DYN.backgroundColor=[UIColor clearColor];
    Distance_Mile_DYN.userInteractionEnabled=NO;
    [Distance_Mile_DYN setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Distance_Mile_DYN.textAlignment=NSTextAlignmentLeft;
    Distance_Mile_DYN.text=@"";
    Distance_Mile_DYN.backgroundColor=[UIColor clearColor];
    Distance_Mile_DYN.textAlignment=NSTextAlignmentRight;
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
    
//    
//    
//    Width = [[UILabel alloc] init];
//    Width.textColor = [UIColor blackColor];
//    [Width setFrame:CGRectMake(20,Type.frame.origin.y+Type.frame.size.height,200, 22)];
//    Width.backgroundColor=[UIColor clearColor];
//    Width.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
//    Width.userInteractionEnabled=NO;
//    [Width setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
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
//    [height setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
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
//    [right_Width setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
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
    
    
    
    objHCSStarRatingView=[[HCSStarRatingView alloc]init];
    
    objHCSStarRatingView.frame=CGRectMake((self.view.frame.size.width-100)/2, Update_package_Status_LB.frame.origin.y+Update_package_Status_LB.frame.size.height-7, 100, 40);
    objHCSStarRatingView.userInteractionEnabled=NO;
    objHCSStarRatingView.hidden=YES;
    [scrollview addSubview:objHCSStarRatingView] ;
    
    
    
    FeedBack_TXTVIEW = [[UITextView alloc] initWithFrame:CGRectMake(0, objHCSStarRatingView.frame.origin.y+objHCSStarRatingView.frame.size.height-5,self.view.frame.size.width, 100)]; //Frame: : 0, 20, 320, 548
    CGRect textViewFrame =FeedBack_TXTVIEW.frame;
    FeedBack_TXTVIEW.font = [UIFont fontWithName:@"bariol-regular" size:12.0];
    FeedBack_TXTVIEW.backgroundColor = [UIColor clearColor];
    FeedBack_TXTVIEW.scrollEnabled = YES;
    FeedBack_TXTVIEW.textAlignment=NSTextAlignmentCenter;
    FeedBack_TXTVIEW.editable = NO;
    FeedBack_TXTVIEW.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    
    [scrollview addSubview:FeedBack_TXTVIEW];
    
    
    
    
    
    
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 630);
    
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
#pragma mark  Login _ With _ Email _Id
#pragma mark - -*********************


-(void)CalltheServer
{
    
    
    
    
    
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&package_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],Pack_Key]:[NSString stringWithFormat:@"%@earning_detail",[Utility API_link_url]]];
        
        NSLog(@"%@",responseString);
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            
            
            FeedBack_TXTVIEW.text=[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_feedback"];
            
            
            if ([[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_confirmationDate"]isEqualToString:@"Feedback Pending"]) {
                
                
                
                UILabel *rating=[[UILabel alloc]init];
                
                rating.frame=CGRectMake(0, Update_package_Status_LB.frame.origin.y+Update_package_Status_LB.frame.size.height-7, self.view.frame.size.width, 40);
                [rating setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
                rating.text=@"Feedback Pending by the sender.";
                rating.textAlignment=NSTextAlignmentCenter;
                rating.textColor= [UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
                [scrollview addSubview:rating] ;
                

                
                [objHCSStarRatingView removeFromSuperview];
                
                
            }
            else
            {
             objHCSStarRatingView.hidden=NO;
            objHCSStarRatingView.value=[[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_rating"]floatValue];
            }
            NSMutableParagraphStyle *style  = [[NSMutableParagraphStyle alloc] init];
            style.minimumLineHeight = 12.f;
            style.maximumLineHeight = 12.f;
            attributtes = @{NSParagraphStyleAttributeName : style,};
            
            Middle_Left_Address_LB.attributedText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@ %@ %@",[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_Pickaddress"],[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_Pickcity"],[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_Pickstate"],[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_Pickzip"]] attributes:attributtes];
            
            
            Middle_Left_Address_LB.textColor=[UIColor whiteColor];
            Middle_Left_Address_LB.textAlignment=NSTextAlignmentLeft;
            [Middle_Left_Address_LB sizeToFit];
            
            [scrollview addSubview:Middle_Left_Address_LB];
            
            
            NSMutableParagraphStyle *styles  = [[NSMutableParagraphStyle alloc] init];
            styles.minimumLineHeight = 12.f;
            styles.maximumLineHeight = 12.f;
            attributtess = @{NSParagraphStyleAttributeName : styles,};
            
            
            
            Middle_Right_Address_LB.attributedText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@ %@ %@",[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_Dropaddress"],[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_Dropcity"],[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_Dropstate"],[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_Dropzip"]]attributes:attributtess];
            
            // Middle_Right_Address_LB.text= @"#801 Pleasant Grove Los Alamitos California 90720";
            Middle_Right_Address_LB.textColor=[UIColor whiteColor];
            Middle_Right_Address_LB.textAlignment=NSTextAlignmentRight;
            [Middle_Right_Address_LB sizeToFit];
            
            
            NSString *string_value=[NSString stringWithFormat:@"Origin City : %@",[[dict valueForKey:@"earning_detail"]valueForKey:@"Created_date"]];
            
            NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:string_value];
            
            [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 14)];
            [str addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(10, [string_value length]-10)];
            
            Created_on.attributedText = str;
            
            
            Created_on.textAlignment=NSTextAlignmentLeft;
            
            
            
            
            
            Status_DYN.text=[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_Status"];
            Sender_Name_DYN.text=[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_accepted_On"];
            Pigeon_type_DYN.text=[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_DeliveryDate"];
            Distance_Mile_DYN.text=[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_confirmationDate"];
            
            
            
            
            
            
            NSString *string_To_delivery=[NSString stringWithFormat:@"Destination City: %@",[[dict valueForKey:@"earning_detail"]valueForKey:@"Delivery_date"]];
            
            NSMutableAttributedString *str_To_delivery = [[NSMutableAttributedString alloc] initWithString:string_To_delivery];
            
            [str_To_delivery addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0,23)];
            [str_To_delivery addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(24, [string_To_delivery length]-24)];
            
            To_delivery.attributedText = str_To_delivery;
            
            
            To_delivery.textAlignment=NSTextAlignmentRight;
            
            
//            
//            NSString *string_Sender_Name=[NSString stringWithFormat:@"Accepted On:  %@",[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_accepted_On"]];
//            
//            NSMutableAttributedString *str_Sender_Name = [[NSMutableAttributedString alloc] initWithString:string_Sender_Name];
//            
//            [str_Sender_Name addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 13)];
//            [str_Sender_Name addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(14, [string_Sender_Name length]-15)];
//            
//            Sender_Name.attributedText = str_Sender_Name;
//            
//            
//            Sender_Name.textAlignment=NSTextAlignmentLeft;
            
            
//            NSString *string_Distance_Mile=[NSString stringWithFormat:@"Feedback Date :%@",[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_confirmationDate"]];
//            
//            NSMutableAttributedString *str_Distance_Mile = [[NSMutableAttributedString alloc] initWithString:string_Distance_Mile];
//            
//            [str_Distance_Mile addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 14)];
//            [str_Distance_Mile addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(15, [str_Distance_Mile length]-16)];
//            
//            Distance_Mile.attributedText = str_Distance_Mile;
//            
//            
//            Distance_Mile.textAlignment=NSTextAlignmentRight;
//            
            
            
            
//            NSString *string_Pigeon_type=[NSString stringWithFormat:@"Marked As Delivered On:  %@",[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_DeliveryDate"]];
//            
//            NSMutableAttributedString *str_Pigeon_type = [[NSMutableAttributedString alloc] initWithString:string_Pigeon_type];
//            
//            [str_Pigeon_type addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 24)];
//            [str_Pigeon_type addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(25, [string_Pigeon_type length]-26)];
//            
//            Pigeon_type.attributedText = str_Pigeon_type;
//            
//            
//            Pigeon_type.textAlignment=NSTextAlignmentRight;
//            
            
            
//            NSString *string_Status=[NSString stringWithFormat:@"Status: %@",[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_Status"]];
//            
//            NSMutableAttributedString *str_Status = [[NSMutableAttributedString alloc] initWithString:string_Status];
//            
//            [str_Status addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 7)];
//            [str_Status addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(8, [string_Status length]-9)];
//            
//            Status.attributedText = str_Status;
//            
//            
//            Status.textAlignment=NSTextAlignmentLeft;
            
            
            
            NSString *string_Type=[NSString stringWithFormat:@"Type:  %@",[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_type"]];
            
            NSMutableAttributedString *str_Type = [[NSMutableAttributedString alloc] initWithString:string_Type];
            
            [str_Type addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 7)];
            [str_Type addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(7, [string_Type length]-7)];
            
            Type.attributedText = str_Type;
            
            
            Type.textAlignment=NSTextAlignmentLeft;
            
            
            
            
            NSString *string_Width=[NSString stringWithFormat:@"Width(inches) :  %@",[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_width"]];
            
            NSMutableAttributedString *str_Width = [[NSMutableAttributedString alloc] initWithString:string_Width];
            
            [str_Width addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 15)];
            [str_Width addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(16, [string_Width length]-17)];
            
            Width.attributedText = str_Width;
            
            
            Width.textAlignment=NSTextAlignmentLeft;
            
            
            
            NSString *string_height=[NSString stringWithFormat:@"Height(inches) :  %@",[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_height"]];
            
            NSMutableAttributedString *str_height = [[NSMutableAttributedString alloc] initWithString:string_height];
            
            [str_height addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 16)];
            [str_height addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(17, [string_height length]-18)];
            
            height.attributedText = str_height;
            
            
            
            
            NSString *string_right_Width=[NSString stringWithFormat:@"Weight(In lbs) :  %@",[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_weight"]];
            
            
            
            NSMutableAttributedString *str_right_Width = [[NSMutableAttributedString alloc] initWithString:string_right_Width];
            
            [str_right_Width addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 16)];
            [str_right_Width addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(17, [string_right_Width length]-18)];
            
            right_Width.attributedText = str_right_Width;
            
            
            
          
            
            
            
            string_Our_fees=[NSString stringWithFormat:@"PigeonShip Fees%@ :  %@",[NSString stringWithFormat:@" (%@ %%)",[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_commision"]],[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_fee"]];
            
            str_Our_fees = [[NSMutableAttributedString alloc] initWithString:string_Our_fees];
            
            [str_Our_fees addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 26)];
            [str_Our_fees addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(27, [string_Our_fees length]-28)];
            
            Our_fees.attributedText = str_Our_fees;

            
            
            
            
            
            
            
            if ([[[dict valueForKey:@"earning_detail"]valueForKey:@"classified"]isEqualToString:@"TRUE"])
            {
                MTitle.text= @"CLASSIFIED ITEM DETAIL";
                
                
                
                [Our_fees setFrame:CGRectMake(scrollview.frame.size.width-320,Package_price.frame.origin.y+Package_price.frame.size.height,300, 22)];
                
                [Bonus setFrame:CGRectMake(scrollview.frame.size.width-320,Our_fees.frame.origin.y+Our_fees.frame.size.height,300, 22)];
                
                [Total setFrame:CGRectMake(self.view.frame.size.width-320,Bonus.frame.origin.y+Bonus.frame.size.height,300, 22)];

                
                string_Package_price=[NSString stringWithFormat:@"Classified Item Price Set By Buyer :   %@",[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_price"]];
                
                str_Package_price = [[NSMutableAttributedString alloc] initWithString:string_Package_price];
                
                [str_Package_price addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0,38)];
                [str_Package_price addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(39, [string_Package_price length]-40)];
                
                Package_price.attributedText = str_Package_price;
                
                
                
              
                
                
                
                
                
                string_Total=[NSString stringWithFormat:@"Total You Receive :  %@",[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_Earning"]];
                
                str_Total = [[NSMutableAttributedString alloc] initWithString:string_Total];
                
                [str_Total addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 21)];
                [str_Total addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(22, [str_Total length]-23)];
                
                Total.attributedText = str_Total;
                

                
                
                
                if ([[[dict valueForKey:@"earning_detail"]valueForKey:@"return"]isEqualToString:@"FALSE"]) {
                    
                    string_Bonus=[NSString stringWithFormat:@"Bonus :  %@",[[dict valueForKey:@"earning_detail"]valueForKey:@"bonus"]];
                    
                    str_Bonus_fee = [[NSMutableAttributedString alloc] initWithString:string_Bonus];
                    
                    [str_Bonus_fee addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 9)];
                    
                    [str_Bonus_fee addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(10, [string_Bonus length]-11)];
                    
                    Bonus.attributedText = str_Bonus_fee;

                    
                    
                    
//                    string_Our_fees=[NSString stringWithFormat:@"Bonus :  %@",[[dict valueForKey:@"earning_detail"]valueForKey:@"bonus"]];
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
                    
                    
                    string_Our_fees=[NSString stringWithFormat:@"Return fee :  %@",[[dict valueForKey:@"earning_detail"]valueForKey:@"return_fee"]];
                    
                    str_Our_fees = [[NSMutableAttributedString alloc] initWithString:string_Our_fees];
                    
                    [str_Our_fees addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 14)];
                    
                    [str_Our_fees addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(15, [str_Our_fees length]-16)];
                    
                    Bonus.attributedText = str_Our_fees;

                    
                    
//                    string_Our_fees=[NSString stringWithFormat:@"Return fee :  %@",[[dict valueForKey:@"earning_detail"]valueForKey:@"return_fee"]];
//                    
//                    str_Our_fees = [[NSMutableAttributedString alloc] initWithString:string_Our_fees];
//                    
//                    [str_Our_fees addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 14)];
//                    [str_Our_fees addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(15, [string_Our_fees length]-16)];
//                    
//                    Our_fees.attributedText = str_Our_fees;
                    
                }
            }
            else
            {
                MTitle.text= @"ITEM DETAIL";
                
                
                
                
                string_Package_price=[NSString stringWithFormat:@"Package price set by Sender:  %@",[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_price"]];
                
               str_Package_price = [[NSMutableAttributedString alloc] initWithString:string_Package_price];
                
                [str_Package_price addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0,28)];
                [str_Package_price addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(29, [string_Package_price length]-30)];
                
                Package_price.attributedText = str_Package_price;
                
                
                
                
                
                
                
                
               string_Total=[NSString stringWithFormat:@"TOTAL(you will get upon delivering the package) :  %@",[[dict valueForKey:@"earning_detail"]valueForKey:@"Package_Earning"]];
                
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



@end
