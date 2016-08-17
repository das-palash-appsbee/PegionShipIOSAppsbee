//
//  Login_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 01/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Login_ViewController.h"
#import "Email_validation.h"
#import "Sign_Up_ViewController.h"
#import "AppDelegate.h"
#import <FacebookSDK/FacebookSDK.h>
#import "Profile_ViewController.h"

#import <GoogleOpenSource/GoogleOpenSource.h>
#import <GooglePlus/GooglePlus.h>
#import <QuartzCore/QuartzCore.h>
#import "API.h"
#import "JSON.h"
#import "ForGot_Password_ViewController.h"

#define AD_SIZE [UIColor colorWithRed:121.0f/255.0f green:194.0f/255.0f blue:233.0f/255.0f alpha:1.0]
static NSString *const kPlaceholderUserName = @"<Name>";
static NSString *const kPlaceholderEmailAddress = @"<Email>";
static NSString *const kPlaceholderAvatarImageName = @"PlaceholderAvatar.png";



#define MAXLENGTH 10
#define MINILENGTH 5
@interface Login_ViewController ()<GPPSignInDelegate>

@end

@implementation Login_ViewController


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
#pragma mark       viewDidLoad
#pragma mark - -*********************



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    locationManager = [[CLLocationManager alloc] init];
    
    locationManager.delegate=self;
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    locationManager.distanceFilter=kCLDistanceFilterNone;
    [locationManager requestWhenInUseAuthorization];
    [locationManager startMonitoringSignificantLocationChanges];
    
    [locationManager startUpdatingLocation];

    
     appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [GPPSignInButton class];
    
    GPPSignIn *signIn = [GPPSignIn sharedInstance];
    signIn.shouldFetchGooglePlusUser = YES;
    signIn.shouldFetchGoogleUserEmail = YES;
    
    // Sync the current sign-in configurations to match the selected
    // app activities in the app activity picker.
    if (signIn.actions) {
      //  [_appActivitiesState.selectedCells removeAllObjects];
        
        for (NSString *appActivity in signIn.actions) {
           // [_appActivitiesState.selectedCells
            // addObject:[appActivity lastPathComponent]];
        }
    }
    
    signIn.delegate = self;
    
     appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    //////////////////// Hide Navigation bar\\\\\\\\\\\\\\

    
    self.navigationController.navigationBarHidden=YES;

    
    
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
    
    
    
    
    //////////////////// Title of main view \\\\\\\\\\\\\\

    MTitle = [[UILabel alloc] init];
    MTitle.textColor = [UIColor blackColor];
    [MTitle setFrame:CGRectMake(0,20,self.view.frame.size.width, 40)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"Sign In";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:MTitle];

    
    
    //////////////////// Email Id Lable and Textfeild\\\\\\\\\\\\\\
    
    email_LB = [[UILabel alloc] init];
    email_LB.textColor = [UIColor blackColor];
    [email_LB setFrame:CGRectMake(30,MTitle.frame.origin.y+50,150, 30)];
    email_LB.backgroundColor=[UIColor clearColor];
    email_LB.textColor=[UIColor whiteColor];
    email_LB.userInteractionEnabled=NO;
    [email_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    email_LB.text= @"Phone or Email";
    email_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    email_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:email_LB];
    
    
    email_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,email_LB.frame.origin.y+10,self.view.frame.size.width-60, 40)];
    email_TXT.borderStyle = UITextBorderStyleNone;
    email_TXT.font = [UIFont systemFontOfSize:15];
   // email_TXT.placeholder = @"Email";
    email_TXT.keyboardType = UIKeyboardTypeEmailAddress;
  //  email_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    email_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    email_TXT.delegate = self;
    email_TXT.backgroundColor=[UIColor clearColor];
    email_TXT.textColor=[UIColor whiteColor];
      [email_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    email_TXT.tag=001;
     email_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [email_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];

    
    UIImageView *imgView_email = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 17, 17)];
    imgView_email.image = [UIImage imageNamed:@"email.png"];
   UIView *paddingView_email = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [paddingView_email addSubview:imgView_email];
    
    [email_TXT setRightViewMode:UITextFieldViewModeAlways];
    email_TXT.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [email_TXT setRightView:paddingView_email];
    
    [scrollview addSubview:email_TXT];
    
    
     //////////////////// Pasword  Lable and Textfeild\\\\\\\\\\\\\\
    
    Passwprd_LB = [[UILabel alloc] init];
    Passwprd_LB.textColor = [UIColor blackColor];
    [Passwprd_LB setFrame:CGRectMake(30,email_TXT.frame.origin.y+50,100, 30)];
    Passwprd_LB.backgroundColor=[UIColor clearColor];
    Passwprd_LB.textColor=[UIColor whiteColor];
    Passwprd_LB.userInteractionEnabled=NO;
    [Passwprd_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Passwprd_LB.text= @"Password";
    Passwprd_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Passwprd_LB.textAlignment=NSTextAlignmentLeft;
   
    [scrollview addSubview:Passwprd_LB];

    
    
    Passwprd_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, Passwprd_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Passwprd_TXT.borderStyle = UITextBorderStyleNone;
    Passwprd_TXT.font = [UIFont systemFontOfSize:18];
    Passwprd_TXT.secureTextEntry=YES;
  
    Passwprd_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Passwprd_TXT.keyboardType = UIReturnKeyDefault;
    Passwprd_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Passwprd_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Passwprd_TXT.delegate = self;
    Passwprd_TXT.backgroundColor=[UIColor clearColor];
    Passwprd_TXT.textColor=[UIColor whiteColor];
     Passwprd_TXT.tag=002;
    Passwprd_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
     [Passwprd_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    
    UIImageView *imgView_Passwprd = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 17, 17)];
    imgView_Passwprd.image = [UIImage imageNamed:@"lock_Demo.png"];
    UIView *paddingView_Passwprd = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [paddingView_Passwprd addSubview:imgView_Passwprd];
    [Passwprd_TXT setRightViewMode:UITextFieldViewModeAlways];
    [Passwprd_TXT setRightView:paddingView_Passwprd];
    
    
    [scrollview addSubview:Passwprd_TXT];


    
    
     //////////////////// Sign In Button\\\\\\\\\\\\\\

    BTN_sign_In = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [BTN_sign_In addTarget:self
               action:@selector(aMethod:)
     forControlEvents:UIControlEventTouchUpInside];
    BTN_sign_In.backgroundColor=[UIColor colorWithRed:218.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1.0];
    [BTN_sign_In setTitle:@"Sign In" forState:UIControlStateNormal];
    [BTN_sign_In setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    [BTN_sign_In setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    BTN_sign_In.layer.cornerRadius=20;
    BTN_sign_In.clipsToBounds = YES;
    BTN_sign_In.frame = CGRectMake(30, Passwprd_TXT.frame.origin.y+70,self.view.frame.size.width-60, 41.0);
    [scrollview addSubview:BTN_sign_In];
    
    
    
    
    //////////////////// BTN_Forgot In Button\\\\\\\\\\\\\\
    
    BTN_Forgot = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [BTN_Forgot addTarget:self
                    action:@selector(ForGot_PSW:)
          forControlEvents:UIControlEventTouchUpInside];
    BTN_Forgot.backgroundColor=[UIColor clearColor];
    [BTN_Forgot setTitle:@"Forgot Password ?" forState:UIControlStateNormal];
    [BTN_Forgot setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    [BTN_Forgot setTitleColor:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
BTN_Forgot.frame = CGRectMake(self.view.frame.size.width-170, BTN_sign_In.frame.origin.y+50,140, 41.0);
    [scrollview addSubview:BTN_Forgot];

    
    
       //////////////////// OR \\\\\\\\\\\\\\
    
    Mlable = [[UILabel alloc] init];
    Mlable.textColor = [UIColor blackColor];
    [Mlable setFrame:CGRectMake(30,BTN_Forgot.frame.origin.y+40,self.view.frame.size.width-60, 40)];
    Mlable.backgroundColor=[UIColor clearColor];
    Mlable.textColor=[UIColor whiteColor];
    Mlable.userInteractionEnabled=NO;
     [Mlable setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
    Mlable.text= @"---------------------- or ----------------------";
    Mlable.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Mlable.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:Mlable];

    
    
    //////////////////// Facebook Button\\\\\\\\\\\\\\
    
    
    BTN_Facebook = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [BTN_Facebook addTarget:self
               action:@selector(Facebook:)
     forControlEvents:UIControlEventTouchUpInside];
    BTN_Facebook.backgroundColor=[UIColor clearColor];
    [BTN_Facebook setTitleColor:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    [BTN_Facebook setTitle:@"LOGIN WITH FACEBOOK" forState:UIControlStateNormal];
    [BTN_Facebook setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];

    
    BTN_Facebook.layer.cornerRadius=20;
    BTN_Facebook.clipsToBounds = YES;
 BTN_Facebook.layer.borderColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0].CGColor;
   
    BTN_Facebook.layer.borderWidth=1;
    BTN_Facebook.frame = CGRectMake(30, Mlable.frame.origin.y+70, self.view.frame.size.width-60, 41.0);
    [scrollview addSubview:BTN_Facebook];
    
    UIImageView *Facebook_img=[[UIImageView alloc]init];
    Facebook_img.frame=CGRectMake(20, 11, 11, 18);
    Facebook_img.image=[UIImage imageNamed:@"Face_book.png"];
    [BTN_Facebook addSubview:Facebook_img];

    
    
    //////////////////// Google Button\\\\\\\\\\\\\\

    
   BTN_Google_Plues= [UIButton buttonWithType:UIButtonTypeCustom];
    [BTN_Google_Plues addTarget:self
               action:@selector(Googleplues:)
     forControlEvents:UIControlEventTouchUpInside];
    [BTN_Google_Plues setTitleColor:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    [BTN_Google_Plues setTitle:@"LOGIN WITH GOOGLE+" forState:UIControlStateNormal];
    [BTN_Google_Plues setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    BTN_Google_Plues.layer.cornerRadius=20;
    BTN_Google_Plues.clipsToBounds = YES;
    BTN_Google_Plues.layer.borderWidth=1;
    BTN_Google_Plues.layer.borderColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0].CGColor;
    BTN_Google_Plues.frame = CGRectMake(30, BTN_Facebook.frame.origin.y+70, self.view.frame.size.width-60, 41.0);
    [scrollview addSubview:BTN_Google_Plues];
    
    UIImageView *Google_Plues_img=[[UIImageView alloc]init];
    Google_Plues_img.frame=CGRectMake(20, 12, 19, 17);
    Google_Plues_img.image=[UIImage imageNamed:@"Google_plues.png"];
    [BTN_Google_Plues addSubview:Google_Plues_img];

    
    
    //////////////////// Don't have account  Button\\\\\\\\\\\\\\

    
    
    BTN_Dont_account = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [BTN_Dont_account addTarget:self
                         action:@selector(Signup:)
    forControlEvents:UIControlEventTouchUpInside];
    [BTN_Dont_account setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    NSMutableAttributedString *commentString = [[NSMutableAttributedString alloc] initWithString:@"I don't have an account"];
    
    [commentString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [commentString length])];
    
    
      [BTN_Dont_account setAttributedTitle:commentString forState:UIControlStateNormal];
    
    [BTN_Dont_account setTintColor:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0]];

    BTN_Dont_account.frame = CGRectMake(30, BTN_Google_Plues.frame.origin.y+75, self.view.frame.size.width-60, 40.0);
    [scrollview addSubview:BTN_Dont_account];

    
        self.view.backgroundColor=[UIColor whiteColor];
    
     scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
    
//
}

-(void)viewWillAppear:(BOOL)animated
{
    Passwprd_TXT.text=@"";
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
#pragma mark  Login _ With _ Email _Id
#pragma mark - -*********************


-(void)CalltheServer_Email
{
    
    
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&email=%@&password=%@&user_type=%@&device_type=%@&device_token=%@&latitude=%@&longitude=%@",[Utility Pigeon_security_token],email_TXT.text,Passwprd_TXT.text,@"login_with_email",@"ios",[[NSUserDefaults standardUserDefaults]valueForKey:@"device_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"latitude"],[[NSUserDefaults standardUserDefaults]valueForKey:@"longitude"]]:[NSString stringWithFormat:@"%@login/",[Utility API_link_url]]];
        
        NSLog(@"%@",responseString);
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            [[NSUserDefaults standardUserDefaults]setObject:[[dict valueForKey:@"post_data"]valueForKey:@"access_token"] forKey:@"access_token"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            

            
            
            [[NSUserDefaults standardUserDefaults]setObject:[[dict valueForKey:@"post_data"]valueForKey:@"pigeon_post_status"] forKey:@"Pigeon_posting_statues"];
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
            
            
            
            [[NSUserDefaults standardUserDefaults]setValue:[[dict valueForKey:@"post_data"]valueForKey:@"User_Role"] forKey:@"Pro_userrole"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            
            
            if ([[[dict valueForKey:@"post_data"]valueForKey:@"User_Role"]isEqualToString:@"pigeon"]) {
                
                [appDelegate Add_Slider_View_App_Delegate];
                
            }
            
            if ([[[dict valueForKey:@"post_data"]valueForKey:@"User_Role"]isEqualToString:@"sender"]) {
                
                [appDelegate Add_Slider_View_App_Delegate];
            }
            
            else
            {
                
                DashBoard_ViewController *objProfile_ViewController=[[DashBoard_ViewController alloc]init];
                
                [self.navigationController pushViewController:objProfile_ViewController animated:YES];
                
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
#pragma mark  Login _ With _ FaceBook _Id
#pragma mark - -*********************



-(void)CalltheServer_FaceBook:(NSString *)URL_Path
{
    
    
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        NSString *responseString = [API makeCallPostData_ALL:URL_Path:[NSString stringWithFormat:@"%@login/",[Utility API_link_url]]];
        
        NSLog(@"%@",responseString);
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            
            [[NSUserDefaults standardUserDefaults]setObject:[[dict valueForKey:@"post_data"]valueForKey:@"access_token"] forKey:@"access_token"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            

            
            
            [[NSUserDefaults standardUserDefaults]setObject:[[dict valueForKey:@"post_data"]valueForKey:@"pigeon_post_status"] forKey:@"Pigeon_posting_statues"];
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
            
            [[NSUserDefaults standardUserDefaults] setObject:[[dict valueForKey:@"post_data"]valueForKey:@"User_Role"] forKey:@"Pro_userrole"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            
            [[NSUserDefaults standardUserDefaults] setObject:[[dict valueForKey:@"post_data"]valueForKey:@"User_Role"] forKey:@"User_Role"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            
            [[NSUserDefaults standardUserDefaults] setObject:[[dict valueForKey:@"post_data"]valueForKey:@"Phone_Number"] forKey:@"MobileNumber"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            
            
            
            if ([[[dict valueForKey:@"post_data"]valueForKey:@"User_Role"]isEqualToString:@"pigeon"]) {
                
                
                
                [appDelegate Add_Slider_View_App_Delegate];
                
            }
            
            if ([[[dict valueForKey:@"post_data"]valueForKey:@"User_Role"]isEqualToString:@"sender"]) {
                
                
                
                
                [appDelegate Add_Slider_View_App_Delegate];
                
            }
            
            else
            {
                
                DashBoard_ViewController *objProfile_ViewController=[[DashBoard_ViewController alloc]init];
                
                [self.navigationController pushViewController:objProfile_ViewController animated:YES];
                
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
#pragma mark  Login _ With _ Google_plues _Id
#pragma mark - -*********************



-(void)CalltheServer_Google_plues:(NSString *)URL_Path
{
    
    
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        
        
        
        NSString *responseString = [API makeCallPostData_ALL:URL_Path:[NSString stringWithFormat:@"%@login/",[Utility API_link_url]]];
        
        NSLog(@"%@",responseString);
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            [[NSUserDefaults standardUserDefaults]setObject:[[dict valueForKey:@"post_data"]valueForKey:@"access_token"] forKey:@"access_token"];
            [[NSUserDefaults standardUserDefaults]synchronize];

            
            
            [[NSUserDefaults standardUserDefaults]setObject:[[dict valueForKey:@"post_data"]valueForKey:@"pigeon_post_status"] forKey:@"Pigeon_posting_statues"];
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
            
            [[NSUserDefaults standardUserDefaults] setObject:[[dict valueForKey:@"post_data"]valueForKey:@"User_Role"] forKey:@"Pro_userrole"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            
            
            [[NSUserDefaults standardUserDefaults] setObject:[[dict valueForKey:@"post_data"]valueForKey:@"User_Role"] forKey:@"User_Role"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            
            [[NSUserDefaults standardUserDefaults] setObject:[[dict valueForKey:@"post_data"]valueForKey:@"Phone_Number"] forKey:@"MobileNumber"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            
            
            
            if ([[[dict valueForKey:@"post_data"]valueForKey:@"User_Role"]isEqualToString:@"pigeon"]) {
                
                
                
                [appDelegate Add_Slider_View_App_Delegate];
                
            }
            
            if ([[[dict valueForKey:@"post_data"]valueForKey:@"User_Role"]isEqualToString:@"sender"]) {
                
                
                
                
                [appDelegate Add_Slider_View_App_Delegate];
                
            }
            
            else
            {
                
                
                
                
                DashBoard_ViewController *objProfile_ViewController=[[DashBoard_ViewController alloc]init];
                
                [self.navigationController pushViewController:objProfile_ViewController animated:YES];
                
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



-(void)Facebook:(UIButton *)sender
{
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
    
    
    [self mActivityIndicater];
    
    
    [[NSUserDefaults standardUserDefaults]setValue:@"Facebook" forKey:@"LoginVlaues"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    
    
    
    [FBSession openActiveSessionWithReadPermissions:@[@"user_about_me",@"email",@"user_location",@"user_birthday",@"user_hometown"]
                                       allowLoginUI:YES
                                  completionHandler:^(FBSession *session, FBSessionState state, NSError *error) {
                                      
                                      switch (state) {
                                          case FBSessionStateOpen:
                                              [[FBRequest requestForMe] startWithCompletionHandler:^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *user, NSError *error) {
                                                  if (error) {
                                                      
                                                      NSLog(@"error:%@",error);
                                                      
                                                      
                                                      
                                                      
                                                  }
                                                  else
                                                  {
                                                      
                                                      NSString * accessToken = [[FBSession activeSession] accessToken];
                                                      
                                                      NSLog(@"%@",user);
                                                      
                                                      
                                                      
                                                      NSString *FT = accessToken;
                                                      [[NSUserDefaults standardUserDefaults] setObject:FT forKey:@"tokenaccess"];
                                                      [[NSUserDefaults standardUserDefaults] synchronize];
                                                      
                                                      
                                                      NSString *string = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture", user.objectID];
                                                      
                                                      NSLog(@"%@",string);
                                                      
                                                      
                                                      
                                                      
                                                      
                                                      NSString *urlString = [NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?type=large", user.objectID];
                                                      
                                                      
                                                      
                                                      NSString *FB = urlString;
                                                      [[NSUserDefaults standardUserDefaults] setObject:FB forKey:@"picture"];
                                                      [[NSUserDefaults standardUserDefaults] synchronize];
                                                      
                                                      
                                                      NSString *FBPic = [[NSUserDefaults standardUserDefaults]
                                                                         stringForKey:@"picture"];
                                                      
                                                      NSLog(@"%@",FBPic);
                                                      
                                                      
                                                      
                                                      NSMutableURLRequest *urlRequest =
                                                      [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]
                                                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                                          timeoutInterval:2];
                                                      
                                                      // Run request asynchronously
                                                      NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:urlRequest
                                                                                                                       delegate:self];
                                                      if (!urlConnection)
                                                          NSLog(@"Failed to download picture");
                                                      
                                                      
                                                      [self CalltheServer_FaceBook:[NSString stringWithFormat:@"security_token=%@&first_name=%@&last_name=%@&facebook_id=%@&email=%@&img_url=%@&user_type=%@&device_type=%@&device_token=%@&latitude=%@&longitude=%@",[Utility Pigeon_security_token],user.first_name,user.last_name,user.objectID,[user objectForKey:@"email"],[NSString stringWithFormat:@"%@",urlString],@"login_with_facebook",@"ios",[[NSUserDefaults standardUserDefaults]valueForKey:@"device_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"latitude"],[[NSUserDefaults standardUserDefaults]valueForKey:@"longitude"]]];
                                                      
                                                      
                                                      
                                                      
                                                  }
                                                  
                                                  
                                                  
                                              }];
                                              
                                              break;
                                      }
                                      
                                      
                                      [loader removeFromSuperview];
                                      
                                      
                                  } ];
    
}

-(void)Googleplues:(UIButton *)sender
{
    
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
    
    [self mActivityIndicater];
    [[NSUserDefaults standardUserDefaults]setValue:@"Googleplues" forKey:@"LoginVlaues"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    GPPSignIn *signIn = [GPPSignIn sharedInstance];
    signIn.delegate = self;
    signIn.shouldFetchGoogleUserEmail = YES;
    signIn.clientID = @"924551345734-gucdps7ruc4dsa8sh0vbh2p8sp0kb5s1.apps.googleusercontent.com";
    signIn.scopes = [NSArray arrayWithObjects:kGTLAuthScopePlusLogin,nil];
    signIn.actions = [NSArray arrayWithObjects:@"http://schemas.google.com/ListenActivity",nil];
    [signIn authenticate];
}


-(void)Signup:(UIButton *)sender
{
    Sign_Up_ViewController *objSign_Up_ViewController=[[Sign_Up_ViewController alloc]init];
    [self.navigationController pushViewController:objSign_Up_ViewController animated:YES];
    
}





-(void)ForGot_PSW:(UIButton *)sender
{

    //------------ Show AlertView For enter Email_id for retrive new password in your email_id--------------//
    
    alert = [[UIAlertView alloc] initWithTitle:@"Enter Email / Phone number" message:@"Please enter the Email / Phone number  for your account. " delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    
    //------------ Show TextField in Alert view--------------//
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];

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
    else

    {
    
    if (buttonIndex==1) {
        
         mEmail_id =  [alertView textFieldAtIndex: 0];
        
        NSLog(@"%@",mEmail_id.text);
       
        
        
        NSScanner *scanner = [NSScanner scannerWithString:[mEmail_id text]];
        BOOL isNumeric = [scanner scanInteger:NULL] && [scanner isAtEnd];

        //------------ Fetch Data From  AlertView textfield (Email_ID)--------------//
        
        if (isNumeric==true)
        {
            
            if ([mEmail_id.text length]>=10) {
                
                [self mActivityIndicater];
                //------------ Call Forgot Password method--------------//
                [self performSelector:@selector(forgot_password)withObject:nil afterDelay:.00];
            }
            else
            {
                UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Enter a valid phone Number" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [alert2 show];
            }
            
            
            
        }

        else    if(![Email_validation validateEmail:[mEmail_id text]]) {
            
            alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Enter a valid email address." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
            
            [loader removeFromSuperview];
        }
        else
        {
             [self performSelector:@selector(forgot_password)withObject:nil afterDelay:.00];
        }
        
    }
    }
    
}

-(void)forgot_password
{
    
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&username=%@",[Utility Pigeon_security_token],mEmail_id.text]:[NSString stringWithFormat:@"%@resetpassword/",[Utility API_link_url]]];
        
        NSLog(@"%@",responseString);
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            ForGot_Password_ViewController *obj_ForGot_Password_ViewController=[[ForGot_Password_ViewController alloc]init];
            obj_ForGot_Password_ViewController.Email_phone_numbers=mEmail_id.text;
              obj_ForGot_Password_ViewController.Code_number=[dict valueForKey:@"key"];
            
            
            
            [self.navigationController pushViewController:obj_ForGot_Password_ViewController animated:YES];
            
            
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




-(void)aMethod:(UIButton *)sender
{
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
    
    NSString *myRegex = @"[A-Z0-9a-z_ ]*";
    NSPredicate *myTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", myRegex];
    BOOL Email_user_passwordvalid = [myTest evaluateWithObject:Passwprd_TXT.text];
    
    NSLog(@"%lu",(unsigned long)Passwprd_TXT.text.length);
    
    
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
    
    
    
    NSScanner *scanner = [NSScanner scannerWithString:email_TXT.text];
    BOOL isNumeric = [scanner scanInteger:NULL] && [scanner isAtEnd];
    
        
        if ([[email_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Passwprd_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ) {
            
            
            if ([[email_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
                
            
            
            [email_TXT shake:10
                      withDelta:5.0
                       andSpeed:0.04
                 shakeDirection:ShakeDirectionHorizontal];
                
                
                
            }
            
            if ([[Passwprd_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
                
            
            
            [Passwprd_TXT shake:10
                   withDelta:5.0
                    andSpeed:0.04
              shakeDirection:ShakeDirectionHorizontal];
            }
            
                }
    
    
    else if (isNumeric==true)
    {
          if ([email_TXT.text length]>=10) {
              
              
             
              
              [self mActivityIndicater];
              [self performSelector:@selector(CalltheServer_Email) withObject:nil afterDelay:0.5];
          }
        else
        {
            UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Enter a valid phone / email address." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert2 show];
        }
    }
    
    else if(![Email_validation validateEmail:[email_TXT text]]) {
            // user entered invalid email address
            UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Enter a valid phone / email address." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert2 show];
        }
    
        else  if([[Passwprd_TXT.text stringByTrimmingCharactersInSet: set] length] == 0 )
        {
            UIAlertView *alert2 = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Password cannot contain space" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert2 show];
        }
        
        else if (Passwprd_TXT.text.length<5)
        {
            UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Lenghth minimum 5 character" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert2 show];
        }
        
        else {
            
            
            
            [self mActivityIndicater];
            [self performSelector:@selector(CalltheServer_Email) withObject:nil afterDelay:0.5];
            
            
        }
    
    
    [self.view endEditing:YES];
    
   /// [appDelegate Add_Slider_View_App_Delegate];

}





#pragma mark - GPPSignInDelegate

- (void)finishedWithAuth:(GTMOAuth2Authentication *)auth
                   error:(NSError *)error {
    if (error) {
              [NSString stringWithFormat:@"Status: Authentication error: %@", error];
        return;
    }
    [self reportAuthStatus];
   
}


- (void)reportAuthStatus {
    if ([GPPSignIn sharedInstance].authentication) {
        //_signInAuthStatus.text = @"Status: Authenticated";
    } else {
        // To authenticate, use Google+ sign-in button.
       // _signInAuthStatus.text = @"Status: Not authenticated";
    }
    [self refreshUserInfo];
}

- (void)refreshUserInfo {
    if ([GPPSignIn sharedInstance].authentication == nil) {
        
        
         NSLog(@"%@",kPlaceholderUserName);
         NSLog(@"%@",kPlaceholderEmailAddress);
         NSLog(@"%@",[UIImage imageNamed:kPlaceholderAvatarImageName]);
        
        return;
    }
    
    [[GTLPlusPersonName alloc]init];
    
  
    
    

      NSLog(@"%@",[GPPSignIn sharedInstance].userEmail);
    
    NSLog(@"%@",[GPPSignIn sharedInstance].userID);

    GTLPlusPerson *person = [GPPSignIn sharedInstance].googlePlusUser;
    if (person == nil) {
        return;
    }
    
    NSLog(@"%@",person.identifier);
      NSLog(@"%@",person.aboutMe);
    
     NSLog(@"%@",person.currentLocation);
    
      NSLog(@"%@",[[person.placesLived objectAtIndex:0] valueForKey:@"value"]);
      dispatch_queue_t backgroundQueue =
    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    [self CalltheServer_Google_plues:[NSString stringWithFormat:@"security_token=%@&first_name=%@&last_name=%@&google_id=%@&email=%@&img_url=%@&user_type=%@&device_type=%@&device_token=%@&latitude=%@&longitude=%@",[Utility Pigeon_security_token],person.displayName,@" ",person.identifier,[GPPSignIn sharedInstance].userEmail,person.image.url ,@"login_with_googleplus",@"ios",[[NSUserDefaults standardUserDefaults]valueForKey:@"device_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"latitude"],[[NSUserDefaults standardUserDefaults]valueForKey:@"longitude"]]];
    
}



#pragma mark - -*********************
#pragma mark     TextField Delegate
#pragma mark - -*********************


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    
    
    return YES;
}

- (BOOL)textField:(UITextField *) textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSUInteger oldLength = [textField.text length];
    NSUInteger replacementLength = [string length];
    NSUInteger rangeLength = range.length;
    
    NSUInteger newLength = oldLength - rangeLength + replacementLength;
    
    BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
    
 
    if (textField.tag==002) {
        
    
    
        return newLength <= MAXLENGTH || returnKey;
    }
    
    return YES;

   
   }
@end
