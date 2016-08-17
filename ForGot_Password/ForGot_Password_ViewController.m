//
//  ForGot_Password_ViewController.m
//  PigeonShip
//
//  Created by Bhushan Bawa on 01/07/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "ForGot_Password_ViewController.h"
#import "Utility.h"
#import "API.h"
#import "JSON.h"
@interface ForGot_Password_ViewController ()

@end

@implementation ForGot_Password_ViewController

@synthesize activeTextView;
@synthesize Email_phone_numbers;
@synthesize Code_number;

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    // save the text view that is being edited
    self.activeTextView = textView;
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    // release the selected text view as we don't need it anymore
    self.activeTextView = nil;
}

// Called when the UIKeyboardDidShowNotification is received
- (void)keyboardWasShown:(NSNotification *)aNotification
{
    // keyboard frame is in window coordinates
    NSDictionary *userInfo = [aNotification userInfo];
    CGRect keyboardInfoFrame = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    // get the height of the keyboard by taking into account the orientation of the device too
    CGRect windowFrame = [self.view.window convertRect:self.view.frame fromView:self.view];
    CGRect keyboardFrame = CGRectIntersection (windowFrame, keyboardInfoFrame);
    CGRect coveredFrame = [self.view.window convertRect:keyboardFrame toView:self.view];
    
    // add the keyboard height to the content insets so that the scrollview can be scrolled
    UIEdgeInsets contentInsets = UIEdgeInsetsMake (0.0, 0.0, coveredFrame.size.height, 0.0);
    scrollview.contentInset = contentInsets;
    scrollview.scrollIndicatorInsets = contentInsets;
    
    // make sure the scrollview content size width and height are greater than 0
    [scrollview setContentSize:CGSizeMake (scrollview.contentSize.width, scrollview.contentSize.height)];
    
    // scroll to the text view
    [scrollview scrollRectToVisible:self.activeTextView.superview.frame animated:YES];
    
}

- (void)keyboardWillBeHidden:(NSNotification *)aNotification
{
    // scroll back..
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        UIEdgeInsets contentInsets = UIEdgeInsetsZero;
        scrollview.contentInset = contentInsets;
        scrollview.scrollIndicatorInsets = contentInsets;
        [UIView commitAnimations];
    });
    
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardDidHideNotification object:nil];
    
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
    
    
    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    MTitle = [[UILabel alloc] init];
    MTitle.textColor = [UIColor blackColor];
    [MTitle setFrame:CGRectMake(0,20,self.view.frame.size.width, 40)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"Forgot Password";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:MTitle];
    
    
    ///////////////////////////// Top View\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    TopView =[[UIView alloc]init];
    TopView.frame=CGRectMake(0, MTitle.frame.origin.y+40, self.view.frame.size.width,70);
    TopView.backgroundColor=[UIColor colorWithRed:52.0f/255.0f green:51.0f/255.0f blue:49.0f/255.0f alpha:1.0];
    [scrollview addSubview:TopView];
    
    ///////////////////////////// Top View Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    textlable = [[UILabel alloc] init];
    textlable.textColor = [UIColor blackColor];
    [textlable setFrame:CGRectMake(10,5,self.view.frame.size.width-20, 50)];
    textlable.backgroundColor=[UIColor clearColor];
    textlable.textColor=[UIColor whiteColor];
    textlable.userInteractionEnabled=NO;
    
    textlable.numberOfLines=0;
    [textlable setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    
    NSMutableParagraphStyle *style  = [[NSMutableParagraphStyle alloc] init];
    style.minimumLineHeight = 25.f;
    style.maximumLineHeight = 25.f;
    NSDictionary *attributtes = @{NSParagraphStyleAttributeName : style,};
    
    textlable.attributedText = [[NSAttributedString alloc] initWithString:@"Verification Code Sent Your Registered Mobile Number"
                                                               attributes:attributtes];
    
    textlable.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    textlable.textAlignment=NSTextAlignmentCenter;
    [TopView addSubview:textlable];
    
    
    livImage=[[UIImageView alloc]init];
    [TopView addSubview:livImage];
    
    
    ///////////////////////////// First Name\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Email_number_LB = [[UILabel alloc] init];
    Email_number_LB.textColor = [UIColor blackColor];
    [Email_number_LB setFrame:CGRectMake(30,TopView.frame.origin.y+TopView.frame.size.height+10,250, 30)];
    Email_number_LB.backgroundColor=[UIColor clearColor];
    Email_number_LB.textColor=[UIColor whiteColor];
    Email_number_LB.userInteractionEnabled=NO;
    [Email_number_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Email_number_LB.text= @"Email/Phone";
    Email_number_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Email_number_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Email_number_LB];
    
    
    
    Email_number_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,Email_number_LB.frame.origin.y+10,self.view.frame.size.width-60, 40)];
    Email_number_TXT.borderStyle = UITextBorderStyleNone;
    Email_number_TXT.font = [UIFont systemFontOfSize:15];
    Email_number_TXT.userInteractionEnabled=NO;
    
    // Fname_TXT.placeholder = @"First Name";
    Email_number_TXT.text=Email_phone_numbers;
    Email_number_TXT.keyboardType = UIKeyboardTypeDefault;
    Email_number_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Email_number_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Email_number_TXT.delegate = self;
    Email_number_TXT.backgroundColor=[UIColor clearColor];
    Email_number_TXT.textColor=[UIColor whiteColor];
    [Email_number_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Email_number_TXT.tag=001;
    Email_number_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Email_number_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [Email_number_TXT setRightViewMode:UITextFieldViewModeAlways];
    
    [scrollview addSubview:Email_number_TXT];
    
    
    ///////////////////////////// Last Name\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Verification_code_LB = [[UILabel alloc] init];
    Verification_code_LB.textColor = [UIColor blackColor];
    [Verification_code_LB setFrame:CGRectMake(30,Email_number_TXT.frame.origin.y+50,250, 30)];
    Verification_code_LB.backgroundColor=[UIColor clearColor];
    Verification_code_LB.textColor=[UIColor whiteColor];
    Verification_code_LB.userInteractionEnabled=NO;
    [Verification_code_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Verification_code_LB.text= @"Enter Verification Code";
    Verification_code_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Verification_code_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Verification_code_LB];
    
    
    
    Verification_code_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, Verification_code_LB.frame.origin.y+10, self.view.frame.size.width-140, 40)];
    Verification_code_TXT.borderStyle = UITextBorderStyleNone;
    Verification_code_TXT.font = [UIFont systemFontOfSize:15];
    Verification_code_TXT.text= @"";
    Verification_code_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Verification_code_TXT.keyboardType = UIKeyboardTypeNumberPad;
    Verification_code_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Verification_code_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Verification_code_TXT.delegate = self;
    Verification_code_TXT.backgroundColor=[UIColor clearColor];
    Verification_code_TXT.textColor=[UIColor whiteColor];
    Verification_code_TXT.tag=002;
    [Verification_code_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Verification_code_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Verification_code_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:Verification_code_TXT];
    [Verification_code_TXT setRightViewMode:UITextFieldViewModeAlways];
    
      //////////////////// Sign In Button\\\\\\\\\\\\\\
    
    Resend_PSW = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Resend_PSW addTarget:self
                 action:@selector(Resnd_Data:)
       forControlEvents:UIControlEventTouchUpInside];
    Resend_PSW.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0];
    [Resend_PSW setTitle:@"Resend" forState:UIControlStateNormal];
    [Resend_PSW setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    [Resend_PSW setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    
    Resend_PSW.layer.cornerRadius=20;
    Resend_PSW.clipsToBounds = YES;
    Resend_PSW.frame = CGRectMake(Verification_code_TXT.frame.origin.x+Verification_code_TXT.frame.size.width+5,Verification_code_LB.frame.origin.y+10,100, 41.0);
    [scrollview addSubview:Resend_PSW];
    
    
    
    ///////////////////////////// Email Id\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Set_PSW_LB = [[UILabel alloc] init];
    Set_PSW_LB.textColor = [UIColor blackColor];
    [Set_PSW_LB setFrame:CGRectMake(30,Verification_code_TXT.frame.origin.y+50,250, 30)];
    Set_PSW_LB.backgroundColor=[UIColor clearColor];
    Set_PSW_LB.textColor=[UIColor whiteColor];
    Set_PSW_LB.userInteractionEnabled=NO;
    [Set_PSW_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Set_PSW_LB.text= @"Set Password";
    Set_PSW_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Set_PSW_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Set_PSW_LB];
    
      Set_PSW_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,Set_PSW_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Set_PSW_TXT.secureTextEntry=YES;
    Set_PSW_TXT.borderStyle = UITextBorderStyleNone;
    Set_PSW_TXT.font = [UIFont systemFontOfSize:15];
    Set_PSW_TXT.text=@"";
    Set_PSW_TXT.keyboardType = UIKeyboardTypeDefault;
    Set_PSW_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Set_PSW_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Set_PSW_TXT.delegate = self;
    Set_PSW_TXT.backgroundColor=[UIColor clearColor];
    Set_PSW_TXT.textColor=[UIColor whiteColor];
    [Set_PSW_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Set_PSW_TXT.tag=003;
    [Set_PSW_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    
    
    Set_PSW_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Set_PSW_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [Set_PSW_TXT setRightViewMode:UITextFieldViewModeAlways];
    [scrollview addSubview:Set_PSW_TXT];
    
    
    //////////////////// Sign In Button\\\\\\\\\\\\\\
    
    Next_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Next_BTN addTarget:self
                 action:@selector(Save_Data:)
       forControlEvents:UIControlEventTouchUpInside];
    Next_BTN.backgroundColor=[UIColor colorWithRed:228.0f/255.0f green:183.0f/255.0f blue:44.0f/255.0f alpha:1.0]
;
    [Next_BTN setTitle:@"Submit" forState:UIControlStateNormal];
    [Next_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    [Next_BTN setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    
    Next_BTN.layer.cornerRadius=20;
    Next_BTN.clipsToBounds = YES;
    Next_BTN.frame = CGRectMake(30, Set_PSW_TXT.frame.origin.y+65,self.view.frame.size.width-60, 41.0);
    [scrollview addSubview:Next_BTN];
    
    
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
}
-(void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
}


-(void)Resnd_Data:(UIButton *)sender
{
    [self mActivityIndicater];
    
    [self performSelector:@selector(forgot_password) withObject:nil afterDelay:0.5];
}


-(void)forgot_password
{
    
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&username=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],Email_phone_numbers]:[NSString stringWithFormat:@"%@resetpassword/",[Utility API_link_url]]];
        
        NSLog(@"%@",responseString);
           NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
           Code_number=[dict valueForKey:@"key"];
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
       
 
        alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Not connected to the internet" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
       
    }
    
    [loader removeFromSuperview];
   }

-(void)Show_CallTheServer_data
{
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"]]                                                             :[NSString stringWithFormat:@"%@licence_detail",[Utility API_link_url]]];
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            if ([[[dict valueForKey:@"License Detail"]valueForKey:@"license"]length]>=5) {
                
                
                checkactionSheet=true;
                
                [livImage sd_setImageWithURL:[NSURL URLWithString:[[dict valueForKey:@"License Detail"]valueForKey:@"license"]]
                            placeholderImage:[UIImage imageNamed:@"default_pic.png"]];
                
                livImage.frame=CGRectMake(10, textlable.frame.origin.y+65, self.view.frame.size.width-20, 150);
                
                
                
                TopView.frame=CGRectMake(0, MTitle.frame.origin.y+40, self.view.frame.size.width,280);
                
                scan_BTN.frame = CGRectMake(30, livImage.frame.origin.y+livImage.frame.size.height+5,self.view.frame.size.width-60, 45.0);
                
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
-(void)Update_CallTheServer_data
{
    if ([API connectedToInternet]==YES) {
        
             //------------ Call API for signup With Post Method --------------//
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&email=%@&password=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],Email_number_TXT.text,Set_PSW_TXT.text] :[NSString stringWithFormat:@"%@updatepassword",[Utility API_link_url]]];
        
              NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            
            alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
            
       
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
else
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
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)Scan_btn:(UIButton *)sender
{
    actionSheets = [[UIActionSheet alloc]
                    initWithTitle:@"Select your Option"
                    delegate:self
                    cancelButtonTitle:@"Cancel"
                    destructiveButtonTitle:nil
                    otherButtonTitles:@"Camera", @"Photos",nil];
    actionSheets.tag=202;
    [actionSheets showInView:self.view];
    
}

-(void)Save_Data:(UIButton *)sender
{
    
    if ([[Email_number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Verification_code_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Set_PSW_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
        Next_BTN.alpha=0.3;
        Next_BTN.userInteractionEnabled=NO;
        
    }
    
    else if (![Code_number isEqualToString:Verification_code_TXT.text])
    {
        /////////////////////////////////////////////////////////////////////////////////////////////////////
        // Edited by Appsbee on 17th August 2016 for same issue as Other issues point no-2////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////
        
        UIAlertView *ALTER=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please recheck your verification code and try again." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [ALTER show];
    }
    
    else
    {
               [self mActivityIndicater];
        
        [self performSelector:@selector(Update_CallTheServer_data) withObject:nil afterDelay:0.5];
        
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
        if (checkactionSheet==false) {
            
            scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
        }
        else
        {
            scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
        }
    }
    
}
-(void)Skip:(UIButton *)sender
{
        [[NSUserDefaults standardUserDefaults]setValue:@"" forKey:@"pro_Licence_number"];
    [[NSUserDefaults standardUserDefaults]setValue:@"" forKey:@"pro_Zip_code"];
    [[NSUserDefaults standardUserDefaults]setValue:@"" forKey:@"pro_City"];
    [[NSUserDefaults standardUserDefaults]setValue:@"" forKey:@"pro_Address"];
    [[NSUserDefaults standardUserDefaults]setValue:@"" forKey:@"pro_State"];
    
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"pro_Location"];
    
    
    [[NSUserDefaults standardUserDefaults]synchronize];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [self.view endEditing:YES];
    
    
    return YES;
    
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    
    UITextField *mtextFeild=textField;
    
    mtextFeild.text=@"";
    
     if ([[Email_number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Verification_code_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Set_PSW_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""])
     {
        
        Next_BTN.alpha=0.3;
        Next_BTN.userInteractionEnabled=NO;
        
    }
    
    else
    {
        Next_BTN.alpha=1.0;
        Next_BTN.userInteractionEnabled=YES;
    }
   
    return YES;
}

- (BOOL)textField:(UITextField *) textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    
    NSUInteger oldLength = [textField.text length];
    NSUInteger replacementLength = [string length];
    NSUInteger rangeLength = range.length;
    
    NSUInteger newLength = oldLength - rangeLength + replacementLength;
    
    
    if ([[Email_number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Verification_code_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Set_PSW_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
        Next_BTN.alpha=0.3;
        Next_BTN.userInteractionEnabled=NO;
    }
    
    else
    {
        Next_BTN.alpha=1.0;
        Next_BTN.userInteractionEnabled=YES;
        
    }
    
       return YES;
 
}
-(void)updateTextLabelsWithText:(NSString *)string
{
}
@end
