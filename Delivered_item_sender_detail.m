//
//  Delivered_item_sender_detail.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 20/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Delivered_item_sender_detail.h"
#import "Utility.h"
#import "See_Bundle_Packages_action.h"

@interface Delivered_item_sender_detail ()

@end

@implementation Delivered_item_sender_detail

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
    
    
    
    
    
    
    
    
    ///////////////////////////// Status_LB_ST Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Status_LB_ST  = [[UILabel alloc] init];
    Status_LB_ST.textColor = [UIColor blackColor];
    [Status_LB_ST setFrame:CGRectMake(20,Middle_Left_Address_LB.frame.origin.y+Middle_Left_Address_LB.frame.size.height+35,150, 22)];
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
    [Status_LB_DYT setFrame:CGRectMake(20,Status_LB_ST.frame.origin.y+Status_LB_ST.frame.size.height,200, 22)];
    Status_LB_DYT.backgroundColor=[UIColor clearColor];
    Status_LB_DYT.userInteractionEnabled=NO;
    [Status_LB_DYT setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
    Status_LB_DYT.textAlignment=NSTextAlignmentLeft;
    Status_LB_DYT.text=@"";
    Status_LB_DYT.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:Status_LB_DYT];
    
    
    
    
    
    ///////////////////////////// Accepted_On_LB_DYT Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Accepted_On_LB_ST  = [[UILabel alloc] init];
    Accepted_On_LB_ST.textColor = [UIColor blackColor];
    [Accepted_On_LB_ST setFrame:CGRectMake(self.view.frame.size.width-140,Middle_Left_Address_LB.frame.origin.y+Middle_Left_Address_LB.frame.size.height+35,120, 22)];
    Accepted_On_LB_ST.backgroundColor=[UIColor clearColor];
    Accepted_On_LB_ST.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Accepted_On_LB_ST.userInteractionEnabled=NO;
    [Accepted_On_LB_ST setFont:[UIFont fontWithName:@"bariol-Bold" size:12.0]];
    Accepted_On_LB_ST.text=@"Accepted On";
    Accepted_On_LB_ST.backgroundColor=[UIColor clearColor];
    Accepted_On_LB_ST.textAlignment=NSTextAlignmentRight;
    [scrollview addSubview:Accepted_On_LB_ST];
    
    
    
    
    
    
    Accepted_On_LB_DYT  = [[UILabel alloc] init];
    Accepted_On_LB_DYT.textColor = [UIColor whiteColor];
    [Accepted_On_LB_DYT setFrame:CGRectMake(self.view.frame.size.width-140,Accepted_On_LB_ST.frame.origin.y+Accepted_On_LB_ST.frame.size.height,120, 22)];
    Accepted_On_LB_DYT.backgroundColor=[UIColor clearColor];
    Accepted_On_LB_DYT.userInteractionEnabled=NO;
    [Accepted_On_LB_DYT setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
    Accepted_On_LB_DYT.textAlignment=NSTextAlignmentRight;
    Accepted_On_LB_DYT.text=@"";
    Accepted_On_LB_DYT.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:Accepted_On_LB_DYT];
    
    
    
    
    
    
    
    ///////////////////////////// Total Distance Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Package_Delivered_On_LB_ST  = [[UILabel alloc] init];
    Package_Delivered_On_LB_ST.textColor = [UIColor blackColor];
    [Package_Delivered_On_LB_ST setFrame:CGRectMake(20,Status_LB_ST.frame.origin.y+Status_LB_ST.frame.size.height+35,190, 22)];
    Package_Delivered_On_LB_ST.backgroundColor=[UIColor clearColor];
    Package_Delivered_On_LB_ST.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Package_Delivered_On_LB_ST.userInteractionEnabled=NO;
    [Package_Delivered_On_LB_ST setFont:[UIFont fontWithName:@"bariol-Bold" size:10.0]];
    Package_Delivered_On_LB_ST.text=@"Delivered On";
    Package_Delivered_On_LB_ST.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:Package_Delivered_On_LB_ST];
    
    Package_Delivered_On_LB_ST.textAlignment=NSTextAlignmentLeft;
    
    
    
    
    Package_Delivered_On_LB_DYT  = [[UILabel alloc] init];
    Package_Delivered_On_LB_DYT.textColor = [UIColor whiteColor];
    [Package_Delivered_On_LB_DYT setFrame:CGRectMake(20,Package_Delivered_On_LB_ST.frame.origin.y+Package_Delivered_On_LB_ST.frame.size.height,200, 22)];
    Package_Delivered_On_LB_DYT.backgroundColor=[UIColor clearColor];
    Package_Delivered_On_LB_DYT.userInteractionEnabled=NO;
    [Package_Delivered_On_LB_DYT setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
    Package_Delivered_On_LB_DYT.textAlignment=NSTextAlignmentLeft;
    Package_Delivered_On_LB_DYT.text=@"";
    Package_Delivered_On_LB_DYT.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:Package_Delivered_On_LB_DYT];
    
    
    
    
    
    ///////////////////////////// Accepted By Pigeon  Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Accepted_By_Pigeon_LB_ST  = [[UILabel alloc] init];
    Accepted_By_Pigeon_LB_ST.textColor = [UIColor blackColor];
    [Accepted_By_Pigeon_LB_ST setFrame:CGRectMake(self.view.frame.size.width-140,Status_LB_ST.frame.origin.y+Status_LB_ST.frame.size.height+35,120, 22)];
    
    Accepted_By_Pigeon_LB_ST.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Accepted_By_Pigeon_LB_ST.userInteractionEnabled=NO;
    [Accepted_By_Pigeon_LB_ST setFont:[UIFont fontWithName:@"bariol_bold-webfont" size:15.0]];
    Accepted_By_Pigeon_LB_ST.text=@"Accepted By";
    Accepted_By_Pigeon_LB_ST.backgroundColor=[UIColor clearColor];
    Accepted_By_Pigeon_LB_ST.textAlignment=NSTextAlignmentRight;
    [scrollview addSubview:Accepted_By_Pigeon_LB_ST];
    
    
    
    Accepted_By_Pigeon_LB_DYT  = [[UILabel alloc] init];
    Accepted_By_Pigeon_LB_DYT.textColor = [UIColor whiteColor];
    [Accepted_By_Pigeon_LB_DYT setFrame:CGRectMake(self.view.frame.size.width-140,Accepted_By_Pigeon_LB_ST.frame.origin.y+Accepted_By_Pigeon_LB_ST.frame.size.height,120, 22)];
    Accepted_By_Pigeon_LB_DYT.backgroundColor=[UIColor clearColor];
    Accepted_By_Pigeon_LB_DYT.userInteractionEnabled=NO;
    [Accepted_By_Pigeon_LB_DYT setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
    Accepted_By_Pigeon_LB_DYT.textAlignment=NSTextAlignmentRight;
    Accepted_By_Pigeon_LB_DYT.text=@"";
    Accepted_By_Pigeon_LB_DYT.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:Accepted_By_Pigeon_LB_DYT];
    
    
    
    
    
    ///////////////////////////// Bottom_MTitle \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Bottom_MTitle = [[UILabel alloc] init];
    Bottom_MTitle.textColor = [UIColor blackColor];
    [Bottom_MTitle setFrame:CGRectMake(0,Accepted_By_Pigeon_LB_DYT.frame.origin.y+Accepted_By_Pigeon_LB_DYT.frame.size.height+15,self.view.frame.size.width, 40)];
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
    //
    //
    //
    //    ///////////////////////////// Type Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    //
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
    //
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
    Package_price.text=@"Total paid:";
    
    //
    //
    //
    Package_price.textAlignment=NSTextAlignmentRight;
    [scrollview addSubview:Package_price];
//    //
    
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 600);
    
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
#pragma mark  Login _ With _ Email _Id
#pragma mark - -*********************


-(void)CalltheServer
{
    
    
    
    
    
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&package_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],Pack_Key]:[NSString stringWithFormat:@"%@packagedetail",[Utility API_link_url]]];
        
        
        
        
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
            
            
         
            Status_LB_DYT.text=[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_Status"];
            Accepted_On_LB_DYT.text=[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_accepted_On"];
            Package_Delivered_On_LB_DYT.text=[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_DeliveryDate"];
            Accepted_By_Pigeon_LB_DYT.text=[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_Acceptedby"];
          
            
            
            
            
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
            
            
            if ( [[[dict valueForKey:@"Package_Detail"]valueForKey:@"pick_ready"]isEqualToString:@"yes"])
            {
                ///////////////////////////// Pick_ready Text lable\\\\\\\\\\\\\\\\\\\\\
                
                
                Pick_ready = [[UILabel alloc] init];
                Pick_ready.textColor = [UIColor blackColor];
                [Pick_ready setFrame:CGRectMake(scrollview.frame.size.width-220,Type.frame.origin.y+Type.frame.size.height,200, 22)];
                Pick_ready.backgroundColor=[UIColor clearColor];
                Pick_ready.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
                Pick_ready.userInteractionEnabled=NO;
                [Pick_ready setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
                
                Pick_ready.textAlignment=NSTextAlignmentRight;
                [scrollview addSubview:Pick_ready];
                
                
                
                
                NSString *string_Width=[NSString stringWithFormat:@"Pick ready :  %@",[[dict valueForKey:@"Package_Detail"]valueForKey:@"pick_ready"]];
                
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
                [Pick_ready setFrame:CGRectMake(20,Type.frame.origin.y+Type.frame.size.height,200, 22)];
                Pick_ready.backgroundColor=[UIColor clearColor];
                Pick_ready.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
                Pick_ready.userInteractionEnabled=NO;
                [Pick_ready setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
                
                Pick_ready.textAlignment=NSTextAlignmentLeft;
                [scrollview addSubview:Pick_ready];
                
                NSString *string_Width=[NSString stringWithFormat:@"Pick ready :  %@",[[dict valueForKey:@"Package_Detail"]valueForKey:@"pick_ready"]];
                
                NSMutableAttributedString *str_Width = [[NSMutableAttributedString alloc] initWithString:string_Width];
                
                [str_Width addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 15)];
                [str_Width addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(14, [string_Width length]-14)];
                
                Pick_ready.attributedText = str_Width;
                
                
                
                
                
                
                
                ///////////////////////////// Max_pic_date Text lable\\\\\\\\\\\\\\\\\\\\\
                
                
                pic_date = [[UILabel alloc] init];
                pic_date.textColor = [UIColor blackColor];
                
                
                
                [pic_date setFrame:CGRectMake(scrollview.frame.size.width-220,Type.frame.origin.y+Type.frame.size.height,200, 22)];
                pic_date.backgroundColor=[UIColor clearColor];
                pic_date.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
                pic_date.userInteractionEnabled=NO;
                [pic_date setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
                
                
                pic_date.textAlignment=NSTextAlignmentRight;
                [scrollview addSubview:pic_date];
                
                
                NSString *string_Widthsss=[NSString stringWithFormat:@"Pick Date :  %@",[[dict valueForKey:@"Package_Detail"]valueForKey:@"pick_date"]];
                
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
                
                
                
                
                NSString *string_Max_pic_date=[NSString stringWithFormat:@"Pick before :  %@",[[dict valueForKey:@"Package_Detail"]valueForKey:@"pick_before"]];
                
                NSMutableAttributedString *str_Max_pic_date = [[NSMutableAttributedString alloc] initWithString:string_Max_pic_date];
                
                [str_Max_pic_date addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0, 15)];
                [str_Max_pic_date addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(15, [string_Max_pic_date length]-16)];
                
                Max_pic_date.attributedText = str_Max_pic_date;
                
                
                
                [Package_price setFrame:CGRectMake(scrollview.frame.size.width-320,Max_pic_date.frame.origin.y+Max_pic_date.frame.size.height+20,300, 22)];
                
                
                scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 730);
                
                
            }
            
            
            
            if ( [[[dict valueForKey:@"Package_Detail"]valueForKey:@"Bundle"]isEqualToString:@"yes"])
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
                
                
                
                
                NSString *string_Bundle_item=[NSString stringWithFormat:@"Bundle items :  %@",[[dict valueForKey:@"Package_Detail"]valueForKey:@"Bundle"]];
                
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
                
                
                
                NSString *string_Bundle_item_count=[NSString stringWithFormat:@"Bundle items count :  %@",[[dict valueForKey:@"Package_Detail"]valueForKey:@"Bundle_items"]];
                
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
                See_Bundle_Packages.frame = CGRectMake(scrollview.frame.size.width-160, Package_price.frame.origin.y+20,150, 35);
                [scrollview addSubview:See_Bundle_Packages];
                
                
                
                [Package_price setFrame:CGRectMake(scrollview.frame.size.width-320,See_Bundle_Packages.frame.origin.y+See_Bundle_Packages.frame.size.height+15,300, 22)];
                
                scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 730);
                
                
            }
            
            
            
            
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
                
                
                
                
                string_Package_price=[NSString stringWithFormat:@"Total Paid:  %@",[[dict valueForKey:@"Package_Detail"]valueForKey:@"total"]];
                
                str_Package_price = [[NSMutableAttributedString alloc] initWithString:string_Package_price];
                
                [str_Package_price addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0,14)];
                [str_Package_price addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(15, [string_Package_price length]-16)];
                
                Package_price.attributedText = str_Package_price;
                
                
                
                
//                ///////////////////////////// Deliver_order_LB Lable \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//                
//                Note_LB_classified = [[UILabel alloc] init];
//                Note_LB_classified.textColor = [UIColor blackColor];
//                [Note_LB_classified setFrame:CGRectMake(10,Package_price.frame.origin.y+Package_price.frame.size.height+5,self.view.frame.size.width, 20)];
//                Note_LB_classified.backgroundColor=[UIColor clearColor];
//                Note_LB_classified.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
//                Note_LB_classified.userInteractionEnabled=NO;
//                [Note_LB_classified setFont:[UIFont fontWithName:@"bariol-regular" size:11.0]];
//                Note_LB_classified.text= [NSString stringWithFormat:@"(%@)",[[dict valueForKey:@"Package_Detail"]valueForKey:@"note"]];
//                Note_LB_classified.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
//                Note_LB_classified.textAlignment=NSTextAlignmentLeft;
//                [scrollview addSubview:Note_LB_classified];
                
                
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
                
                
//                Returen_price = [[UILabel alloc] init];
//                Returen_price.textColor = [UIColor blackColor];
//                [Returen_price setFrame:CGRectMake(scrollview.frame.size.width-320,Package_price.frame.origin.y+Package_price.frame.size.height+10,300, 22)];
//                Returen_price.backgroundColor=[UIColor clearColor];
//                Returen_price.textColor=[UIColor whiteColor];
//                Returen_price.userInteractionEnabled=NO;
//                [Returen_price setFont:[UIFont fontWithName:@"bariol-regular" size:11.0]];
//                Returen_price.textAlignment=NSTextAlignmentRight;
//                Returen_price.text=[[dict valueForKey:@"Package_Detail"]valueForKey:@"note"];
//                
//                [scrollview addSubview:Returen_price];
                
                
                scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 680);
            }
        
        }
        
            else
            {
                MTitle.text= @"ITEM DETAIL";
                
                string_Package_price=[NSString stringWithFormat:@"Total Paid:  %@",[[dict valueForKey:@"Package_Detail"]valueForKey:@"Package_price"]];
                
                str_Package_price = [[NSMutableAttributedString alloc] initWithString:string_Package_price];
                
                [str_Package_price addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0,13)];
                [str_Package_price addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(14, [string_Package_price length]-15)];
                
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

-(void)See_Bundle_Packages_action:(UIButton *)sender
{
    See_Bundle_Packages_action *obj_Accepted_items_sender_ViewController=[[See_Bundle_Packages_action alloc]init];
    
    obj_Accepted_items_sender_ViewController.Bundle_package=[dict valueForKey:@"Bundle"];
    
    
    [self.navigationController pushViewController:obj_Accepted_items_sender_ViewController animated:YES];
    
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
    if ([_post_type isEqualToString:@"Notification"]) {
        
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
