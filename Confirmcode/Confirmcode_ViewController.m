//
//  Confirmcode_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 03/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Confirmcode_ViewController.h"
#import "Selfi_ViewController.h"
#import "API.h"
#import "JSON.h"
#import "Term_ condition_ViewController.h"
#import "Utility.h"


@interface Confirmcode_ViewController ()

@end

@implementation Confirmcode_ViewController
@synthesize PhoneVerify_code;
@synthesize Phone_number;


#pragma mark - -*********************
#pragma mark       viewDidLoad Mthodes
#pragma mark - -*********************



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
     appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    UIImageView *backGround=[[UIImageView alloc]init];
    backGround.image=[UIImage imageNamed:@"main_slider_bg.jpg"];
    backGround.frame=CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height);
    backGround.userInteractionEnabled=YES;
    [self.view addSubview:backGround];
    

    
    self.navigationController.navigationBarHidden=YES;
    
    scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,[[UIScreen mainScreen]bounds].size.width,[[UIScreen mainScreen]bounds].size.height)];
    scrollview.showsVerticalScrollIndicator=YES;
    scrollview.scrollEnabled=YES;
    scrollview.userInteractionEnabled=YES;
    scrollview.backgroundColor = [UIColor clearColor];
    [backGround addSubview:scrollview];

    
    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    MTitle = [[UILabel alloc] init];
    MTitle.textColor = [UIColor blackColor];
    [MTitle setFrame:CGRectMake(0,10,self.view.frame.size.width, 40)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"Confirmation";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:MTitle];
    
    
    
    ////////////////////////Confirmation Code textfeild/////////////////
    
    
        Confir_code_LB = [[UILabel alloc] init];
        Confir_code_LB.textColor = [UIColor blackColor];
        [Confir_code_LB setFrame:CGRectMake(10,MTitle.frame.origin.y+50,200, 30)];
        Confir_code_LB.backgroundColor=[UIColor clearColor];
        Confir_code_LB.textColor=[UIColor whiteColor];
        Confir_code_LB.userInteractionEnabled=NO;
        [Confir_code_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
        Confir_code_LB.text= @"Enter Confirmation Code";
        Confir_code_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
        Confir_code_LB.textAlignment=NSTextAlignmentLeft;
        [scrollview addSubview:Confir_code_LB];
    
    
        Confir_code_TXT = [[UITextField alloc] initWithFrame:CGRectMake(10,Confir_code_LB.frame.origin.y+10, self.view.frame.size.width-20, 40)];
        Confir_code_TXT.borderStyle = UITextBorderStyleNone;
        Confir_code_TXT.font = [UIFont systemFontOfSize:15];
        Confir_code_TXT.keyboardType = UIKeyboardTypeDefault;
        Confir_code_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
        Confir_code_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
        Confir_code_TXT.delegate = self;
    Confir_code_TXT.text=@"";
        Confir_code_TXT.backgroundColor=[UIColor clearColor];
        Confir_code_TXT.textColor=[UIColor whiteColor];
        [Confir_code_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
        Confir_code_TXT.tag=006;
        Confir_code_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
        [Confir_code_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
        [scrollview addSubview: Confir_code_TXT];
    
//        UIImageView *imgView_Confir_code = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 17, 17)];
//        imgView_Confir_code.image = [UIImage imageNamed:@"email.png"];
//        UIView *paddingView_Confir_code = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
//        [paddingView_Confir_code addSubview:imgView_Confir_code];
        [Confir_code_TXT setRightViewMode:UITextFieldViewModeAlways];
        //[Confir_code_TXT setRightView:paddingView_Confir_code];
    
    
    
    Resend_verification_number=[[UILabel alloc]init];
    Resend_verification_number.backgroundColor=[UIColor clearColor];
    Resend_verification_number.text=@"Resend verification code";
    Resend_verification_number.userInteractionEnabled=YES;
    [Resend_verification_number setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Resend_verification_number.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    UITapGestureRecognizer *gestureRecognizers = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFroms:)];
    [Resend_verification_number addGestureRecognizer:gestureRecognizers];
    gestureRecognizers.cancelsTouchesInView = NO;
    Resend_verification_number.frame = CGRectMake(10, Confir_code_TXT.frame.origin.y+40,250, 40.0);
    Resend_verification_number.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Resend_verification_number];

    
    
    Wrong_number=[[UILabel alloc]init];
    Wrong_number.backgroundColor=[UIColor clearColor];
    Wrong_number.text=@"Wrong Number ?";
    Wrong_number.userInteractionEnabled=YES;
    [Wrong_number setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Wrong_number.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
    [Wrong_number addGestureRecognizer:gestureRecognizer];
    gestureRecognizer.cancelsTouchesInView = NO;
   Wrong_number.frame = CGRectMake(10, Resend_verification_number.frame.origin.y+50,150, 40.0);
    Wrong_number.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Wrong_number];

    
    
    ///////////////////////////// Term and condision ///////////////////////
    
  Check_Box = [[UIImageView alloc] initWithFrame:CGRectMake(8, Wrong_number.frame.origin.y+58, 30, 30)];
    Check_Box.image = [UIImage imageNamed:@"uncheck_checkbox.png"];
    Check_Box.contentMode = UIViewContentModeScaleToFill;
    Check_Box.userInteractionEnabled=YES;
    [scrollview addSubview:Check_Box];
    
    
    UITapGestureRecognizer *gestureRecognizers_Check_Box = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFroms_check:)];
    [Check_Box addGestureRecognizer:gestureRecognizers_Check_Box];
    gestureRecognizers_Check_Box.cancelsTouchesInView = NO;

    
    
    TermCondision = [[UILabel alloc] init];
    TermCondision.userInteractionEnabled=YES;
    TermCondision.textColor = [UIColor blackColor];
    [TermCondision setFrame:CGRectMake(40,Wrong_number.frame.origin.y+50,300, 50)];
    TermCondision.backgroundColor=[UIColor clearColor];
    TermCondision.userInteractionEnabled=NO;
    [TermCondision setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    
    NSMutableAttributedString * string = [[NSMutableAttributedString alloc] initWithString:@"I accept all Terms and Conditions"];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(0,13)];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0] range:NSMakeRange(13,6)];
    //     [string addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(13, 5)];
    
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] range:NSMakeRange(19,4)];
    
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0] range:NSMakeRange(23,10)];
    
    TermCondision.attributedText= string;
    TermCondision.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:TermCondision];
    TermCondision.userInteractionEnabled=YES;

    
    UITapGestureRecognizer *TermCondision_gestureRecognizers = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TermCondision_handleTapFroms:)];
    [TermCondision addGestureRecognizer:TermCondision_gestureRecognizers];
    
    ///////////////////////////// Sign up button///////////////////////
    
    BTN_sign_In = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [BTN_sign_In addTarget:self
                    action:@selector(aMethod:)
          forControlEvents:UIControlEventTouchUpInside];
    BTN_sign_In.backgroundColor=[UIColor colorWithRed:228.0f/255.0f green:183.0f/255.0f blue:44.0f/255.0f alpha:1.0];
    [BTN_sign_In setTitle:@"Verify!" forState:UIControlStateNormal];
    [BTN_sign_In setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    [BTN_sign_In setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    BTN_sign_In.layer.cornerRadius=20;
    BTN_sign_In.clipsToBounds = YES;
    BTN_sign_In.frame = CGRectMake(30, TermCondision.frame.origin.y+70,self.view.frame.size.width-60, 44.0);
    [scrollview  addSubview:BTN_sign_In];
    
    check_value=false;
    
}
-(void)viewWillAppear:(BOOL)animated
{
    
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
#pragma mark   Back TapGesture Method
#pragma mark - -*********************



- (void) handleTapFrom: (UITapGestureRecognizer *)recognizer
{
        [self.navigationController popViewControllerAnimated:YES];
   
}

#pragma mark - -*********************
#pragma mark  Login _ With _ verification code
#pragma mark - -*********************


-(void)CalltheServer_
{
    self.view.userInteractionEnabled=NO;
  
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&phone_number=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],Phone_number]:[NSString stringWithFormat:@"%@verify_mobile",[Utility API_link_url]]];
        
        NSLog(@"%@",responseString);
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
        PhoneVerify_code=[[dict valueForKey:@"post_data"]valueForKey:@"Verification_Code"];
       
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
    
     self.view.userInteractionEnabled=YES;
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
#pragma mark   TapGesture For Term And Condision
#pragma mark - -*********************

- (void) TermCondision_handleTapFroms: (UITapGestureRecognizer *)recognizer
{
    Term__condition_ViewController *objTerm__condition_ViewController=[[Term__condition_ViewController alloc]init];
    [self.navigationController pushViewController:objTerm__condition_ViewController animated:YES];
    
}
#pragma mark - -*********************
#pragma mark   TapGesture For Resend Code
#pragma mark - -*********************

- (void) handleTapFroms: (UITapGestureRecognizer *)recognizer
{
    
    [self mActivityIndicater];
    [self performSelector:@selector(CalltheServer_) withObject:nil afterDelay:0.5];
}
#pragma mark - -*********************
#pragma mark   TapGesture For Check Uncheck Box
#pragma mark - -*********************

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
-(void)aMethod:(UIButton *)sender
{
    if ([Confir_code_TXT.text isEqualToString:PhoneVerify_code]) {
        
        if (check_value==true) {
            
            Selfi_ViewController *OBJSelfi_ViewController=[[Selfi_ViewController alloc]init];
            [self.navigationController pushViewController:OBJSelfi_ViewController animated:YES];
            
        }
        else
        {
            UIAlertView *ALTER=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please read and accept the term and conditions." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [ALTER show];
        }
        
    }
    else
    {
        ////////////////////////////////////////////////////////////////////////////////////////
        // Edited by Appsbee on 17th August 2016 for Other issues point no-2////////////////////
        ////////////////////////////////////////////////////////////////////////////////////////
        UIAlertView *ALTER=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please recheck your verification code and try again." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [ALTER show];
   
    }
}
#pragma mark - -*********************
#pragma mark   UIText Feild Delegate Method
#pragma mark - -*********************

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    
    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    
    UITextField *mtextFeild=textField;
    
    mtextFeild.text=@"";
    
    
    if ([mtextFeild.text length]==0) {
        
        BTN_sign_In.alpha=0.3;
        BTN_sign_In.userInteractionEnabled=NO;
    }
    else
    {
        BTN_sign_In.alpha=1.0;
        BTN_sign_In.userInteractionEnabled=YES;
    }

    return true;
}

- (BOOL)textField:(UITextField *) textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    
    NSUInteger oldLength = [textField.text length];
    NSUInteger replacementLength = [string length];
    NSUInteger rangeLength = range.length;
    
    NSUInteger newLength = oldLength - rangeLength + replacementLength;
    
    if (newLength==0) {
        
        BTN_sign_In.alpha=0.3;
        BTN_sign_In.userInteractionEnabled=NO;
        
    }
    else
    {
        BTN_sign_In.alpha=1.0;
        BTN_sign_In.userInteractionEnabled=YES;
    }
    return YES;
}

#pragma mark - -*********************
#pragma mark   formatNumber Leght Number Method
#pragma mark - -*********************
-(NSString*)formatNumber:(NSString*)mobileNumber
{
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
    
    NSLog(@"%@", mobileNumber);
    
    int length = [mobileNumber length];
    if(length > 10)
    {
        mobileNumber = [mobileNumber substringFromIndex: length-10];
        NSLog(@"%@", mobileNumber);
        
    }
        return mobileNumber;
}
-(int)getLength:(NSString*)mobileNumber
{
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
    int length = [mobileNumber length];
    return length;
  }
@end
