//
//  Edit_Insurance_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 13/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Edit_Insurance_ViewController.h"
#import "Profile_ViewController.h"
#import "Vechile_Info_ViewController.h"
#import "Utility.h"


@interface Edit_Insurance_ViewController ()

@end

@implementation Edit_Insurance_ViewController
@synthesize activeTextView;


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
    
    Dic_Insurance=[[NSMutableDictionary alloc]init];
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
    //
    //    ///////////////////////////// Next Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    //
    //    Next_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [Next_BTN addTarget:self
    //                 action:@selector(Next:)
    //       forControlEvents:UIControlEventTouchUpInside];
    //    [Next_BTN setImage:[UIImage imageNamed:@"next_.png"] forState:UIControlStateNormal];
    //
    //
    //    Next_BTN.frame = CGRectMake(self.view.frame.size.width-50,10,49,26);
    //    [scrollview addSubview:Next_BTN];
    
    
    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    MTitle = [[UILabel alloc] init];
    MTitle.textColor = [UIColor blackColor];
    [MTitle setFrame:CGRectMake(0,20,self.view.frame.size.width, 40)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"Insurance";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:MTitle];
    
    
    ///////////////////////////// Top View\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    TopView =[[UIView alloc]init];
    TopView.frame=CGRectMake(0, MTitle.frame.origin.y+50, self.view.frame.size.width,70);
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
    
    textlable.attributedText = [[NSAttributedString alloc] initWithString:@"Must have current state minimum auto insurance"
                                                               attributes:attributtes];
    
    textlable.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    textlable.textAlignment=NSTextAlignmentCenter;
    [TopView addSubview:textlable];
    
    
    //    ///////////////////////////// Top View Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    //
    //    scan_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //    [scan_BTN addTarget:self
    //                 action:@selector(Scan_btn:)
    //       forControlEvents:UIControlEventTouchUpInside];
    //    scan_BTN.backgroundColor=[UIColor colorWithRed:59.0f/255.0f green:89.0f/255.0f blue:132.0f/255.0f alpha:1.0];
    //    [scan_BTN setTitle:@"Take a Photo of your License" forState:UIControlStateNormal];
    //    [scan_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
    //    [scan_BTN setTitleColor:[UIColor colorWithRed:121.0f/255.0f green:194.0f/255.0f blue:233.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    //    scan_BTN.layer.cornerRadius=20;
    //    scan_BTN.clipsToBounds = YES;
    //    scan_BTN.layer.borderWidth=1;
    //    scan_BTN.layer.borderColor=[UIColor colorWithRed:121.0f/255.0f green:194.0f/255.0f blue:233.0f/255.0f alpha:1.0].CGColor;
    //    scan_BTN.frame = CGRectMake(30, textlable.frame.origin.y+65,self.view.frame.size.width-60, 45.0);
    //    [TopView addSubview:scan_BTN];
    
    //////////////////////////
    
    
    
    ///////////////////////////// First Name\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Insurance_name_LB = [[UILabel alloc] init];
    Insurance_name_LB.textColor = [UIColor blackColor];
    [Insurance_name_LB setFrame:CGRectMake(30,TopView.frame.origin.y+90,250, 30)];
    Insurance_name_LB.backgroundColor=[UIColor clearColor];
    Insurance_name_LB.textColor=[UIColor whiteColor];
    Insurance_name_LB.userInteractionEnabled=NO;
    [Insurance_name_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Insurance_name_LB.text= @"Name of Insured Person";
    Insurance_name_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Insurance_name_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Insurance_name_LB];
    
    
    
    Insurance_name_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,Insurance_name_LB.frame.origin.y+10,self.view.frame.size.width-60, 40)];
    Insurance_name_TXT.borderStyle = UITextBorderStyleNone;
    Insurance_name_TXT.font = [UIFont systemFontOfSize:15];
    Insurance_name_TXT.keyboardType = UIKeyboardTypeDefault;
    Insurance_name_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Insurance_name_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Insurance_name_TXT.delegate = self;
    Insurance_name_TXT.backgroundColor=[UIColor clearColor];
    Insurance_name_TXT.textColor=[UIColor whiteColor];
    [Insurance_name_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Insurance_name_TXT.tag=001;
    Insurance_name_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Insurance_name_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [Insurance_name_TXT setRightViewMode:UITextFieldViewModeAlways];
    
    [scrollview addSubview:Insurance_name_TXT];
    
    
    ///////////////////////////// Last Name\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Insurance_Provider_LB = [[UILabel alloc] init];
    Insurance_Provider_LB.textColor = [UIColor blackColor];
    [Insurance_Provider_LB setFrame:CGRectMake(30,Insurance_name_TXT.frame.origin.y+50,250, 30)];
    Insurance_Provider_LB.backgroundColor=[UIColor clearColor];
    Insurance_Provider_LB.textColor=[UIColor whiteColor];
    Insurance_Provider_LB.userInteractionEnabled=NO;
    [Insurance_Provider_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Insurance_Provider_LB.text= @"Insurance Provider";
    Insurance_Provider_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Insurance_Provider_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Insurance_Provider_LB];
    
    
    Insurance_Provider_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, Insurance_Provider_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Insurance_Provider_TXT.borderStyle = UITextBorderStyleNone;
    Insurance_Provider_TXT.font = [UIFont systemFontOfSize:15];
    Insurance_Provider_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Insurance_Provider_TXT.keyboardType = UIReturnKeyDefault;
    Insurance_Provider_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Insurance_Provider_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Insurance_Provider_TXT.delegate = self;
    Insurance_Provider_TXT.backgroundColor=[UIColor clearColor];
    Insurance_Provider_TXT.textColor=[UIColor whiteColor];
    Insurance_Provider_TXT.tag=002;
    [Insurance_Provider_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Insurance_Provider_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Insurance_Provider_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:Insurance_Provider_TXT];
    [Insurance_Provider_TXT setRightViewMode:UITextFieldViewModeAlways];
    
    
    
    
    
    ///////////////////////////// Email Id\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Policy_Number_LB = [[UILabel alloc] init];
    Policy_Number_LB.textColor = [UIColor blackColor];
    [Policy_Number_LB setFrame:CGRectMake(30,Insurance_Provider_TXT.frame.origin.y+50,250, 30)];
    Policy_Number_LB.backgroundColor=[UIColor clearColor];
    Policy_Number_LB.textColor=[UIColor whiteColor];
    Policy_Number_LB.userInteractionEnabled=NO;
    [Policy_Number_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Policy_Number_LB.text= @"Policy Number";
    Policy_Number_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Policy_Number_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Policy_Number_LB];
    
    
    
    Policy_Number_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,Policy_Number_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Policy_Number_TXT.borderStyle = UITextBorderStyleNone;
    Policy_Number_TXT.font = [UIFont systemFontOfSize:15];
    Policy_Number_TXT.keyboardType = UIKeyboardTypeDefault;
    Policy_Number_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Policy_Number_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Policy_Number_TXT.delegate = self;
    Policy_Number_TXT.backgroundColor=[UIColor clearColor];
    Policy_Number_TXT.textColor=[UIColor whiteColor];
    [Policy_Number_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Policy_Number_TXT.tag=003;
    [Policy_Number_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    Policy_Number_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Policy_Number_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [Policy_Number_TXT setRightViewMode:UITextFieldViewModeAlways];
    [scrollview addSubview:Policy_Number_TXT];
    
    
    
    
    
    
    ///////////////////////////// Password \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Expiration_LB = [[UILabel alloc] init];
    Expiration_LB.textColor = [UIColor blackColor];
    [Expiration_LB setFrame:CGRectMake(30,Policy_Number_TXT.frame.origin.y+50,250, 30)];
    Expiration_LB.backgroundColor=[UIColor clearColor];
    Expiration_LB.textColor=[UIColor whiteColor];
    Expiration_LB.userInteractionEnabled=NO;
    [Expiration_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Expiration_LB.text= @"Expiration Date";
    Expiration_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Expiration_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Expiration_LB];
    
    
    Expiration_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, Expiration_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Expiration_TXT.borderStyle = UITextBorderStyleNone;
    Expiration_TXT.font = [UIFont systemFontOfSize:15];
    Expiration_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Expiration_TXT.keyboardType = UIReturnKeyDefault;
    Expiration_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Expiration_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Expiration_TXT.delegate = self;
    Expiration_TXT.backgroundColor=[UIColor clearColor];
    Expiration_TXT.textColor=[UIColor whiteColor];
    Expiration_TXT.tag=004;
    [Expiration_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Expiration_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Expiration_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    
    UIImageView *imgView_Expiration_TXT = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 14, 7)];
    imgView_Expiration_TXT.image = [UIImage imageNamed:@"dropdown-icon-2.png"];
    UIView *paddingView_Expiration_TXT = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [paddingView_Expiration_TXT addSubview:imgView_Expiration_TXT];
    [Expiration_TXT setRightViewMode:UITextFieldViewModeAlways];
    [Expiration_TXT setRightView:paddingView_Expiration_TXT];
    

    
    [scrollview addSubview:Expiration_TXT];
    [Expiration_TXT setRightViewMode:UITextFieldViewModeAlways];
    
    
    
    
    
    /////////////////////////////UIDATE PICKER\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    UIDatePicker *picker1   = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 210, 320, 216)];
    [picker1 setDatePickerMode:UIDatePickerModeDate];
    picker1.backgroundColor = [UIColor clearColor];
    [picker1 addTarget:self action:@selector(startDateSelected:) forControlEvents:UIControlEventValueChanged];
    
    //    [picker1 addSubview:toolBar];
    Expiration_TXT.inputView  = picker1; // Here birthTxt is Textfield Name replace with your name
    
    // add a toolbar with Cancel & Done button
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolBar.barStyle = UIBarStyleBlackOpaque;
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneTouched:)];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelTouched:)];
    
    // the middle button is to make the Done button align to right
    [toolBar setItems:[NSArray arrayWithObjects:cancelButton, [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], doneButton, nil]];
    
    Expiration_TXT.inputAccessoryView = toolBar;
    
    
    /////////////////////////////Confirm Password \\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Insurance_phone_number_LB = [[UILabel alloc] init];
    Insurance_phone_number_LB.textColor = [UIColor blackColor];
    [Insurance_phone_number_LB setFrame:CGRectMake(30,Expiration_TXT.frame.origin.y+50,250, 30)];
    Insurance_phone_number_LB.backgroundColor=[UIColor clearColor];
    Insurance_phone_number_LB.textColor=[UIColor whiteColor];
    Insurance_phone_number_LB.userInteractionEnabled=NO;
    [Insurance_phone_number_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Insurance_phone_number_LB.text= @"Insurance phone number";
    Insurance_phone_number_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Insurance_phone_number_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Insurance_phone_number_LB];
    
    
    Insurance_phone_number_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, Insurance_phone_number_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Insurance_phone_number_TXT.borderStyle = UITextBorderStyleNone;
    Insurance_phone_number_TXT.font = [UIFont systemFontOfSize:15];
    Insurance_phone_number_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Insurance_phone_number_TXT.keyboardType = UIKeyboardTypeNumberPad;;
    Insurance_phone_number_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Insurance_phone_number_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Insurance_phone_number_TXT.delegate = self;
    Insurance_phone_number_TXT.backgroundColor=[UIColor clearColor];
    Insurance_phone_number_TXT.textColor=[UIColor whiteColor];
    Insurance_phone_number_TXT.tag=005;
    [Insurance_phone_number_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Insurance_phone_number_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Insurance_phone_number_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:Insurance_phone_number_TXT];
    [Insurance_phone_number_TXT setRightViewMode:UITextFieldViewModeAlways];
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    
    Insurance_phone_number_TXT.inputAccessoryView = numberToolbar;
    
    
    
    //////////////////// Sign In Button\\\\\\\\\\\\\\
    
    Next_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Next_BTN addTarget:self
                 action:@selector(Save_Data:)
       forControlEvents:UIControlEventTouchUpInside];
    Next_BTN.backgroundColor=[UIColor colorWithRed:228.0f/255.0f green:183.0f/255.0f blue:44.0f/255.0f alpha:1.0];
    [Next_BTN setTitle:@"Save" forState:UIControlStateNormal];
    [Next_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    [Next_BTN setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    
    Next_BTN.layer.cornerRadius=20;
    Next_BTN.clipsToBounds = YES;
    Next_BTN.frame = CGRectMake(30, Insurance_phone_number_TXT.frame.origin.y+70,self.view.frame.size.width-60, 41.0);
    [scrollview addSubview:Next_BTN];
    

    
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
    
    
    [self mActivityIndicater];
    
    [self performSelector:@selector(Show_CallTheServer_data) withObject:nil afterDelay:0.5];

    
}

-(void)Show_CallTheServer_data
{
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"]]                                                             :[NSString stringWithFormat:@"%@insurance_detail",[Utility API_link_url]]];
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            Insurance_name_TXT.text=[[dict valueForKey:@"insurance detail"]valueForKey:@"insurance_name"];
            
            Insurance_Provider_TXT.text=[[dict valueForKey:@"insurance detail"]valueForKey:@"insurance_provider"];
            Policy_Number_TXT.text=[[dict valueForKey:@"insurance detail"]valueForKey:@"insurance_number"];
            
           
                Expiration_TXT.text=[[dict valueForKey:@"insurance detail"]valueForKey:@"expiration_date"];
                
            
            Insurance_phone_number_TXT.text=[[dict valueForKey:@"insurance detail"]valueForKey:@"insurance_phone"];
            
            
            
            
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
    
    Insurance_phone_number_TXT.text = @"";
    
    if ([[Insurance_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Insurance_Provider_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Policy_Number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[Expiration_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Insurance_phone_number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
        Next_BTN.alpha=0.3;
        Next_BTN.userInteractionEnabled=NO;
        
        
    }
    
    else
    {
        Next_BTN.alpha=1.0;
        Next_BTN.userInteractionEnabled=YES;
        
    }
    
    
    
    
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
    
    if ([[Insurance_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Insurance_Provider_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Policy_Number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[Expiration_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Insurance_phone_number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
        Next_BTN.alpha=0.3;
        Next_BTN.userInteractionEnabled=NO;
        
        
    }
    
    else
    {
        Next_BTN.alpha=1.0;
        Next_BTN.userInteractionEnabled=YES;
        
    }
    
    
    
    
    [self.view endEditing:YES];
}



- (void)cancelTouched:(UIBarButtonItem *)sender
{
    Expiration_TXT.text=@"";
    
    if ([[Insurance_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Insurance_Provider_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Policy_Number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[Expiration_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Insurance_phone_number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
        Next_BTN.alpha=0.3;
        Next_BTN.userInteractionEnabled=NO;
        
        
    }
    
    else
    {
        Next_BTN.alpha=1.0;
        Next_BTN.userInteractionEnabled=YES;
        
    }
    
    
    
    
    // hide the picker view
    [self.view endEditing:YES];
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
        [UIView commitAnimations];
    });
    
}

- (void)doneTouched:(UIBarButtonItem *)sender
{
    [self.view endEditing:YES];
    
    
    if ([Expiration_TXT.text isEqualToString:@""]) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"MM-dd-yyyy";
        Expiration_TXT.text = [formatter stringFromDate:[NSDate date]];
        
    }
    else
    {
        
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
        [UIView commitAnimations];
    });
    
    if ([[Insurance_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Insurance_Provider_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Policy_Number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[Expiration_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Insurance_phone_number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
        Next_BTN.alpha=0.3;
        Next_BTN.userInteractionEnabled=NO;
        
        
    }
    
    else
    {
        Next_BTN.alpha=1.0;
        Next_BTN.userInteractionEnabled=YES;
        
    }
    
    
    
}

- (void)startDateSelected:(id)sender
{
    
    // 2015-05-08 11:03:03 +0000
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd  HH:mm:ss Z"];
    
    NSDate *date = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",[sender date]]];
    
    
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    [dateFormatter2 setDateFormat:@"MM-dd-yyyy"];
    NSString *newDateString = [dateFormatter2 stringFromDate:date];
    
    NSLog(@"value: %@",newDateString);
    
    Expiration_TXT.text=newDateString;
    
    NSLog(@"value: %@",[sender date]);
}


-(void)Save_Data:(UIButton *)sender
{
    
    [[NSUserDefaults standardUserDefaults]setObject:@"True" forKey:@"Insurance_Info_Statues"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    
    
    if ([[Insurance_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Insurance_Provider_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Policy_Number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[Expiration_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Insurance_phone_number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
        
        
        
        
        [[NSUserDefaults standardUserDefaults]setObject:Dic_Insurance forKey:@"InsuranceView"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        
        
    }
    
    else
    {
        
        
        [self mActivityIndicater];
        
        [self performSelector:@selector(Update_CallTheServer_data) withObject:nil afterDelay:0.5];
        
    }
    
    
    
    
}

-(void)Update_CallTheServer_data
{
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        
        
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&insurance_name=%@&insurance_provider=%@&insurance_number=%@&insurance_phone_number=%@&expiration_date=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],Insurance_name_TXT.text,Insurance_Provider_TXT.text,Policy_Number_TXT.text,Insurance_phone_number_TXT.text,Expiration_TXT.text]                                                            :[NSString stringWithFormat:@"%@edit_insurancedetail",[Utility API_link_url]]];
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        ////////////////////////////////////////////////////////////////////////////////////////
        // Edited by Appsbee on 17th August 2016 for Other issues point no-3////////////////////
        ////////////////////////////////////////////////////////////////////////////////////////
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            
            alert = [[UIAlertView alloc] initWithTitle:@"Done" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
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



-(void)Skip:(UIButton *)sender
{
    [[NSUserDefaults standardUserDefaults]setObject:@"False" forKey:@"Insurance_Info_Statues"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    
    [Dic_Insurance setValue:@"" forKey:@"Insurance_name_TXT"];
    [Dic_Insurance setValue:@"" forKey:@"Insurance_Provider_TXT"];
    [Dic_Insurance setValue:@"" forKey:@"Policy_Number_TXT"];
    [Dic_Insurance setValue:@"" forKey:@"Expiration_TXT"];
    [Dic_Insurance setValue:@"" forKey:@"Insurance_phone_number_TXT"];
    
    
    [[NSUserDefaults standardUserDefaults]setObject:Dic_Insurance forKey:@"InsuranceView"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    
    [[NSUserDefaults standardUserDefaults]setObject:Dic_Insurance forKey:@"InsuranceView"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    
    
    Vechile_Info_ViewController *OBJProfile_ViewController=[[Vechile_Info_ViewController alloc]init];
    [self.navigationController pushViewController:OBJProfile_ViewController animated:YES];
}

-(void)Back:(UIButton *)sender
{
     [self.navigationController popViewControllerAnimated:YES];
}

//-(void)Next:(UIButton *)sender
//{
//
//
//}
-(void)Scan_btn:(UIButton *)sender
{
    
}




- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [self.view endEditing:YES];
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [UIView beginAnimations:nil context:nil];
//        [UIView setAnimationDuration:0.5];
//        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
//        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//        
//        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
//        [UIView commitAnimations];
//    });
    
    
    return YES;
    
}

//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
//{
//    if (textField.tag==002 || textField.tag==003 || textField.tag==004 || textField.tag==005) {
//        
//        
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [UIView beginAnimations:nil context:nil];
//            [UIView setAnimationDuration:0.5];
//            [UIView setAnimationCurve:UIViewAnimationCurveLinear];
//            scrollview.frame=CGRectMake(0, -100, self.view.frame.size.width, self.view.frame.size.height);
//            
//            scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 650);
//            [UIView commitAnimations];
//        });
//        
//    }
//    
//    
//    else
//    {
//        
//    }
//    
//    return YES;
//}


- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    
    UITextField *mtextFeild=textField;
    
    mtextFeild.text=@"";
    
    
    if ([[Insurance_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Insurance_Provider_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Policy_Number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[Expiration_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Insurance_phone_number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
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
    
    
    if ([[Insurance_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Insurance_Provider_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Policy_Number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[Expiration_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Insurance_phone_number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || newLength==0) {
        
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


@end
