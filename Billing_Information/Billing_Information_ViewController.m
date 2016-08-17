//
//  Billing_Information_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 21/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Billing_Information_ViewController.h"
#import "Utility.h"
#import "AppDelegate.h"
@interface Billing_Information_ViewController ()

@end

@implementation Billing_Information_ViewController
@synthesize Card_name_STR;
@synthesize card_number_STR;
@synthesize card_type_STR;
@synthesize CVV_STR;
@synthesize Expiary_Month_STR;
@synthesize Expiary_Year_STR;


@synthesize Business_name_STR;
@synthesize Last_name_STR;
@synthesize Address1_STR;
@synthesize Address2_STR;
@synthesize City_STR;
@synthesize State_STR;
@synthesize Zip_code_STR;
@synthesize Country_STR;
@synthesize activeTextView;

AppDelegate *appDelegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [self createInputAccessoryView];
    
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
     
    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    MTitle = [[UILabel alloc] init];
    MTitle.textColor = [UIColor blackColor];
    [MTitle setFrame:CGRectMake(0,20,self.view.frame.size.width, 40)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"Billing Information";
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
    [textlable setFrame:CGRectMake(10,5,self.view.frame.size.width-20, 40)];
    textlable.backgroundColor=[UIColor clearColor];
    textlable.textColor=[UIColor whiteColor];
    textlable.userInteractionEnabled=NO;
    
    textlable.numberOfLines=0;
    [textlable setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    
    NSMutableParagraphStyle *style  = [[NSMutableParagraphStyle alloc] init];
    style.minimumLineHeight = 25.f;
    style.maximumLineHeight = 25.f;
    NSDictionary *attributtes = @{NSParagraphStyleAttributeName : style,};
    
    textlable.attributedText = [[NSAttributedString alloc] initWithString:@"Billing address"
                                                               attributes:attributtes];
    
    textlable.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    textlable.textAlignment=NSTextAlignmentLeft;
    [TopView addSubview:textlable];
    
    
    
    
    ///////////////////////////// First Name\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Business_name_LB = [[UILabel alloc] init];
    Business_name_LB.textColor = [UIColor blackColor];
    [Business_name_LB setFrame:CGRectMake(30,TopView.frame.origin.y+90,250, 30)];
    Business_name_LB.backgroundColor=[UIColor clearColor];
    Business_name_LB.textColor=[UIColor whiteColor];
    Business_name_LB.userInteractionEnabled=NO;
    [Business_name_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Business_name_LB.text= @"First Name Or Business Name";
    Business_name_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Business_name_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Business_name_LB];
    
    
    
    Business_name_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,Business_name_LB.frame.origin.y+10,self.view.frame.size.width-60, 40)];
    Business_name_TXT.borderStyle = UITextBorderStyleNone;
    Business_name_TXT.font = [UIFont systemFontOfSize:15];
    Business_name_TXT.keyboardType = UIKeyboardTypeDefault;
    Business_name_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Business_name_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Business_name_TXT.delegate = self;
    Business_name_TXT.backgroundColor=[UIColor clearColor];
    Business_name_TXT.textColor=[UIColor whiteColor];
    [Business_name_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Business_name_TXT.tag=001;
    Business_name_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Business_name_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    Business_name_TXT.text=Business_name_STR;
    [Business_name_TXT setRightViewMode:UITextFieldViewModeAlways];
    
    [scrollview addSubview:Business_name_TXT];
    
    
    ///////////////////////////// Last Name\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Last_name_LB = [[UILabel alloc] init];
    Last_name_LB.textColor = [UIColor blackColor];
    [Last_name_LB setFrame:CGRectMake(30,Business_name_TXT.frame.origin.y+50,250, 30)];
    Last_name_LB.backgroundColor=[UIColor clearColor];
    Last_name_LB.textColor=[UIColor whiteColor];
    Last_name_LB.userInteractionEnabled=NO;
    [Last_name_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Last_name_LB.text= @"Last Name";
    Last_name_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Last_name_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Last_name_LB];
    
    
    Last_name_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, Last_name_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Last_name_TXT.borderStyle = UITextBorderStyleNone;
    Last_name_TXT.font = [UIFont systemFontOfSize:15];
    Last_name_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Last_name_TXT.keyboardType = UIReturnKeyDefault;
    Last_name_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Last_name_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Last_name_TXT.delegate = self;
    Last_name_TXT.backgroundColor=[UIColor clearColor];
    Last_name_TXT.textColor=[UIColor whiteColor];
    Last_name_TXT.tag=002;
    [Last_name_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Last_name_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Last_name_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:Last_name_TXT];
      Last_name_TXT.text=Last_name_STR;
    [Last_name_TXT setRightViewMode:UITextFieldViewModeAlways];
    
    
    
    
    
    ///////////////////////////// Email Id\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Address1_LB = [[UILabel alloc] init];
    Address1_LB.textColor = [UIColor blackColor];
    [Address1_LB setFrame:CGRectMake(30,Last_name_TXT.frame.origin.y+50,250, 30)];
    Address1_LB.backgroundColor=[UIColor clearColor];
    Address1_LB.textColor=[UIColor whiteColor];
    Address1_LB.userInteractionEnabled=NO;
    [Address1_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Address1_LB.text= @"Address 1";
    Address1_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Address1_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Address1_LB];
    
    
    
    Address1_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,Address1_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Address1_TXT.borderStyle = UITextBorderStyleNone;
    Address1_TXT.font = [UIFont systemFontOfSize:15];
    Address1_TXT.keyboardType = UIKeyboardTypeDefault;
    Address1_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Address1_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Address1_TXT.delegate = self;
    Address1_TXT.backgroundColor=[UIColor clearColor];
    Address1_TXT.textColor=[UIColor whiteColor];
    [Address1_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Address1_TXT.tag=003;
    [Address1_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    Address1_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Address1_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [Address1_TXT setRightViewMode:UITextFieldViewModeAlways];
        Address1_TXT.text=Address1_STR;
    [scrollview addSubview:Address1_TXT];
    
    
    
    
    
    
    ///////////////////////////// Password \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Address2_LB = [[UILabel alloc] init];
    Address2_LB.textColor = [UIColor blackColor];
    [Address2_LB setFrame:CGRectMake(30,Address1_TXT.frame.origin.y+50,250, 30)];
    Address2_LB.backgroundColor=[UIColor clearColor];
    Address2_LB.textColor=[UIColor whiteColor];
    Address2_LB.userInteractionEnabled=NO;
    [Address2_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Address2_LB.text= @"Address 2";
    Address2_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Address2_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Address2_LB];
    
    
    Address2_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, Address2_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Address2_TXT.borderStyle = UITextBorderStyleNone;
    Address2_TXT.font = [UIFont systemFontOfSize:15];
    Address2_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Address2_TXT.keyboardType = UIReturnKeyDefault;
    Address2_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Address2_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Address2_TXT.delegate = self;
    Address2_TXT.backgroundColor=[UIColor clearColor];
    Address2_TXT.textColor=[UIColor whiteColor];
    Address2_TXT.tag=004;
    [Address2_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Address2_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Address2_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:Address2_TXT];
    [Address2_TXT setRightViewMode:UITextFieldViewModeAlways];
     Address2_TXT.text=Address2_STR;
    
    
    
    
    
    /////////////////////////////UIDATE PICKER\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    UIDatePicker *picker1   = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 210, 320, 216)];
    [picker1 setDatePickerMode:UIDatePickerModeDate];
    picker1.backgroundColor = [UIColor clearColor];
    [picker1 addTarget:self action:@selector(startDateSelected:) forControlEvents:UIControlEventValueChanged];
    
    //    [picker1 addSubview:toolBar];
   // Expiration_TXT.inputView  = picker1; // Here birthTxt is Textfield Name replace with your name
    
    // add a toolbar with Cancel & Done button
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolBar.barStyle = UIBarStyleBlackOpaque;
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneTouched:)];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelTouched:)];
    
    // the middle button is to make the Done button align to right
    [toolBar setItems:[NSArray arrayWithObjects:cancelButton, [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], doneButton, nil]];
    
   // Expiration_TXT.inputAccessoryView = toolBar;
    
    
    /////////////////////////////Confirm Password \\\\\\\\\\\\\\\\\\\\\\\\\\
    
    City_LB = [[UILabel alloc] init];
    City_LB.textColor = [UIColor blackColor];
    [City_LB setFrame:CGRectMake(30,Address2_TXT.frame.origin.y+50,250, 30)];
    City_LB.backgroundColor=[UIColor clearColor];
    City_LB.textColor=[UIColor whiteColor];
    City_LB.userInteractionEnabled=NO;
    [City_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    City_LB.text= @"City";
    City_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    City_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:City_LB];
    
    
    City_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, City_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    City_TXT.borderStyle = UITextBorderStyleNone;
    City_TXT.font = [UIFont systemFontOfSize:15];
    City_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    City_TXT.keyboardType = UIReturnKeyDefault;
    City_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    City_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    City_TXT.delegate = self;
    City_TXT.backgroundColor=[UIColor clearColor];
    City_TXT.textColor=[UIColor whiteColor];
    City_TXT.tag=005;
    [City_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    City_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [City_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:City_TXT];
    [City_TXT setRightViewMode:UITextFieldViewModeAlways];
    City_TXT.text=City_STR;
    
    
    
    /////////////////////////////Confirm Password \\\\\\\\\\\\\\\\\\\\\\\\\\
    
    State_LB = [[UILabel alloc] init];
    State_LB.textColor = [UIColor blackColor];
    [State_LB setFrame:CGRectMake(30,City_TXT.frame.origin.y+50,250, 30)];
    State_LB.backgroundColor=[UIColor clearColor];
    State_LB.textColor=[UIColor whiteColor];
    State_LB.userInteractionEnabled=NO;
    [State_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    State_LB.text= @"State";
    State_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    State_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:State_LB];
    
    
    State_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, State_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    State_TXT.borderStyle = UITextBorderStyleNone;
    State_TXT.font = [UIFont systemFontOfSize:15];
    State_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    State_TXT.keyboardType = UIReturnKeyDefault;
    State_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    State_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    State_TXT.delegate = self;
    State_TXT.backgroundColor=[UIColor clearColor];
    State_TXT.textColor=[UIColor whiteColor];
    State_TXT.tag=005;
    [State_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    State_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [State_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:State_TXT];
    [State_TXT setRightViewMode:UITextFieldViewModeAlways];
    State_TXT.text=State_STR;
    

    
    /////////////////////////////Zip_code_LB \\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Zip_code_LB = [[UILabel alloc] init];
    Zip_code_LB.textColor = [UIColor blackColor];
    [Zip_code_LB setFrame:CGRectMake(30,State_TXT.frame.origin.y+50,250, 30)];
    Zip_code_LB.backgroundColor=[UIColor clearColor];
    Zip_code_LB.textColor=[UIColor whiteColor];
    Zip_code_LB.userInteractionEnabled=NO;
    [Zip_code_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Zip_code_LB.text= @"Zip Code";
    Zip_code_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Zip_code_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Zip_code_LB];
    
    
    Zip_code_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, Zip_code_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Zip_code_TXT.borderStyle = UITextBorderStyleNone;
    Zip_code_TXT.font = [UIFont systemFontOfSize:15];
    Zip_code_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Zip_code_TXT.keyboardType = UIKeyboardTypeNumberPad;;
    Zip_code_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Zip_code_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Zip_code_TXT.delegate = self;
    Zip_code_TXT.backgroundColor=[UIColor clearColor];
    Zip_code_TXT.textColor=[UIColor whiteColor];
    Zip_code_TXT.tag=005;
    [Zip_code_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Zip_code_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Zip_code_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:Zip_code_TXT];
    [Zip_code_TXT setRightViewMode:UITextFieldViewModeAlways];
     Zip_code_TXT.text=Zip_code_STR;
     Zip_code_TXT.inputAccessoryView=ptoolbar;
    
    
    
    /////////////////////////////Zip_code_LB \\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Country_LB = [[UILabel alloc] init];
    Country_LB.textColor = [UIColor blackColor];
    [Country_LB setFrame:CGRectMake(30,Zip_code_TXT.frame.origin.y+50,250, 30)];
    Country_LB.backgroundColor=[UIColor clearColor];
    Country_LB.textColor=[UIColor whiteColor];
    Country_LB.userInteractionEnabled=NO;
    [Country_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Country_LB.text= @"Country";
    Country_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Country_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Country_LB];
    
    
    Country_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, Country_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Country_TXT.borderStyle = UITextBorderStyleNone;
    Country_TXT.font = [UIFont systemFontOfSize:15];
    Country_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Country_TXT.keyboardType = UIReturnKeyDefault;
    Country_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Country_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Country_TXT.delegate = self;
    Country_TXT.backgroundColor=[UIColor clearColor];
    Country_TXT.textColor=[UIColor whiteColor];
    Country_TXT.tag=005;
    [Country_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Country_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Country_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:Country_TXT];
    [Country_TXT setRightViewMode:UITextFieldViewModeAlways];
     Country_TXT.text=Country_STR;
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    
    
    Next_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Next_BTN addTarget:self
                 action:@selector(Next:)
       forControlEvents:UIControlEventTouchUpInside];
    Next_BTN.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0];
    [Next_BTN setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    [Next_BTN setTitle:@"Update" forState:UIControlStateNormal];
    [Next_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    
    Next_BTN.layer.cornerRadius=20;
    Next_BTN.clipsToBounds = YES;
    Next_BTN.layer.borderColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0].CGColor;
//    Next_BTN.alpha=0.3;
//    Next_BTN.userInteractionEnabled=NO;
    Next_BTN.layer.borderWidth=1;
    Next_BTN.frame = CGRectMake((scrollview.frame.size.width-120)/2,Country_TXT.frame.origin.y+Country_TXT.frame.size.height+10,120, 40.0);
    [scrollview addSubview:Next_BTN];
    

    if ([[Business_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Last_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Address1_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[City_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Zip_code_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Country_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[State_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        Next_BTN.alpha=0.3;
        Next_BTN.userInteractionEnabled=NO;
        
        
    }
    
    else
    {
        Next_BTN.alpha=1.0;
        Next_BTN.userInteractionEnabled=YES;
        
    }
    

    
    
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 700);
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    
    [super viewWillDisappear:animated];
    
    // unregister for keyboard notifications
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
    
}


#pragma mark - -*********************
#pragma mark Toolbar animation methods
#pragma mark - -*********************

-(void)createInputAccessoryView
{
    ptoolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    ptoolbar.barStyle = UIBarStyleBlackOpaque;
    UIBarButtonItem* cancel = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:self action:@selector(cancel:)];
    UIBarButtonItem* flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(Done:)];
    
    [ptoolbar setItems:[NSArray arrayWithObjects:cancel, flexSpace,done, nil] animated:NO];
   
    
    
}

- (void)cancel:(UIBarButtonItem *)sender
{

}

- (void)Done:(UIBarButtonItem *)sender
{
    [self.view endEditing:YES];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 700);
        [UIView commitAnimations];
    });

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
    
    
     if ([[Business_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Last_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Address1_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[City_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Zip_code_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Country_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[State_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
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
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 700);
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
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 700);
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view endEditing:YES];
        [UIView commitAnimations];
    });
    
    
    
    if ([[Business_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Last_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Address1_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[City_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Zip_code_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Country_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[State_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
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
   
    
  if ([[Business_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Last_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Address1_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[City_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Zip_code_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Country_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[State_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
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
        
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 700);
        [UIView commitAnimations];
    });
    
}

- (void)doneTouched:(UIBarButtonItem *)sender
{
    [self.view endEditing:YES];
    
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 700);
        [UIView commitAnimations];
    });
    
    if ([[Business_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Last_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Address1_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[City_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Zip_code_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Country_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[State_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
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
    
//    // 2015-05-08 11:03:03 +0000
//    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"YYYY-MM-dd  HH:mm:ss Z"];
//    
//    NSDate *date = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",[sender date]]];
//    
//    
//    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
//    [dateFormatter2 setDateFormat:@"MM-dd-yyyy"];
//    NSString *newDateString = [dateFormatter2 stringFromDate:date];
//    
//    NSLog(@"value: %@",newDateString);
//    
//    Expiration_TXT.text=newDateString;
//    
//    NSLog(@"value: %@",[sender date]);
}


-(void)Next:(UIButton *)sender
{
    
    [[NSUserDefaults standardUserDefaults]setObject:@"True" forKey:@"Insurance_Info_Statues"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    
    
     if ([[Business_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Last_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Address1_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[City_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Zip_code_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Country_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
        
        
        
        
         
        
    }
    
    else
    {

        [self mActivityIndicater];
        
        [self performSelector:@selector(UpDate_CallTheServer) withObject:nil afterDelay:0.5];
        
        
        [self.view endEditing:YES];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.5];
            [UIView setAnimationCurve:UIViewAnimationCurveLinear];
            scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            
            scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 700);
            [UIView commitAnimations];
        });

        

    }
    
    
    
    
}


-(void)UpDate_CallTheServer
{
    if ([API connectedToInternet]==YES) {
        
       //// ------------ Call API for signup With Post Method --------------//
        
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&name_on_card=%@&card_number=%@&card_type=%@&card_cvv=%@&card_exp_month=%@&card_exp_year=%@&card_first_name=%@&card_last_name=%@&card_address=%@&card_address2=%@&card_city=%@&card_state=%@&card_zip=%@&card_country=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],Card_name_STR,card_number_STR,card_type_STR,CVV_STR,Expiary_Month_STR,Expiary_Year_STR,Business_name_TXT.text,Last_name_TXT.text,Address1_TXT.text,Address2_TXT.text,State_TXT.text,City_TXT.text,Zip_code_TXT.text,Country_TXT.text]:[NSString stringWithFormat:@"%@update_credit_card",[Utility API_link_url]]];
        
        
        
        
        
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

    
    [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
}

-(void)Back:(UIButton *)sender
{
     [self.navigationController popViewControllerAnimated:YES];
}
//
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
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 700);
        [UIView commitAnimations];
    });
    
    
    return YES;
    
}


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

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    
    UITextField *mtextFeild=textField;
    
    mtextFeild.text=@"";
    
    
  if ([[Business_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Last_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Address1_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[City_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Zip_code_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Country_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[State_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
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
    
    
    if ([[Business_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Last_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Address1_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[City_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Zip_code_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Country_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[State_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || newLength==0) {
        
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
