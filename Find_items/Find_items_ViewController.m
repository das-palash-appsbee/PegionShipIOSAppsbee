 //
//  Find_items_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 07/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Find_items_ViewController.h"
#import <AddressBookUI/AddressBookUI.h>

@interface Find_items_ViewController ()
{
   NSString *test;
   CLPlacemark * myPlacemark;
    NSMutableArray *mainarrr;
      NSMutableArray *mainarrr2;
}

//@property (strong, nonatomic) CLLocationManager *locationManager;
//@property (strong, nonatomic) CLLocation *location;

@end

@implementation Find_items_ViewController

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



-(void)createInputAccessoryView_cardnumber
{
    ptoolbar_card = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    ptoolbar_card.barStyle = UIBarStyleBlackOpaque;
    UIBarButtonItem* cancel_card = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:self action:@selector(cancel_card)];
    UIBarButtonItem* flexSpace_cxard = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *done_card = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(Done_card)];
    
    [ptoolbar_card setItems:[NSArray arrayWithObjects:cancel_card, flexSpace_cxard,done_card, nil] animated:NO];
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    count_value=620;
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"Tiny"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"Small"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"Medium"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"Large"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"Extra Large"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"Other"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    array2=[[NSMutableArray alloc]init];
    
    
    Any_price_array=[[NSMutableArray alloc]initWithObjects:@"$10-$50",@"$51-$80",@"$81-$120",@"$121-$130", nil];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardDidHideNotification object:nil];

    
    [self createInputAccessoryView_cardnumber];

   mainarrr =[[NSMutableArray alloc]init];
    
     mainarrr2 =[[NSMutableArray alloc]init];
    ScrollFrame=620;
    
    scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,[[UIScreen mainScreen]bounds].size.width,[[UIScreen mainScreen]bounds].size.height)];
    scrollview.showsVerticalScrollIndicator=YES;
    scrollview.scrollEnabled=YES;
    scrollview.userInteractionEnabled=YES;
    scrollview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"main_slider_bg.jpg"]];
    [self.view addSubview:scrollview];
    
    
    self.navigationController.navigationBarHidden=YES;
    
    
    
    //------------ UIpicker view for show State list --------------//
    
    pPickerState=[[UIPickerView alloc] initWithFrame:CGRectMake(10,600, 300, 200)];
    
    pPickerState.showsSelectionIndicator=YES;
    pPickerState.backgroundColor=[UIColor whiteColor];
    pPickerState.delegate=self;
    pPickerState.dataSource=self;
    [scrollview addSubview:pPickerState];
    
    // add a toolbar with Cancel & Done button
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolBar.barStyle = UIBarStyleBlackOpaque;
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneToucheds:)];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelToucheds:)];
    
    // the middle button is to make the Done button align to right
    [toolBar setItems:[NSArray arrayWithObjects:cancelButton, [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], doneButton, nil]];

    
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
//    
    
    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    MTitle = [[UILabel alloc] init];
    MTitle.textColor = [UIColor blackColor];
    [MTitle setFrame:CGRectMake(0,20,self.view.frame.size.width, 40)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"Find items";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:MTitle];
    
    
    
    
    
    /////////////////////////////Current Location\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Current_Location_LB = [[UILabel alloc] init];
    Current_Location_LB.textColor = [UIColor blackColor];
    [Current_Location_LB setFrame:CGRectMake(30,MTitle.frame.origin.y+50,250, 30)];
    Current_Location_LB.backgroundColor=[UIColor clearColor];
    Current_Location_LB.textColor=[UIColor whiteColor];
    Current_Location_LB.userInteractionEnabled=NO;
    [Current_Location_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Current_Location_LB.text= @"Set Current Location";
    Current_Location_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Current_Location_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Current_Location_LB];
    
    
    
    Current_Location_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,Current_Location_LB.frame.origin.y+10,self.view.frame.size.width-80, 40)];
    Current_Location_TXT.borderStyle = UITextBorderStyleNone;
    Current_Location_TXT.tag=1002;
    Current_Location_TXT.font = [UIFont systemFontOfSize:15];
    Current_Location_TXT.keyboardType = UIKeyboardTypeDefault;
    Current_Location_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Current_Location_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Current_Location_TXT.delegate = self;
    Current_Location_TXT.backgroundColor=[UIColor clearColor];
    Current_Location_TXT.textColor=[UIColor whiteColor];
    [Current_Location_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
    Current_Location_TXT.tag=001;
    Current_Location_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Current_Location_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [Current_Location_TXT setRightViewMode:UITextFieldViewModeAlways];
    
    [scrollview addSubview:Current_Location_TXT];
    
    
    
    
    UIImageView *imgView_Lname = [[UIImageView alloc] initWithFrame:CGRectMake(Current_Location_TXT.frame.origin.x+Current_Location_TXT.frame.size.width, Current_Location_TXT.frame.origin.y+17, 35, 35)];
    imgView_Lname.image = [UIImage imageNamed:@"locatio.png"];
    imgView_Lname.userInteractionEnabled=YES;
        [scrollview addSubview:imgView_Lname];
    
    UITapGestureRecognizer *gestureRecognizers = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFroms:)];
    [imgView_Lname addGestureRecognizer:gestureRecognizers];
    gestureRecognizers.cancelsTouchesInView = NO;

    
    
    
    
    
    
    
    
    /////////////////////////////Current Location\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Price_will_LB = [[UILabel alloc] init];
    Price_will_LB.textColor = [UIColor blackColor];
    [Price_will_LB setFrame:CGRectMake(30,Current_Location_TXT.frame.origin.y+50,250, 30)];
    Price_will_LB.backgroundColor=[UIColor clearColor];
    Price_will_LB.textColor=[UIColor whiteColor];
    Price_will_LB.userInteractionEnabled=NO;
    [Price_will_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Price_will_LB.text= @"Price";
    Price_will_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Price_will_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Price_will_LB];
    
    
    
    Price_will_TX = [[UITextField alloc] initWithFrame:CGRectMake(30,Price_will_LB.frame.origin.y+10,self.view.frame.size.width-80, 40)];
    Price_will_TX.borderStyle = UITextBorderStyleNone;
    Price_will_TX.tag=1002;
    Price_will_TX.font = [UIFont systemFontOfSize:15];
    Price_will_TX.keyboardType = UIKeyboardTypeDefault;
    Price_will_TX.clearButtonMode = UITextFieldViewModeWhileEditing;
    Price_will_TX.autocorrectionType = UITextAutocorrectionTypeNo;
    Price_will_TX.delegate = self;
    Price_will_TX.backgroundColor=[UIColor clearColor];
    Price_will_TX.textColor=[UIColor whiteColor];
    [Price_will_TX setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
    Price_will_TX.tag=001;
    Price_will_TX.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Price_will_TX setBackground:[UIImage imageNamed:@"line-1.png"]];
    [Price_will_TX setRightViewMode:UITextFieldViewModeAlways];
    
    [scrollview addSubview:Price_will_TX];
    
    Price_will_TX.inputView=pPickerState;
    [pPickerState removeFromSuperview];

    UIImageView *imgView_Price = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 14, 7)];
    imgView_Price.image = [UIImage imageNamed:@"dropdown-icon-2.png"];
    UIView *paddingView_Price = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [paddingView_Price addSubview:imgView_Price];
    [Price_will_TX setRightViewMode:UITextFieldViewModeAlways];
    [Price_will_TX setRightView:paddingView_Price];
    
    [scrollview addSubview:Price_will_TX];
    [Price_will_TX setRightViewMode:UITextFieldViewModeAlways];
    Price_will_TX.inputAccessoryView=toolBar;

    
    
    ///////////////////////////// Suggested price Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    SUB_Title = [[UILabel alloc] init];
    SUB_Title.textColor = [UIColor blackColor];
    [SUB_Title setFrame:CGRectMake(20,Price_will_TX.frame.origin.y+Price_will_TX.frame.size.height+10,scrollview.frame.size.width, 50)];
    SUB_Title.backgroundColor=[UIColor clearColor];
    SUB_Title.textColor=[UIColor whiteColor];
    SUB_Title.userInteractionEnabled=NO;
    [SUB_Title setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    SUB_Title.numberOfLines=0;
    SUB_Title.text=@"Select item size";
    
       [scrollview addSubview:SUB_Title];

    
    
    ///////////////////////////// Tiny_Check_Uncheck  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Tiny_Check_Uncheck = [UIButton buttonWithType:UIButtonTypeCustom];
    [Tiny_Check_Uncheck addTarget:self action:@selector(Tiny_Btn_action:)forControlEvents:UIControlEventTouchUpInside];
    Tiny_Check_Uncheck.tag=1;
    Tiny_Check_Uncheck.frame = CGRectMake(10,SUB_Title.frame.origin.y+SUB_Title.frame.size.height,30,30);
    [Tiny_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_checkbox.png"] forState:UIControlStateNormal];
    [scrollview addSubview:Tiny_Check_Uncheck];
    
    
    
    ///////////////////////////// Tiny Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Tiny_Check_text = [[UILabel alloc] init];
    Tiny_Check_text.textColor = [UIColor blackColor];
    [Tiny_Check_text setFrame:CGRectMake(40,SUB_Title.frame.origin.y+SUB_Title.frame.size.height+7,200, 22)];
    Tiny_Check_text.backgroundColor=[UIColor clearColor];
    Tiny_Check_text.textColor=[UIColor whiteColor];
    Tiny_Check_text.userInteractionEnabled=NO;
    [Tiny_Check_text setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Tiny_Check_text.text = @"Tiny";
    
    Tiny_Check_text.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Tiny_Check_text.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Tiny_Check_text];
    
    
    
    ///////////////////////////// Small_Check_Uncheck  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Small_Check_Uncheck = [UIButton buttonWithType:UIButtonTypeCustom];
    [Small_Check_Uncheck addTarget:self action:@selector(Small_Check_action:)forControlEvents:UIControlEventTouchUpInside];
    Small_Check_Uncheck.frame = CGRectMake(10,Tiny_Check_text.frame.origin.y+Tiny_Check_text.frame.size.height+17,30,30);
    Small_Check_Uncheck.tag=2;
    [Small_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_checkbox.png"] forState:UIControlStateNormal];
    
    [scrollview addSubview:Small_Check_Uncheck];
    
    
    
    ///////////////////////////// Small_Check_text  lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Small_Check_text = [[UILabel alloc] init];
    Small_Check_text.textColor = [UIColor blackColor];
    [Small_Check_text setFrame:CGRectMake(40,Tiny_Check_text.frame.origin.y+Tiny_Check_text.frame.size.height+22,200, 22)];
    Small_Check_text.backgroundColor=[UIColor clearColor];
    Small_Check_text.textColor=[UIColor whiteColor];
    Small_Check_text.userInteractionEnabled=NO;
    [Small_Check_text setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    
    
//    NSString *Small_Check_text_value=@"Small example: Duffle Bag";
//    
//    NSMutableAttributedString *str_Small_Check_text= [[NSMutableAttributedString alloc] initWithString:Small_Check_text_value];
//    
//    [str_Small_Check_text addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0] range:NSMakeRange(0, 5)];
//    
//    
//    
//    [str_Small_Check_text addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"bariol-regular" size:16.0] range:NSMakeRange(5, [string_value length]-6)];
//    
    Small_Check_text.text = @"Small";
    
    Small_Check_text.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Small_Check_text.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Small_Check_text];
    
    
    
    ///////////////////////////// Medium_Check_Uncheck  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Medium_Check_Uncheck = [UIButton buttonWithType:UIButtonTypeCustom];
    [Medium_Check_Uncheck addTarget:self action:@selector(Medium_Btn_action:)forControlEvents:UIControlEventTouchUpInside];
      Medium_Check_Uncheck.tag=3;
    Medium_Check_Uncheck.frame = CGRectMake(10,Small_Check_text.frame.origin.y+Small_Check_text.frame.size.height+17,30,30);
    [Medium_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_checkbox.png"] forState:UIControlStateNormal];
    
    [scrollview addSubview:Medium_Check_Uncheck];
    
    
    
    ///////////////////////////// Medium_text  lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Medium_Check_text = [[UILabel alloc] init];
    Medium_Check_text.textColor = [UIColor blackColor];
    [Medium_Check_text setFrame:CGRectMake(37,Small_Check_text.frame.origin.y+Small_Check_text.frame.size.height+21,300, 22)];
    Medium_Check_text.backgroundColor=[UIColor clearColor];
    Medium_Check_text.textColor=[UIColor whiteColor];
    Medium_Check_text.userInteractionEnabled=NO;
    [Medium_Check_text setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    
    
//    NSString *Medium_Check_text_value=@"Medium example: T.V. or Microwave";
//    
//    NSMutableAttributedString *str_Medium_Check_text= [[NSMutableAttributedString alloc] initWithString:Medium_Check_text_value];
//    
//    [str_Medium_Check_text addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0] range:NSMakeRange(0, 6)];
//    
//    
//    
//    [str_Medium_Check_text addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"bariol-regular" size:16.0] range:NSMakeRange(6, [string_value length]-7)];
    
    Medium_Check_text.text = @"Medium";
    
    Medium_Check_text.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Medium_Check_text.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Medium_Check_text];
    
    ///////////////////////////// Large_Check_Uncheck  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Large_Check_Uncheck = [UIButton buttonWithType:UIButtonTypeCustom];
    [Large_Check_Uncheck addTarget:self action:@selector(Large_Check_Btn_action:)forControlEvents:UIControlEventTouchUpInside];
     Large_Check_Uncheck.tag=4;
    Large_Check_Uncheck.frame = CGRectMake(10,Medium_Check_text.frame.origin.y+Medium_Check_text.frame.size.height+17,30,30);
    [Large_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_checkbox.png"] forState:UIControlStateNormal];
    [scrollview addSubview:Large_Check_Uncheck];
    
    
    
    ///////////////////////////// Large_text  lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Large_Check_text = [[UILabel alloc] init];
    Large_Check_text.textColor = [UIColor blackColor];
    [Large_Check_text setFrame:CGRectMake(37,Medium_Check_text.frame.origin.y+Medium_Check_text.frame.size.height+21,300, 22)];
    Large_Check_text.backgroundColor=[UIColor clearColor];
    Large_Check_text.textColor=[UIColor whiteColor];
    Large_Check_text.userInteractionEnabled=NO;
    [Large_Check_text setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    
    
//    NSString *Large_Check_text_value=@"Large example: Large Suitcase";
//    
//    NSMutableAttributedString *str_Large_Check_text= [[NSMutableAttributedString alloc] initWithString:Large_Check_text_value];
//    
//    [str_Large_Check_text addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0] range:NSMakeRange(0, 5)];
//    
//    
//    
//    [str_Large_Check_text addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"bariol-regular" size:16.0] range:NSMakeRange(6, [string_value length]-6)];
    
    Large_Check_text.text = @"Large";
    
    Large_Check_text.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Large_Check_text.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Large_Check_text];
    
    
    
    
    ///////////////////////////// Extra_Check_Uncheck  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Extra_Check_Uncheck = [UIButton buttonWithType:UIButtonTypeCustom];
    [Extra_Check_Uncheck addTarget:self action:@selector(Extra_Btn_action:)forControlEvents:UIControlEventTouchUpInside];
    Extra_Check_Uncheck.frame = CGRectMake(10,Large_Check_text.frame.origin.y+Large_Check_text.frame.size.height+17,30,30);
    Extra_Check_Uncheck.tag=5;
    [Extra_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_checkbox.png"] forState:UIControlStateNormal];
    
    [scrollview addSubview:Extra_Check_Uncheck];
    
    
    
    ///////////////////////////// Extra_text  lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Extra_Check_text = [[UILabel alloc] init];
    Extra_Check_text.textColor = [UIColor blackColor];
    [Extra_Check_text setFrame:CGRectMake(37,Large_Check_text.frame.origin.y+Large_Check_text.frame.size.height+21,300, 22)];
    Extra_Check_text.backgroundColor=[UIColor clearColor];
    Extra_Check_text.textColor=[UIColor whiteColor];
    Extra_Check_text.userInteractionEnabled=NO;
    [Extra_Check_text setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    
    
//    NSString *Extra_Check_text_value=@"Extra Large example: Golf Clubs, Skis, Bike";
//    
//    NSMutableAttributedString *str_Extra_Check_text= [[NSMutableAttributedString alloc] initWithString:Extra_Check_text_value];
//    
//    [str_Extra_Check_text addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0] range:NSMakeRange(0, 12)];
//    
//    
//    
//    [str_Extra_Check_text addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"bariol-regular" size:16.0] range:NSMakeRange(13, [string_value length]-13)];
    
    Extra_Check_text.text = @"Extra Large";
    
    Extra_Check_text.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Extra_Check_text.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Extra_Check_text];
    
    
    
    ///////////////////////////// Other_Check_Uncheck  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Other_Check_Uncheck = [UIButton buttonWithType:UIButtonTypeCustom];
    [Other_Check_Uncheck addTarget:self action:@selector(Other_Check_action:)forControlEvents:UIControlEventTouchUpInside];
    Other_Check_Uncheck.frame = CGRectMake(10,Extra_Check_text.frame.origin.y+Extra_Check_text.frame.size.height+17,30,30);
     Other_Check_Uncheck.tag=6;
    [Other_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_checkbox.png"] forState:UIControlStateNormal];
    
    [scrollview addSubview:Other_Check_Uncheck];
    
    
    
    ///////////////////////////// Other_Text  lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Other_Check_text = [[UILabel alloc] init];
    Other_Check_text.textColor = [UIColor blackColor];
    [Other_Check_text setFrame:CGRectMake(37,Extra_Check_text.frame.origin.y+Extra_Check_text.frame.size.height+26,270, 22)];
    Other_Check_text.backgroundColor=[UIColor clearColor];
    Other_Check_text.textColor=[UIColor whiteColor];
    Other_Check_text.userInteractionEnabled=NO;
    
    [Other_Check_text setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Other_Check_text.lineBreakMode = NSLineBreakByWordWrapping;
    Other_Check_text.numberOfLines = 0;
    
    Other_Check_text.text = @"Other";
    
    Other_Check_text.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Other_Check_text.textAlignment=NSTextAlignmentLeft;
    
    [Other_Check_text sizeToFit];
    [scrollview addSubview:Other_Check_text];
    

    
    
    
    
    
    
    
    
    
    /////////////////////////////Add Zip Code\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Add_Zip_LB = [[UILabel alloc] init];
    Add_Zip_LB.textColor = [UIColor blackColor];
    [Add_Zip_LB setFrame:CGRectMake(30,Other_Check_text.frame.origin.y+Other_Check_text.frame.size.height+10,150, 30)];
    Add_Zip_LB.backgroundColor=[UIColor clearColor];
    Add_Zip_LB.textColor=[UIColor whiteColor];
    Add_Zip_LB.userInteractionEnabled=NO;
    [Add_Zip_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Add_Zip_LB.text= @"Add Zip Code";

    Add_Zip_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Add_Zip_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Add_Zip_LB];
    
    
    
    Add_Zip_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,Other_Check_text.frame.origin.y+Other_Check_text.frame.size.height+10, self.view.frame.size.width-215, 40)];
    Add_Zip_TXT.borderStyle = UITextBorderStyleNone;
    Add_Zip_TXT.font = [UIFont systemFontOfSize:15];
    Add_Zip_TXT.keyboardType = UIKeyboardTypeNumberPad;
   /// Add_Zip_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Add_Zip_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Add_Zip_TXT.delegate = self;
    Add_Zip_TXT.backgroundColor=[UIColor clearColor];
    Add_Zip_TXT.textColor=[UIColor whiteColor];
    [Add_Zip_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Add_Zip_TXT.tag=003;
    [Add_Zip_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    Add_Zip_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Add_Zip_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [Add_Zip_TXT setRightViewMode:UITextFieldViewModeAlways];
    Add_Zip_TXT.inputAccessoryView=ptoolbar_card;

    [scrollview addSubview:Add_Zip_TXT];
    
    
    
    
    
    
    ///////////////////////////// Add Radius  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Add_Radius_LB = [[UILabel alloc] init];
    Add_Radius_LB.textColor = [UIColor blackColor];
    [Add_Radius_LB setFrame:CGRectMake(155,Other_Check_text.frame.origin.y+Other_Check_text.frame.size.height+10,100, 30)];
    Add_Radius_LB.backgroundColor=[UIColor clearColor];
    Add_Radius_LB.textColor=[UIColor whiteColor];
    Add_Radius_LB.userInteractionEnabled=NO;
  
    
    
    
    
    [Add_Radius_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Add_Radius_LB.text= @"Add Radius";
    Add_Radius_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Add_Radius_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Add_Radius_LB];
    
    
    Add_Radius_TXT = [[UITextField alloc] initWithFrame:CGRectMake(155, Other_Check_text.frame.origin.y+Other_Check_text.frame.size.height+10, self.view.frame.size.width-215, 40)];
    Add_Radius_TXT.borderStyle = UITextBorderStyleNone;
    Add_Radius_TXT.font = [UIFont systemFontOfSize:15];
    Add_Radius_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Add_Radius_TXT.keyboardType = UIKeyboardTypeNumberPad;
  //  Add_Radius_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Add_Radius_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Add_Radius_TXT.delegate = self;
    Add_Radius_TXT.backgroundColor=[UIColor clearColor];
    Add_Radius_TXT.textColor=[UIColor whiteColor];
    Add_Radius_TXT.tag=004;
    [Add_Radius_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Add_Radius_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Add_Radius_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
     Add_Radius_TXT.inputAccessoryView=ptoolbar_card;
    [scrollview addSubview:Add_Radius_TXT];
    [Add_Radius_TXT setRightViewMode:UITextFieldViewModeAlways];
    
    
    
    ///////////////////////////// second Row  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    /////////////////////////////Add Zip Code\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Add_Zip_LB2 = [[UILabel alloc] init];
    Add_Zip_LB2.textColor = [UIColor blackColor];
    [Add_Zip_LB2 setFrame:CGRectMake(30,Add_Radius_TXT.frame.origin.y+Add_Radius_TXT.frame.size.height+10,150, 30)];
    Add_Zip_LB2.backgroundColor=[UIColor clearColor];
    Add_Zip_LB2.textColor=[UIColor whiteColor];
    Add_Zip_LB2.userInteractionEnabled=NO;
    [Add_Zip_LB2 setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Add_Zip_LB2.text= @"Add Zip Code";
    
    Add_Zip_LB2.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Add_Zip_LB2.textAlignment=NSTextAlignmentLeft;
    Add_Zip_LB2.hidden=YES;
    [scrollview addSubview:Add_Zip_LB2];
    
    
    
    Add_Zip_TXT2 = [[UITextField alloc] initWithFrame:CGRectMake(30,Add_Zip_LB2.frame.origin.y+5, self.view.frame.size.width-215, 40)];
    Add_Zip_TXT2.borderStyle = UITextBorderStyleNone;
    Add_Zip_TXT2.font = [UIFont systemFontOfSize:15];
    Add_Zip_TXT2.keyboardType = UIKeyboardTypeDefault;
   // Add_Zip_TXT2.clearButtonMode = UITextFieldViewModeWhileEditing;
    Add_Zip_TXT2.autocorrectionType = UITextAutocorrectionTypeNo;
    Add_Zip_TXT2.delegate = self;
    Add_Zip_TXT2.backgroundColor=[UIColor clearColor];
    Add_Zip_TXT2.textColor=[UIColor whiteColor];
    [Add_Zip_TXT2 setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Add_Zip_TXT2.tag=003;
    [Add_Zip_TXT2 setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    Add_Zip_TXT2.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Add_Zip_TXT2 setBackground:[UIImage imageNamed:@"line-1.png"]];
    [Add_Zip_TXT2 setRightViewMode:UITextFieldViewModeAlways];
     Add_Zip_TXT2.hidden=YES;
    Add_Zip_TXT2.inputAccessoryView=ptoolbar_card;
     Add_Zip_TXT2.keyboardType = UIKeyboardTypeNumberPad;
    [scrollview addSubview:Add_Zip_TXT2];
    
    
    ///////////////////////////// Add Radius  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Add_Radius_LB2 = [[UILabel alloc] init];
    Add_Radius_LB2.textColor = [UIColor blackColor];
    [Add_Radius_LB2 setFrame:CGRectMake(155,Add_Radius_TXT.frame.origin.y+Add_Radius_TXT.frame.size.height+5,100, 30)];
    Add_Radius_LB2.backgroundColor=[UIColor clearColor];
    Add_Radius_LB2.textColor=[UIColor whiteColor];
    Add_Radius_LB2.userInteractionEnabled=NO;
    
    [Add_Radius_LB2 setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Add_Radius_LB2.text= @"Add Radius";
    Add_Radius_LB2.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Add_Radius_LB2.textAlignment=NSTextAlignmentLeft;
    Add_Radius_LB2.hidden=YES;
    [scrollview addSubview:Add_Radius_LB2];
    
    
    Add_Radius_TXT2 = [[UITextField alloc] initWithFrame:CGRectMake(155, Add_Radius_LB2.frame.origin.y+10, self.view.frame.size.width-215, 40)];
    Add_Radius_TXT2.borderStyle = UITextBorderStyleNone;
    Add_Radius_TXT2.font = [UIFont systemFontOfSize:15];
    Add_Radius_TXT2.autocorrectionType = UITextAutocorrectionTypeNo;
    Add_Radius_TXT2.keyboardType = UIKeyboardTypeNumberPad;
   // Add_Radius_TXT2.clearButtonMode = UITextFieldViewModeWhileEditing;
    Add_Radius_TXT2.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Add_Radius_TXT2.delegate = self;
    Add_Radius_TXT2.backgroundColor=[UIColor clearColor];
    Add_Radius_TXT2.textColor=[UIColor whiteColor];
    Add_Radius_TXT2.tag=004;
    [Add_Radius_TXT2 setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Add_Radius_TXT2.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Add_Radius_TXT2 setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:Add_Radius_TXT2];
   Add_Radius_TXT2.hidden=YES;
    Add_Radius_TXT2.inputAccessoryView=ptoolbar_card;

    [Add_Radius_TXT2 setRightViewMode:UITextFieldViewModeAlways];
    
    
    
    
    
    ///////////////////////////// 3rd Row  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    /////////////////////////////Add Zip Code\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Add_Zip_LB3 = [[UILabel alloc] init];
    Add_Zip_LB3.textColor = [UIColor blackColor];
    [Add_Zip_LB3 setFrame:CGRectMake(30,Add_Radius_TXT2.frame.origin.y+Add_Radius_TXT2.frame.size.height+10,150, 30)];
    Add_Zip_LB3.backgroundColor=[UIColor clearColor];
    Add_Zip_LB3.textColor=[UIColor whiteColor];
    Add_Zip_LB3.userInteractionEnabled=NO;
    [Add_Zip_LB3 setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Add_Zip_LB3.text= @"Add Zip Code";
    
    Add_Zip_LB3.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Add_Zip_LB3.textAlignment=NSTextAlignmentLeft;
    Add_Zip_LB3.hidden=YES;
    [scrollview addSubview:Add_Zip_LB3];
    
    
    
    Add_Zip_TXT3 = [[UITextField alloc] initWithFrame:CGRectMake(30,Add_Zip_LB3.frame.origin.y+5, self.view.frame.size.width-215, 40)];
    Add_Zip_TXT3.borderStyle = UITextBorderStyleNone;
    Add_Zip_TXT3.font = [UIFont systemFontOfSize:15];
    Add_Zip_TXT3.keyboardType = UIKeyboardTypeDefault;
    // Add_Zip_TXT2.clearButtonMode = UITextFieldViewModeWhileEditing;
    Add_Zip_TXT3.autocorrectionType = UITextAutocorrectionTypeNo;
    Add_Zip_TXT3.delegate = self;
    Add_Zip_TXT3.backgroundColor=[UIColor clearColor];
    Add_Zip_TXT3.textColor=[UIColor whiteColor];
    [Add_Zip_TXT3 setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Add_Zip_TXT3.tag=003;
    [Add_Zip_TXT3 setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    Add_Zip_TXT3.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Add_Zip_TXT3 setBackground:[UIImage imageNamed:@"line-1.png"]];
    [Add_Zip_TXT3 setRightViewMode:UITextFieldViewModeAlways];
     Add_Zip_TXT3.hidden=YES;
     Add_Zip_TXT3.inputAccessoryView=ptoolbar_card;
      Add_Zip_TXT3.keyboardType = UIKeyboardTypeNumberPad;
    [scrollview addSubview:Add_Zip_TXT3];
    
    
    ///////////////////////////// Add Radius  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Add_Radius_LB3 = [[UILabel alloc] init];
    Add_Radius_LB3.textColor = [UIColor blackColor];
    [Add_Radius_LB3 setFrame:CGRectMake(155,Add_Radius_TXT2.frame.origin.y+Add_Radius_TXT2.frame.size.height+5,100, 30)];
    Add_Radius_LB3.backgroundColor=[UIColor clearColor];
    Add_Radius_LB3.textColor=[UIColor whiteColor];
    Add_Radius_LB3.userInteractionEnabled=NO;
    
    [Add_Radius_LB3 setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Add_Radius_LB3.text= @"Add Radius";
    Add_Radius_LB3.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Add_Radius_LB3.textAlignment=NSTextAlignmentLeft;
     Add_Radius_LB3.hidden=YES;
    [scrollview addSubview:Add_Radius_LB3];
    
    
    Add_Radius_TXT3 = [[UITextField alloc] initWithFrame:CGRectMake(155, Add_Radius_LB3.frame.origin.y+10, self.view.frame.size.width-215, 40)];
    Add_Radius_TXT3.borderStyle = UITextBorderStyleNone;
    Add_Radius_TXT3.font = [UIFont systemFontOfSize:15];
    Add_Radius_TXT3.autocorrectionType = UITextAutocorrectionTypeNo;
    Add_Radius_TXT3.keyboardType = UIKeyboardTypeNumberPad;
    // Add_Radius_TXT2.clearButtonMode = UITextFieldViewModeWhileEditing;
    Add_Radius_TXT3.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Add_Radius_TXT3.delegate = self;
    Add_Radius_TXT3.backgroundColor=[UIColor clearColor];
    Add_Radius_TXT3.textColor=[UIColor whiteColor];
    Add_Radius_TXT3.tag=004;
    [Add_Radius_TXT3 setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Add_Radius_TXT3.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Add_Radius_TXT3 setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:Add_Radius_TXT3];
    Add_Radius_TXT3.hidden=YES;
     Add_Radius_TXT3.inputAccessoryView=ptoolbar_card;
    [Add_Radius_TXT3 setRightViewMode:UITextFieldViewModeAlways];

    
    
    
    ///////////////////////////// 4rd Row  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    /////////////////////////////Add Zip Code\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Add_Zip_LB4 = [[UILabel alloc] init];
    Add_Zip_LB4.textColor = [UIColor blackColor];
    [Add_Zip_LB4 setFrame:CGRectMake(30,Add_Radius_TXT3.frame.origin.y+Add_Radius_TXT3.frame.size.height+10,150, 30)];
    Add_Zip_LB4.backgroundColor=[UIColor clearColor];
    Add_Zip_LB4.textColor=[UIColor whiteColor];
    Add_Zip_LB4.userInteractionEnabled=NO;
    [Add_Zip_LB4 setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Add_Zip_LB4.text= @"Add Zip Code";
    
    Add_Zip_LB4.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Add_Zip_LB4.textAlignment=NSTextAlignmentLeft;
    Add_Zip_LB4.hidden=YES;
    [scrollview addSubview:Add_Zip_LB4];
    
    
    
    Add_Zip_TXT4 = [[UITextField alloc] initWithFrame:CGRectMake(30,Add_Zip_LB4.frame.origin.y+5, self.view.frame.size.width-215, 40)];
    Add_Zip_TXT4.borderStyle = UITextBorderStyleNone;
    Add_Zip_TXT4.font = [UIFont systemFontOfSize:15];
    Add_Zip_TXT4.keyboardType = UIKeyboardTypeDefault;
    // Add_Zip_TXT2.clearButtonMode = UITextFieldViewModeWhileEditing;
    Add_Zip_TXT4.autocorrectionType = UITextAutocorrectionTypeNo;
    Add_Zip_TXT4.delegate = self;
    Add_Zip_TXT4.backgroundColor=[UIColor clearColor];
    Add_Zip_TXT4.textColor=[UIColor whiteColor];
    [Add_Zip_TXT4 setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Add_Zip_TXT4.tag=003;
    [Add_Zip_TXT4 setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    Add_Zip_TXT4.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Add_Zip_TXT4 setBackground:[UIImage imageNamed:@"line-1.png"]];
    [Add_Zip_TXT4 setRightViewMode:UITextFieldViewModeAlways];
    Add_Zip_TXT4.hidden=YES;
    Add_Zip_TXT4.inputAccessoryView=ptoolbar_card;
  Add_Zip_TXT4.keyboardType = UIKeyboardTypeNumberPad;

    [scrollview addSubview:Add_Zip_TXT4];
    
    
    ///////////////////////////// Add Radius  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Add_Radius_LB4 = [[UILabel alloc] init];
    Add_Radius_LB4.textColor = [UIColor blackColor];
    [Add_Radius_LB4 setFrame:CGRectMake(155,Add_Radius_TXT3.frame.origin.y+Add_Radius_TXT3.frame.size.height+5,100, 30)];
    Add_Radius_LB4.backgroundColor=[UIColor clearColor];
    Add_Radius_LB4.textColor=[UIColor whiteColor];
    Add_Radius_LB4.userInteractionEnabled=NO;
    
    [Add_Radius_LB4 setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Add_Radius_LB4.text= @"Add Radius";
    Add_Radius_LB4.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Add_Radius_LB4.textAlignment=NSTextAlignmentLeft;
    
     Add_Radius_LB4.hidden=YES;
    [scrollview addSubview:Add_Radius_LB4];
    
    
    Add_Radius_TXT4 = [[UITextField alloc] initWithFrame:CGRectMake(155, Add_Radius_LB4.frame.origin.y+10, self.view.frame.size.width-215, 40)];
    Add_Radius_TXT4.borderStyle = UITextBorderStyleNone;
    Add_Radius_TXT4.font = [UIFont systemFontOfSize:15];
    Add_Radius_TXT4.autocorrectionType = UITextAutocorrectionTypeNo;
    Add_Radius_TXT4.keyboardType = UIKeyboardTypeNumberPad;
    // Add_Radius_TXT2.clearButtonMode = UITextFieldViewModeWhileEditing;
    Add_Radius_TXT4.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Add_Radius_TXT4.delegate = self;
    Add_Radius_TXT4.backgroundColor=[UIColor clearColor];
    Add_Radius_TXT4.textColor=[UIColor whiteColor];
    Add_Radius_TXT4.tag=004;
    [Add_Radius_TXT4 setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Add_Radius_TXT4.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Add_Radius_TXT4 setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:Add_Radius_TXT4];
     Add_Radius_TXT4.hidden=YES;
      Add_Radius_TXT4.inputAccessoryView=ptoolbar_card;
    [Add_Radius_TXT4 setRightViewMode:UITextFieldViewModeAlways];

    
    
    
    
    ///////////////////////////// 5th Row  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    /////////////////////////////Add Zip Code\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Add_Zip_LB5 = [[UILabel alloc] init];
    Add_Zip_LB5.textColor = [UIColor blackColor];
    [Add_Zip_LB5 setFrame:CGRectMake(30,Add_Radius_TXT4.frame.origin.y+Add_Radius_TXT4.frame.size.height+10,150, 30)];
    Add_Zip_LB5.backgroundColor=[UIColor clearColor];
    Add_Zip_LB5.textColor=[UIColor whiteColor];
    Add_Zip_LB5.userInteractionEnabled=NO;
    [Add_Zip_LB5 setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Add_Zip_LB5.text= @"Add Zip Code";
    
    Add_Zip_LB5.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Add_Zip_LB5.textAlignment=NSTextAlignmentLeft;
    Add_Zip_LB5.hidden=YES;
    [scrollview addSubview:Add_Zip_LB5];
    
    
    
    Add_Zip_TXT5 = [[UITextField alloc] initWithFrame:CGRectMake(30,Add_Zip_LB5.frame.origin.y+5, self.view.frame.size.width-215, 40)];
    Add_Zip_TXT5.borderStyle = UITextBorderStyleNone;
    Add_Zip_TXT5.font = [UIFont systemFontOfSize:15];
    Add_Zip_TXT5.keyboardType = UIKeyboardTypeDefault;
    // Add_Zip_TXT2.clearButtonMode = UITextFieldViewModeWhileEditing;
    Add_Zip_TXT5.autocorrectionType = UITextAutocorrectionTypeNo;
    Add_Zip_TXT5.delegate = self;
    Add_Zip_TXT5.backgroundColor=[UIColor clearColor];
    Add_Zip_TXT5.textColor=[UIColor whiteColor];
    [Add_Zip_TXT5 setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Add_Zip_TXT5.tag=003;
    [Add_Zip_TXT5 setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    Add_Zip_TXT5.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Add_Zip_TXT5 setBackground:[UIImage imageNamed:@"line-1.png"]];
    [Add_Zip_TXT5 setRightViewMode:UITextFieldViewModeAlways];
      Add_Zip_TXT5.hidden=YES;
    Add_Zip_TXT5.inputAccessoryView=ptoolbar_card;
 Add_Zip_TXT5.keyboardType = UIKeyboardTypeNumberPad;
    [scrollview addSubview:Add_Zip_TXT5];
    
    
    ///////////////////////////// Add Radius  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Add_Radius_LB5 = [[UILabel alloc] init];
    Add_Radius_LB5.textColor = [UIColor blackColor];
    [Add_Radius_LB5 setFrame:CGRectMake(155,Add_Radius_TXT4.frame.origin.y+Add_Radius_TXT4.frame.size.height+5,100, 30)];
    Add_Radius_LB5.backgroundColor=[UIColor clearColor];
    Add_Radius_LB5.textColor=[UIColor whiteColor];
    Add_Radius_LB5.userInteractionEnabled=NO;
    
    [Add_Radius_LB5 setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Add_Radius_LB5.text= @"Add Radius";
    Add_Radius_LB5.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Add_Radius_LB5.textAlignment=NSTextAlignmentLeft;
    Add_Radius_LB5.hidden=YES;
    [scrollview addSubview:Add_Radius_LB5];
    
    
    Add_Radius_TXT5 = [[UITextField alloc] initWithFrame:CGRectMake(155, Add_Radius_LB5.frame.origin.y+10, self.view.frame.size.width-215, 40)];
    Add_Radius_TXT5.borderStyle = UITextBorderStyleNone;
    Add_Radius_TXT5.font = [UIFont systemFontOfSize:15];
    Add_Radius_TXT5.autocorrectionType = UITextAutocorrectionTypeNo;
    Add_Radius_TXT5.keyboardType = UIKeyboardTypeNumberPad;
    // Add_Radius_TXT2.clearButtonMode = UITextFieldViewModeWhileEditing;
    Add_Radius_TXT5.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Add_Radius_TXT5.delegate = self;
    Add_Radius_TXT5.backgroundColor=[UIColor clearColor];
    Add_Radius_TXT5.textColor=[UIColor whiteColor];
    Add_Radius_TXT5.tag=004;
    [Add_Radius_TXT5 setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Add_Radius_TXT5.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Add_Radius_TXT5 setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:Add_Radius_TXT5];
    Add_Radius_TXT5.hidden=YES;
    Add_Radius_TXT5.inputAccessoryView=ptoolbar_card;


    [Add_Radius_TXT5 setRightViewMode:UITextFieldViewModeAlways];
    

    
    //Frame=Other_Check_text.frame.origin.y+Other_Check_text.frame.size.height+57;

    
    
   //// Frame=Other_Check_text.frame.origin.y+Other_Check_text.frame.size.height+57;
    
    
    
    
    
    
    
    ////////////////////////////    ADD Plues Button \\\\\\\\\\\\\\\\\\\\\\\\
    
    Plues_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Plues_BTN addTarget:self
                   action:@selector(Plues:)
         forControlEvents:UIControlEventTouchUpInside];
    Plues_BTN.backgroundColor=[UIColor clearColor];
    [Plues_BTN setBackgroundImage:[UIImage imageNamed:@"plus.png"] forState:UIControlStateNormal];
    
    [Plues_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    [Plues_BTN setTitleColor:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    Plues_BTN.frame = CGRectMake(Add_Radius_TXT.frame.origin.x+Add_Radius_TXT.frame.size.width+12, Add_Radius_LB.frame.origin.y+20,22, 22);
    [scrollview addSubview:Plues_BTN];

    
    
    
    ////////////////////////////    Finder Button \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Finder_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Finder_BTN addTarget:self
                  action:@selector(FindPackages:)
        forControlEvents:UIControlEventTouchUpInside];
    Finder_BTN.backgroundColor=[UIColor colorWithRed:228.0f/255.0f green:183.0f/255.0f blue:44.0f/255.0f alpha:1.0]
;
    [Finder_BTN setTitle:@"Find items" forState:UIControlStateNormal];
    [Finder_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    [Finder_BTN setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    Finder_BTN.layer.cornerRadius=20;
    Finder_BTN.clipsToBounds = YES;
    Finder_BTN.frame = CGRectMake(30, Add_Radius_TXT.frame.origin.y+80,self.view.frame.size.width-60, 40.0);
    [scrollview addSubview:Finder_BTN];
    
    
//    ////////////////////////////    Pigeon Button \\\\\\\\\\\\\\\\\\\\\\\\
//    
//
//    
//    Pigeon_ship = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [Pigeon_ship addTarget:self
//                   action:@selector(Sender:)
//         forControlEvents:UIControlEventTouchUpInside];
//    Pigeon_ship.backgroundColor=[UIColor colorWithRed:228.0f/255.0f green:183.0f/255.0f blue:44.0f/255.0f alpha:1.0];
//    [Pigeon_ship setTitle:@"PigeonShip" forState:UIControlStateNormal];
//    [Pigeon_ship setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
//    [Pigeon_ship setTitleColor:[UIColor colorWithRed:225.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
//    
//
//    Pigeon_ship.layer.cornerRadius=20;
//    Pigeon_ship.clipsToBounds = YES;
//    Pigeon_ship.frame = CGRectMake(30, Finder_BTN.frame.origin.y+70,self.view.frame.size.width-60, 40.0);
//    [scrollview addSubview:Pigeon_ship];
//
    
    
    
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 620);
    
}


- (NSString *) getFileName:(UIImageView *)imgView{
    
    NSString *imgName = [imgView image].accessibilityIdentifier;
    
    NSLog(@"%@",imgName);
    
    return imgName;
    
}



- (void)cancelToucheds:(UIBarButtonItem *)sender
{
    
 
    [self.view endEditing:YES];
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
     
        [UIView commitAnimations];
    });
    
}

- (void)doneToucheds:(UIBarButtonItem *)sender
{
    

        if ([pickre_STR isEqualToString:@""]||[pickre_STR isEqualToString:nil] || [pickre_STR isEqual:nil] || [pickre_STR length]==0) {
            
            Price_will_TX.text=[Any_price_array objectAtIndex:0];
            
        }
        else
        {
            
            
            Price_will_TX.text=pickre_STR;
       }

    [self.view endEditing:YES];
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
      
        [UIView commitAnimations];
    });

}



-(void)Other_Check_action:(UIButton *)sender
{
    
    UIButton *mbutton=(UIButton *)sender;
    
  
   
    
    
    if (mbutton.tag==6)
    {
        [[NSUserDefaults standardUserDefaults]setValue:@"Yes" forKey:@"Other"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        mbutton.tag=66;
        
        
        [Other_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"check_checkbox.png"] forState:UIControlStateNormal];

        
    
    }
    else
    {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"Other"];
        [[NSUserDefaults standardUserDefaults] synchronize];

         mbutton.tag=6;
        
        [Other_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_checkbox.png"] forState:UIControlStateNormal];
       
     
    }

    
    
}

-(void)Small_Check_action:(UIButton *)sender
{
    
    
    
   
   
    
    
    UIButton *mbutton=(UIButton *)sender;
    
    
    
    
    if (mbutton.tag==2)
    {
        [[NSUserDefaults standardUserDefaults]setValue:@"Yes" forKey:@"Small"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        mbutton.tag=22;
        
        
        [Small_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"check_checkbox.png"] forState:UIControlStateNormal];
        
        
        
    }
    else
    {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"Small"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        mbutton.tag=2;
        
        [Small_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_checkbox.png"] forState:UIControlStateNormal];
        
        
    }

    
    
  }

-(void)Extra_Btn_action:(UIButton *)sender
{
    

    
      UIButton *mbutton=(UIButton *)sender;
    
    if (mbutton.tag==5)
    {
        [[NSUserDefaults standardUserDefaults]setValue:@"Yes" forKey:@"Extra Large"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        mbutton.tag=55;
        
        
        [Extra_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"check_checkbox.png"] forState:UIControlStateNormal];

        
        
        
    }
    else
    {
        
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"Extra Large"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        mbutton.tag=5;
        
        [Extra_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_checkbox.png"] forState:UIControlStateNormal];

        
        
    }
    
}

-(void)Large_Check_Btn_action:(UIButton *)sender
{
    
    
    UIButton *mbutton=(UIButton *)sender;
    
    if (mbutton.tag==4)
    {
        [[NSUserDefaults standardUserDefaults]setValue:@"Yes" forKey:@"Large"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        mbutton.tag=44;
        
        
         [Large_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"check_checkbox.png"] forState:UIControlStateNormal];
        
          }
    else
    {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"Large"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        mbutton.tag=4;
       [Large_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_checkbox.png"] forState:UIControlStateNormal];
        
        
        
    }

}

-(void)Medium_Btn_action:(UIButton *)sender
{
    
    UIButton *mbutton=(UIButton *)sender;
    
    if (mbutton.tag==3)
    {
        [[NSUserDefaults standardUserDefaults]setValue:@"Yes" forKey:@"Medium"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        mbutton.tag=33;
        
        
        [Medium_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"check_checkbox.png"] forState:UIControlStateNormal];
        
    }
    else
    {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"Medium"];
        [[NSUserDefaults standardUserDefaults] synchronize];

        mbutton.tag=3;
        [Medium_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_checkbox.png"] forState:UIControlStateNormal];

          }
}

-(void)Tiny_Btn_action:(UIButton *)sender
{
    
    UIButton *mbutton=(UIButton *)sender;
    
    if (mbutton.tag==1)
    {
        
        [[NSUserDefaults standardUserDefaults]setValue:@"Yes" forKey:@"Tiny"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        
        mbutton.tag=11;
        
        
        [Tiny_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"check_checkbox.png"] forState:UIControlStateNormal];
        
    }
    else
    {
        
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"Tiny"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        mbutton.tag=1;
        
        [Tiny_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_checkbox.png"] forState:UIControlStateNormal];
        
    }

    
}



-(void)viewWillAppear:(BOOL)animated
{
     CountValue=0;
    
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate=self;
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    locationManager.distanceFilter=kCLDistanceFilterNone;
    [locationManager requestWhenInUseAuthorization];
    [locationManager startMonitoringSignificantLocationChanges];
    //[locationManager startUpdatingLocation];
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
//    UIAlertView *errorAlert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"There was an error retrieving your location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//    [errorAlert show];
//    NSLog(@"Error: %@",error.description);
    
    [loader removeFromSuperview];
    [locationManager stopUpdatingLocation];
    

}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    currentLocation = [locations objectAtIndex:0];
   
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init] ;
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error)
     {
          [loader removeFromSuperview];
         if (!(error))
         {
             CLPlacemark *placemark = [placemarks objectAtIndex:0];
             NSLog(@"\nCurrent Location Detected\n");
             NSLog(@"placemark %@",placemark);
             NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
             
             Current_Location_TXT.text = [[NSString alloc]initWithString:locatedAt];
            Zipcode = [[NSString alloc]initWithString:placemark.postalCode];
             NSLog(@"%@",Zipcode);
         }
         else
         {
             NSLog(@"Geocode failed with error %@", error); // Error handling must required
         }
     }];
    
     [locationManager stopUpdatingLocation];
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    Zipcode=@"";
    return YES;
}


-(void)Back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)Done_card
{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, count_value);
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view endEditing:YES];
        [UIView commitAnimations];
    });
    
}


-(void)Next:(UIButton *)sender
{
    
    //    Profile_ViewController *OBJProfile_ViewController=[[Profile_ViewController alloc]init];
    //    [self.navigationController pushViewController:OBJProfile_ViewController animated:YES];
    
}

- (void) handleTapFroms: (UITapGestureRecognizer *)recognizer
{

    [loader removeFromSuperview];
    [self mActivityIndicater];
    
    [locationManager startUpdatingLocation];
    
}

-(void)FindPackages:(UIButton *)sender
{
 
    NSMutableArray *arrr=[[NSMutableArray alloc]init];
    NSMutableDictionary *vale1=[[NSMutableDictionary alloc]init];
        
    [mainarrr removeAllObjects];
      [arrr removeAllObjects];
      [vale1 removeAllObjects];
  
    if ([Add_Zip_TXT.text isEqualToString:@""] ||[Add_Zip_TXT.text isEqualToString:@""]) {
        
    }
    else
    {
       
        [vale1 setValue:Add_Zip_TXT.text forKey:@"zip_code"];
        [vale1 setValue:Add_Radius_TXT.text forKey:@"radius"];
        
        [arrr addObject:vale1];

    }
   
    
    

    if (Add_Zip_TXT2.hidden==YES || Add_Radius_TXT2.hidden==YES ||[Add_Zip_TXT2.text isEqualToString:@""] ||[Add_Radius_TXT2.text isEqualToString:@""]) {
        
    }
    else
    {
          NSMutableDictionary *vale1=[[NSMutableDictionary alloc]init];
        [vale1 setValue:Add_Zip_TXT2.text forKey:@"zip_code"];
        [vale1 setValue:Add_Radius_TXT2.text forKey:@"radius"];
        
        [arrr addObject:vale1];
    }
    
    if (Add_Zip_TXT3.hidden==YES || Add_Radius_TXT3.hidden==YES ||[Add_Zip_TXT3.text isEqualToString:@""] ||[Add_Radius_TXT3.text isEqualToString:@""]) {
        
    }
    else
    {
           NSMutableDictionary *vale1=[[NSMutableDictionary alloc]init];
        [vale1 setValue:Add_Zip_TXT3.text forKey:@"zip_code"];
        [vale1 setValue:Add_Radius_TXT3.text forKey:@"radius"];
        
        [arrr addObject:vale1];
    }

    
    if (Add_Zip_TXT4.hidden==YES || Add_Radius_TXT4.hidden==YES ||[Add_Zip_TXT4.text isEqualToString:@""] ||[Add_Radius_TXT4.text isEqualToString:@""]) {
        
    }
    else
    {
           NSMutableDictionary *vale1=[[NSMutableDictionary alloc]init];
        [vale1 setValue:Add_Zip_TXT4.text forKey:@"zip_code"];
        [vale1 setValue:Add_Radius_TXT4.text forKey:@"radius"];
        
        [arrr addObject:vale1];

    }

    
    
    if (Add_Zip_TXT5.hidden==YES || Add_Radius_TXT5.hidden==YES ||[Add_Zip_TXT5.text isEqualToString:@""] ||[Add_Radius_TXT5.text isEqualToString:@""]   ) {
        
    }
    else
    {
          NSMutableDictionary *vale1=[[NSMutableDictionary alloc]init];
        [vale1 setValue:Add_Zip_TXT5.text forKey:@"zip_code"];
        [vale1 setValue:Add_Radius_TXT5.text forKey:@"radius"];
        
        [arrr addObject:vale1];
    }
    
    
  
    
    [mainarrr addObjectsFromArray:arrr];
    
    NSLog(@"%@",mainarrr);

    array2=[[NSMutableArray alloc]init];
    
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    NSObject * object1 = [prefs objectForKey:@"Other"];
    if(object1 != nil){
        
        NSMutableDictionary *vale1=[[NSMutableDictionary alloc]init];
        [vale1 setValue:@"other" forKey:@"Size_type"];
      [array2 addObject:vale1];
        
    }
    
    NSObject * object2 = [prefs objectForKey:@"Small"];
    if(object2 != nil){
        
        NSMutableDictionary *vale1=[[NSMutableDictionary alloc]init];
        [vale1 setValue:@"small" forKey:@"Size_type"];
        [array2 addObject:vale1];
        
    }

    
    NSObject * object3 = [prefs objectForKey:@"Extra Large"];
    if(object3 != nil){
        
        NSMutableDictionary *vale1=[[NSMutableDictionary alloc]init];
        [vale1 setValue:@"extra-large" forKey:@"Size_type"];
        [array2 addObject:vale1];

        
    }

    
    NSObject * object4 = [prefs objectForKey:@"Large"];
    if(object4 != nil){
        
        NSMutableDictionary *vale1=[[NSMutableDictionary alloc]init];
        [vale1 setValue:@"large" forKey:@"Size_type"];
        [array2 addObject:vale1];

        
    }

    
    NSObject * object5 = [prefs objectForKey:@"Medium"];
    if(object5 != nil){
        
        NSMutableDictionary *vale1=[[NSMutableDictionary alloc]init];
        [vale1 setValue:@"medium" forKey:@"Size_type"];
        [array2 addObject:vale1];

        
    }

    NSObject * object6 = [prefs objectForKey:@"Tiny"];
    if(object6 != nil){
        
        NSMutableDictionary *vale1=[[NSMutableDictionary alloc]init];
        [vale1 setValue:@"tiny" forKey:@"Size_type"];
        [array2 addObject:vale1];

        
    }
  [mainarrr2 addObjectsFromArray:array2];

    NSLog(@"%@",mainarrr);
    
    [self performSelector:@selector(CalltheServer) withObject:nil afterDelay:0.5];
     [self mActivityIndicater];
}

-(void)Sender:(UIButton *)sender
{
    
}


-(void)Plues:(UIButton *)sender
{
    CountValue+=1;
    
    if (CountValue==1) {
        
        Plues_BTN.frame = CGRectMake(Add_Radius_TXT2.frame.origin.x+Add_Radius_TXT2.frame.size.width+12, Add_Radius_LB2.frame.origin.y+20,22, 22);
        
         Finder_BTN.frame = CGRectMake(30, Add_Radius_TXT2.frame.origin.y+80,self.view.frame.size.width-60, 40.0);
        
        
        Add_Zip_TXT2.hidden=NO;
        Add_Radius_TXT2.hidden=NO;
        
        
        Add_Zip_LB2.hidden=NO;
        Add_Radius_LB2.hidden=NO;
        
           scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 670);
        count_value=670;

    }
    else if (CountValue==2)
    {
        Plues_BTN.frame = CGRectMake(Add_Radius_TXT3.frame.origin.x+Add_Radius_TXT3.frame.size.width+12, Add_Radius_LB3.frame.origin.y+20,22, 22);
        
           Finder_BTN.frame = CGRectMake(30, Add_Radius_TXT3.frame.origin.y+80,self.view.frame.size.width-60, 40.0);
        
        Add_Zip_TXT3.hidden=NO;
        Add_Radius_TXT3.hidden=NO;
        
        
        Add_Zip_LB3.hidden=NO;
        Add_Radius_LB3.hidden=NO;
        
           scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 740);
        
         count_value=740;
 
    }
    else if (CountValue==3)
    {
        Plues_BTN.frame = CGRectMake(Add_Radius_TXT4.frame.origin.x+Add_Radius_TXT4.frame.size.width+12, Add_Radius_LB4.frame.origin.y+20,22, 22);
        
         Finder_BTN.frame = CGRectMake(30, Add_Radius_TXT4.frame.origin.y+80,self.view.frame.size.width-60, 40.0);
        
        Add_Zip_TXT4.hidden=NO;
        Add_Radius_TXT4.hidden=NO;
        
        
        Add_Zip_LB4.hidden=NO;
        Add_Radius_LB4.hidden=NO;
        
           scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 810);
        
         count_value=810;

    }
    else if (CountValue==4)
    {
        Plues_BTN.frame = CGRectMake(Add_Radius_TXT5.frame.origin.x+Add_Radius_TXT5.frame.size.width+12, Add_Radius_LB5.frame.origin.y+20,22, 22);
        
        Finder_BTN.frame = CGRectMake(30, Add_Radius_TXT5.frame.origin.y+80,self.view.frame.size.width-60, 40.0);

        
        Plues_BTN.userInteractionEnabled=NO;
        Plues_BTN.alpha=0.3;
        
        Add_Zip_TXT5.hidden=NO;
        Add_Radius_TXT5.hidden=NO;
        
        
        Add_Zip_LB5.hidden=NO;
        Add_Radius_LB5.hidden=NO;
        
           scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 880);
        
        count_value=880;

    }
    else if (CountValue==5)
    {
//        Plues_BTN.frame = CGRectMake(Add_Radius_TXT.frame.origin.x+Add_Radius_TXT.frame.size.width+12, Add_Radius_LB.frame.origin.y+20,22, 22);

    }
    
    
//     Plues_BTN.frame = CGRectMake(Add_Radius_TXT.frame.origin.x+Add_Radius_TXT.frame.size.width+15, Frame+20,20, 20);
//    
//    
//    Finder_BTN.frame = CGRectMake(30, Frame+80,self.view.frame.size.width-60, 40.0);
//
//    
//    
//    Frame+=57;
//    
//    if (Finder_BTN.frame.origin.y>=542.000000)
//    
//    {
//        
//                
//          scrollview.contentSize = CGSizeMake(self.view.frame.size.width, Finder_BTN.frame.origin.y+60);
//    }
//    
    
    NSLog(@"Frame :---->%f",Finder_BTN.frame.origin.y);
    
  
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
#pragma mark  CalltheServer
#pragma mark - -*********************


-(void)CalltheServer
{
    NSMutableDictionary *dicvalue=[[NSMutableDictionary alloc]init];
    
    
    if (Zipcode == (id)[NSNull null] || Zipcode == (NSString *)[NSNull null] || [Zipcode length]==0 || [Zipcode isEqualToString:@""] ) {
        
        Zipcode=@"";
    }
    
    
    
    if ([Price_will_TX.text isEqualToString:@""]) {
        price_value=@"0";
        
    }
    else
    {
        price_value=[Price_will_TX.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
        
    }
    
    
    [dicvalue setValue:Zipcode forKey:@"current_loc"];
    [dicvalue setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"] forKey:@"User_ID"];
    [dicvalue setValue:mainarrr forKey:@"zips"];
     [dicvalue setValue:mainarrr2 forKey:@"item_size"];
    [dicvalue setValue:price_value forKey:@"Price_will"];

    
    
   //
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        NSString *responseString = [API makeCallPostData:dicvalue];
        
        NSLog(@"%@",responseString);
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            [[NSUserDefaults standardUserDefaults]setValue:dict forKey:@"Find_Data"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            
            [[NSUserDefaults standardUserDefaults]setValue:@"YES" forKey:@"Fin_check"];
            [[NSUserDefaults standardUserDefaults]synchronize];

            [self.navigationController popViewControllerAnimated:YES];
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
   
        
    }


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView; {
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;

{
    return Any_price_array.count;
}

-(NSString*) pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [Any_price_array objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
{
    pickre_STR=[Any_price_array objectAtIndex:row];
    
}


- (void)reverseGeocode:(CLLocation *)location {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Finding address");
        if (error) {
            NSLog(@"Error %@", error.description);
        } else {
            CLPlacemark *placemark = [placemarks lastObject];
            NSLog(@"%@",[NSString stringWithFormat:@"%@", ABCreateStringWithAddressDictionary(placemark.addressDictionary, NO)]);
        }
    }];
}



- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
//    if (textField.tag==1) {
//        
////        float spanX = 0.00725;
////        float spanY = 0.00725;
////        self.location = self.locationManager.location;
////        MKCoordinateRegion region;
////        region.center.latitude = [@"39.281516" floatValue];
////        region.center.longitude = [@"-76.580806" floatValue];
////        region.span = MKCoordinateSpanMake(spanX, spanY);
////        //[self.mapView setRegion:region animated:YES];
////        [self reverseGeocode:self.location];
//        
//         return false;
//        
//    }
//    else
//    {
        return true;
   // }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [self.view endEditing:YES];
    
    return YES;
    
}



@end
