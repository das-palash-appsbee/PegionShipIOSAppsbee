//
//  ANY_TIME_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 27/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "ANY_TIME_ViewController.h"
#import "Term_ condition_ViewController.h"
#import "Pending_items_sender_ViewController.h"
#import "MFSideMenu.h"
#import "Utility.h"
#import "Pigeon_posting_detail_ViewController.h"
@interface ANY_TIME_ViewController ()

@end

@implementation ANY_TIME_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
     appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    UIImageView *backGround=[[UIImageView alloc]init];
    backGround.image=[UIImage imageNamed:@"main_slider_bg.jpg"];
    backGround.frame=CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height);
    backGround.userInteractionEnabled=YES;
    [self.view addSubview:backGround];
    
      self.navigationController.navigationBarHidden=YES;
    Back_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [Back_BTN addTarget:self
                 action:@selector(Back:)
       forControlEvents:UIControlEventTouchUpInside];
    [Back_BTN setImage:[UIImage imageNamed:@"back_.png"] forState:UIControlStateNormal];
    Back_BTN.frame = CGRectMake(10,10,49,26);
    [self.view addSubview:Back_BTN];
    
    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    MTitle = [[UILabel alloc] init];
    MTitle.textColor = [UIColor blackColor];
    [MTitle setFrame:CGRectMake(0,50,self.view.frame.size.width, 40)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"ANYTIME";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:MTitle];
    
    
    
    ///////////////////////////// Upon_LB Text\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Upon_LB = [[UILabel alloc] init];
    Upon_LB.textColor = [UIColor blackColor];
    [Upon_LB setFrame:CGRectMake(30,MTitle.frame.origin.y+MTitle.frame.size.height+20,300, 22)];
    Upon_LB.backgroundColor=[UIColor clearColor];
    Upon_LB.textColor=[UIColor whiteColor];
    Upon_LB.userInteractionEnabled=NO;
    [Upon_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Upon_LB.text= @"Upon delivery you will be charged";
    Upon_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Upon_LB.textAlignment=NSTextAlignmentLeft;
    [self.view addSubview:Upon_LB];

    
    ///////////////////////////// payment Text\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Payment_text_LB = [[UILabel alloc] init];
    Payment_text_LB.textColor = [UIColor blackColor];
    [Payment_text_LB setFrame:CGRectMake(0,Upon_LB.frame.origin.y+Upon_LB.frame.size.height+30,self.view.frame.size.width, 22)];
    Payment_text_LB.backgroundColor=[UIColor clearColor];
    Payment_text_LB.textColor=[UIColor whiteColor];
    Payment_text_LB.userInteractionEnabled=NO;
    [Payment_text_LB setFont:[UIFont fontWithName:@"bariol-regular" size:26.0]];
    Payment_text_LB.text= [NSString stringWithFormat:@"$ %@",[[NSUserDefaults standardUserDefaults]valueForKey:@"after_discount"]];
    Payment_text_LB.textColor=[UIColor whiteColor];
    Payment_text_LB.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:Payment_text_LB];


    ///////////////////////////// Term and condision ///////////////////////
    
    Check_Box = [[UIImageView alloc] initWithFrame:CGRectMake(8, Payment_text_LB.frame.origin.y+58, 30, 30)];
    Check_Box.image = [UIImage imageNamed:@"uncheck_checkbox.png"];
    Check_Box.userInteractionEnabled=YES;
    [self.view addSubview:Check_Box];
    
    
    UITapGestureRecognizer *gestureRecognizers_Check_Box = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFroms_check:)];
    [Check_Box addGestureRecognizer:gestureRecognizers_Check_Box];
    gestureRecognizers_Check_Box.cancelsTouchesInView = NO;
    
    
    
    TermCondision = [[UILabel alloc] init];
    TermCondision.userInteractionEnabled=YES;
    TermCondision.textColor = [UIColor blackColor];
    [TermCondision setFrame:CGRectMake(40,Payment_text_LB.frame.origin.y+50,250, 50)];
    TermCondision.backgroundColor=[UIColor clearColor];
    TermCondision.userInteractionEnabled=NO;
    [TermCondision setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    
    
    NSMutableAttributedString * string = [[NSMutableAttributedString alloc] initWithString:@"I accept all Terms and Conditions"];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0,13)];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0] range:NSMakeRange(13,6)];
    //     [string addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(13, 5)];
    
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(19,4)];
    
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0] range:NSMakeRange(23,10)];
    
    TermCondision.attributedText= string;
    TermCondision.textAlignment=NSTextAlignmentLeft;
    [self.view addSubview:TermCondision];
    TermCondision.userInteractionEnabled=YES;
    
    
    UITapGestureRecognizer *TermCondision_gestureRecognizers = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TermCondision_handleTapFroms:)];
    [TermCondision addGestureRecognizer:TermCondision_gestureRecognizers];
    
    
    check_value=false;
    
    ///////////////////////////// PigenShip IT Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    PigenShip_it = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [PigenShip_it addTarget:self
                     action:@selector(PigenShip_it:)
           forControlEvents:UIControlEventTouchUpInside];
    PigenShip_it.backgroundColor=[UIColor colorWithRed:228.0f/255.0f green:183.0f/255.0f blue:44.0f/255.0f alpha:1.0];
    [PigenShip_it setTitle:@"PigeonShip-it" forState:UIControlStateNormal];
    [PigenShip_it setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    [PigenShip_it setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    
    
    PigenShip_it.layer.cornerRadius=20;
    PigenShip_it.clipsToBounds = YES;
    PigenShip_it.frame = CGRectMake(30, TermCondision.frame.origin.y+70,self.view.frame.size.width-60, 40.0);
    [self.view addSubview:PigenShip_it];
    




}

- (void) TermCondision_handleTapFroms: (UITapGestureRecognizer *)recognizer
{
    
    
    Term__condition_ViewController *objTerm__condition_ViewController=[[Term__condition_ViewController alloc]init];
    [self.navigationController pushViewController:objTerm__condition_ViewController animated:YES];
    
}

- (void) handleTapFroms_check: (UITapGestureRecognizer *)recognizer
{
    if (check_value==false) {
        
        Check_Box.image = [UIImage imageNamed:@"check_checkbox.png"];
        
        check_value=true;
        
    }
    else
    {
        
        Check_Box.image = [UIImage imageNamed:@"uncheck_checkbox.png"];
        check_value=false;
    }
    
}

-(void)PigenShip_it:(UIButton *)sender
{
    
    if (check_value==true) {
        
        [self mActivityIndicater];
        
        [self performSelector:@selector(CallTheServer) withObject:nil afterDelay:0.5];

        
    }
    else
    {
        UIAlertView *ALTER=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please read and accept the term and conditions." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [ALTER show];

    }
    
   
}



-(void)CallTheServer
{
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
       
        
        
        if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Pigeon_posting"]isEqualToString:@"YES"]) {
            
            
            
            

            
            
            
            responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&pick_street=%@&pick_street1=%@&pick_state=%@&pick_city=%@&pick_zip=%@&pick_info=%@&pick_business=%@&pick_meet=%@&drop_street=%@&drop_street1=%@&drop_state=%@&drop_city=%@&drop_zip=%@&drop_info=%@&drop_business=%@&drop_meet=%@&promo_code=%@&pigeon_type=%@&after_discount=%@&original_price=%@&kms=%@&type=%@&select_date=%@&time=%@&pick_lat=%@&pick_long=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],[[NSUserDefaults standardUserDefaults]valueForKey:@"Busines_name_TF"],[[NSUserDefaults standardUserDefaults]valueForKey:@"App_setp_TXT"],[[NSUserDefaults standardUserDefaults]valueForKey:@"State_TXT"],[[NSUserDefaults standardUserDefaults]valueForKey:@"City_TXT"],[[NSUserDefaults standardUserDefaults]valueForKey:@"Zip_TXT"],[[NSUserDefaults standardUserDefaults]valueForKey:@"Addition_info_TXT_View"],[[NSUserDefaults standardUserDefaults]valueForKey:@"Full_address_TF"],[[NSUserDefaults standardUserDefaults]valueForKey:@"other_pic_up_name"],
                                                        
                                                        [[NSUserDefaults standardUserDefaults]valueForKey:@"Busines_name_TF_Drop"],[[NSUserDefaults standardUserDefaults]valueForKey:@"App_setp_TXT_Drop"],[[NSUserDefaults standardUserDefaults]valueForKey:@"State_TXT_Drop"],[[NSUserDefaults standardUserDefaults]valueForKey:@"City_TXT_Drop"],[[NSUserDefaults standardUserDefaults]valueForKey:@"Zip_TXT_Drop"],[[NSUserDefaults standardUserDefaults]valueForKey:@"Addition_info_TXT_View_Drop"],[[NSUserDefaults standardUserDefaults]valueForKey:@"Full_address_TF_Drop"],[[NSUserDefaults standardUserDefaults]valueForKey:@"other_drop_down_name"],
                                                        
                                                        
                                                        
                                                        
                                                        [[NSUserDefaults standardUserDefaults]valueForKey:@"promo_code"],[[NSUserDefaults standardUserDefaults]valueForKey:@"pigeon_type"],[[NSUserDefaults standardUserDefaults]valueForKey:@"after_discount"],[[NSUserDefaults standardUserDefaults]valueForKey:@"original_price"],[[NSUserDefaults standardUserDefaults]valueForKey:@"Total_miles"],[[NSUserDefaults standardUserDefaults]valueForKey:@"type"],@"anytime",@"anytime",[[NSUserDefaults standardUserDefaults]valueForKey:@"latitude"],[[NSUserDefaults standardUserDefaults]valueForKey:@"longitude"]]:[NSString stringWithFormat:@"%@postitem",[Utility Pigeon_post_link_url]]];
            
          

            
            
        }
        
        else
        {
            
        
        
       responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&pick_street=%@&pick_street1=%@&pick_state=%@&pick_city=%@&pick_zip=%@&pick_info=%@&pick_business=%@&pick_meet=%@&drop_street=%@&drop_street1=%@&drop_state=%@&drop_city=%@&drop_zip=%@&drop_info=%@&drop_business=%@&drop_meet=%@&promo_code=%@&pigeon_type=%@&after_discount=%@&original_price=%@&kms=%@&type=%@&select_date=%@&time=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],[[NSUserDefaults standardUserDefaults]valueForKey:@"Busines_name_TF"],[[NSUserDefaults standardUserDefaults]valueForKey:@"App_setp_TXT"],[[NSUserDefaults standardUserDefaults]valueForKey:@"State_TXT"],[[NSUserDefaults standardUserDefaults]valueForKey:@"City_TXT"],[[NSUserDefaults standardUserDefaults]valueForKey:@"Zip_TXT"],[[NSUserDefaults standardUserDefaults]valueForKey:@"Addition_info_TXT_View"],[[NSUserDefaults standardUserDefaults]valueForKey:@"Full_address_TF"],[[NSUserDefaults standardUserDefaults]valueForKey:@"other_pic_up_name"],
                                                              
[[NSUserDefaults standardUserDefaults]valueForKey:@"Busines_name_TF_Drop"],[[NSUserDefaults standardUserDefaults]valueForKey:@"App_setp_TXT_Drop"],[[NSUserDefaults standardUserDefaults]valueForKey:@"State_TXT_Drop"],[[NSUserDefaults standardUserDefaults]valueForKey:@"City_TXT_Drop"],[[NSUserDefaults standardUserDefaults]valueForKey:@"Zip_TXT_Drop"],[[NSUserDefaults standardUserDefaults]valueForKey:@"Addition_info_TXT_View_Drop"],[[NSUserDefaults standardUserDefaults]valueForKey:@"Full_address_TF_Drop"],[[NSUserDefaults standardUserDefaults]valueForKey:@"other_drop_down_name"],
                                
                                                              
                                                              
                                                              
                                [[NSUserDefaults standardUserDefaults]valueForKey:@"promo_code"],[[NSUserDefaults standardUserDefaults]valueForKey:@"pigeon_type"],[[NSUserDefaults standardUserDefaults]valueForKey:@"after_discount"],[[NSUserDefaults standardUserDefaults]valueForKey:@"original_price"],[[NSUserDefaults standardUserDefaults]valueForKey:@"Total_miles"],[[NSUserDefaults standardUserDefaults]valueForKey:@"type"],@"anytime",@"anytime"]:[NSString stringWithFormat:@"%@package_post",[Utility API_link_url]]];
            
        }
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        
        
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Pigeon_posting"]isEqualToString:@"YES"]) {
                
                alert = [[UIAlertView alloc] initWithTitle:@"Done" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                alert.tag=10099;
                [alert show];
                
            }
            else
            {
             alert = [[UIAlertView alloc] initWithTitle:@"Done" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
            }
            
                   }
        
        else
        {
            
            if ([[dict valueForKey:@"message"] isEqualToString:@"Access token expired"] || [[dict valueForKey:@"message"] isEqualToString:@"Security token mismatch ,Contact admin"]) {
                
                
                alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                alert.tag=786;
                [alert show];
                
            }
            
            
           else if ([[dict valueForKey:@"error_type"]isEqualToString:@"0"]) {
                
                alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                alert.tag=1001;
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
        
        
        
        alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Not connected to the internet" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
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

    
    
 else   if (alert.tag==1001) {
        
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
    else if (alert.tag==10099)
    {
        
        
        
        
        Pigeon_posting_detail_ViewController *objPigeon_posting_detail_ViewController=[[Pigeon_posting_detail_ViewController alloc]init];
        [self.navigationController pushViewController:objPigeon_posting_detail_ViewController animated:YES];

        
    }
    else
    {
    
    Pending_items_sender_ViewController *demoController = [[Pending_items_sender_ViewController alloc] init];
    //demoController.Title = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
    NSArray *controllers = [NSArray arrayWithObject:demoController];
    navigationController.viewControllers = controllers;
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
    }
    
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"ResetClass"
     object:self];
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
