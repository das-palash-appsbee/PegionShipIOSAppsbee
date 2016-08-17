//
//  MY_WITHDRAWALS_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 15/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "MY_WITHDRAWALS_ViewController.h"
#import "MFSideMenu.h"
#import "API.h"
#import "JSON.h"
#import "Delivered_Item_Detail_Page.h"
#import "My_Earning_Deatil_Page.h"

#import "Utility.h"


@interface MY_WITHDRAWALS_ViewController ()

@end

@implementation MY_WITHDRAWALS_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    UIImageView *backGround=[[UIImageView alloc]init];
    backGround.image=[UIImage imageNamed:@"main_slider_bg.jpg"];
    backGround.frame=CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height);
    backGround.userInteractionEnabled=YES;
    [self.view addSubview:backGround];
    
    
    ///////////////////////////// Back Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Slider_Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [Slider_Button addTarget:self
                      action:@selector(Slider_Back:)
            forControlEvents:UIControlEventTouchUpInside];
    [Slider_Button setImage:[UIImage imageNamed:@"nav_button.png"] forState:UIControlStateNormal];
     Slider_Button.frame = CGRectMake(10,15,35,35);
    [self.view addSubview:Slider_Button];
    
    
    
    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    MTitle = [[UILabel alloc] init];
    MTitle.textColor = [UIColor blackColor];
    [MTitle setFrame:CGRectMake(0,0,self.view.frame.size.width, 64)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"Earnings";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:MTitle];
    
    ///////////////////////////// Top View\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    TopView =[[UIView alloc]init];
    TopView.frame=CGRectMake(0, 64, self.view.frame.size.width,31);
    TopView.backgroundColor=[UIColor colorWithRed:52.0f/255.0f green:51.0f/255.0f blue:49.0f/255.0f alpha:1.0];
    [self.view addSubview:TopView];
    
    ///////////////////////////// Top View Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    textlable = [[UILabel alloc] init];
    [textlable setFrame:CGRectMake(10,0,self.view.frame.size.width-100,31)];
    textlable.backgroundColor=[UIColor clearColor];
    textlable.textColor=[UIColor whiteColor];
    textlable.userInteractionEnabled=NO;
    
    textlable.numberOfLines=0;
    [textlable setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
    textlable.text=@"My Earnings";
    
    
    textlable.textColor=[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0];
    textlable.textAlignment=NSTextAlignmentCenter;
    // [textlable sizeToFit];
    [TopView addSubview:textlable];
    
//
//    
//    //    ////////////////////////////   Today_Earning_LB  Lable \\\\\\\\\\\\\\\\\\\\\\\\
//    
//    
//    Today_Earning_LB = [[UILabel alloc] init];
//    Today_Earning_LB.textColor = [UIColor blackColor];
//    [Today_Earning_LB setFrame:CGRectMake(0,TopView.frame.origin.y+TopView.frame.size.height+5,150, 30)];
//    Today_Earning_LB.backgroundColor=[UIColor clearColor];
//    Today_Earning_LB.textColor=[UIColor whiteColor];
//    Today_Earning_LB.userInteractionEnabled=NO;
//    [Today_Earning_LB setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
//    Today_Earning_LB.text= @"Today's Earning :";
//    Today_Earning_LB.textColor=[UIColor colorWithRed:196.0f/255.0f green:196.0f/255.0f blue:196.0f/255.0f alpha:1.0];
//    Today_Earning_LB.textAlignment=NSTextAlignmentRight;
//    [self.view addSubview:Today_Earning_LB];
//    
//    
//    
//    
//    
//    //    ////////////////////////////   Top Left   Lable \\\\\\\\\\\\\\\\\\\\\\\\
//    
//    
//    Today_Earning_LB_DYN = [[UILabel alloc] init];
//    Today_Earning_LB_DYN.textColor = [UIColor blackColor];
//    [Today_Earning_LB_DYN setFrame:CGRectMake(Today_Earning_LB.frame.origin.x+Today_Earning_LB.frame.size.width,TopView.frame.origin.y+TopView.frame.size.height+5,100, 30)];
//    Today_Earning_LB_DYN.backgroundColor=[UIColor clearColor];
//    Today_Earning_LB_DYN.textColor=[UIColor whiteColor];
//    Today_Earning_LB_DYN.userInteractionEnabled=NO;
//    [Today_Earning_LB_DYN setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
//    Today_Earning_LB_DYN.text= @"";
//    Today_Earning_LB_DYN.textColor=[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0];
//    Today_Earning_LB_DYN.textAlignment=NSTextAlignmentLeft;
//    [self.view addSubview:Today_Earning_LB_DYN];
//    
//    
//    
//    //    ////////////////////////////   Top Left   Lable \\\\\\\\\\\\\\\\\\\\\\\\
//    
//    
//    Outstanding_Earning = [[UILabel alloc] init];
//    Outstanding_Earning.textColor = [UIColor blackColor];
//    [Outstanding_Earning setFrame:CGRectMake(0,Today_Earning_LB.frame.origin.y+Today_Earning_LB.frame.size.height-5,150, 30)];
//    Outstanding_Earning.backgroundColor=[UIColor clearColor];
//    Outstanding_Earning.textColor=[UIColor whiteColor];
//    Outstanding_Earning.userInteractionEnabled=NO;
//    [Outstanding_Earning setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
//    Outstanding_Earning.text= @"Outstanding Earning : ";
//    Outstanding_Earning.textColor=[UIColor colorWithRed:196.0f/255.0f green:196.0f/255.0f blue:196.0f/255.0f alpha:1.0];
//    Outstanding_Earning.textAlignment=NSTextAlignmentRight;
//    [self.view addSubview:Outstanding_Earning];
//    
//    
//    
//    
//    
//    //    ////////////////////////////   Top Left   Lable \\\\\\\\\\\\\\\\\\\\\\\\
//    
//    
//    Outstanding_Earning_DYN = [[UILabel alloc] init];
//    
//    [Outstanding_Earning_DYN setFrame:CGRectMake(Outstanding_Earning.frame.origin.x+Outstanding_Earning.frame.size.width,Today_Earning_LB.frame.origin.y+Today_Earning_LB.frame.size.height-5,100, 30)];
//    Outstanding_Earning_DYN.backgroundColor=[UIColor clearColor];
//    Outstanding_Earning_DYN.textColor=[UIColor whiteColor];
//    Outstanding_Earning_DYN.userInteractionEnabled=NO;
//    [Outstanding_Earning_DYN setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
//    Outstanding_Earning_DYN.text= @"";
//    Outstanding_Earning_DYN.textColor=[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0];
//    Outstanding_Earning_DYN.textAlignment=NSTextAlignmentLeft;
//    [self.view addSubview:Outstanding_Earning_DYN];
//    
//    
//    
//    
//    
//    
//    //    ////////////////////////////   Top Left   Lable \\\\\\\\\\\\\\\\\\\\\\\\
//    
//    
//    Total_Earning = [[UILabel alloc] init];
//    Total_Earning.textColor = [UIColor blackColor];
//    [Total_Earning setFrame:CGRectMake(0,Outstanding_Earning.frame.origin.y+Outstanding_Earning.frame.size.height-5,150, 30)];
//    Total_Earning.backgroundColor=[UIColor clearColor];
//    Total_Earning.textColor=[UIColor whiteColor];
//    Total_Earning.userInteractionEnabled=NO;
//    [Total_Earning setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
//    Total_Earning.text= @"Total Earning : ";
//    Total_Earning.textColor=[UIColor colorWithRed:196.0f/255.0f green:196.0f/255.0f blue:196.0f/255.0f alpha:1.0];
//    Total_Earning.textAlignment=NSTextAlignmentRight;
//    [self.view addSubview:Total_Earning];
//    
//    
//    
//    
//    
//    //    ////////////////////////////   Top Left   Lable \\\\\\\\\\\\\\\\\\\\\\\\
//    
//    
//    Total_Earning_DY = [[UILabel alloc] init];
//    
//    [Total_Earning_DY setFrame:CGRectMake(Total_Earning.frame.origin.x+Total_Earning.frame.size.width,Outstanding_Earning.frame.origin.y+Outstanding_Earning.frame.size.height-5,100, 30)];
//    Total_Earning_DY.backgroundColor=[UIColor clearColor];
//    Total_Earning_DY.textColor=[UIColor whiteColor];
//    Total_Earning_DY.userInteractionEnabled=NO;
//    [Total_Earning_DY setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
//    Total_Earning_DY.text= @"";
//    Total_Earning_DY.textColor=[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0];
//    Total_Earning_DY.textAlignment=NSTextAlignmentLeft;
//    [self.view addSubview:Total_Earning_DY];
//    
//    
//    
//    
//    
//    //    ////////////////////////////   View_Deatil Button \\\\\\\\\\\\\\\\\\\\\\\
//    
//    withdraw_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [withdraw_BTN addTarget:self
//                     action:@selector(withdraw_BTN_Action:)
//           forControlEvents:UIControlEventTouchUpInside];
//    withdraw_BTN.backgroundColor=[UIColor clearColor];
//    [withdraw_BTN setTitle:@"Withdraw" forState:UIControlStateNormal];
//    
//    [withdraw_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
//    [withdraw_BTN setTitleColor:[UIColor colorWithRed:218.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
//    
//    
//    withdraw_BTN.layer.cornerRadius=12;
//    withdraw_BTN.clipsToBounds = YES;
//    withdraw_BTN.layer.borderWidth=1;
//    withdraw_BTN.layer.borderColor=[UIColor colorWithRed:218.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1.0].CGColor;
//    
//    
//    withdraw_BTN.frame = CGRectMake((self.view.frame.size.width-86)/2,Total_Earning_DY.frame.origin.y+Total_Earning_DY.frame.size.height-2,86, 22.0);
//    [self.view addSubview:withdraw_BTN];
    
    
    
    
    
    ////////////////////////////    UitableView Show \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    mtableview = [[UITableView alloc] initWithFrame:CGRectMake(0, TopView.frame.origin.y+TopView.frame.size.height+2, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height-(withdraw_BTN.frame.origin.y+withdraw_BTN.frame.size.height)) style:UITableViewStylePlain];
    mtableview.delegate = self;
    mtableview.dataSource = self;
    mtableview.allowsSelection = NO;
    mtableview.hidden=NO;
    mtableview.separatorColor=[UIColor clearColor];
    mtableview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:mtableview];
    
    [self setupMenuBarButtonItems];
    
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [self performSelector:@selector(CalltheServer) withObject:nil afterDelay:0.5];
    [self mActivityIndicater];
    
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

#pragma mark - -*********************
#pragma mark  CalltheServer
#pragma mark - -*********************


-(void)CalltheServer
{
    
    
    
    
    
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"]]:[NSString stringWithFormat:@"%@myearnings",[Utility API_link_url]]];
        
        NSLog(@"%@",responseString);
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        
        
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            Outstanding_Earning_DYN.text= [dict valueForKey:@"outstanding"];
            Today_Earning_LB_DYN.text= [dict valueForKey:@"todayearning"];
            Total_Earning_DY.text=[dict valueForKey:@"totalEarning"];
            
            
            
            NSLog(@"%lu",(unsigned long)[[dict valueForKey:@"earning"]count]);
            
            
            textlable.text = [NSString stringWithFormat:@"Total %d items are Earnings",[[dict valueForKey:@"earning"]count]];
            
            
            
            NSLog(@"%@",[dict valueForKey:@"Package_Deliver_Detail"]);
            NSLog(@"%@",[[[dict valueForKey:@"Package_Deliver_Detail"]objectAtIndex:0]valueForKey:@"Delivery_date"]);
            [mtableview reloadData];
            
        }
        
        else
        { if ([[dict valueForKey:@"message"] isEqualToString:@"Access token expired"] || [[dict valueForKey:@"message"] isEqualToString:@"Security token mismatch ,Contact admin"]) {
            
            
            alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            alert.tag=786;
            [alert show];
            
        }
        else
        {

            
            textlable.text =[dict valueForKey:@"message"];
            
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



-(void)Slider_Back:(UIButton *)sender
{
    [self leftSideMenuButtonPressed];
    
}

#pragma mark -
#pragma mark - *****UIBarButtonItem Callbacks*****
#pragma mark -

- (void)backButtonPressed:(id)sender {
    
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)leftSideMenuButtonPressed {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{
        [self setupMenuBarButtonItems];
    }];
}

- (void)rightSideMenuButtonPressed:(id)sender {
    [self.menuContainerViewController toggleRightSideMenuCompletion:^{
        [self setupMenuBarButtonItems];
    }];
}




#pragma mark - UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return [[dict valueForKey:@"earning"]count];
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    NSArray *views=[cell.contentView subviews];
    for(int i=0;i<[views count];i++)
    {
        UIView *tempView=[views objectAtIndex:i];
        [tempView removeFromSuperview];
        tempView = nil;
    }
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
        
        
    }
    
    ///////////////////////////////////   BackGround view /////////////////////////////////////////////////
    mtable_bacground=[[UIView alloc]initWithFrame:CGRectMake(0, 0, mtableview.frame.size.width, 100)];
    mtableview.backgroundColor=[UIColor clearColor];
    [cell.contentView addSubview:mtable_bacground];
    
//    //    ////////////////////////////   Top Left   Lable \\\\\\\\\\\\\\\\\\\\\\\\
//    
//    
//    topLeft_LB = [[UILabel alloc] init];
//    topLeft_LB.textColor = [UIColor blackColor];
//    [topLeft_LB setFrame:CGRectMake(10,10,100, 30)];
//    topLeft_LB.backgroundColor=[UIColor clearColor];
//    topLeft_LB.textColor=[UIColor whiteColor];
//    topLeft_LB.userInteractionEnabled=NO;
//    [topLeft_LB setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
//    topLeft_LB.text= @"Pick-up origin";
//    topLeft_LB.textColor=[UIColor colorWithRed:196.0f/255.0f green:196.0f/255.0f blue:196.0f/255.0f alpha:1.0];
//    topLeft_LB.textAlignment=NSTextAlignmentCenter;
//    [mtable_bacground addSubview:topLeft_LB];
    
    
    
    
//    //    ////////////////////////////   Top Left   Location Image \\\\\\\\\\\\\\\\\\\\\\\\
//    
//    
//    topLeft_location_IMG = [[UIImageView alloc] initWithFrame:CGRectMake(46,topLeft_LB.frame.origin.x+30, 19, 19)];
//    
//    if (indexPath.row%2==0) {
//        
//        topLeft_location_IMG.image = [UIImage imageNamed:@"mpp.png"];
//        
//        /// Middle_Round_LB.backgroundColor=[UIColor colorWithRed:83.0f/255.0f green:83.0f/255.0f blue:83.0f/255.0f alpha:1.0];
//        
//    }
//    else
//    {
//        
//        topLeft_location_IMG.image = [UIImage imageNamed:@"mpp.png"];
//        /// Middle_Round_LB.backgroundColor=[UIColor colorWithRed:120.0f/255.0f green:117.0f/255.0f blue:114.0f/255.0f alpha:1.0];
//    }
//    
//    
//    
//    topLeft_location_IMG.layer.cornerRadius=15*0.5;
//    [mtable_bacground addSubview:topLeft_location_IMG];
//    
//    
//    
//    //    ////////////////////////////   Middle Line Image \\\\\\\\\\\\\\\\\\\\\\\\
//    
//    
//    Middle_Line_IMG = [[UIImageView alloc] initWithFrame:CGRectMake(65,topLeft_LB.frame.origin.x+40, 185, 0.5)];
//    Middle_Line_IMG.image = [UIImage imageNamed:@"line__.png"];
//    [mtable_bacground addSubview:Middle_Line_IMG];
//    
//    
//    //    ////////////////////////////   Middle Round Image \\\\\\\\\\\\\\\\\\\\\\\\
//    
//    
//    
//    Middle_Round_LB = [[UILabel alloc] init];
//    Middle_Round_LB.textColor = [UIColor blackColor];
//    [Middle_Round_LB setFrame:CGRectMake((Middle_Line_IMG.frame.size.width-30)/2,-17,34, 34)];
//    Middle_Round_LB.layer.cornerRadius=34*0.5;
//    Middle_Round_LB.clipsToBounds=YES;
//    
//    if (indexPath.row%2==0) {
//        
//        Middle_Round_LB.backgroundColor=[UIColor colorWithRed:83.0f/255.0f green:83.0f/255.0f blue:83.0f/255.0f alpha:1.0];
//        
//    }
//    else
//    {
//        Middle_Round_LB.backgroundColor=[UIColor colorWithRed:83.0f/255.0f green:83.0f/255.0f blue:83.0f/255.0f alpha:1.0];
//    }
//    
//    
//    Middle_Round_LB.textColor=[UIColor whiteColor];
//    Middle_Round_LB.userInteractionEnabled=NO;
//    [Middle_Round_LB setFont:[UIFont fontWithName:@"bariol-regular" size:10.0]];
//    
//    if ([[[dict valueForKey:@"earning"]objectAtIndex:indexPath.row]valueForKey:@"amount_earned"]==(id)[NSNull null] || [[[[dict valueForKey:@"earning"]objectAtIndex:indexPath.row]valueForKey:@"amount_earned"] isKindOfClass:[NSNull class]]) {
//        
//        Middle_Round_LB.text=@"$ 0";
//    }
//    else
//    {
//        Middle_Round_LB.text=[NSString stringWithFormat:@"$%@",[[[dict valueForKey:@"earning"]objectAtIndex:indexPath.row]valueForKey:@"amount_earned"]];
//    }
//    
//    
//    /// Middle_Round_LB.textColor=[UIColor colorWithRed:59.0f/255.0f green:89.0f/255.0f blue:132.0f/255.0f alpha:1.0];
//    Middle_Round_LB.adjustsFontSizeToFitWidth=YES;
//    Middle_Round_LB.textAlignment=NSTextAlignmentCenter;
//    [Middle_Line_IMG addSubview:Middle_Round_LB];
//    
//    
//    
//    //    ////////////////////////////   Middle Left Address \\\\\\\\\\\\\\\\\\\\\\\\
//    
//    
//    Middle_Left_Address_LB = [[UILabel alloc] init];
//    Middle_Left_Address_LB.textColor = [UIColor blackColor];
//    [Middle_Left_Address_LB setFrame:CGRectMake(10,Middle_Line_IMG.frame.origin.y+10,100, 30)];
//    Middle_Left_Address_LB.backgroundColor=[UIColor clearColor];
//    Middle_Left_Address_LB.textColor=[UIColor whiteColor];
//    Middle_Left_Address_LB.userInteractionEnabled=NO;
//    [Middle_Left_Address_LB setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
//    Middle_Left_Address_LB.text= [[[dict valueForKey:@"earning"]objectAtIndex:indexPath.row]valueForKey:@"pick_city"];
//    Middle_Left_Address_LB.textColor=[UIColor whiteColor];
//    Middle_Left_Address_LB.textAlignment=NSTextAlignmentCenter;
//    [mtable_bacground addSubview:Middle_Left_Address_LB];
//    
//    
//    
//    //    ////////////////////////////   Top Right   Lable \\\\\\\\\\\\\\\\\\\\\\\\
//    
//    
//    topRight_LB = [[UILabel alloc] init];
//    topRight_LB.textColor = [UIColor blackColor];
//    [topRight_LB setFrame:CGRectMake(mtable_bacground.frame.size.width-120,10,100, 30)];
//    topRight_LB.backgroundColor=[UIColor clearColor];
//    topRight_LB.textColor=[UIColor whiteColor];
//    topRight_LB.userInteractionEnabled=NO;
//    [topRight_LB setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
//    topRight_LB.text= @"Drop Destination";
//    topRight_LB.textColor=[UIColor colorWithRed:196.0f/255.0f green:196.0f/255.0f blue:196.0f/255.0f alpha:1.0];
//    topRight_LB.textAlignment=NSTextAlignmentCenter;
//    [mtable_bacground addSubview:topRight_LB];
//    
//    
//    
//    //    ////////////////////////////   Top Right   Location Image \\\\\\\\\\\\\\\\\\\\\\\\
//    
//    
//    topRight_location_IMG = [[UIImageView alloc] initWithFrame:CGRectMake(mtable_bacground.frame.size.width-74,topLeft_LB.frame.origin.x+30, 19, 19)];
//    ///  topRight_location_IMG.image = [UIImage imageNamed:@"map.png"];
//    
//    if (indexPath.row%2==0) {
//        
//        topRight_location_IMG.image = [UIImage imageNamed:@"mpp.png"];
//        
//        /// Middle_Round_LB.backgroundColor=[UIColor colorWithRed:83.0f/255.0f green:83.0f/255.0f blue:83.0f/255.0f alpha:1.0];
//        
//    }
//    else
//    {
//        
//        topRight_location_IMG.image = [UIImage imageNamed:@"mpp.png"];
//        /// Middle_Round_LB.backgroundColor=[UIColor colorWithRed:120.0f/255.0f green:117.0f/255.0f blue:114.0f/255.0f alpha:1.0];
//    }
//    
//    
//    
//    topRight_location_IMG.layer.cornerRadius=15*0.5;
//    [mtable_bacground addSubview:topRight_location_IMG];
//    
//    
//    //    ////////////////////////////   Middle Right Address \\\\\\\\\\\\\\\\\\\\\\\\
//    
//    
//    Middle_Right_Address_LB = [[UILabel alloc] init];
//    Middle_Right_Address_LB.textColor = [UIColor blackColor];
//    [Middle_Right_Address_LB setFrame:CGRectMake(mtable_bacground.frame.size.width-110,Middle_Line_IMG.frame.origin.y+10,100, 30)];
//    Middle_Right_Address_LB.backgroundColor=[UIColor clearColor];
//    Middle_Right_Address_LB.textColor=[UIColor whiteColor];
//    Middle_Right_Address_LB.userInteractionEnabled=NO;
//    [Middle_Right_Address_LB setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
//    Middle_Right_Address_LB.text= [[[dict valueForKey:@"earning"]objectAtIndex:indexPath.row]valueForKey:@"drop_city"];
//    Middle_Right_Address_LB.textColor=[UIColor whiteColor];
//    Middle_Right_Address_LB.textAlignment=NSTextAlignmentCenter;
//    [mtable_bacground addSubview:Middle_Right_Address_LB];
//    
//    
    
    //    ////////////////////////////   Pack_type_str_LB  Lable \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Pack_type_str_LB = [[UILabel alloc] init];
    Pack_type_str_LB.textColor = [UIColor blackColor];
    [Pack_type_str_LB setFrame:CGRectMake(10,10,90, 30)];
    Pack_type_str_LB.backgroundColor=[UIColor clearColor];
    Pack_type_str_LB.textColor=[UIColor whiteColor];
    Pack_type_str_LB.userInteractionEnabled=NO;
    [Pack_type_str_LB setFont:[UIFont fontWithName:@"bariol-regular" size:10.0]];
    Pack_type_str_LB.text= @"REQUESTED ON :";
    Pack_type_str_LB.textColor=[UIColor colorWithRed:196.0f/255.0f green:196.0f/255.0f blue:196.0f/255.0f alpha:1.0];
    Pack_type_str_LB.textAlignment=NSTextAlignmentLeft;
    [mtable_bacground addSubview:Pack_type_str_LB];
    
    //    ////////////////////////////   Pack_type_Dynamic Lable \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Pack_type_dyn_LB = [[UILabel alloc] init];
    Pack_type_dyn_LB.textColor = [UIColor blackColor];
    [Pack_type_dyn_LB setFrame:CGRectMake(Pack_type_str_LB.frame.origin.x+Pack_type_str_LB.frame.size.width+5,10,100, 30)];
    Pack_type_dyn_LB.backgroundColor=[UIColor clearColor];
    Pack_type_dyn_LB.textColor=[UIColor whiteColor];
    Pack_type_dyn_LB.userInteractionEnabled=NO;
    [Pack_type_dyn_LB setFont:[UIFont fontWithName:@"bariol-regular" size:11.0]];
    Pack_type_dyn_LB.text= [[[dict valueForKey:@"earning"]objectAtIndex:indexPath.row]valueForKey:@"package_type"];
    Pack_type_dyn_LB.textColor=[UIColor whiteColor];
    Pack_type_dyn_LB.textAlignment=NSTextAlignmentLeft;
    [mtable_bacground addSubview:Pack_type_dyn_LB];
    
    
    
    
    //////////////////////////////   Pack_type_str_LB  Lable \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Delivered_Before_str_LB = [[UILabel alloc] init];
    Delivered_Before_str_LB.textColor = [UIColor blackColor];
    [Delivered_Before_str_LB setFrame:CGRectMake(mtable_bacground.frame.size.width-200,10,120, 30)];
    Delivered_Before_str_LB.backgroundColor=[UIColor clearColor];
    Delivered_Before_str_LB.textColor=[UIColor whiteColor];
    Delivered_Before_str_LB.userInteractionEnabled=NO;
    [Delivered_Before_str_LB setFont:[UIFont fontWithName:@"bariol-regular" size:10.0]];
    Delivered_Before_str_LB.text= @"PROCESSED ON :";
    Delivered_Before_str_LB.textColor=[UIColor colorWithRed:196.0f/255.0f green:196.0f/255.0f blue:196.0f/255.0f alpha:1.0];
    Delivered_Before_str_LB.textAlignment=NSTextAlignmentRight;
    [mtable_bacground addSubview:Delivered_Before_str_LB];
    
    //    ////////////////////////////   Pack_type_Dynamic Lable \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Delivered_Before_dyn_LB = [[UILabel alloc] init];
    Delivered_Before_dyn_LB.textColor = [UIColor blackColor];
    [Delivered_Before_dyn_LB setFrame:CGRectMake(Delivered_Before_str_LB.frame.origin.x+Delivered_Before_str_LB.frame.size.width+2,10,100, 30)];
    Delivered_Before_dyn_LB.backgroundColor=[UIColor clearColor];
    Delivered_Before_dyn_LB.textColor=[UIColor whiteColor];
    Delivered_Before_dyn_LB.userInteractionEnabled=NO;
    [Delivered_Before_dyn_LB setFont:[UIFont fontWithName:@"bariol-regular" size:11.0]];
    Delivered_Before_dyn_LB.text= [[[dict valueForKey:@"earning"]objectAtIndex:indexPath.row]valueForKey:@"dimension"];
    Delivered_Before_dyn_LB.textColor=[UIColor whiteColor];
    Delivered_Before_dyn_LB.textAlignment=NSTextAlignmentLeft;
    [mtable_bacground addSubview:Delivered_Before_dyn_LB];
    
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    //    ////////////////////////////   Pack_type_str_LB  Lable \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    MARKED_AS_DELIVERED_ON = [[UILabel alloc] init];
    MARKED_AS_DELIVERED_ON.textColor = [UIColor blackColor];
    [MARKED_AS_DELIVERED_ON setFrame:CGRectMake(10,Pack_type_str_LB.frame.origin.y+Pack_type_str_LB.frame.size.height-5,90, 30)];
    MARKED_AS_DELIVERED_ON.backgroundColor=[UIColor clearColor];
    MARKED_AS_DELIVERED_ON.textColor=[UIColor whiteColor];
    MARKED_AS_DELIVERED_ON.userInteractionEnabled=NO;
    [MARKED_AS_DELIVERED_ON setFont:[UIFont fontWithName:@"bariol-regular" size:10.0]];
    MARKED_AS_DELIVERED_ON.text= @"TRANSACTION ID:";
    MARKED_AS_DELIVERED_ON.textColor=[UIColor colorWithRed:196.0f/255.0f green:196.0f/255.0f blue:196.0f/255.0f alpha:1.0];
    MARKED_AS_DELIVERED_ON.textAlignment=NSTextAlignmentLeft;
    [mtable_bacground addSubview:MARKED_AS_DELIVERED_ON];
    
    //    ////////////////////////////   Pack_type_Dynamic Lable \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    MARKED_AS_DELIVERED_ON_DYN = [[UILabel alloc] init];
    MARKED_AS_DELIVERED_ON_DYN.textColor = [UIColor blackColor];
    [MARKED_AS_DELIVERED_ON_DYN setFrame:CGRectMake(MARKED_AS_DELIVERED_ON.frame.origin.x+MARKED_AS_DELIVERED_ON.frame.size.width-10,Pack_type_str_LB.frame.origin.y+Pack_type_str_LB.frame.size.height-5,90, 30)];
    MARKED_AS_DELIVERED_ON_DYN.backgroundColor=[UIColor clearColor];
    MARKED_AS_DELIVERED_ON_DYN.textColor=[UIColor whiteColor];
    MARKED_AS_DELIVERED_ON_DYN.userInteractionEnabled=NO;
    [MARKED_AS_DELIVERED_ON_DYN setFont:[UIFont fontWithName:@"bariol-regular" size:11.0]];
    MARKED_AS_DELIVERED_ON_DYN.text= [[[dict valueForKey:@"earning"]objectAtIndex:indexPath.row]valueForKey:@"delivered_on"];
    MARKED_AS_DELIVERED_ON_DYN.textColor=[UIColor whiteColor];
    MARKED_AS_DELIVERED_ON_DYN.textAlignment=NSTextAlignmentLeft;
    [mtable_bacground addSubview:MARKED_AS_DELIVERED_ON_DYN];
    
    
    
    
        //////////////////////////////   Pack_type_str_LB  Lable \\\\\\\\\\\\\\\\\\\\\\\\
    
    
        AMOUNT_EARNED = [[UILabel alloc] init];
        AMOUNT_EARNED.textColor = [UIColor blackColor];
        [AMOUNT_EARNED setFrame:CGRectMake(mtable_bacground.frame.size.width-155,Delivered_Before_str_LB.frame.origin.y+Delivered_Before_str_LB.frame.size.height-7,100, 30)];
        AMOUNT_EARNED.backgroundColor=[UIColor clearColor];
        AMOUNT_EARNED.textColor=[UIColor whiteColor];
        AMOUNT_EARNED.userInteractionEnabled=NO;
        [AMOUNT_EARNED setFont:[UIFont fontWithName:@"bariol-regular" size:10.0]];
        AMOUNT_EARNED.text= @"REQUESTED AMOUNT:";
        AMOUNT_EARNED.textColor=[UIColor colorWithRed:196.0f/255.0f green:196.0f/255.0f blue:196.0f/255.0f alpha:1.0];
        AMOUNT_EARNED.textAlignment=NSTextAlignmentRight;
        [mtable_bacground addSubview:AMOUNT_EARNED];
    
        //    ////////////////////////////   Pack_type_Dynamic Lable \\\\\\\\\\\\\\\\\\\\\\\\
    
    
        AMOUNT_EARNED_DYN = [[UILabel alloc] init];
        AMOUNT_EARNED_DYN.textColor = [UIColor blackColor];
        [AMOUNT_EARNED_DYN setFrame:CGRectMake(AMOUNT_EARNED.frame.origin.x+AMOUNT_EARNED.frame.size.width+2,Delivered_Before_str_LB.frame.origin.y+Delivered_Before_str_LB.frame.size.height-7,70, 30)];
        AMOUNT_EARNED_DYN.backgroundColor=[UIColor clearColor];
        AMOUNT_EARNED_DYN.textColor=[UIColor whiteColor];
        AMOUNT_EARNED_DYN.userInteractionEnabled=NO;
        [AMOUNT_EARNED_DYN setFont:[UIFont fontWithName:@"bariol-regular" size:11.0]];
    
    
        if ([[[dict valueForKey:@"earning"]objectAtIndex:indexPath.row]valueForKey:@"amount_earned"]==(id)[NSNull null] || [[[[dict valueForKey:@"earning"]objectAtIndex:indexPath.row]valueForKey:@"amount_earned"] isKindOfClass:[NSNull class]]) {
    
            AMOUNT_EARNED_DYN.text=@"0";
        }
        else
        {
            AMOUNT_EARNED_DYN.text= [[[dict valueForKey:@"earning"]objectAtIndex:indexPath.row]valueForKey:@"amount_earned"];
        }
    
    
    
         AMOUNT_EARNED_DYN.textColor=[UIColor whiteColor];
        AMOUNT_EARNED_DYN.textAlignment=NSTextAlignmentLeft;
        [mtable_bacground addSubview:AMOUNT_EARNED_DYN];
    
    
    
    //    ////////////////////////////   Pack_type_str_LB  Lable \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    STATUS = [[UILabel alloc] init];
    STATUS.textColor = [UIColor blackColor];
    [STATUS setFrame:CGRectMake(10,AMOUNT_EARNED_DYN.frame.origin.y+AMOUNT_EARNED_DYN.frame.size.height,80, 30)];
    STATUS.backgroundColor=[UIColor clearColor];
    STATUS.textColor=[UIColor whiteColor];
    STATUS.userInteractionEnabled=NO;
    [STATUS setFont:[UIFont fontWithName:@"bariol-regular" size:10.0]];
    STATUS.text= @"STATUS :";
    STATUS.textColor=[UIColor colorWithRed:196.0f/255.0f green:196.0f/255.0f blue:196.0f/255.0f alpha:1.0];
    STATUS.textAlignment=NSTextAlignmentLeft;
    [mtable_bacground addSubview:STATUS];
    
    //    ////////////////////////////   Pack_type_Dynamic Lable \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Pack_type_dyn_LB = [[UILabel alloc] init];
    Pack_type_dyn_LB.textColor = [UIColor blackColor];
    [Pack_type_dyn_LB setFrame:CGRectMake(STATUS.frame.origin.x+STATUS.frame.size.width,AMOUNT_EARNED_DYN.frame.origin.y+AMOUNT_EARNED_DYN.frame.size.height,100, 30)];
    Pack_type_dyn_LB.backgroundColor=[UIColor clearColor];
    Pack_type_dyn_LB.textColor=[UIColor whiteColor];
    Pack_type_dyn_LB.userInteractionEnabled=NO;
    [Pack_type_dyn_LB setFont:[UIFont fontWithName:@"bariol-regular" size:11.0]];
    Pack_type_dyn_LB.text= [[[dict valueForKey:@"earning"]objectAtIndex:indexPath.row]valueForKey:@"package_type"];
    Pack_type_dyn_LB.textColor=[UIColor whiteColor];
    Pack_type_dyn_LB.textAlignment=NSTextAlignmentLeft;
    [mtable_bacground addSubview:Pack_type_dyn_LB];
    
    

    
//    ///////////////////////////////////////////////////////////////////////////////////////////////////////////
//    
//    //    ////////////////////////////   View_Deatil Button \\\\\\\\\\\\\\\\\\\\\\\
//    
//    View_Detail_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [View_Detail_BTN addTarget:self
//                        action:@selector(View_Detail:)
//              forControlEvents:UIControlEventTouchUpInside];
//    View_Detail_BTN.backgroundColor=[UIColor clearColor];
//    [View_Detail_BTN setTitle:@"View Detail" forState:UIControlStateNormal];
//    View_Detail_BTN.tag=indexPath.row;
//    [View_Detail_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
//    [View_Detail_BTN setTitleColor:[UIColor colorWithRed:218.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
//    
//    
//    View_Detail_BTN.layer.cornerRadius=12;
//    View_Detail_BTN.clipsToBounds = YES;
//    View_Detail_BTN.layer.borderWidth=1;
//    View_Detail_BTN.layer.borderColor=[UIColor colorWithRed:218.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1.0].CGColor;
//    
//    
//    View_Detail_BTN.frame = CGRectMake((self.view.frame.size.width-86)/2, MARKED_AS_DELIVERED_ON_DYN.frame.origin.y+35,86, 22.0);
//    [mtable_bacground addSubview:View_Detail_BTN];
//    
//    //    //    ////////////////////////////   Accept Button \\\\\\\\\\\\\\\\\\\\\\\
//    //
//    //    Accept_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    //    [Accept_BTN addTarget:self
//    //                   action:@selector(Accept_action:)
//    //         forControlEvents:UIControlEventTouchUpInside];
//    //    Accept_BTN.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0];
//    //    [Accept_BTN setTitle:@"Accept" forState:UIControlStateNormal];
//    //    Accept_BTN.tag=indexPath.row;
//    //    [Accept_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
//    //    [Accept_BTN setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
//    //
//    //
//    //    Accept_BTN.layer.cornerRadius=12;
//    //    Accept_BTN.clipsToBounds = YES;
//    //    Accept_BTN.frame = CGRectMake(190, Pack_type_str_LB.frame.origin.y+30,86, 22.0);
//    //    [mtable_bacground addSubview:Accept_BTN];
    
    
    if (indexPath.row%2==0) {
        cell.backgroundColor=[UIColor colorWithRed:120.0f/255.0f green:117.0f/255.0f blue:114.0f/255.0f alpha:0.4];
        
    }
    else
    {
        cell.backgroundColor=[UIColor colorWithRed:104.0f/255.0f green:101.0f/255.0f blue:98.0f/255.0f alpha:0.4];
        
    }
    
    return cell;
    
}



-(void)withdraw_BTN_Action:(UIButton *)sender
{
    
    
}

-(void)View_Detail:(UIButton *)sender
{
    My_Earning_Deatil_Page *objItem_Detail_ViewController=[[My_Earning_Deatil_Page alloc]init];
    objItem_Detail_ViewController.Pack_Key=[[[dict valueForKey:@"earning"]objectAtIndex:sender.tag]valueForKey:@"Package_Id"];
    
    [self.navigationController pushViewController:objItem_Detail_ViewController animated:YES];
    
}

#pragma mark - UITableViewDelegate
// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %d row", indexPath.row);
}


#pragma mark -
#pragma mark - UIBarButtonItems

- (void)setupMenuBarButtonItems {
    self.navigationItem.rightBarButtonItem = [self rightMenuBarButtonItem];
    if(self.menuContainerViewController.menuState == MFSideMenuStateClosed &&
       ![[self.navigationController.viewControllers objectAtIndex:0] isEqual:self]) {
        self.navigationItem.leftBarButtonItem = [self backBarButtonItem];
    } else {
        self.navigationItem.leftBarButtonItem = [self leftMenuBarButtonItem];
    }
}

- (UIBarButtonItem *)leftMenuBarButtonItem {
    return [[UIBarButtonItem alloc]
            initWithImage:[UIImage imageNamed:@"menu-icon.png"] style:UIBarButtonItemStyleBordered
            target:self
            action:@selector(leftSideMenuButtonPressed:)];
}

- (UIBarButtonItem *)rightMenuBarButtonItem {
    return [[UIBarButtonItem alloc]
            initWithImage:[UIImage imageNamed:@"menu-icon.png"] style:UIBarButtonItemStyleBordered
            target:self
            action:@selector(rightSideMenuButtonPressed:)];
}

- (UIBarButtonItem *)backBarButtonItem {
    return [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back-arrow"]
                                            style:UIBarButtonItemStyleBordered
                                           target:self
                                           action:@selector(backButtonPressed:)];
}




@end
