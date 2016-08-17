//
//  Edit_Bank_Info_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 13/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Edit_Bank_Info_ViewController.h"
#import "Utility.h"

@interface Edit_Bank_Info_ViewController ()

@end

@implementation Edit_Bank_Info_ViewController

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

    Dic_Bank_info=[[NSMutableDictionary alloc]init];
    
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    Account_Type_array=[[NSMutableArray alloc]initWithObjects:@"Checking",@"Saving",nil];
    
    
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
    
    
    //------------ UIpicker view for show State list --------------//
    
    pPickerState=[[UIPickerView alloc] initWithFrame:CGRectMake(10,600, 300, 200)];
    
    pPickerState.showsSelectionIndicator=YES;
    pPickerState.backgroundColor=[UIColor whiteColor];
    pPickerState.delegate=self;
    pPickerState.dataSource=self;
    [backGround addSubview:pPickerState];
    
    
    
    ///////////////////////////// Back Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Back_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [Back_BTN addTarget:self
                 action:@selector(Back:)
       forControlEvents:UIControlEventTouchUpInside];
    [Back_BTN setImage:[UIImage imageNamed:@"back_.png"] forState:UIControlStateNormal];
    
    
    Back_BTN.frame = CGRectMake(10,10,49,26);
    [scrollview addSubview:Back_BTN];
    
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
    //
    //
    
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    
    
    
    UIDatePicker *picker1   = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 210, 320, 216)];
    [picker1 setDatePickerMode:UIDatePickerModeDate];
    picker1.backgroundColor = [UIColor clearColor];
    [picker1 addTarget:self action:@selector(startDateSelected:) forControlEvents:UIControlEventValueChanged];
    
    //    [picker1 addSubview:toolBar];
    // Here birthTxt is Textfield Name replace with your name
    
    // add a toolbar with Cancel & Done button
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolBar.barStyle = UIBarStyleBlackOpaque;
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneToucheds:)];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelToucheds:)];
    
    // the middle button is to make the Done button align to right
    [toolBar setItems:[NSArray arrayWithObjects:cancelButton, [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], doneButton, nil]];
    
    
    
    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    MTitle = [[UILabel alloc] init];
    MTitle.textColor = [UIColor blackColor];
    [MTitle setFrame:CGRectMake(0,20,self.view.frame.size.width, 40)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"Bank info";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:MTitle];
    
    
    
    
    
    ///////////////////////////// Car Make\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Account_name_LB = [[UILabel alloc] init];
    Account_name_LB.textColor = [UIColor blackColor];
    [Account_name_LB setFrame:CGRectMake(30,MTitle.frame.origin.y+50,250, 30)];
    Account_name_LB.backgroundColor=[UIColor clearColor];
    Account_name_LB.textColor=[UIColor whiteColor];
    Account_name_LB.userInteractionEnabled=NO;
    [Account_name_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Account_name_LB.text= @"Account Name";
    Account_name_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Account_name_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Account_name_LB];
    
    
    
    Account_name_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, Account_name_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Account_name_TXT.borderStyle = UITextBorderStyleNone;
    Account_name_TXT.font = [UIFont systemFontOfSize:15];
    Account_name_TXT.keyboardType = UIKeyboardTypeDefault;
    Account_name_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Account_name_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Account_name_TXT.delegate = self;
    Account_name_TXT.backgroundColor=[UIColor clearColor];
    Account_name_TXT.textColor=[UIColor whiteColor];
    [Account_name_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Account_name_TXT.tag=001;
    Account_name_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Account_name_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [Account_name_TXT setRightViewMode:UITextFieldViewModeAlways];
    
    [scrollview addSubview:Account_name_TXT];
    
    
    ///////////////////////////// Car Modal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Routing_Number_LB = [[UILabel alloc] init];
    Routing_Number_LB.textColor = [UIColor blackColor];
    [Routing_Number_LB setFrame:CGRectMake(30,Account_name_TXT.frame.origin.y+50,250, 30)];
    Routing_Number_LB.backgroundColor=[UIColor clearColor];
    Routing_Number_LB.textColor=[UIColor whiteColor];
    Routing_Number_LB.userInteractionEnabled=NO;
    [Routing_Number_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Routing_Number_LB.text= @"Routing Number";
    Routing_Number_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Routing_Number_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Routing_Number_LB];
    
    
    Routing_Number_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, Routing_Number_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Routing_Number_TXT.borderStyle = UITextBorderStyleNone;
    Routing_Number_TXT.font = [UIFont systemFontOfSize:15];
    Routing_Number_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Routing_Number_TXT.keyboardType = UIReturnKeyDefault;
    Routing_Number_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Routing_Number_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Routing_Number_TXT.delegate = self;
    Routing_Number_TXT.backgroundColor=[UIColor clearColor];
    Routing_Number_TXT.textColor=[UIColor whiteColor];
    Routing_Number_TXT.tag=002;
    Routing_Number_TXT.keyboardType = UIKeyboardTypeNumberPad;
    
    [Routing_Number_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Routing_Number_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Routing_Number_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:Routing_Number_TXT];
    [Routing_Number_TXT setRightViewMode:UITextFieldViewModeAlways];
    
    Routing_Number_TXT.inputAccessoryView = numberToolbar;
    
    
    
    
    ///////////////////////////// Year textfeild\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Account_Number_LB = [[UILabel alloc] init];
    Account_Number_LB.textColor = [UIColor blackColor];
    [Account_Number_LB setFrame:CGRectMake(30,Routing_Number_TXT.frame.origin.y+50,250, 30)];
    Account_Number_LB.backgroundColor=[UIColor clearColor];
    Account_Number_LB.textColor=[UIColor whiteColor];
    Account_Number_LB.userInteractionEnabled=NO;
    [Account_Number_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Account_Number_LB.text= @"Account Number";
    Account_Number_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Account_Number_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Account_Number_LB];
    
    
    Account_Number_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,Account_Number_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Account_Number_TXT.borderStyle = UITextBorderStyleNone;
    Account_Number_TXT.font = [UIFont systemFontOfSize:15];
    Account_Number_TXT.keyboardType = UIKeyboardTypeDefault;
    Account_Number_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Account_Number_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Account_Number_TXT.delegate = self;
    Account_Number_TXT.backgroundColor=[UIColor clearColor];
    Account_Number_TXT.textColor=[UIColor whiteColor];
    [Account_Number_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Account_Number_TXT.tag=003;
    [Account_Number_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Account_Number_TXT.keyboardType = UIKeyboardTypeNumberPad;
    Account_Number_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Account_Number_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [Account_Number_TXT setRightViewMode:UITextFieldViewModeAlways];
    [scrollview addSubview:Account_Number_TXT];
    
    Account_Number_TXT.inputAccessoryView = numberToolbar;
    
    
    
    
    
    
    ///////////////////////////// Account_Type_LB textfeild  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Account_Type_LB = [[UILabel alloc] init];
    Account_Type_LB.textColor = [UIColor blackColor];
    [Account_Type_LB setFrame:CGRectMake(30,Account_Number_TXT.frame.origin.y+50,250, 30)];
    Account_Type_LB.backgroundColor=[UIColor clearColor];
    Account_Type_LB.textColor=[UIColor whiteColor];
    Account_Type_LB.userInteractionEnabled=NO;
    [Account_Type_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Account_Type_LB.text= @"Account Type";
    Account_Type_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Account_Type_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Account_Type_LB];
    
   

    Account_Type_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, Account_Type_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Account_Type_TXT.borderStyle = UITextBorderStyleNone;
    Account_Type_TXT.font = [UIFont systemFontOfSize:15];
    Account_Type_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Account_Type_TXT.keyboardType = UIReturnKeyDefault;
    Account_Type_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Account_Type_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Account_Type_TXT.delegate = self;
    Account_Type_TXT.backgroundColor=[UIColor clearColor];
    Account_Type_TXT.textColor=[UIColor whiteColor];
    Account_Type_TXT.tag=004;
    [Account_Type_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Account_Type_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Account_Type_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    Account_Type_TXT.inputView=pPickerState;
    [pPickerState removeFromSuperview];
    
    
    
    UIImageView *imgView_Account_Type = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 14, 7)];
    imgView_Account_Type.image = [UIImage imageNamed:@"dropdown-icon-2.png"];
    UIView *paddingView_Account_Type = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [paddingView_Account_Type addSubview:imgView_Account_Type];
    [Account_Type_TXT setRightViewMode:UITextFieldViewModeAlways];
    [Account_Type_TXT setRightView:paddingView_Account_Type];
    
    [scrollview addSubview:Account_Type_TXT];
    [Account_Type_TXT setRightViewMode:UITextFieldViewModeAlways];
    Account_Type_TXT.inputAccessoryView=toolBar;
    
    
    ///////////////////////////// Date of Birth textfeild  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Date_Birth_LB = [[UILabel alloc] init];
    Date_Birth_LB.textColor = [UIColor blackColor];
    [Date_Birth_LB setFrame:CGRectMake(30,Account_Type_TXT.frame.origin.y+50,250, 30)];
    Date_Birth_LB.backgroundColor=[UIColor clearColor];
    Date_Birth_LB.textColor=[UIColor whiteColor];
    Date_Birth_LB.userInteractionEnabled=NO;
    [Date_Birth_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Date_Birth_LB.text= @"Date of Birth";
    Date_Birth_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Date_Birth_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Date_Birth_LB];
    
 
    
    Date_Birth_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, Date_Birth_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Date_Birth_TXT.borderStyle = UITextBorderStyleNone;
    Date_Birth_TXT.font = [UIFont systemFontOfSize:15];
    Date_Birth_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Date_Birth_TXT.keyboardType = UIReturnKeyDefault;
    Date_Birth_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Date_Birth_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Date_Birth_TXT.delegate = self;
    Date_Birth_TXT.backgroundColor=[UIColor clearColor];
    Date_Birth_TXT.textColor=[UIColor whiteColor];
    Date_Birth_TXT.tag=005;
    [Date_Birth_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Date_Birth_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Date_Birth_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    
    UIImageView *imgView_Birth_TXT = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 14, 7)];
    imgView_Birth_TXT.image = [UIImage imageNamed:@"dropdown-icon-2.png"];
    UIView *paddingView_Birth_TXT = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [paddingView_Birth_TXT addSubview:imgView_Birth_TXT];
    [Date_Birth_TXT setRightViewMode:UITextFieldViewModeAlways];
    [Date_Birth_TXT setRightView:paddingView_Birth_TXT];
    
    [scrollview addSubview:Date_Birth_TXT];
    Date_Birth_TXT.inputView  = picker1;
    [Date_Birth_TXT setRightViewMode:UITextFieldViewModeAlways];
    
    
    /////////////////////////////UIDATE PICKER\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Date_Birth_TXT.inputAccessoryView = toolBar;
    
    
    facke_view=[[UIView alloc]init];
    facke_view.frame= CGRectMake(30, Date_Birth_TXT.frame.origin.y+Date_Birth_TXT.frame.size.height+10,self.view.frame.size.width-60, 60.0);
    facke_view.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:facke_view];
    
    
    
    
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
    Next_BTN.frame = CGRectMake(30, Date_Birth_TXT.frame.origin.y+70,self.view.frame.size.width-60, 41.0);
    [scrollview addSubview:Next_BTN];
    
     
    [self mActivityIndicater];
    
    [self performSelector:@selector(Show_CallTheServer_data) withObject:nil afterDelay:0.5];
    
    
    UIImageView *CheckGround=[[UIImageView alloc]init];
    CheckGround.image=[UIImage imageNamed:@"image3.png"];
    CheckGround.frame=CGRectMake((self.view.frame.size.width-254)/2, facke_view.frame.origin.y+facke_view.frame.size.height+10, 254,  105);
    CheckGround.userInteractionEnabled=YES;
    [scrollview addSubview:CheckGround];
    
    
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
    
}

-(void)Show_CallTheServer_data
{
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"]]                                                             :[NSString stringWithFormat:@"%@bank_detail",[Utility API_link_url]]];
        
        
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            Account_name_TXT.text=[[dict valueForKey:@"bank detail"]valueForKey:@"account_name"];
            
            Routing_Number_TXT.text=[[dict valueForKey:@"bank detail"]valueForKey:@"routing_number"];
            Account_Number_TXT.text=[[dict valueForKey:@"bank detail"]valueForKey:@"account_number"];
            
            if ([[[dict valueForKey:@"bank detail"]valueForKey:@"account_type"]isEqualToString:@"S"] || [[[dict valueForKey:@"bank detail"]valueForKey:@"account_type"]isEqualToString:@"s"]) {
                Account_Type_TXT.text=[[dict valueForKey:@"bank detail"]valueForKey:@"account_type"];

                Account_Type_TXT.text=@"Saving";;
            }
            else
                
            {
                Account_Type_TXT.text=@"Checking";

            }
            
                      Date_Birth_TXT.text=[[dict valueForKey:@"bank detail"]valueForKey:@"date_of_birth"];
            
            
                         
            
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


-(void)Save_Data:(UIButton *)sender
{
    
    
    NSString *dateStr =  Date_Birth_TXT.text;
    
    // Convert string to date object
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM-dd-yyyy"];
    NSDate *birthday = [dateFormat dateFromString:dateStr];
    
    NSDate* now = [NSDate date];
    NSDateComponents* ageComponents = [[NSCalendar currentCalendar]
                                       components:NSYearCalendarUnit
                                       fromDate:birthday
                                       toDate:now
                                       options:0];
    NSInteger age = [ageComponents year];
    
    NSLog(@"%ld",(long)age);

    
    
    if ([[Account_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Routing_Number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Account_Number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[Account_Type_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Date_Birth_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
        Next_BTN.alpha=0.3;
        Next_BTN.userInteractionEnabled=NO;
        [Dic_Bank_info removeAllObjects];
        
    }
    
    else if (age<18)
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Age should be above 18" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert2 show];
    }
    
    else if (Routing_Number_TXT.text.length>9)
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Routing Number Lenghth maximum 9 character" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert2 show];
    }
    
    else if (Account_Number_TXT.text.length>15)
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Account Number Lenghth maximum 15 character" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert2 show];
    }
    
    
    else
    {
        
        [self mActivityIndicater];
        
        [self performSelector:@selector(Update_CallTheServer_data) withObject:nil afterDelay:0.5];
        
        
        
    }
    
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

    [self.navigationController popViewControllerAnimated:YES];
    }
    
}

-(void)Update_CallTheServer_data
{
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&account_name=%@&routing_number=%@&account_number=%@&account_type=%@&date_of_birth=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],Account_name_TXT.text,Routing_Number_TXT.text,Account_Number_TXT.text,Account_Type_TXT.text,Date_Birth_TXT.text]                                                            :[NSString stringWithFormat:@"%@edit_bankdetail",[Utility API_link_url]]];
        
        
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        ////////////////////////////////////////////////////////////////////////////////////////
        // Edited by Appsbee on 17th August 2016 for Other issues point no-6////////////////////
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



-(void)Skip:(UIButton *)sender
{
    
    [[NSUserDefaults standardUserDefaults]setObject:@"False" forKey:@"Bank_Info_Statues"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    
    [Dic_Bank_info setValue:@"" forKey:@"Account_name_TXT"];
    [Dic_Bank_info setValue:@"" forKey:@"Routing_Number_TXT"];
    [Dic_Bank_info setValue:@"" forKey:@"Account_Number_TXT"];
    [Dic_Bank_info setValue:@"" forKey:@"Account_Type_TXT"];
    [Dic_Bank_info setValue:@"" forKey:@"Date_Birth_TXT"];
    
    [[NSUserDefaults standardUserDefaults]setObject:Dic_Bank_info forKey:@"Bank_info_View"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"Vechile_info_View"]);
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"InsuranceView"]);
    
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"Bank_info_View"]);
    
    
    
    [[NSUserDefaults standardUserDefaults]setObject:Dic_Bank_info forKey:@"Bank_info_View"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    [self mActivityIndicater];
    
    [self performSelector:@selector(CallTheServer) withObject:nil afterDelay:0.5];
    
    
    
    
}


-(void)CallTheServer
{
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        
        
        
        NSLog(@"%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"Vechile_info_View"]);
        NSLog(@"%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"InsuranceView"]);
        
        NSLog(@"%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"Bank_info_View"]);
        
        
        
        
        
        
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&insurance_name=%@&insurance_provider=%@&insurance_number=%@&insurance_phone_number=%@&expiration_date=%@&make=%@&model=%@&year=%@&color=%@&type=%@&account_name=%@&routing_number=%@&account_number=%@&account_type=%@&date_of_birth=%@&user_id=%@&Bank_Info_Statues=%@&Vechile_info_Statues=%@&Insurance_Info_Statues=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[[NSUserDefaults standardUserDefaults]valueForKey:@"InsuranceView"]valueForKey:@"Insurance_name_TXT"],[[[NSUserDefaults standardUserDefaults]valueForKey:@"InsuranceView"]valueForKey:@"Insurance_Provider_TXT"],[[[NSUserDefaults standardUserDefaults]valueForKey:@"InsuranceView"]valueForKey:@"Policy_Number_TXT"],[[[NSUserDefaults standardUserDefaults]valueForKey:@"InsuranceView"]valueForKey:@"Insurance_phone_number_TXT"],
                                                              [[[NSUserDefaults standardUserDefaults]valueForKey:@"InsuranceView"]valueForKey:@"Expiration_TXT"],[[[NSUserDefaults standardUserDefaults]valueForKey:@"Vechile_info_View"]valueForKey:@"Car_Make_TXT"],
                                                              [[[NSUserDefaults standardUserDefaults]valueForKey:@"Vechile_info_View"]valueForKey:@"Car_Modal_TXT"]
                                                              ,[[[NSUserDefaults standardUserDefaults]valueForKey:@"Vechile_info_View"]valueForKey:@"Year_TXT"]
                                                              ,[[[NSUserDefaults standardUserDefaults]valueForKey:@"Vechile_info_View"]valueForKey:@"Color_TXT"],
                                                              [[[NSUserDefaults standardUserDefaults]valueForKey:@"Vechile_info_View"]valueForKey:@"Type_TXT"]
                                                              ,[[[NSUserDefaults standardUserDefaults]valueForKey:@"Bank_info_View"]valueForKey:@"Account_name_TXT"],
                                                              [[[NSUserDefaults standardUserDefaults]valueForKey:@"Bank_info_View"]valueForKey:@"Routing_Number_TXT"],
                                                              [[[NSUserDefaults standardUserDefaults]valueForKey:@"Bank_info_View"]valueForKey:@"Account_Number_TXT"],
                                                              [[[NSUserDefaults standardUserDefaults]valueForKey:@"Bank_info_View"]valueForKey:@"Account_Type_TXT"],
                                                              [[[NSUserDefaults standardUserDefaults]valueForKey:@"Bank_info_View"]valueForKey:@"Date_Birth_TXT"]
                                                              ,[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],[[NSUserDefaults standardUserDefaults]valueForKey:@"Bank_Info_Statues"],[[NSUserDefaults standardUserDefaults]valueForKey:@"Vechile_info_Statues"],[[NSUserDefaults standardUserDefaults]valueForKey:@"Insurance_Info_Statues"]]:[NSString stringWithFormat:@"%@signup_step2",[Utility API_link_url]]];
        
        
        
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        
        
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            [appDelegate Add_Slider_View_App_Delegate];
            
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
    
    Date_Birth_TXT.text=newDateString;
    
    NSLog(@"value: %@",[sender date]);
    
}

- (void)cancelToucheds:(UIBarButtonItem *)sender
{
    if (tagvale==004) {
        pickre_STR=nil;
    }
    else
    {
        
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

- (void)doneToucheds:(UIBarButtonItem *)sender
{
    
    if (tagvale==004) {
        if ([pickre_STR isEqualToString:@""]||[pickre_STR isEqualToString:nil] || [pickre_STR isEqual:nil] || [pickre_STR length]==0) {
            
            
            Account_Type_TXT.text=[Account_Type_array objectAtIndex:0];
            
        }
        else
        {
            
            
            Account_Type_TXT.text=pickre_STR;
        }
        
    }
    else if (tagvale==005)
    {
        if ([Date_Birth_TXT.text isEqualToString:@""]) {
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"MM-dd-yyyy";
            Date_Birth_TXT.text = [formatter stringFromDate:[NSDate date]];
            
        }
        else
        {
            
        }
    }
    
    else
    {
        
    }
    
    if ([[Account_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Routing_Number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Account_Number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[Account_Type_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Date_Birth_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
        Next_BTN.alpha=0.3;
        Next_BTN.userInteractionEnabled=NO;
        
        
    }
    
    else
    {
        Next_BTN.alpha=1.0;
        Next_BTN.userInteractionEnabled=YES;
        
    }
    
    
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


-(void)cancelNumberPad{
    
    
}

-(void)doneWithNumberPad{
    
    [self.view endEditing:YES];
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view endEditing:YES];
        [UIView commitAnimations];
    });
    
    if ([[Account_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Routing_Number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Account_Number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[Account_Type_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Date_Birth_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
        Next_BTN.alpha=0.3;
        Next_BTN.userInteractionEnabled=NO;
        
        
    }
    
    else
    {
        Next_BTN.alpha=1.0;
        Next_BTN.userInteractionEnabled=YES;
        
    }
    
    
    
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView; {
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;

{
    return Account_Type_array.count;
}

-(NSString*) pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [Account_Type_array objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
{
    pickre_STR=[Account_Type_array objectAtIndex:row];
    
}



-(void)Back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)Scan_btn:(UIButton *)sender
{
    
}

///[appDelegate Add_Slider_View_App_Delegate];

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    pickre_STR=nil;
    [pPickerState selectRow:0 inComponent:0 animated:YES];
    tagvale=textField.tag;
    //    if (textField.tag==005 || textField.tag==006) {
    //
    //
    //
    //        dispatch_async(dispatch_get_main_queue(), ^{
    //            [UIView beginAnimations:nil context:nil];
    //            [UIView setAnimationDuration:0.5];
    //            [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    //            scrollview.frame=CGRectMake(0, -70, self.view.frame.size.width, self.view.frame.size.height);
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
    
    return YES;
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
    
    
    if ([[Account_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Routing_Number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Account_Number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[Account_Type_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Date_Birth_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
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
    
    
    if ([[Account_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Routing_Number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Account_Number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[Account_Type_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Date_Birth_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]||newLength==0) {
        
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
