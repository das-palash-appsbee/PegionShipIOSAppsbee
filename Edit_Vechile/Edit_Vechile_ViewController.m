//
//  Edit_Vechile_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 13/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Edit_Vechile_ViewController.h"
#import "Profile_ViewController.h"
#import "Vechile_Info_ViewController.h"
#import "Bank_info_ViewController.h"
#import "Utility.h"

@interface Edit_Vechile_ViewController ()

@end

@implementation Edit_Vechile_ViewController
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



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardDidHideNotification object:nil];
    
    [self createInputAccessoryView];
    
    Dic_Vechile_info=[[NSMutableDictionary alloc]init];
    
    
    ///////////////////////////UIPickerView////////////////////////////////
    
    //
    //    mpicker = [[UIPickerView alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height+100, 300, 200)];
    //    mpicker.delegate = self;
    //    mpicker.showsSelectionIndicator = YES;
    //    [self.view addSubview:mpicker];
    
    
    
    Type_array=[[NSMutableArray alloc]initWithObjects:@"SUV",@"Truck",@"Sedan",@"Other",nil];
    
    Sub_Type_array=[[NSMutableArray alloc]initWithObjects:@"Truck with Hitch",@"Truck with Hitch and Trailer", nil];
    Demo_array=[[NSMutableArray alloc]init];
    
    
    //Get Current Year into i2
    NSDateFormatter* formatter = [[[NSDateFormatter alloc] init]autorelease];
    [formatter setDateFormat:@"yyyy"];
    int i2  = [[formatter stringFromDate:[NSDate date]] intValue];
    
    
    //Create Years Array from 1960 to This year
    years = [[NSMutableArray alloc] init];
    for (int i=1960; i<=i2; i++) {
        [years addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    
    
    UIImageView *backGround=[[UIImageView alloc]init];
    backGround.image=[UIImage imageNamed:@"main_slider_bg.jpg"];
    backGround.frame=CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height);
    backGround.userInteractionEnabled=YES;
    [self.view addSubview:backGround];
    
    
    
    //------------ UIpicker view for show State list --------------//
    
    pPickerState=[[UIPickerView alloc] initWithFrame:CGRectMake(10,600, 300, 200)];
    
    pPickerState.showsSelectionIndicator=YES;
    pPickerState.backgroundColor=[UIColor whiteColor];
    pPickerState.delegate=self;
    pPickerState.dataSource=self;
    [pPickerState selectRow:40 inComponent:0 animated:NO];
    [backGround addSubview:pPickerState];
    
    
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
    
    //    ///////////////////////////// Next Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    //
    //    Next_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [Next_BTN addTarget:self
    //                 action:@selector(Next:)
    //       forControlEvents:UIControlEventTouchUpInside];
    //    [Next_BTN setImage:[UIImage imageNamed:@"next.png"] forState:UIControlStateNormal];
    //
    //
    //    Next_BTN.frame = CGRectMake(self.view.frame.size.width-50,10,37,14);
    //    [scrollview addSubview:Next_BTN];
    
    
    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    MTitle = [[UILabel alloc] init];
    MTitle.textColor = [UIColor blackColor];
    [MTitle setFrame:CGRectMake(0,20,self.view.frame.size.width, 40)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"Vehicle info";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:MTitle];
    
    
    ///////////////////////////// Car Make\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Car_Make_LB = [[UILabel alloc] init];
    Car_Make_LB.textColor = [UIColor blackColor];
    [Car_Make_LB setFrame:CGRectMake(30,MTitle.frame.origin.y+50,250, 30)];
    Car_Make_LB.backgroundColor=[UIColor clearColor];
    Car_Make_LB.textColor=[UIColor whiteColor];
    Car_Make_LB.userInteractionEnabled=NO;
    [Car_Make_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Car_Make_LB.text= @"Car Make";
    Car_Make_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Car_Make_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Car_Make_LB];
    
    
    
    Car_Make_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, Car_Make_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Car_Make_TXT.borderStyle = UITextBorderStyleNone;
    Car_Make_TXT.font = [UIFont systemFontOfSize:15];
    Car_Make_TXT.keyboardType = UIKeyboardTypeDefault;
    Car_Make_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Car_Make_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Car_Make_TXT.delegate = self;
    Car_Make_TXT.backgroundColor=[UIColor clearColor];
    Car_Make_TXT.textColor=[UIColor whiteColor];
    [Car_Make_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Car_Make_TXT.tag=001;
    Car_Make_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Car_Make_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [Car_Make_TXT setRightViewMode:UITextFieldViewModeAlways];
    
    [scrollview addSubview:Car_Make_TXT];
    
    
    ///////////////////////////// Car Modal\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Car_Modal_LB = [[UILabel alloc] init];
    Car_Modal_LB.textColor = [UIColor blackColor];
    [Car_Modal_LB setFrame:CGRectMake(30,Car_Make_TXT.frame.origin.y+50,250, 30)];
    Car_Modal_LB.backgroundColor=[UIColor clearColor];
    Car_Modal_LB.textColor=[UIColor whiteColor];
    Car_Modal_LB.userInteractionEnabled=NO;
    [Car_Modal_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Car_Modal_LB.text= @"Car Model";
    Car_Modal_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Car_Modal_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Car_Modal_LB];
    
    
    Car_Modal_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, Car_Modal_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Car_Modal_TXT.borderStyle = UITextBorderStyleNone;
    Car_Modal_TXT.font = [UIFont systemFontOfSize:15];
    Car_Modal_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Car_Modal_TXT.keyboardType = UIReturnKeyDefault;
    Car_Modal_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Car_Modal_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Car_Modal_TXT.delegate = self;
    Car_Modal_TXT.backgroundColor=[UIColor clearColor];
    Car_Modal_TXT.textColor=[UIColor whiteColor];
    Car_Modal_TXT.tag=002;
    [Car_Modal_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Car_Modal_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Car_Modal_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:Car_Modal_TXT];
    [Car_Modal_TXT setRightViewMode:UITextFieldViewModeAlways];
    
    
    
    
    
    ///////////////////////////// Year textfeild\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Year_LB = [[UILabel alloc] init];
    Year_LB.textColor = [UIColor blackColor];
    [Year_LB setFrame:CGRectMake(30,Car_Modal_TXT.frame.origin.y+50,250, 30)];
    Year_LB.backgroundColor=[UIColor clearColor];
    Year_LB.textColor=[UIColor whiteColor];
    Year_LB.userInteractionEnabled=NO;
    [Year_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Year_LB.text= @"Year";
    Year_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Year_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Year_LB];
    
    
    
    Year_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,Year_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Year_TXT.borderStyle = UITextBorderStyleNone;
    Year_TXT.font = [UIFont systemFontOfSize:15];
    Year_TXT.keyboardType = UIKeyboardTypeDefault;
    Year_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Year_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Year_TXT.delegate = self;
    Year_TXT.backgroundColor=[UIColor clearColor];
    Year_TXT.textColor=[UIColor whiteColor];
    [Year_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Year_TXT.tag=90;
    [Year_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Year_TXT.inputView=pPickerState;
    [pPickerState removeFromSuperview];
    Year_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Year_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [Year_TXT setRightViewMode:UITextFieldViewModeAlways];
    
    UIImageView *imgView_Year_TXT = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 14, 7)];
    imgView_Year_TXT.image = [UIImage imageNamed:@"dropdown-icon-2.png"];
    UIView *paddingView_Year_TXT = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [paddingView_Year_TXT addSubview:imgView_Year_TXT];
    [Year_TXT setRightViewMode:UITextFieldViewModeAlways];
    [Year_TXT setRightView:paddingView_Year_TXT];
    

    
    [scrollview addSubview:Year_TXT];
    Year_TXT.inputAccessoryView=ptoolbar;
    
    
    
    
    
    
    
    ///////////////////////////// Color textfeild  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Color_LB = [[UILabel alloc] init];
    Color_LB.textColor = [UIColor blackColor];
    [Color_LB setFrame:CGRectMake(30,Year_TXT.frame.origin.y+50,250, 30)];
    Color_LB.backgroundColor=[UIColor clearColor];
    Color_LB.textColor=[UIColor whiteColor];
    Color_LB.userInteractionEnabled=NO;
    [Color_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Color_LB.text= @"Color";
    Color_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Color_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Color_LB];
    
    
    Color_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, Color_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Color_TXT.borderStyle = UITextBorderStyleNone;
    Color_TXT.font = [UIFont systemFontOfSize:15];
    Color_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Color_TXT.keyboardType = UIReturnKeyDefault;
    Color_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Color_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Color_TXT.delegate = self;
    Color_TXT.backgroundColor=[UIColor clearColor];
    Color_TXT.textColor=[UIColor whiteColor];
    Color_TXT.tag=004;
    [Color_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Color_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Color_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:Color_TXT];
    [Color_TXT setRightViewMode:UITextFieldViewModeAlways];
    
    
    
    /////////////////////////////Confirm Password \\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Type_LB = [[UILabel alloc] init];
    Type_LB.textColor = [UIColor blackColor];
    [Type_LB setFrame:CGRectMake(30,Color_TXT.frame.origin.y+50,250, 30)];
    Type_LB.backgroundColor=[UIColor clearColor];
    Type_LB.textColor=[UIColor whiteColor];
    Type_LB.userInteractionEnabled=NO;
    [Type_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Type_LB.text= @"Type";
    Type_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Type_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Type_LB];
    
    
    Type_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, Type_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Type_TXT.borderStyle = UITextBorderStyleNone;
    Type_TXT.font = [UIFont systemFontOfSize:15];
    Type_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Type_TXT.keyboardType = UIReturnKeyDefault;
    Type_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Type_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Type_TXT.delegate = self;
    Type_TXT.backgroundColor=[UIColor clearColor];
    Type_TXT.textColor=[UIColor whiteColor];
    Type_TXT.tag=010;
    Type_TXT.inputView=pPickerState;
    [pPickerState removeFromSuperview];
    [Type_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Type_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Type_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    
    UIImageView *imgView_Type_TXT = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 14, 7)];
    imgView_Type_TXT.image = [UIImage imageNamed:@"dropdown-icon-2.png"];
    UIView *paddingView_Type_TXT = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [paddingView_Type_TXT addSubview:imgView_Type_TXT];
    [Type_TXT setRightViewMode:UITextFieldViewModeAlways];
    [Type_TXT setRightView:paddingView_Type_TXT];

    
    
    [scrollview addSubview:Type_TXT];
    [Type_TXT setRightViewMode:UITextFieldViewModeAlways];
    Type_TXT.inputAccessoryView=ptoolbar;
    
    /////////////////////////////Confirm Password \\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Sub_Type_LB = [[UILabel alloc] init];
    Sub_Type_LB.textColor = [UIColor blackColor];
    Sub_Type_LB.alpha=0.4;
    [Sub_Type_LB setFrame:CGRectMake(30,Type_TXT.frame.origin.y+50,250, 30)];
    Sub_Type_LB.backgroundColor=[UIColor clearColor];
    Sub_Type_LB.textColor=[UIColor whiteColor];
    Sub_Type_LB.userInteractionEnabled=NO;
    [Sub_Type_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Sub_Type_LB.text= @"Sub Type";
    Sub_Type_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Sub_Type_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Sub_Type_LB];
    
  
    Sub_Type_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, Sub_Type_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Sub_Type_TXT.borderStyle = UITextBorderStyleNone;
    Sub_Type_TXT.userInteractionEnabled=NO;
    Sub_Type_TXT.alpha=0.4;
    Sub_Type_TXT.font = [UIFont systemFontOfSize:15];
    Sub_Type_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Sub_Type_TXT.keyboardType = UIReturnKeyDefault;
    Sub_Type_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Sub_Type_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Sub_Type_TXT.delegate = self;
    Sub_Type_TXT.backgroundColor=[UIColor clearColor];
    Sub_Type_TXT.textColor=[UIColor whiteColor];
    Sub_Type_TXT.tag=011;
    [Sub_Type_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Sub_Type_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Sub_Type_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    Sub_Type_TXT.inputView=pPickerState;
    [pPickerState removeFromSuperview];
    
    
    UIImageView *imgView_Sub_Type_TXT = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 14, 7)];
    imgView_Sub_Type_TXT.image = [UIImage imageNamed:@"dropdown-icon-2.png"];
    UIView *paddingView_Sub_Type_TXT = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [paddingView_Sub_Type_TXT addSubview:imgView_Sub_Type_TXT];
    [Sub_Type_TXT setRightViewMode:UITextFieldViewModeAlways];
    [Sub_Type_TXT setRightView:paddingView_Sub_Type_TXT];
    

    
    [scrollview addSubview:Sub_Type_TXT];
    [Sub_Type_TXT setRightViewMode:UITextFieldViewModeAlways];
    Sub_Type_TXT.inputAccessoryView=ptoolbar;
    
    
    facke_view=[[UIView alloc]init];
    facke_view.frame= CGRectMake(30, Sub_Type_TXT.frame.origin.y+100,self.view.frame.size.width-60, 60.0);
    facke_view.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:facke_view];
    
    
    
    //////////////////// Sign In Button\\\\\\\\\\\\\\
    
    Next_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Next_BTN addTarget:self
                 action:@selector(Save_Data:)
       forControlEvents:UIControlEventTouchUpInside];
    Next_BTN.backgroundColor=[UIColor colorWithRed:228.0f/255.0f green:183.0f/255.0f blue:44.0f/255.0f alpha:1.0]
;
    [Next_BTN setTitle:@"Save" forState:UIControlStateNormal];
    [Next_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    [Next_BTN setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    
    Next_BTN.layer.cornerRadius=20;
    Next_BTN.clipsToBounds = YES;
    Next_BTN.frame = CGRectMake(30, Sub_Type_TXT.frame.origin.y+70,self.view.frame.size.width-60, 41.0);
    [scrollview addSubview:Next_BTN];

    [self mActivityIndicater];
    
    [self performSelector:@selector(Show_CallTheServer_data) withObject:nil afterDelay:0.5];

       scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
    
}
     
     -(void)Show_CallTheServer_data
    {
        if ([API connectedToInternet]==YES) {
            
            //------------ Call API for signup With Post Method --------------//
            
            
            NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"]]                                                             :[NSString stringWithFormat:@"%@vehicle_detail",[Utility API_link_url]]];
            
            NSDictionary *responseDict = [responseString JSONValue];
            dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
            
           
            
            if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
                
                
                Car_Make_TXT.text=[[dict valueForKey:@"Vehicle Detail"]valueForKey:@"make"];
                
                Car_Modal_TXT.text=[[dict valueForKey:@"Vehicle Detail"]valueForKey:@"model"];
                Year_TXT.text=[[dict valueForKey:@"Vehicle Detail"]valueForKey:@"year"];
                Color_TXT.text=[[dict valueForKey:@"Vehicle Detail"]valueForKey:@"color"];
                
                
                if ([[[dict valueForKey:@"Vehicle Detail"]valueForKey:@"type"]isEqualToString:@"Truck with Hitch"]||[[[dict valueForKey:@"Vehicle Detail"]valueForKey:@"type"]isEqualToString:@"Truck with Hitch and Trailer"]) {
                    
                      Type_TXT.text=@"Truck";
                      Sub_Type_TXT.text=[[dict valueForKey:@"Vehicle Detail"]valueForKey:@"type"];
                    
                    Sub_Type_LB.alpha=1.0;
                    Sub_Type_TXT.alpha=1.0;
                    Sub_Type_TXT.userInteractionEnabled=NO;
                    
                }
                
                else
                {
                    Sub_Type_LB.alpha=0.4;
                    Sub_Type_TXT.alpha=0.4;
                    Sub_Type_TXT.userInteractionEnabled=NO;
                    Type_TXT.text=[[dict valueForKey:@"Vehicle Detail"]valueForKey:@"type"];
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
        
        
        
        if ([Sub_Type_TXT.text isEqualToString:@""] ||[Sub_Type_TXT.text length]==0 ) {
            
        }
        else
        {
            Type_TXT.text=Sub_Type_TXT.text;
            
        }

        
        
        
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&make=%@&model=%@&year=%@&color=%@&type=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],Car_Make_TXT.text,Car_Modal_TXT.text,Year_TXT.text,Color_TXT.text,Type_TXT.text]                                                            :[NSString stringWithFormat:@"%@edit_vehicledetil",[Utility API_link_url]]];
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            
            alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
            
            
            //            Fname_TXT.text=[[dict valueForKey:@"License Detail"]valueForKey:@"Licence_number"];
            //            Lname_TXT.text=[[dict valueForKey:@"License Detail"]valueForKey:@"zip"];
            //            Address_TXT.text=[[dict valueForKey:@"License Detail"]valueForKey:@"Address"];
            //            City_TXT.text=[[dict valueForKey:@"License Detail"]valueForKey:@"City"];
            //            State_TXT.text=[[dict valueForKey:@"License Detail"]valueForKey:@"State"];
            
            
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


#pragma mark - -*********************
#pragma mark Toolbar animation methods
#pragma mark - -*********************

-(void)createInputAccessoryView
{
    ptoolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    ptoolbar.barStyle = UIBarStyleBlackOpaque;
    UIBarButtonItem* cancel = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    UIBarButtonItem* flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(Done)];
    
    [ptoolbar setItems:[NSArray arrayWithObjects:cancel, flexSpace,done, nil] animated:NO];
    [Type_TXT setInputAccessoryView:ptoolbar];
    [Sub_Type_TXT setInputAccessoryView:ptoolbar];
    
    
}


#pragma mark - -*********************
#pragma mark Toolbar cancel methods
#pragma mark - -*********************

-(void)cancel
{
    pickre_STR=nil;
    
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
    
    if (tagvale==010) {
        
    }
    else if (tagvale==011)
    {
        
    }
    else
    {
        
    }
    
    
    
  
}


#pragma mark - -*********************
#pragma mark Toolbar Done methods
#pragma mark - -*********************

-(void)Done
{
    
    
    if (tagvale==010) {
        
        if ([pickre_STR isEqualToString:@""]||[pickre_STR isEqualToString:nil] || [pickre_STR isEqual:nil] || [pickre_STR length]==0) {
            
            
            Type_TXT.text=[Demo_array objectAtIndex:0];
            
        }
        else
        {
            
            
            Type_TXT.text=pickre_STR;
        }
        
        if ([pickre_STR isEqualToString:@"Truck"]) {
            
            Sub_Type_TXT.userInteractionEnabled=YES;
            Sub_Type_TXT.alpha=1.0;
            Sub_Type_LB.alpha=1.0;
            
            
        }
        else
        {
            Sub_Type_TXT.text=@"";
            Sub_Type_TXT.userInteractionEnabled=NO;
            Sub_Type_TXT.alpha=0.4;
            Sub_Type_LB.alpha=0.4;
        }
        
    }
    else if (tagvale==011)
    {
        if ([pickre_STR isEqualToString:@""]||[pickre_STR isEqualToString:nil] || [pickre_STR isEqual:nil] || [pickre_STR length]==0) {
            
            
            Sub_Type_TXT.text=[Demo_array objectAtIndex:0];
            
        }
        else
        {
            
            Sub_Type_TXT.text=pickre_STR;
        }
        
    }
    else if (tagvale==90)
    {
        if ([pickre_STR isEqualToString:@""]||[pickre_STR isEqualToString:nil] || [pickre_STR isEqual:nil] || [pickre_STR length]==0) {
            
            
            Year_TXT.text=[Demo_array objectAtIndex:40];
            
        }
        else
        {
            
            Year_TXT.text=pickre_STR;
        }
        
    }
    else
    {
        
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
    
    if ([[Car_Make_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Car_Modal_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Year_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[Color_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Type_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
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


-(void)Save_Data:(UIButton *)sender
{
    
    
    if ([[Car_Make_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Car_Modal_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Year_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[Color_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Type_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
        Next_BTN.alpha=0.3;
        Next_BTN.userInteractionEnabled=NO;
        
        
    }
    
    else
    {
        
        
        
        [self mActivityIndicater];
        
        [self performSelector:@selector(Update_CallTheServer_data) withObject:nil afterDelay:0.5];
    
    }
    
    
    
}

-(void)Skip:(UIButton *)sender
{
    
    
    [[NSUserDefaults standardUserDefaults]setObject:@"False" forKey:@"Vechile_info_Statues"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    [Dic_Vechile_info setValue:@"" forKey:@"Car_Make_TXT"];
    [Dic_Vechile_info setValue:@"" forKey:@"Car_Modal_TXT"];
    [Dic_Vechile_info setValue:@"" forKey:@"Year_TXT"];
    [Dic_Vechile_info setValue:@"" forKey:@"Color_TXT"];
    [Dic_Vechile_info setValue:@"" forKey:@"Type_TXT"];
    
    
    
    [[NSUserDefaults standardUserDefaults]setObject:Dic_Vechile_info forKey:@"Vechile_info_View"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    Bank_info_ViewController *OBJProfile_ViewController=[[Bank_info_ViewController alloc]init];
    [self.navigationController pushViewController:OBJProfile_ViewController animated:YES];
}





-(void)Back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

//-(void)Next:(UIButton *)sender
//{
//
////    Profile_ViewController *OBJProfile_ViewController=[[Profile_ViewController alloc]init];
////    [self.navigationController pushViewController:OBJProfile_ViewController animated:YES];
//
//}
-(void)Scan_btn:(UIButton *)sender
{
    
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView; {
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;

{
    return Demo_array.count;
}

-(NSString*) pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [Demo_array objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
{
    pickre_STR=[Demo_array objectAtIndex:row];
    
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

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    pickre_STR=nil;
   
    
    
    tagvale=textField.tag;
    
    if (textField.tag==003 || textField.tag==004 || textField.tag==005) {
        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [UIView beginAnimations:nil context:nil];
//            [UIView setAnimationDuration:0.5];
//            [UIView setAnimationCurve:UIViewAnimationCurveLinear];
//            scrollview.frame=CGRectMake(0, -100, self.view.frame.size.width, self.view.frame.size.height);
//            
//            scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 650);
//            [UIView commitAnimations];
//        });
        
    }
    
    else if (textField.tag==010)
    {
        [Demo_array removeAllObjects];
        
        [Demo_array addObjectsFromArray:Type_array];
        [pPickerState reloadAllComponents];

        
           [pPickerState selectRow:0 inComponent:0 animated:YES];
        
    }
    else if (textField.tag==011)
    {
        [Demo_array removeAllObjects];
        
        [Demo_array addObjectsFromArray:Sub_Type_array];
        [pPickerState reloadAllComponents];

        [pPickerState selectRow:0 inComponent:0 animated:YES];

        
       
    }
    
    else if (textField.tag==90)
    {
        [Demo_array removeAllObjects];
        
        [Demo_array addObjectsFromArray:years];
        [pPickerState reloadAllComponents];

        
        [pPickerState selectRow:40 inComponent:0 animated:YES];
        
       

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
    
    
    if ([[Car_Make_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Car_Modal_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Year_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[Color_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Type_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
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
    
    
    if ([[Car_Make_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Car_Modal_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Year_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[Color_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Type_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || newLength==0) {
        
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
