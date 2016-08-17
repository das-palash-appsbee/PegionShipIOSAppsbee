//
//  Profile_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 03/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Profile_ViewController.h"
#import "AppDelegate.h"
#import "UIImageView+WebCache.h"
#import "API.h"
#import "JSON.h"
#import "Insurance_ViewController.h"
#import "Utility.h"
#import "Spec_ROOT_ViewController.h"
@interface Profile_ViewController ()
{
    }

@end

@implementation Profile_ViewController
@synthesize Class_name;




#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [[NSUserDefaults standardUserDefaults]setValue:@"" forKey:@"longitude"];
    [[NSUserDefaults standardUserDefaults]setValue:@"" forKey:@"latitude"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    currentLocation = newLocation;
    
    if (currentLocation != nil) {
        
        NSString *longitude = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        NSString *latitude  = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        
        
        
        NSLog(@"%@",longitude);
        NSLog(@"%@",latitude);
        
        [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude] forKey:@"longitude"];
        [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude] forKey:@"latitude"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        
    }
}

#pragma mark - -*********************
#pragma mark       viewDidLoad Mthodes
#pragma mark - -*********************

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    locationManager = [[CLLocationManager alloc] init];
   
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,[[UIScreen mainScreen]bounds].size.width,[[UIScreen mainScreen]bounds].size.height)];
    scrollview.showsVerticalScrollIndicator=YES;
    scrollview.scrollEnabled=YES;
    scrollview.userInteractionEnabled=YES;
    scrollview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"main_slider_bg.jpg"]];
    [self.view addSubview:scrollview];
    
    
    self.navigationController.navigationBarHidden=YES;
    
    
    
    ///////////////////////////// Back Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Back_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [Back_BTN addTarget:self
                 action:@selector(back:)
       forControlEvents:UIControlEventTouchUpInside];
    [Back_BTN setImage:[UIImage imageNamed:@"back_.png"] forState:UIControlStateNormal];
    
    
    Back_BTN.frame = CGRectMake(10,10,49,26);
    [scrollview addSubview:Back_BTN];

    
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
    
     mValide_key=[[NSMutableArray alloc]init];
    
    
   NSString *Svalues=[[NSUserDefaults standardUserDefaults] objectForKey:@"pro_image"];
    
    
    if (Svalues==nil ||  [Svalues length]==0) {
        
               Selfi_image.image = [UIImage imageNamed:@"take_selfie.png"];
        [mValide_key addObject:@""];


        
    }
    
    else
    {
        imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"pro_image"];
        image = [UIImage imageWithData:imageData];
        Selfi_image.image = image;
        [mValide_key addObject:[imageData base64EncodedStringWithOptions:0]];


    }
    
    
    
    Licence_mValide_key=[[NSMutableArray alloc]init];

    
    NSString *LIcenvalues=[[NSUserDefaults standardUserDefaults] objectForKey:@"Lice_image"];
    
    if (LIcenvalues==nil ||  [LIcenvalues length]==0) {
        
              [Licence_mValide_key addObject:@""];
        
        
        
    }
    
    else
    {
        Licence_imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"Lice_image"];
      
        [Licence_mValide_key addObject:[Licence_imageData base64EncodedStringWithOptions:0]];
        
        
    }
       
    [scrollview addSubview:Selfi_image];
    
    
    ///////////////////////////// User Name\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    User_Name = [[UILabel alloc] init];
    User_Name.textColor = [UIColor blackColor];
    [User_Name setFrame:CGRectMake(40,Selfi_image.frame.origin.y+170,self.view.frame.size.width-80, 40)];
    User_Name.backgroundColor=[UIColor clearColor];
    User_Name.textColor=[UIColor whiteColor];
    User_Name.userInteractionEnabled=NO;
    [User_Name setFont:[UIFont fontWithName:@"bariol-regular" size:25.0]];
    User_Name.text=[NSString stringWithFormat:@"%@ %@",[[NSUserDefaults standardUserDefaults]valueForKey:@"pro_User_name_Fname"],[[NSUserDefaults standardUserDefaults]valueForKey:@"pro_User_last_name"]] ;
    User_Name.textAlignment=NSTextAlignmentCenter;

    User_Name.textColor=[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0];
    User_Name.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:User_Name];
    
    ///////////////////////////// User Email id\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    User_Email_ID = [[UILabel alloc] init];
    User_Email_ID.textColor = [UIColor blackColor];
    [User_Email_ID setFrame:CGRectMake(40,User_Name.frame.origin.y+25,self.view.frame.size.width-80, 40)];
    User_Email_ID.backgroundColor=[UIColor clearColor];
    User_Email_ID.textColor=[UIColor whiteColor];
    User_Email_ID.userInteractionEnabled=NO;
    [User_Email_ID setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    User_Email_ID.text= [[NSUserDefaults standardUserDefaults]valueForKey:@"pro_User_Email_Id"];
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
    User_Number.text= [[NSUserDefaults standardUserDefaults]valueForKey:@"pro_MOBILE"];
    User_Number.textAlignment=NSTextAlignmentCenter;

    User_Number.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    User_Number.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:User_Number];
    
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"pro_Location"] length]==0) {
        
    }
    else
    {
    
    ///////////////////////////// profile Pic\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    map_image = [[UIImageView alloc] initWithFrame:CGRectMake(15,User_Number.frame.origin.y+73, 15, 19)];
    map_image.image = [UIImage imageNamed:@"location.png"];
    [scrollview addSubview:map_image];
    }

    
    
    ///////////////////////////// User Address \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    User_Address = [[UILabel alloc] init];
    User_Address.textColor = [UIColor blackColor];
    [User_Address setFrame:CGRectMake(40,User_Number.frame.origin.y+50,self.view.frame.size.width-80, 70)];
    User_Address.backgroundColor=[UIColor clearColor];
    User_Address.textColor=[UIColor whiteColor];
    User_Address.userInteractionEnabled=NO;
    User_Address.textAlignment=NSTextAlignmentCenter;
    User_Address.numberOfLines=0;
    [User_Address setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
 
    
    NSMutableParagraphStyle *style  = [[NSMutableParagraphStyle alloc] init];
    style.minimumLineHeight = 25.f;
    style.maximumLineHeight = 25.f;
    NSDictionary *attributtes = @{NSParagraphStyleAttributeName : style,};
    
    User_Address.attributedText = [[NSAttributedString alloc] initWithString:[[NSUserDefaults standardUserDefaults]valueForKey:@"pro_Location"]
                                                           attributes:attributtes];
    User_Address.textAlignment=NSTextAlignmentCenter;

    
       User_Address.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    User_Address.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:User_Address];

    
    
    
    Sender_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Sender_BTN addTarget:self
                   action:@selector(Sender:)
         forControlEvents:UIControlEventTouchUpInside];
    Sender_BTN.backgroundColor=[UIColor colorWithRed:228.0f/255.0f green:183.0f/255.0f blue:44.0f/255.0f alpha:1.0];
    [Sender_BTN setTitle:@"PigeonShip Your Item" forState:UIControlStateNormal];
    [Sender_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    [Sender_BTN setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    
    
    Sender_BTN.layer.cornerRadius=20;
    Sender_BTN.clipsToBounds = YES;
    Sender_BTN.frame =CGRectMake(30, User_Address.frame.origin.y+80,self.view.frame.size.width-60, 40.0); ;
    [scrollview addSubview:Sender_BTN];
    
    

    
    pigen_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pigen_BTN addTarget:self
                  action:@selector(Pigen:)
        forControlEvents:UIControlEventTouchUpInside];
    pigen_BTN.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0];
    [pigen_BTN setTitle:@"Become a Pigeon" forState:UIControlStateNormal];
    [pigen_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    [pigen_BTN setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    pigen_BTN.layer.cornerRadius=20;
    pigen_BTN.clipsToBounds = YES;
    pigen_BTN.frame =CGRectMake(30, Sender_BTN.frame.origin.y+70,self.view.frame.size.width-60, 40.0);
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


#pragma mark - -*********************
#pragma mark       Back Button Action
#pragma mark - -*********************


-(void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - -*********************
#pragma mark       Pigen Button Action
#pragma mark - -*********************


-(void)Pigen:(UIButton *)sender
{
    locationManager.delegate=self;
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    locationManager.distanceFilter=kCLDistanceFilterNone;
    [locationManager requestWhenInUseAuthorization];
    [locationManager startMonitoringSignificantLocationChanges];
    
    [locationManager startUpdatingLocation];
    [[NSUserDefaults standardUserDefaults]setValue:@"pigeon" forKey:@"Pro_userrole"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [self mActivityIndicater];
    [self performSelector:@selector(CalltheServer_Email) withObject:nil afterDelay:0.5];

}

#pragma mark - -*********************
#pragma mark       Sender Button Action
#pragma mark - -*********************

-(void)Sender:(UIButton *)sender
{
    locationManager.delegate=self;
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    locationManager.distanceFilter=kCLDistanceFilterNone;
    [locationManager requestWhenInUseAuthorization];
    [locationManager startMonitoringSignificantLocationChanges];
    
    [locationManager startUpdatingLocation];
    
    [[NSUserDefaults standardUserDefaults]setValue:@"sender" forKey:@"Pro_userrole"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    [self mActivityIndicater];
    [self performSelector:@selector(CalltheServer_Email) withObject:nil afterDelay:0.5];

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
#pragma mark  Login _ With _ verification code
#pragma mark - -*********************


-(void)CalltheServer_Email
{
    
    
    if ([API connectedToInternet]==YES) {
        
        
        
        NSString *unfilteredString =[[NSUserDefaults standardUserDefaults]valueForKey:@"pro_MOBILE"] ;
        NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
        NSString *resultString = [[unfilteredString componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
        NSLog (@"Result: %@", resultString);
        //------------ Call API for signup With Post Method --------------//
        
        
        
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&first_name=%@&last_name=%@&email=%@&password=%@&phone_number=%@&img_url=%@&role=%@&city=%@&address=%@&state=%@&zip_code=%@&licence_number=%@&license_img=%@&device_type=%@&device_token=%@&latitude=%@&longitude=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"pro_User_name_Fname"],[[NSUserDefaults standardUserDefaults]valueForKey:@"pro_User_last_name"],[[NSUserDefaults standardUserDefaults]valueForKey:@"pro_User_Email_Id"],[[NSUserDefaults standardUserDefaults]valueForKey:@"pro_Password"],resultString,[mValide_key objectAtIndex:0],[[NSUserDefaults standardUserDefaults]valueForKey:@"Pro_userrole"],[[NSUserDefaults standardUserDefaults]valueForKey:@"pro_City"],[[NSUserDefaults standardUserDefaults]valueForKey:@"pro_Address"],[[NSUserDefaults standardUserDefaults]valueForKey:@"pro_State"],[[NSUserDefaults standardUserDefaults]valueForKey:@"pro_Zip_code"],[[NSUserDefaults standardUserDefaults]valueForKey:@"pro_Licence_number"],[Licence_mValide_key objectAtIndex:0],@"ios",[[NSUserDefaults standardUserDefaults]valueForKey:@"device_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"latitude"],[[NSUserDefaults standardUserDefaults]valueForKey:@"longitude"]]:[NSString stringWithFormat:@"%@signup_step1",[Utility API_link_url]]];
            NSLog(@"%@",responseString);
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            
            
            [[NSUserDefaults standardUserDefaults]setObject:[[dict valueForKey:@"post_data"]valueForKey:@"access_token"] forKey:@"access_token"];
            [[NSUserDefaults standardUserDefaults]synchronize];

            
            
            [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:@"Pigeon_posting_statues"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            
            
            [[NSUserDefaults standardUserDefaults]setObject:@"Login" forKey:@"LoginStatues"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            

            
            [[NSUserDefaults standardUserDefaults] setObject:[[dict valueForKey:@"post_data"]valueForKey:@"Profile_Pic"] forKey:@"picture"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"Location"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            
            [[NSUserDefaults standardUserDefaults] setObject:[[dict valueForKey:@"post_data"]valueForKey:@"Email_id"] forKey:@"User_Email_Id"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%@%@",[[dict valueForKey:@"post_data"]valueForKey:@"First_Name"],[[dict valueForKey:@"post_data"]valueForKey:@"Last_Name"]] forKey:@"User_name"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            
            [[NSUserDefaults standardUserDefaults] setObject:[[dict valueForKey:@"post_data"]valueForKey:@"User_Id"] forKey:@"User_ID"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            [[NSUserDefaults standardUserDefaults] setObject:[[dict valueForKey:@"post_data"]valueForKey:@"User_Role"] forKey:@"User_Role"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            
            
            [[NSUserDefaults standardUserDefaults] setObject:[[dict valueForKey:@"post_data"]valueForKey:@"Phone_Number"] forKey:@"MobileNumber"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            if ([[[dict valueForKey:@"post_data"]valueForKey:@"User_Role"]isEqualToString:@"pigeon"]) {
                
                Spec_ROOT_ViewController  *objInsurance_ViewController=[[Spec_ROOT_ViewController alloc]init];
                [self.navigationController pushViewController:objInsurance_ViewController animated:YES];
                
            }
            
            if ([[[dict valueForKey:@"post_data"]valueForKey:@"User_Role"]isEqualToString:@"sender"]) {
                
                [appDelegate Add_Slider_View_App_Delegate];
                
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
    else
    {
        
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
