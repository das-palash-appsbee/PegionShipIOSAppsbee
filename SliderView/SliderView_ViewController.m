//
//  SliderView_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 16/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//
#import "Pigeon_Posting_ViewController.h"
#import "SliderView_ViewController.h"
#import "UIImageView+WebCache.h"
#import "Edit_LIST_SENDER_ViewController.h"
#import "MFSideMenu.h"
#import "Post_package_ViewController.h"
#import "Delivered_item_sender_ViewController.h"
#import "Accepted_items_sender_ViewController.h"
#import "Pending_items_sender_ViewController.h"
#import "Close_items_sender_ViewController.h"
#import "Expired_items_sender_ViewController.h"
#import "MORE_INFO_ViewController.h"
#import "Utility.h"
#import "Pigeon_Posting_PIGEON_ViewController.h"
#import "ThreeSteps.h"
#import "Deliver_FoodViewController.h"
@interface SliderView_ViewController ()

@end

@implementation SliderView_ViewController

- (void) Previously_receiveTestNotification:(NSNotification *) notification
{
    [Selfi_image sd_setImageWithURL:[NSURL URLWithString:[[NSUserDefaults standardUserDefaults] valueForKey:@"picture"]]
                   placeholderImage:[UIImage imageNamed:@"default_pic.png"]];
    
    
    User_Name.text= [[NSUserDefaults standardUserDefaults]valueForKey:@"User_name"];
    
    User_Email_ID.text= [[NSUserDefaults standardUserDefaults]valueForKey:@"User_Email_Id"];
    
    
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(Previously_receiveTestNotification:)
                                                 name:@"Update_Data"
                                               object:nil];
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//
    List_item=[[NSMutableArray alloc]initWithObjects:@"PigeonShip an Item",@"Pigeon Feed",@"My Profile",@"Pending items",@"Accepted items",@"Delivered items",@"Closed items",@"Expired items",@"Become a Pigeon",@"MORE INFO",@"Logout", nil];
    
    List_item_images=[[NSMutableArray alloc]initWithObjects:@"post_package.png",@"user_.png",@"user_.png",@"clock_.png",@"accepted_.png",@"delivered_.png",@"lock_.png",@"expired_.png",@"delivered_.png",@"icon2.png",@"logout__.png", nil];
    
    
    
//    List_item=[[NSMutableArray alloc]initWithObjects:@"PigeonShip an Item",@"My Profile",@"Pending items",@"Accepted items",@"Delivered items",@"Closed items",@"Expired items",@"Become a Pigeon",@"MORE INFO",@"Logout", nil];
//    
//    List_item_images=[[NSMutableArray alloc]initWithObjects:@"post_package.png",@"user_.png",@"clock_.png",@"accepted_.png",@"delivered_.png",@"lock_.png",@"expired_.png",@"delivered_.png",@"icon2.png",@"logout__.png", nil];

   
    self.view.backgroundColor=[UIColor colorWithRed:52.0f/255.0f green:51.0f/255.0f blue:49.0f/255.0f alpha:1.0];
    self.navigationController.navigationBarHidden=YES;
    
    
    
    ///////////////////////////// User Name\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
  UILabel  *User_type = [[UILabel alloc] init];
    User_type.textColor = [UIColor blackColor];
    [User_type setFrame:CGRectMake(0,10,self.view.frame.size.width-50, 40)];
    User_type.backgroundColor=[UIColor clearColor];
    User_type.textColor=[UIColor whiteColor];
    User_type.userInteractionEnabled=NO;
    [User_type setFont:[UIFont fontWithName:@"bariol-regular" size:24.0]];
    User_type.text= @"Sender";
    User_type.textAlignment=NSTextAlignmentCenter;
    
    User_type.textColor=[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0];
    User_type.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:User_type];

    
    
    ///////////////////////////// profile Pic\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Selfi_image = [[UIImageView alloc] initWithFrame:CGRectMake(((self.view.frame.size.width-60)-150)/2, User_type.frame.origin.y+User_type.frame.size.height, 150, 150)];
    Selfi_image.layer.cornerRadius=150*0.5;
    Selfi_image.layer.borderColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0].CGColor;
    Selfi_image.layer.borderWidth=5;
    Selfi_image.clipsToBounds=YES;
    
    [Selfi_image sd_setImageWithURL:[NSURL URLWithString:[[NSUserDefaults standardUserDefaults] valueForKey:@"picture"]]
                   placeholderImage:[UIImage imageNamed:@"default_pic.png"]];
    
    [self.view addSubview:Selfi_image];
    
    
    
    
    ///////////////////////////// User Name\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    User_Name = [[UILabel alloc] init];
    User_Name.textColor = [UIColor blackColor];
    [User_Name setFrame:CGRectMake(0,Selfi_image.frame.origin.y+160,self.view.frame.size.width-50, 40)];
    User_Name.backgroundColor=[UIColor clearColor];
    User_Name.textColor=[UIColor whiteColor];
    User_Name.userInteractionEnabled=NO;
    [User_Name setFont:[UIFont fontWithName:@"bariol-regular" size:24.0]];
    User_Name.text= [[NSUserDefaults standardUserDefaults]valueForKey:@"User_name"];
    User_Name.textAlignment=NSTextAlignmentCenter;
    
    User_Name.textColor=[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0];
    User_Name.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:User_Name];
    
    ///////////////////////////// User Email id\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    User_Email_ID = [[UILabel alloc] init];
    User_Email_ID.textColor = [UIColor blackColor];
    [User_Email_ID setFrame:CGRectMake(0,User_Name.frame.origin.y+27,self.view.frame.size.width-50, 40)];
    User_Email_ID.backgroundColor=[UIColor clearColor];
    User_Email_ID.textColor=[UIColor whiteColor];
    User_Email_ID.userInteractionEnabled=NO;
    [User_Email_ID setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    User_Email_ID.text= [[NSUserDefaults standardUserDefaults]valueForKey:@"User_Email_Id"];
    User_Email_ID.textAlignment=NSTextAlignmentCenter;
    User_Email_ID.textColor=[UIColor whiteColor];
    User_Email_ID.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:User_Email_ID];
    
    
    ////////////////////////////    UitableView Show \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    mtableview = [[UITableView alloc] initWithFrame:CGRectMake(0, User_Email_ID.frame.origin.y+45, [[UIScreen mainScreen]bounds].size.width-50, [[UIScreen mainScreen]bounds].size.height-(User_Email_ID.frame.origin.y+User_Email_ID.frame.size.height)) style:UITableViewStylePlain];
    
    
    NSLog(@"%f",[[UIScreen mainScreen]bounds].size.height);

      NSLog(@"%f",User_Email_ID.frame.origin.y+User_Email_ID.frame.size.height);
    
    NSLog(@"%f",mtableview.frame.size.height);
    
    
    mtableview.delegate = self;
    mtableview.dataSource = self;
    mtableview.allowsSelection = YES;
    mtableview.hidden=NO;
    mtableview.separatorColor=[UIColor clearColor];
    mtableview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:mtableview];
    

    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return [List_item count];
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
    
    List_image=[[UIImageView alloc]init];
    List_image.frame=CGRectMake(10, 20, 26, 24);
  
    [cell.contentView addSubview:List_image];
    
    List_Name=[[UILabel alloc]init];
    List_Name.frame=CGRectMake(60,19, mtableview.frame.size.width-120, 30);
   
    
              List_Name.backgroundColor=[UIColor clearColor];
        List_Name.textColor=[UIColor colorWithRed:88.0f/255.0f green:90.0f/255.0f blue:91.0f/255.0f alpha:1.0];
        cell.backgroundColor=[UIColor whiteColor];

         [List_Name setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];

    
    
    if (indexPath.row==8) {
        
        if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"User_Role"]isEqualToString:@"both"]) {
              List_image.image=[UIImage imageNamed:[List_item_images objectAtIndex:indexPath.row]];
            List_Name.text=[@"DELIVER AN ITEM" capitalizedString];
            
        }
        else
        {
              List_image.image=[UIImage imageNamed:@"SENDER1.jpg"];
            List_Name.text=[[List_item objectAtIndex:indexPath.row]capitalizedString];
        }
    }
    else
    {
          List_image.image=[UIImage imageNamed:[List_item_images objectAtIndex:indexPath.row]];
        List_Name.text=[[List_item objectAtIndex:indexPath.row]capitalizedString];
    }

    [cell.contentView addSubview:List_Name];
    
    
    
    
    
    return cell;
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



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row==0) {
        
        Post_package_ViewController *demoController = [[Post_package_ViewController alloc] init];
        demoController.Title = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
        
        UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
        NSArray *controllers = [NSArray arrayWithObject:demoController];
        navigationController.viewControllers = controllers;
        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];

        
        
        
    }
    else if (indexPath.row==1)
    {
        
        
        
        Deliver_FoodViewController *demoController = [[Deliver_FoodViewController alloc] init];
        
        UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
        NSArray *controllers = [NSArray arrayWithObject:demoController];
        navigationController.viewControllers = controllers;
        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];

        
        
    }
    
      else if (indexPath.row==2) {
          
          Edit_LIST_SENDER_ViewController *demoController = [[Edit_LIST_SENDER_ViewController alloc] init];
          demoController.Title = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
          
          UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
          NSArray *controllers = [NSArray arrayWithObject:demoController];
          navigationController.viewControllers = controllers;
          [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
          

          
          
      }
    
      else if (indexPath.row==3) {
          
          Pending_items_sender_ViewController *demoController = [[Pending_items_sender_ViewController alloc] init];
          demoController.Title = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
          
          UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
          NSArray *controllers = [NSArray arrayWithObject:demoController];
          navigationController.viewControllers = controllers;
          [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
          

          
      }
    
      else if (indexPath.row==4) {
          
          Accepted_items_sender_ViewController *demoController = [[Accepted_items_sender_ViewController alloc] init];
          demoController.Title = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
          
          UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
          NSArray *controllers = [NSArray arrayWithObject:demoController];
          navigationController.viewControllers = controllers;
          [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
          

          
          
      }
    
      else if (indexPath.row==5) {
          
          Delivered_item_sender_ViewController *demoController = [[Delivered_item_sender_ViewController alloc] init];
          demoController.Title = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
          
          UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
          NSArray *controllers = [NSArray arrayWithObject:demoController];
          navigationController.viewControllers = controllers;
          [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
          
          
      }
    
      else if (indexPath.row==6) {
          
          Close_items_sender_ViewController *demoController = [[Close_items_sender_ViewController alloc] init];
          demoController.Title = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
          
          UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
          NSArray *controllers = [NSArray arrayWithObject:demoController];
          navigationController.viewControllers = controllers;
          [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
          
          
      }
    
      else if (indexPath.row==7) {
          
          Expired_items_sender_ViewController *demoController = [[Expired_items_sender_ViewController alloc] init];
          demoController.Title = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
          
          UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
          NSArray *controllers = [NSArray arrayWithObject:demoController];
          navigationController.viewControllers = controllers;
          [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
          
          
      }
    
    
    
      else if (indexPath.row==8) {
          
          
          if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"User_Role"]isEqualToString:@"both"]) {
              
               [appDelegate Become_Pigeon];
              
          }
          else
          {
          
          UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"Become a Pigeon" message:@"You are about to merge accounts.  You will now be able to send items and deliver items.  Click ok to continue" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok",nil];
          alter.tag=1001;
          
          [alter show];

          
          }
          
          
      }
//     else if (indexPath.row==8) {
//         
//         
//         Pigeon_Posting_ViewController *demoController = [[ Pigeon_Posting_ViewController alloc] init];
//         UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
//         NSArray *controllers = [NSArray arrayWithObject:demoController];
//         navigationController.viewControllers = controllers;
//         [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
//         
//         
//         
//     }

      else if (indexPath.row==9) {
          
          
          MORE_INFO_ViewController *demoController = [[ MORE_INFO_ViewController alloc] init];
          demoController.Title = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
          UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
          NSArray *controllers = [NSArray arrayWithObject:demoController];
          navigationController.viewControllers = controllers;
          [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];

          
          
      }
    
   else if (indexPath.row==10) {
        
       UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"Log out" message:@"Are you sure you want to log out" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes",nil];
       alter.tag=569;
       [alter show];

       
        
    }
}


#pragma mark - -*********************
#pragma mark  CalltheServer
#pragma mark - -*********************


-(void)CalltheServer
{
    
    
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"]]:[NSString stringWithFormat:@"%@merge_account",[Utility API_link_url]]];
        
        NSLog(@"%@",responseString);
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        
        
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            [[NSUserDefaults standardUserDefaults] setObject:[dict valueForKey:@"role"] forKey:@"User_Role"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            

                   [appDelegate Become_Pigeon];
            
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
   else if (alertView.tag==1001) {
        if (buttonIndex==0) {
            
        }
        
        else
        {
            [self performSelector:@selector(CalltheServer) withObject:nil afterDelay:0.5];
            [self mActivityIndicater];

        }
       
    }
    
    
    else if (alertView.tag==568) {
        
        
       
        
          [self mActivityIndicater];
         [self performSelector:@selector(CallTheServer_LOG_OUT) withObject:nil afterDelay:0.5];
      
        
    }
    
     else if (alertView.tag==569) {
         
         if (buttonIndex==0) {
             
         }
         else
         {
             [self mActivityIndicater];
             [self performSelector:@selector(CallTheServer_LOG_OUT) withObject:nil afterDelay:0.5];

         }
         
         
     }
    
    
    else
    {
    
    
    }
}



-(void)CallTheServer_LOG_OUT
{
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&user_id=%@&device_token=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],[[NSUserDefaults standardUserDefaults]valueForKey:@"device_token"]]:[NSString stringWithFormat:@"%@logout",[Utility API_link_url]]];
        
        //   [NSString stringWithFormat:@"%@signup_step2",[Utility API_link_url]]
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            NSString *device_token=[[NSUserDefaults standardUserDefaults]valueForKey:@"device_token"];
            
            NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
            NSDictionary * dict = [defs dictionaryRepresentation];
            for (id key in dict) {
                [defs removeObjectForKey:key];
            }
            [defs synchronize];
            
            
            
            [[NSUserDefaults standardUserDefaults]setObject:device_token forKey:@"device_token"];
            [[NSUserDefaults standardUserDefaults]synchronize];

            
            [[NSUserDefaults standardUserDefaults]setObject:@"Logout" forKey:@"LoginStatues"];
            [[NSUserDefaults standardUserDefaults]synchronize];

            
            appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            [appDelegate LogOut_Method];
            
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
