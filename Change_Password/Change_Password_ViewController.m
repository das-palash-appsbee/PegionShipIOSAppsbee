//
//  Change_Password_ViewController.m
//  PigeonShip
//
//  Created by Bhushan Bawa on 29/06/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Change_Password_ViewController.h"
#import "Utility.h"
#import "API.h"
#import "JSON.h"
#import "UITextField+Shake.h"
#import "Email_validation.h"

#define MAXLENGTH 7
#define MINILENGTH 5


@interface Change_Password_ViewController ()

@end

@implementation Change_Password_ViewController

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
    
    
    ///////////////////////////// Back Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Back_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [Back_BTN addTarget:self
                 action:@selector(Back:)
       forControlEvents:UIControlEventTouchUpInside];
    [Back_BTN setImage:[UIImage imageNamed:@"back_.png"] forState:UIControlStateNormal];
    
    
    Back_BTN.frame = CGRectMake(10,10,49,26);
    [scrollview addSubview:Back_BTN];
    
    
    
    self.navigationController.navigationBarHidden=YES;
    
    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    MTitle = [[UILabel alloc] init];
    MTitle.textColor = [UIColor blackColor];
    [MTitle setFrame:CGRectMake(0,10,self.view.frame.size.width, 40)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"Change Password";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:MTitle];
    
    
    ///////////////////////////// First Name\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Old_password_LB = [[UILabel alloc] init];
    Old_password_LB.textColor = [UIColor blackColor];
    [Old_password_LB setFrame:CGRectMake(30,MTitle.frame.origin.y+50,250, 30)];
    Old_password_LB.backgroundColor=[UIColor clearColor];
    Old_password_LB.textColor=[UIColor whiteColor];
    Old_password_LB.userInteractionEnabled=NO;
    [Old_password_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Old_password_LB.text= @"Old Password";
    Old_password_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Old_password_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Old_password_LB];
    
    
    
    Old_password_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,Old_password_LB.frame.origin.y+10,self.view.frame.size.width-60, 40)];
    
    Old_password_TXT.font = [UIFont systemFontOfSize:15];
    Old_password_TXT.text=@"";
    Old_password_TXT.keyboardType = UIKeyboardTypeDefault;
    Old_password_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Old_password_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Old_password_TXT.delegate = self;
    Old_password_TXT.backgroundColor=[UIColor clearColor];
    Old_password_TXT.textColor=[UIColor whiteColor];
    [Old_password_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Old_password_TXT.tag=001;
    Old_password_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Old_password_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:Old_password_TXT];
    
    
    ///////////////////////////// Last Name\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    New_password_LB = [[UILabel alloc] init];
    New_password_LB.textColor = [UIColor blackColor];
    [New_password_LB setFrame:CGRectMake(30,Old_password_TXT.frame.origin.y+50,250, 30)];
    New_password_LB.backgroundColor=[UIColor clearColor];
    New_password_LB.textColor=[UIColor whiteColor];
    New_password_LB.userInteractionEnabled=NO;
    [New_password_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    New_password_LB.text= @"New Password";
    New_password_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    New_password_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:New_password_LB];
    
    
    New_password_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, New_password_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    // Lname_TXT.text=@"Rana";
    New_password_TXT.text=@"";
    New_password_TXT.borderStyle = UITextBorderStyleNone;
    New_password_TXT.font = [UIFont systemFontOfSize:15];
    New_password_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    New_password_TXT.keyboardType = UIReturnKeyDefault;
    New_password_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    New_password_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    New_password_TXT.delegate = self;
    New_password_TXT.backgroundColor=[UIColor clearColor];
    New_password_TXT.textColor=[UIColor whiteColor];
    New_password_TXT.tag=002;
    [New_password_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    New_password_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [New_password_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:New_password_TXT];
    
    
    ///////////////////////////// Email Id\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Confirem_password_LB = [[UILabel alloc] init];
    Confirem_password_LB.textColor = [UIColor blackColor];
    [Confirem_password_LB setFrame:CGRectMake(30,New_password_TXT.frame.origin.y+50,250, 30)];
    Confirem_password_LB.backgroundColor=[UIColor clearColor];
    Confirem_password_LB.textColor=[UIColor whiteColor];
    Confirem_password_LB.userInteractionEnabled=NO;
    [Confirem_password_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Confirem_password_LB.text= @"Confirm Password";
    Confirem_password_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Confirem_password_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Confirem_password_LB];
    
    
    
    Confirem_password_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,Confirem_password_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    /// email_TXT.text=@"ranabhushan87@gmail.com";
    Confirem_password_TXT.text=@"";
    Confirem_password_TXT.borderStyle = UITextBorderStyleNone;
    Confirem_password_TXT.font = [UIFont systemFontOfSize:15];
    Confirem_password_TXT.keyboardType = UIKeyboardTypeEmailAddress;
    Confirem_password_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Confirem_password_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Confirem_password_TXT.delegate = self;
    Confirem_password_TXT.backgroundColor=[UIColor clearColor];
    Confirem_password_TXT.textColor=[UIColor whiteColor];
    [Confirem_password_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Confirem_password_TXT.tag=003;
    [Confirem_password_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    Confirem_password_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Confirem_password_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:Confirem_password_TXT];
    
    
    
    BTN_Change_password = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [BTN_Change_password addTarget:self
                    action:@selector(NEXT_VIEW:)
          forControlEvents:UIControlEventTouchUpInside];
    BTN_Change_password.backgroundColor=[UIColor colorWithRed:228.0f/255.0f green:183.0f/255.0f blue:44.0f/255.0f alpha:1.0];
    [BTN_Change_password setTitle:@"Save" forState:UIControlStateNormal];
    [BTN_Change_password setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    [BTN_Change_password setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    BTN_Change_password.layer.cornerRadius=20;
    BTN_Change_password.clipsToBounds = YES;
    BTN_Change_password.frame = CGRectMake(30,Confirem_password_TXT.frame.origin.y+70,self.view.frame.size.width-60, 44.0);
    [scrollview addSubview:BTN_Change_password];
    
    ///  self.view.backgroundColor=[UIColor whiteColor];
    
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
    
    //
    
 
    
    
    
}

-(void)Show_CallTheServer_data
{
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"]]                                                             :[NSString stringWithFormat:@"%@view_profile",[Utility API_link_url]]];
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
                      
            
            
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




-(void)Back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
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




-(void)cancelNumberPad{
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view endEditing:YES];
        [UIView commitAnimations];
    });
    
    
    
    
    
    if ([[New_password_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Old_password_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Confirem_password_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
        BTN_Change_password.alpha=0.3;
        BTN_Change_password.userInteractionEnabled=NO;
        
        
    }
    
    else
    {
        BTN_Change_password.alpha=1.0;
        BTN_Change_password.userInteractionEnabled=YES;
        
    }
    
    
}

-(void)doneWithNumberPad{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view endEditing:YES];
        [UIView commitAnimations];
    });
    
    
    
}



-(void)back
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}




-(void)Update_CallTheServer_data
{
    
    if ([API connectedToInternet]==YES) {
        

    
    NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&old_password=%@&new_password=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],Old_password_TXT.text,New_password_TXT.text]                                                            :[NSString stringWithFormat:@"%@changepassword",[Utility API_link_url]]];
    
    
    
    
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



-(void)NEXT_VIEW:(UIButton *)sender
{
 
    
    if ([[Old_password_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[New_password_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Confirem_password_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ) {
        
        if ([[Old_password_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
            
            
            
            [Old_password_TXT shake:10
                   withDelta:5.0
                    andSpeed:0.04
              shakeDirection:ShakeDirectionHorizontal];
            
            
            
        }
        
        if ([[New_password_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
            
            
            
            [New_password_TXT shake:10
                   withDelta:5.0
                    andSpeed:0.04
              shakeDirection:ShakeDirectionHorizontal];
        }
        
        if ([[Confirem_password_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
            
            
            
            [Confirem_password_TXT shake:10
                   withDelta:5.0
                    andSpeed:0.04
              shakeDirection:ShakeDirectionHorizontal];
            
        }
        
        
        
        
        
    }
    
    else if (![New_password_TXT.text isEqualToString:Confirem_password_TXT.text])
    {
        alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:@"New Password and Confirm Password are not match" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];    }
  
    
    else {
        
        [self mActivityIndicater];
        
        [self performSelector:@selector(Update_CallTheServer_data) withObject:nil afterDelay:0.5];
        
        
    }
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
    scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view endEditing:YES];
    
}




- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view endEditing:YES];
        [UIView commitAnimations];
    });
    
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField.tag==005 || textField.tag==006) {
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.5];
            [UIView setAnimationCurve:UIViewAnimationCurveLinear];
            scrollview.frame=CGRectMake(0, -70, self.view.frame.size.width, self.view.frame.size.height);
            
            scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 650);
            [UIView commitAnimations];
        });
        
    }
    
    
    else
    {
        
    }
    
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    
    UITextField *mtextFeild=textField;
    
    mtextFeild.text=@"";
    
    
    if ([[New_password_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Old_password_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Confirem_password_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
        BTN_Change_password.alpha=0.3;
        BTN_Change_password.userInteractionEnabled=NO;
        
        
    }
    
    else
    {
        BTN_Change_password.alpha=1.0;
        BTN_Change_password.userInteractionEnabled=YES;
        
    }
    
    
    
    
    
    return true;
    
}



- (BOOL)textField:(UITextField *) textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    
    NSUInteger oldLength = [textField.text length];
    NSUInteger replacementLength = [string length];
    NSUInteger rangeLength = range.length;
    
    NSUInteger newLength = oldLength - rangeLength + replacementLength;
    
     if ([[New_password_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Old_password_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Confirem_password_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
        BTN_Change_password.alpha=0.3;
        BTN_Change_password.userInteractionEnabled=NO;
        
        
    }
    
    else
    {
        BTN_Change_password.alpha=1.0;
        BTN_Change_password.userInteractionEnabled=YES;
        
    }
    
    
    
    
    
    BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
    
    
    if (textField.tag==004 || textField.tag==005) {
        
        
        
        return newLength <= MAXLENGTH || returnKey;
    }
    
    else if (textField.tag==006)
    {
        int length = [self getLength:textField.text];
        //NSLog(@"Length  =  %d ",length);
        
        if(length == 10)
        {
            if(range.length == 0)
                return NO;
        }
        
        
    }
    
    return YES;
    
    
}





@end
