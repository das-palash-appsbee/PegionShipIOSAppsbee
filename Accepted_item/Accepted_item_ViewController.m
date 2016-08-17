//
//  Accepted_item_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 09/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Accepted_item_ViewController.h"
#import "MFSideMenu.h"
#import "API.h"
#import "JSON.h"
#import "Accepted_item_Detail_Page.h"
#import "Utility.h"
#import "Pic_Up_InstructionViewController.h"
#import "SignatureViewController.h"
#import "SignatureView.h"
#import "DROP_OFF_Instruction_ViewController.h"
@interface Accepted_item_ViewController ()

@end

@implementation Accepted_item_ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
          appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    UIImageView *backGround=[[UIImageView alloc]init];
    backGround.image=[UIImage imageNamed:@"main_slider_bg.jpg"];
    backGround.frame=CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height);
    backGround.userInteractionEnabled=YES;
    [self.view addSubview:backGround];
    
    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    MTitle = [[UILabel alloc] init];
    MTitle.textColor = [UIColor blackColor];
    [MTitle setFrame:CGRectMake(0,0,self.view.frame.size.width, 64)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"Accepted items";
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
    textlable.text=@"Searching...";
    
    
    textlable.textColor=[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0];
    textlable.textAlignment=NSTextAlignmentCenter;
    // [textlable sizeToFit];
    [TopView addSubview:textlable];
    
    
    ///////////////////////////// Back Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  
    
    Slider_Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [Slider_Button addTarget:self
                 action:@selector(Slider_Back:)
       forControlEvents:UIControlEventTouchUpInside];
    [Slider_Button setImage:[UIImage imageNamed:@"nav_button.png"] forState:UIControlStateNormal];
    Slider_Button.frame =CGRectMake(10,15,35,35);
    [self.view addSubview:Slider_Button];

    
    
    ////////////////////////////    UitableView Show \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    mtableview = [[UITableView alloc] initWithFrame:CGRectMake(0, TopView.frame.origin.y+TopView.frame.size.height, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height-(TopView.frame.origin.y+TopView.frame.size.height)) style:UITableViewStylePlain];
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
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"]]:[NSString stringWithFormat:@"%@package_acceptall",[Utility API_link_url]]];
        
        NSLog(@"%@",responseString);
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        
        
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            NSLog(@"%lu",(unsigned long)[[dict valueForKey:@"Package_Accepted_Detail"]count]);
            
            
            textlable.text = [NSString stringWithFormat:@"Total %d items are accepted",[[dict valueForKey:@"Package_Accepted_Detail"]count]];
            
            
            
            NSLog(@"%@",[dict valueForKey:@"Package_Accepted_Detail"]);
            NSLog(@"%@",[[[dict valueForKey:@"Package_Accepted_Detail"]objectAtIndex:0]valueForKey:@"Delivery_date"]);
            [mtableview reloadData];
            
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

            
              textlable.text =[dict valueForKey:@"message"];
            
            
             [mtableview reloadData];
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
    return 190;
}

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return [[dict valueForKey:@"Package_Accepted_Detail"]count];
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
    mtable_bacground=[[UIView alloc]initWithFrame:CGRectMake(0, 0, mtableview.frame.size.width, 200)];
    mtableview.backgroundColor=[UIColor clearColor];
    [cell.contentView addSubview:mtable_bacground];
    
    if (indexPath.row==0) {
        
        mtable_bacground.frame=CGRectMake(0, 5, mtableview.frame.size.width, 210);
        
    }
    
    else
    {
        mtable_bacground.frame=CGRectMake(0, 0, mtableview.frame.size.width, 220);
    }
    
    
    
    
    //    ////////////////////////////   Top Left   Lable \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    topLeft_LB = [[UILabel alloc] init];
    topLeft_LB.textColor = [UIColor blackColor];
    [topLeft_LB setFrame:CGRectMake(10,10,100, 30)];
    topLeft_LB.backgroundColor=[UIColor clearColor];
    topLeft_LB.textColor=[UIColor whiteColor];
    topLeft_LB.userInteractionEnabled=NO;
    [topLeft_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    topLeft_LB.text= @"Pick-up origin";
    topLeft_LB.textColor=[UIColor colorWithRed:196.0f/255.0f green:196.0f/255.0f blue:196.0f/255.0f alpha:1.0];
    topLeft_LB.textAlignment=NSTextAlignmentCenter;
    [mtable_bacground addSubview:topLeft_LB];
    
    
    
    
    //    ////////////////////////////   Top Left   Location Image \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    topLeft_location_IMG = [[UIImageView alloc] initWithFrame:CGRectMake(46,topLeft_LB.frame.origin.x+30, 19, 19)];
    
    if (indexPath.row%2==0) {
        
        topLeft_location_IMG.image = [UIImage imageNamed:@"mpp.png"];
        
        /// Middle_Round_LB.backgroundColor=[UIColor colorWithRed:83.0f/255.0f green:83.0f/255.0f blue:83.0f/255.0f alpha:1.0];
        
    }
    else
    {
        
        topLeft_location_IMG.image = [UIImage imageNamed:@"mpp.png"];
        /// Middle_Round_LB.backgroundColor=[UIColor colorWithRed:120.0f/255.0f green:117.0f/255.0f blue:114.0f/255.0f alpha:1.0];
    }
    
    
    
    topLeft_location_IMG.layer.cornerRadius=15*0.5;
    [mtable_bacground addSubview:topLeft_location_IMG];
    
    
    
    //    ////////////////////////////   Middle Line Image \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Middle_Line_IMG = [[UIImageView alloc] initWithFrame:CGRectMake(65,topLeft_LB.frame.origin.x+40, self.view.frame.size.width-135, 0.5)];
    Middle_Line_IMG.image = [UIImage imageNamed:@"line__.png"];
    [mtable_bacground addSubview:Middle_Line_IMG];
    
    
    //    ////////////////////////////   Middle Round Image \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Middle_Round_LB = [[UILabel alloc] init];
    Middle_Round_LB.textColor = [UIColor blackColor];
    [Middle_Round_LB setFrame:CGRectMake((Middle_Line_IMG.frame.size.width-30)/2,-20,40, 40)];
    Middle_Round_LB.layer.cornerRadius=40*0.5;
    Middle_Round_LB.clipsToBounds=YES;
    
    if (indexPath.row%2==0) {
        
        Middle_Round_LB.backgroundColor=[UIColor colorWithRed:83.0f/255.0f green:83.0f/255.0f blue:83.0f/255.0f alpha:1.0];
        
    }
    else
    {
        Middle_Round_LB.backgroundColor=[UIColor colorWithRed:83.0f/255.0f green:83.0f/255.0f blue:83.0f/255.0f alpha:1.0];
    }
    
    
    Middle_Round_LB.textColor=[UIColor whiteColor];
    Middle_Round_LB.userInteractionEnabled=NO;
    [Middle_Round_LB setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
    Middle_Round_LB.text=[NSString stringWithFormat:@"$%@",[[[dict valueForKey:@"Package_Accepted_Detail"]objectAtIndex:indexPath.row]valueForKey:@"Package_Price"]];
    /// Middle_Round_LB.textColor=[UIColor colorWithRed:59.0f/255.0f green:89.0f/255.0f blue:132.0f/255.0f alpha:1.0];
    Middle_Round_LB.adjustsFontSizeToFitWidth=YES;
    Middle_Round_LB.textAlignment=NSTextAlignmentCenter;
    [Middle_Line_IMG addSubview:Middle_Round_LB];
    
    
    
    //    ////////////////////////////   Middle Left Address \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Middle_Left_Address_LB = [[UILabel alloc] init];
    Middle_Left_Address_LB.textColor = [UIColor blackColor];
    [Middle_Left_Address_LB setFrame:CGRectMake(10,Middle_Line_IMG.frame.origin.y+10,100, 30)];
    Middle_Left_Address_LB.backgroundColor=[UIColor clearColor];
    Middle_Left_Address_LB.textColor=[UIColor whiteColor];
    Middle_Left_Address_LB.userInteractionEnabled=NO;
    [Middle_Left_Address_LB setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
    Middle_Left_Address_LB.text= [[[dict valueForKey:@"Package_Accepted_Detail"]objectAtIndex:indexPath.row]valueForKey:@"Package_Origin"];
    Middle_Left_Address_LB.textColor=[UIColor whiteColor];
    Middle_Left_Address_LB.textAlignment=NSTextAlignmentCenter;
    Middle_Left_Address_LB.numberOfLines=0;
    Middle_Left_Address_LB.lineBreakMode = NSLineBreakByWordWrapping;
    [mtable_bacground addSubview:Middle_Left_Address_LB];
    
    
    
    //    ////////////////////////////   Top Right   Lable \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    topRight_LB = [[UILabel alloc] init];
    topRight_LB.textColor = [UIColor blackColor];
    [topRight_LB setFrame:CGRectMake(mtable_bacground.frame.size.width-130,10,120, 30)];
    topRight_LB.backgroundColor=[UIColor clearColor];
    topRight_LB.textColor=[UIColor whiteColor];
    topRight_LB.userInteractionEnabled=NO;
    [topRight_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    topRight_LB.text= @"Drop Destination";
    topRight_LB.textColor=[UIColor colorWithRed:196.0f/255.0f green:196.0f/255.0f blue:196.0f/255.0f alpha:1.0];
    topRight_LB.textAlignment=NSTextAlignmentCenter;
    [mtable_bacground addSubview:topRight_LB];
    
    
    
    //    ////////////////////////////   Top Right   Location Image \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    topRight_location_IMG = [[UIImageView alloc] initWithFrame:CGRectMake(mtable_bacground.frame.size.width-74,topLeft_LB.frame.origin.x+30, 19, 19)];
    ///  topRight_location_IMG.image = [UIImage imageNamed:@"map.png"];
    
    if (indexPath.row%2==0) {
        
        topRight_location_IMG.image = [UIImage imageNamed:@"mpp.png"];
        
        /// Middle_Round_LB.backgroundColor=[UIColor colorWithRed:83.0f/255.0f green:83.0f/255.0f blue:83.0f/255.0f alpha:1.0];
        
    }
    else
    {
        
        topRight_location_IMG.image = [UIImage imageNamed:@"mpp.png"];
        /// Middle_Round_LB.backgroundColor=[UIColor colorWithRed:120.0f/255.0f green:117.0f/255.0f blue:114.0f/255.0f alpha:1.0];
    }
    
    
    
    topRight_location_IMG.layer.cornerRadius=15*0.5;
    [mtable_bacground addSubview:topRight_location_IMG];
    
    
    //    ////////////////////////////   Middle Right Address \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Middle_Right_Address_LB = [[UILabel alloc] init];
    Middle_Right_Address_LB.textColor = [UIColor blackColor];
    [Middle_Right_Address_LB setFrame:CGRectMake(mtable_bacground.frame.size.width-110,Middle_Line_IMG.frame.origin.y+10,100, 30)];
    
    Middle_Right_Address_LB.backgroundColor=[UIColor clearColor];
    Middle_Right_Address_LB.textColor=[UIColor whiteColor];
    Middle_Right_Address_LB.userInteractionEnabled=NO;
    [Middle_Right_Address_LB setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
    Middle_Right_Address_LB.text= [[[dict valueForKey:@"Package_Accepted_Detail"]objectAtIndex:indexPath.row]valueForKey:@"Package_Destination"];
    Middle_Right_Address_LB.textColor=[UIColor whiteColor];
    Middle_Right_Address_LB.numberOfLines=0;

    Middle_Right_Address_LB.textAlignment=NSTextAlignmentCenter;
    [mtable_bacground addSubview:Middle_Right_Address_LB];
    
    
    
    //    ////////////////////////////   Pack_type_str_LB  Lable \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Pack_type_str_LB = [[UILabel alloc] init];
    Pack_type_str_LB.textColor = [UIColor blackColor];
    [Pack_type_str_LB setFrame:CGRectMake(15,Middle_Right_Address_LB.frame.origin.y+Middle_Right_Address_LB.frame.size.height+2,100, 30)];
    
    Pack_type_str_LB.backgroundColor=[UIColor clearColor];
    Pack_type_str_LB.textColor=[UIColor whiteColor];
    Pack_type_str_LB.userInteractionEnabled=NO;
    [Pack_type_str_LB setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Pack_type_str_LB.text= @"Package Type";
    Pack_type_str_LB.textColor=[UIColor colorWithRed:196.0f/255.0f green:196.0f/255.0f blue:196.0f/255.0f alpha:1.0];
    Pack_type_str_LB.textAlignment=NSTextAlignmentLeft;
    [mtable_bacground addSubview:Pack_type_str_LB];
    
    //    ////////////////////////////   Pack_type_Dynamic Lable \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Pack_type_dyn_LB = [[UILabel alloc] init];
    Pack_type_dyn_LB.textColor = [UIColor blackColor];
    [Pack_type_dyn_LB setFrame:CGRectMake(15,Pack_type_str_LB.frame.origin.y+20,150, 30)];
    
    Pack_type_dyn_LB.backgroundColor=[UIColor clearColor];
    Pack_type_dyn_LB.textColor=[UIColor whiteColor];
    Pack_type_dyn_LB.userInteractionEnabled=NO;
    [Pack_type_dyn_LB setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    
    if ([[[[dict valueForKey:@"Package_Accepted_Detail"]objectAtIndex:indexPath.row]valueForKey:@"classified"]isEqualToString:@"TRUE"]) {
        
        Pack_type_dyn_LB.text=[[[[dict valueForKey:@"Package_Accepted_Detail"]objectAtIndex:indexPath.row]valueForKey:@"Package_Type"] stringByAppendingString:@"(Classified)"];
        
    }
    
    else
    {
        Pack_type_dyn_LB.text= [[[dict valueForKey:@"Package_Accepted_Detail"]objectAtIndex:indexPath.row]valueForKey:@"Package_Type"];
    }

//    Pack_type_dyn_LB.text= [[[dict valueForKey:@"Package_Accepted_Detail"]objectAtIndex:indexPath.row]valueForKey:@"Package_Type"];
    Pack_type_dyn_LB.textColor=[UIColor whiteColor];
    Pack_type_dyn_LB.textAlignment=NSTextAlignmentLeft;
    [mtable_bacground addSubview:Pack_type_dyn_LB];
    
    
    //    ////////////////////////////   Pack_type_str_LB  Lable \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Delivered_Before_str_LB = [[UILabel alloc] init];
    Delivered_Before_str_LB.textColor = [UIColor blackColor];
    [Delivered_Before_str_LB setFrame:CGRectMake((mtable_bacground.frame.size.width-15)-150,Middle_Right_Address_LB.frame.origin.y+Middle_Right_Address_LB.frame.size.height+2,150, 30)];
    
    Delivered_Before_str_LB.backgroundColor=[UIColor clearColor];
    Delivered_Before_str_LB.textColor=[UIColor whiteColor];
    Delivered_Before_str_LB.userInteractionEnabled=NO;
    [Delivered_Before_str_LB setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Delivered_Before_str_LB.text= @"To be delivered before";
    Delivered_Before_str_LB.textColor=[UIColor colorWithRed:196.0f/255.0f green:196.0f/255.0f blue:196.0f/255.0f alpha:1.0];
    Delivered_Before_str_LB.textAlignment=NSTextAlignmentRight;
    [mtable_bacground addSubview:Delivered_Before_str_LB];
    
    //    ////////////////////////////   Pack_type_Dynamic Lable \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Delivered_Before_dyn_LB = [[UILabel alloc] init];
    Delivered_Before_dyn_LB.textColor = [UIColor blackColor];
    [Delivered_Before_dyn_LB setFrame:CGRectMake((mtable_bacground.frame.size.width-15)-150,Delivered_Before_str_LB.frame.origin.y+20,150, 30)];
    Delivered_Before_dyn_LB.backgroundColor=[UIColor clearColor];
    Delivered_Before_dyn_LB.textColor=[UIColor whiteColor];
    Delivered_Before_dyn_LB.userInteractionEnabled=NO;
    [Delivered_Before_dyn_LB setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Delivered_Before_dyn_LB.text= [[[dict valueForKey:@"Package_Accepted_Detail"]objectAtIndex:indexPath.row]valueForKey:@"Package_Delivery"];
    Delivered_Before_dyn_LB.textColor=[UIColor whiteColor];
    Delivered_Before_dyn_LB.textAlignment=NSTextAlignmentRight;
    [mtable_bacground addSubview:Delivered_Before_dyn_LB];
    
    
    //    ////////////////////////////   Pick_up_Button Button \\\\\\\\\\\\\\\\\\\\\\\
    
    
    Pick_up_Button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Pick_up_Button addTarget:self
                        action:@selector(Pick_up_Button:)
              forControlEvents:UIControlEventTouchUpInside];
    Pick_up_Button.backgroundColor=[UIColor clearColor];
    [Pick_up_Button setTitle:@"Pick up" forState:UIControlStateNormal];
    Pick_up_Button.tag=indexPath.row;
    [Pick_up_Button setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
   
    Pick_up_Button.layer.cornerRadius=12;
    Pick_up_Button.clipsToBounds = YES;
    
    if ([[[[dict valueForKey:@"Package_Accepted_Detail"]objectAtIndex:indexPath.row]valueForKey:@"pick_photo"] isEqualToString:@""]) {
        
        
        [Pick_up_Button setTitleColor:[UIColor colorWithRed:52.0f/255.0f green:51.0f/255.0f blue:49.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
        Pick_up_Button.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0];
        Pick_up_Button.userInteractionEnabled=YES;


        
    }
    else
    {
        Pick_up_Button.backgroundColor=[UIColor colorWithRed:218.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1.0];
        [Pick_up_Button setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
        Pick_up_Button.userInteractionEnabled=NO;
        
    }
    
    Pick_up_Button.frame = CGRectMake(10, Delivered_Before_dyn_LB.frame.origin.y+27,70, 30);
    [mtable_bacground addSubview:Pick_up_Button];
    
    
    //    ////////////////////////////   Dropp_off_Button Button \\\\\\\\\\\\\\\\\\\\\\\
    
    Dropp_off_Button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Dropp_off_Button addTarget:self
                        action:@selector(Dropp_off_Button:)
              forControlEvents:UIControlEventTouchUpInside];
   
    [Dropp_off_Button setTitle:@"Drop off" forState:UIControlStateNormal];
    Dropp_off_Button.tag=indexPath.row;
    [Dropp_off_Button setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    
    
    if ([[[[dict valueForKey:@"Package_Accepted_Detail"]objectAtIndex:indexPath.row]valueForKey:@"pick_photo"] isEqualToString:@""]) {
        
        
        Dropp_off_Button.backgroundColor=[UIColor colorWithRed:218.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1.0];
        [Dropp_off_Button setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
        Dropp_off_Button.userInteractionEnabled=NO;
        
        
        
    }
    else
    {
        
        
          if ([[[[dict valueForKey:@"Package_Accepted_Detail"]objectAtIndex:indexPath.row]valueForKey:@"drop_photo"] isEqualToString:@""] || [[[[dict valueForKey:@"Package_Accepted_Detail"]objectAtIndex:indexPath.row]valueForKey:@"signature"] isEqualToString:@""]) {
              
              
              
              [Dropp_off_Button setTitleColor:[UIColor colorWithRed:52.0f/255.0f green:51.0f/255.0f blue:49.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
              Dropp_off_Button.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0];
                Dropp_off_Button.userInteractionEnabled=YES;

              
          }
        
        else
        {
            Dropp_off_Button.backgroundColor=[UIColor colorWithRed:218.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1.0];
            [Dropp_off_Button setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
            Dropp_off_Button.userInteractionEnabled=NO;
        }
        
     
      
        
    }

    
    
    
   
    
    
    Dropp_off_Button.layer.cornerRadius=12;
    Dropp_off_Button.clipsToBounds = YES;
    Dropp_off_Button.frame = CGRectMake((self.view.frame.size.width-80), Delivered_Before_dyn_LB.frame.origin.y+27,70, 30);
    [mtable_bacground addSubview:Dropp_off_Button];

    
    
    
    //    ////////////////////////////   View_Deatil Button \\\\\\\\\\\\\\\\\\\\\\\
    
    View_Detail_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [View_Detail_BTN addTarget:self
                        action:@selector(View_Detail:)
              forControlEvents:UIControlEventTouchUpInside];
    View_Detail_BTN.backgroundColor=[UIColor clearColor];
    [View_Detail_BTN setTitle:@"View Detail" forState:UIControlStateNormal];
    View_Detail_BTN.tag=indexPath.row;
    [View_Detail_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    [View_Detail_BTN setTitleColor:[UIColor colorWithRed:218.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    
    
    View_Detail_BTN.layer.cornerRadius=12;
    View_Detail_BTN.clipsToBounds = YES;
    View_Detail_BTN.layer.borderWidth=1;
    View_Detail_BTN.layer.borderColor=[UIColor colorWithRed:218.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1.0].CGColor;
    
    
    View_Detail_BTN.frame = CGRectMake((self.view.frame.size.width-110)/2, Delivered_Before_dyn_LB.frame.origin.y+27,110, 30);
    [mtable_bacground addSubview:View_Detail_BTN];
    
    
    
    
    
    if (indexPath.row%2==0) {
        cell.backgroundColor=[UIColor colorWithRed:120.0f/255.0f green:117.0f/255.0f blue:114.0f/255.0f alpha:0.4];
        
    }
    else
    {
        cell.backgroundColor=[UIColor colorWithRed:104.0f/255.0f green:101.0f/255.0f blue:98.0f/255.0f alpha:0.4];
        
    }
    
    return cell;
    

    
    }




-(void)Pick_up_Button:(UIButton *)sender
{
    
    Pic_Up_InstructionViewController *objItem_Detail_ViewController=[[Pic_Up_InstructionViewController alloc]init];
    objItem_Detail_ViewController.Pack_Key=[[[dict valueForKey:@"Package_Accepted_Detail"]objectAtIndex:sender.tag]valueForKey:@"Package_id"];
    [self.navigationController pushViewController:objItem_Detail_ViewController animated:YES];

    
}

-(void)Dropp_off_Button:(UIButton *)sender
{
    
    
    
    DROP_OFF_Instruction_ViewController *obj=[[DROP_OFF_Instruction_ViewController alloc]init];
     obj.Pack_Key=[[[dict valueForKey:@"Package_Accepted_Detail"]objectAtIndex:sender.tag]valueForKey:@"Package_id"];
    
     obj.signature=[[[dict valueForKey:@"Package_Accepted_Detail"]objectAtIndex:sender.tag]valueForKey:@"signature"];
    
     obj.drop_photo=[[[dict valueForKey:@"Package_Accepted_Detail"]objectAtIndex:sender.tag]valueForKey:@"drop_photo"];
    
    [self.navigationController pushViewController:obj animated:YES];
   //obj.Pack_Key=[[[dict valueForKey:@"Package_Accepted_Detail"]objectAtIndex:sender.tag]valueForKey:@"Package_id"];

  //  UINavigationController *HomeNavController =[[UINavigationController alloc]initWithRootViewController:obj];
    //[self.navigationController.topViewController presentViewController:HomeNavController animated:YES completion:NULL];
    
  
}

-(void)View_Detail:(UIButton *)sender
{
    Accepted_item_Detail_Page *objItem_Detail_ViewController=[[Accepted_item_Detail_Page alloc]init];
    
    
    
    
    objItem_Detail_ViewController.Pack_Key=[[[dict valueForKey:@"Package_Accepted_Detail"]objectAtIndex:sender.tag]valueForKey:@"Package_id"];
    
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
