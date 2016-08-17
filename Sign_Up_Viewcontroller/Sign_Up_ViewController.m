//
//  Sign_Up_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 02/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Sign_Up_ViewController.h"
#import "Email_validation.h"
#import "Selfi_ViewController.h"
#import "Login_ViewController.h"
#import "Confirmcode_ViewController.h"
#import "Utility.h"
#import "API.h"
#import "JSON.h"
#define MAXLENGTH 7
#define MINILENGTH 5


@interface Sign_Up_ViewController ()

@end

@implementation Sign_Up_ViewController
@synthesize activeTextView;

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
#pragma mark       AutoScroll UItextfeild Mthodes
#pragma mark - -*********************



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

#pragma mark - -*********************
#pragma mark      viewDidLoad
#pragma mark - -*********************



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
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
    
   
    
    //////////////////// Hide Navigation bar\\\\\\\\\\\\\\

    
    locationManager = [[CLLocationManager alloc] init];
    
    locationManager.delegate=self;
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    locationManager.distanceFilter=kCLDistanceFilterNone;
    [locationManager requestWhenInUseAuthorization];
    [locationManager startMonitoringSignificantLocationChanges];
    
    [locationManager startUpdatingLocation];

    
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
    
    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    MTitle = [[UILabel alloc] init];
    MTitle.textColor = [UIColor blackColor];
    [MTitle setFrame:CGRectMake(0,10,self.view.frame.size.width, 40)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"Sign Up";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:MTitle];
    
    
    ///////////////////////////// First Name\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Fname_LB = [[UILabel alloc] init];
    Fname_LB.textColor = [UIColor blackColor];
    [Fname_LB setFrame:CGRectMake(30,MTitle.frame.origin.y+50,100, 30)];
    Fname_LB.backgroundColor=[UIColor clearColor];
    Fname_LB.textColor=[UIColor whiteColor];
    Fname_LB.userInteractionEnabled=NO;
    [Fname_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Fname_LB.text= @"First Name";
    Fname_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Fname_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Fname_LB];

//    ////////////////////////
//    
//       [[NSUserDefaults standardUserDefaults]setValue:Cpassword_TXT.text forKey:@"pro_ConfirMpassword"];
//    [[NSUserDefaults standardUserDefaults]setValue:Pnumber_TXT.text forKey:@"pro_MOBILE"];
//    
/////////////////////////
    
    
    Fname_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,Fname_LB.frame.origin.y+10,self.view.frame.size.width-60, 40)];

    Fname_TXT.font = [UIFont systemFontOfSize:15];
 // Fname_TXT.text = @"Bhushan";
    Fname_TXT.text=@"";
    Fname_TXT.keyboardType = UIKeyboardTypeDefault;
    Fname_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Fname_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Fname_TXT.delegate = self;
    Fname_TXT.backgroundColor=[UIColor clearColor];
    Fname_TXT.textColor=[UIColor whiteColor];
    [Fname_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Fname_TXT.tag=001;
     Fname_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
     [Fname_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
   
    
    
    
    UIImageView *imgView_Fname = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 17, 17)];
    imgView_Fname.image = [UIImage imageNamed:@"Demo_User.png"];
    UIView *paddingView_Fname = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [paddingView_Fname addSubview:imgView_Fname];
    [Fname_TXT setRightViewMode:UITextFieldViewModeAlways];
    [Fname_TXT setRightView:paddingView_Fname];
    
    [scrollview addSubview:Fname_TXT];

    
        ///////////////////////////// Last Name\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Lname_LB = [[UILabel alloc] init];
    Lname_LB.textColor = [UIColor blackColor];
    [Lname_LB setFrame:CGRectMake(30,Fname_TXT.frame.origin.y+50,100, 30)];
    Lname_LB.backgroundColor=[UIColor clearColor];
    Lname_LB.textColor=[UIColor whiteColor];
    Lname_LB.userInteractionEnabled=NO;
    [Lname_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Lname_LB.text= @"Last Name";
    Lname_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Lname_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Lname_LB];

    
    Lname_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, Lname_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
   // Lname_TXT.text=@"Rana";
    Lname_TXT.text=@"";
    Lname_TXT.borderStyle = UITextBorderStyleNone;
    Lname_TXT.font = [UIFont systemFontOfSize:15];
    Lname_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Lname_TXT.keyboardType = UIReturnKeyDefault;
    Lname_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Lname_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Lname_TXT.delegate = self;
    Lname_TXT.backgroundColor=[UIColor clearColor];
    Lname_TXT.textColor=[UIColor whiteColor];
    Lname_TXT.tag=002;
     [Lname_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Lname_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Lname_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:Lname_TXT];
    
    UIImageView *imgView_Lname = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 17, 17)];
    imgView_Lname.image = [UIImage imageNamed:@"Demo_User.png"];
    UIView *paddingView_Lname = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [paddingView_Lname addSubview:imgView_Lname];
    [Lname_TXT setRightViewMode:UITextFieldViewModeAlways];
    [Lname_TXT setRightView:paddingView_Lname];
    
    [scrollview addSubview:Lname_TXT];

    
    ///////////////////////////// Email Id\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    email_LB = [[UILabel alloc] init];
    email_LB.textColor = [UIColor blackColor];
    [email_LB setFrame:CGRectMake(30,Lname_TXT.frame.origin.y+50,100, 30)];
    email_LB.backgroundColor=[UIColor clearColor];
    email_LB.textColor=[UIColor whiteColor];
    email_LB.userInteractionEnabled=NO;
    [email_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    email_LB.text= @"Email";
    email_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    email_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:email_LB];


    
    email_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,email_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
   /// email_TXT.text=@"ranabhushan87@gmail.com";
     email_TXT.text=@"";
    email_TXT.borderStyle = UITextBorderStyleNone;
    email_TXT.font = [UIFont systemFontOfSize:15];
    email_TXT.keyboardType = UIKeyboardTypeEmailAddress;
    email_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    email_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    email_TXT.delegate = self;
    email_TXT.backgroundColor=[UIColor clearColor];
    email_TXT.textColor=[UIColor whiteColor];
    [email_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    email_TXT.tag=003;
    [email_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];

    email_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [email_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:email_TXT];
    
    UIImageView *imgView_email = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 17, 17)];
    imgView_email.image = [UIImage imageNamed:@"email.png"];
    UIView *paddingView_email = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [paddingView_email addSubview:imgView_email];
    [email_TXT setRightViewMode:UITextFieldViewModeAlways];
     email_TXT.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [email_TXT setRightView:paddingView_email];
    

    
      ///////////////////////////// Password \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
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
  ///  Passwprd_TXT.text=@"123456";
     Passwprd_TXT.text=@"";
    Passwprd_TXT.borderStyle = UITextBorderStyleNone;
    Passwprd_TXT.font = [UIFont systemFontOfSize:15];
    Passwprd_TXT.secureTextEntry=YES;
    Passwprd_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Passwprd_TXT.keyboardType = UIReturnKeyDefault;
    Passwprd_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Passwprd_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Passwprd_TXT.delegate = self;
    Passwprd_TXT.backgroundColor=[UIColor clearColor];
    Passwprd_TXT.textColor=[UIColor whiteColor];
    Passwprd_TXT.tag=004;
    [Passwprd_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
     Passwprd_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Passwprd_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview: Passwprd_TXT];
    
    UIImageView *imgView_Passwprd = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 17, 17)];
    imgView_Passwprd.image = [UIImage imageNamed:@"lock_Demo.png"];
    UIView *paddingView_Passwprd = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [paddingView_Passwprd addSubview:imgView_Passwprd];
    [Passwprd_TXT setRightViewMode:UITextFieldViewModeAlways];
    [Passwprd_TXT setRightView:paddingView_Passwprd];

    
    
    /////////////////////////////Confirm Password \\\\\\\\\\\\\\\\\\\\\\\\\\

    
    Cpassword_LB = [[UILabel alloc] init];
    Cpassword_LB.textColor = [UIColor blackColor];
    [Cpassword_LB setFrame:CGRectMake(30,Passwprd_TXT.frame.origin.y+50,150, 30)];
    Cpassword_LB.backgroundColor=[UIColor clearColor];
    Cpassword_LB.textColor=[UIColor whiteColor];
    Cpassword_LB.userInteractionEnabled=NO;
    [Cpassword_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Cpassword_LB.text= @"Confirm Password";
    Cpassword_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Cpassword_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Cpassword_LB];

    
    
    Cpassword_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, Cpassword_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
  ///  Cpassword_TXT.text=@"123456";
     Cpassword_TXT.text=@"";
    Cpassword_TXT.borderStyle = UITextBorderStyleNone;
    Cpassword_TXT.font = [UIFont systemFontOfSize:15];
    Cpassword_TXT.secureTextEntry=YES;
    Cpassword_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Cpassword_TXT.keyboardType = UIReturnKeyDefault;
    Cpassword_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Cpassword_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Cpassword_TXT.delegate = self;
    Cpassword_TXT.backgroundColor=[UIColor clearColor];
    Cpassword_TXT.textColor=[UIColor whiteColor];
    Cpassword_TXT.tag=005;
    [Cpassword_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];

    Cpassword_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Cpassword_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview: Cpassword_TXT];
    
    UIImageView *imgView_Cpassword = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 17, 17)];
    imgView_Cpassword.image = [UIImage imageNamed:@"lock_Demo.png"];
    UIView *paddingView_Cpassword = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [paddingView_Cpassword addSubview:imgView_Cpassword];
    [Cpassword_TXT setRightViewMode:UITextFieldViewModeAlways];
    [Cpassword_TXT setRightView:paddingView_Cpassword];
    
    /////////////////////////////Phone naumber \\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Pnumber_LB = [[UILabel alloc] init];
    Pnumber_LB.textColor = [UIColor blackColor];
    [Pnumber_LB setFrame:CGRectMake(30,Cpassword_TXT.frame.origin.y+50,100, 30)];
    Pnumber_LB.backgroundColor=[UIColor clearColor];
    Pnumber_LB.textColor=[UIColor whiteColor];
    Pnumber_LB.userInteractionEnabled=NO;
    [Pnumber_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Pnumber_LB.text= @"Phone No";
    Pnumber_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Pnumber_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Pnumber_LB];

    

    Pnumber_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,Pnumber_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    /// Pnumber_TXT.text=@"(956)-959-2506";
    Pnumber_TXT.text=@"";
    Pnumber_TXT.borderStyle = UITextBorderStyleNone;
    Pnumber_TXT.font = [UIFont systemFontOfSize:15];
    Pnumber_TXT.keyboardType = UIKeyboardTypeNumberPad;
    Pnumber_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Pnumber_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Pnumber_TXT.delegate = self;
    Pnumber_TXT.backgroundColor=[UIColor clearColor];
    Pnumber_TXT.textColor=[UIColor whiteColor];
    Pnumber_TXT.tag=006;
    [Pnumber_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Pnumber_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Pnumber_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview: Pnumber_TXT];
    
    UIImageView *imgView_Pnumber = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 17, 17)];
    imgView_Pnumber.image = [UIImage imageNamed:@"call.png"];
    UIView *paddingView_Pnumber = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [paddingView_Pnumber addSubview:imgView_Pnumber];
    [Pnumber_TXT setRightViewMode:UITextFieldViewModeAlways];
    [Pnumber_TXT setRightView:paddingView_Pnumber];
    
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    Pnumber_TXT.inputAccessoryView = numberToolbar;
    
    
    //////////////////////////Show static message/////////////////
    
    Show_text = [[UILabel alloc] init];
    Show_text.textColor = [UIColor blackColor];
    Show_text.numberOfLines=0;
    [Show_text setFrame:CGRectMake(30,Pnumber_TXT.frame.origin.y+50,self.view.frame.size.width-40, 30)];
    Show_text.backgroundColor=[UIColor clearColor];
    Show_text.textColor=[UIColor whiteColor];
    Show_text.userInteractionEnabled=NO;
    [Show_text setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    NSMutableParagraphStyle *style  = [[NSMutableParagraphStyle alloc] init];
    style.minimumLineHeight = 18.f;
    style.maximumLineHeight = 22.f;
    NSDictionary *attributtes = @{NSParagraphStyleAttributeName : style,};
    
    Show_text.attributedText = [[NSAttributedString alloc] initWithString:@"We'll send a Verification code via SMS to confirm your mobile number"
                                                                  attributes:attributtes];
    Show_text.textAlignment=NSTextAlignmentCenter;

    
    
 //   Show_text.text= @"We'll send a Verification code via SMS to confirm your mobile number";
    Show_text.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Show_text.textAlignment=NSTextAlignmentLeft;
    [Show_text sizeToFit];
    [scrollview addSubview:Show_text];

    
    ///////////////////////////// Sign up button///////////////////////
    
    
    BTN_sign_In = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [BTN_sign_In addTarget:self
                    action:@selector(NEXT_VIEW:)
          forControlEvents:UIControlEventTouchUpInside];
    BTN_sign_In.backgroundColor=[UIColor colorWithRed:218.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1.0];
    [BTN_sign_In setTitle:@"Next" forState:UIControlStateNormal];
    [BTN_sign_In setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    [BTN_sign_In setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    
    
    BTN_sign_In.alpha=0.3;
    BTN_sign_In.userInteractionEnabled=NO;
    BTN_sign_In.layer.cornerRadius=20;
    BTN_sign_In.clipsToBounds = YES;
    BTN_sign_In.frame = CGRectMake(30,Show_text.frame.origin.y+70,self.view.frame.size.width-60, 44.0);
    [scrollview addSubview:BTN_sign_In];
    
    
     ///////////////////////////// Bottom  ///////////////////////
    
    BTN_Dont_account = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [BTN_Dont_account addTarget:self
                         action:@selector(back)
               forControlEvents:UIControlEventTouchUpInside];
    [BTN_Dont_account setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    
    
    
    
    
    
    
    
    //////////////////// OR \\\\\\\\\\\\\\
    
    Mlable = [[UILabel alloc] init];
    Mlable.textColor = [UIColor blackColor];
    [Mlable setFrame:CGRectMake(30,BTN_sign_In.frame.origin.y+40,self.view.frame.size.width-60, 40)];
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
    [BTN_Facebook setTitle:@"SIGN UP WITH FACEBOOK" forState:UIControlStateNormal];
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
    [BTN_Google_Plues setTitle:@"SIGN UP WITH GOOGLE+" forState:UIControlStateNormal];
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
    
    
    

    
    
    
    
    NSMutableAttributedString *commentString = [[NSMutableAttributedString alloc] initWithString:@"I already have an account"];
    
    [commentString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [commentString length])];
    
    
    [BTN_Dont_account setAttributedTitle:commentString forState:UIControlStateNormal];
    
    [BTN_Dont_account setTintColor:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0]];
    
    BTN_Dont_account.frame = CGRectMake(30, BTN_Google_Plues.frame.origin.y+BTN_Google_Plues.frame.size.height+5, self.view.frame.size.width-60, 40.0);
    [scrollview addSubview:BTN_Dont_account];
    
    
  ///  self.view.backgroundColor=[UIColor whiteColor];
    
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 760);
    
    //
}




-(void)Facebook:(UIButton *)sender
{
    
    
    
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





#pragma mark - -*********************
#pragma mark    Back Button Action
#pragma mark - -*********************


-(void)back
{
    
    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
    NSDictionary * dicts = [defs dictionaryRepresentation];
    for (id key in dicts) {
        [defs removeObjectForKey:key];
    }
    [defs synchronize];
    
    Login_ViewController *OBJSelfi_ViewController=[[Login_ViewController alloc]init];
    [self.navigationController pushViewController:OBJSelfi_ViewController animated:YES];
    
    
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
#pragma mark  KeyBoard Top Done And aclcel Button
#pragma mark - -*********************


-(void)cancelNumberPad{
    
    [Pnumber_TXT resignFirstResponder];
    Pnumber_TXT.text = @"";
    
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 580);
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view endEditing:YES];
        [UIView commitAnimations];
    });
    
   


    
    if ([[Fname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Lname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[email_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[Passwprd_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Cpassword_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Pnumber_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
        BTN_sign_In.alpha=0.3;
        BTN_sign_In.userInteractionEnabled=NO;
        
        
    }
    
    else
    {
        BTN_sign_In.alpha=1.0;
        BTN_sign_In.userInteractionEnabled=YES;
        
    }

    
   }

-(void)doneWithNumberPad{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 580);
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view endEditing:YES];
        [UIView commitAnimations];
    });

   
    [Pnumber_TXT resignFirstResponder];
}


#pragma mark - -*********************
#pragma mark      Next Button Action
#pragma mark - -*********************

-(void)NEXT_VIEW:(UIButton *)sender
{
    
    NSLog(@"%lu",(unsigned long)Pnumber_TXT.text.length);
    
    
    NSString *myRegex = @"[A-Z0-9a-z_ ]*";
    NSPredicate *myTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", myRegex];
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
    
    
    
    if ([[Fname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Lname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[email_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[Passwprd_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Cpassword_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Pnumber_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
        if ([[Fname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
            
            
            
            [Fname_TXT shake:10
                   withDelta:5.0
                    andSpeed:0.04
              shakeDirection:ShakeDirectionHorizontal];
            
            
            
        }
        
        if ([[Lname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
            
            
            
            [Lname_TXT shake:10
                      withDelta:5.0
                       andSpeed:0.04
                 shakeDirection:ShakeDirectionHorizontal];
        }

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

        
        if ([[Cpassword_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
            
            
            
            [Cpassword_TXT shake:10
                   withDelta:5.0
                    andSpeed:0.04
              shakeDirection:ShakeDirectionHorizontal];
            
            
            
        }
        
        if ([[Pnumber_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
            
            
            
            [Pnumber_TXT shake:10
                      withDelta:5.0
                       andSpeed:0.04
                 shakeDirection:ShakeDirectionHorizontal];
        }

        
        
    }
    else if(![Email_validation validateEmail:[email_TXT text]]) {
        // user entered invalid email address
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Enter a valid email address." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
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
    else if (![Passwprd_TXT.text isEqualToString:Cpassword_TXT.text])
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Passwords mismatch. Try again?" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert2 show];
    }
    
    else if ([Pnumber_TXT.text length]<14)
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Wrong phone number Try again?" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert2 show];
    }

        else {
            
            
            [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:@"pro_image"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
        
        [self mActivityIndicater];
        [self performSelector:@selector(CalltheServer_Email) withObject:nil afterDelay:0.5];
        
    }
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 580);
    scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view endEditing:YES];
    
}

#pragma mark - -*********************
#pragma mark  Login _ With _ verification code
#pragma mark - -*********************


-(void)CalltheServer_Email
{
    
    
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        
        
        NSString *unfilteredString = Pnumber_TXT.text;
        NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"] invertedSet];
        NSString *resultString = [[unfilteredString componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];

     
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&phone_number=%@&email_id=%@",[Utility Pigeon_security_token],resultString,email_TXT.text]:[NSString stringWithFormat:@"%@signup",[Utility API_link_url]]];
        
        NSLog(@"%@",responseString);
    
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            
            
            
            
            [[NSUserDefaults standardUserDefaults]setValue:Fname_TXT.text forKey:@"pro_User_name_Fname"];
            [[NSUserDefaults standardUserDefaults]setValue:Lname_TXT.text forKey:@"pro_User_last_name"];
            [[NSUserDefaults standardUserDefaults]setValue:email_TXT.text forKey:@"pro_User_Email_Id"];
            [[NSUserDefaults standardUserDefaults]setValue:Passwprd_TXT.text forKey:@"pro_Password"];
             [[NSUserDefaults standardUserDefaults]setValue:Cpassword_TXT.text forKey:@"pro_ConfirMpassword"];
           [[NSUserDefaults standardUserDefaults]setValue:Pnumber_TXT.text forKey:@"pro_MOBILE"];
            
            
            
            
            
            [[NSUserDefaults standardUserDefaults]synchronize];
            

            
            Confirmcode_ViewController  *OBJConfirmcode_ViewController=[[Confirmcode_ViewController alloc]init];
            OBJConfirmcode_ViewController.PhoneVerify_code=[[dict valueForKey:@"post_data"]valueForKey:@"Verification_Code"];
            OBJConfirmcode_ViewController.Phone_number=Pnumber_TXT.text;
            
            [self.navigationController pushViewController:OBJConfirmcode_ViewController animated:YES];
            
            
        }
        
        else
        {
            alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
            
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
#pragma mark      UItextfeild Delegate Method
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
    
    
    if ([[Fname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Lname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[email_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[Passwprd_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Cpassword_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Pnumber_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
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
    
    if ([[Fname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Lname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[email_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[Passwprd_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Cpassword_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Pnumber_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || newLength==0) {
        
        BTN_sign_In.alpha=0.3;
        BTN_sign_In.userInteractionEnabled=NO;

        
    }
    
    else
    {
        BTN_sign_In.alpha=1.0;
        BTN_sign_In.userInteractionEnabled=YES;

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
        
        if(length == 3)
        {
            NSString *num = [self formatNumber:textField.text];
            textField.text = [NSString stringWithFormat:@"(%@) ",num];
            if(range.length > 0)
                textField.text = [NSString stringWithFormat:@"%@",[num substringToIndex:3]];
        }
        else if(length == 6)
        {
            NSString *num = [self formatNumber:textField.text];
            //NSLog(@"%@",[num  substringToIndex:3]);
            //NSLog(@"%@",[num substringFromIndex:3]);
            textField.text = [NSString stringWithFormat:@"(%@) %@-",[num  substringToIndex:3],[num substringFromIndex:3]];
            if(range.length > 0)
                textField.text = [NSString stringWithFormat:@"(%@) %@",[num substringToIndex:3],[num substringFromIndex:3]];
        }

    }
    
    return YES;
    
    
}


#pragma mark - -*********************
#pragma mark  formatNumber Number and Lengh
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




@end
