//
//  Credit_Card_ ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 21/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Credit_Card_ ViewController.h"
#import "Billing_Information_ViewController.h"
#import "CardIO.h"
#import "Utility.h"
@interface Credit_Card__ViewController ()<CardIOPaymentViewControllerDelegate>
{
    
}


@end

@implementation Credit_Card__ViewController

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

// Called when the UIKeyboardDidShowNotification i

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


#pragma mark - -*********************
#pragma mark Toolbar cancel methods
#pragma mark - -*********************

-(void)cancel_card
{

    
}

-(void)Done_card
{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 630);
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view endEditing:YES];
        [UIView commitAnimations];
    });

}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    check_card_value=false;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardDidHideNotification object:nil];
    [self createInputAccessoryView];
    
    [self createInputAccessoryView_cardnumber];
    

    exp_month_array=[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12", nil];
    
    
      card_type_array=[[NSMutableArray alloc]initWithObjects:@"Visa",@"Mastercard",@"Discover",@"Amex",@"JCB", nil];
    
    exp_Year_array=[[NSMutableArray alloc]init];
    
      Demo_array=[[NSMutableArray alloc]init];
    
    //Get Current Year into i2
    NSDateFormatter* formatter = [[[NSDateFormatter alloc] init]autorelease];
    [formatter setDateFormat:@"yyyy"];
    int i2  = [[formatter stringFromDate:[NSDate date]] intValue];
    
    
    //Create Years Array from 1960 to This year
        for (int i=0; i<20; i++) {
        [exp_Year_array addObject:[NSString stringWithFormat:@"%d",i2]];
            
            i2+=1;
    }
    

    NSLog(@"%@",exp_Year_array);
    
   
    
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
    //
    //    Next_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [Next_BTN addTarget:self action:@selector(Next:)
    //         forControlEvents:UIControlEventTouchUpInside];
    //    [Next_BTN setImage:[UIImage imageNamed:@"next_.png"] forState:UIControlStateNormal];
    //
    //
    //      Next_BTN.frame = CGRectMake(self.view.frame.size.width-50,10,49,26);
    //    [scrollview addSubview:Next_BTN];
    
    
    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    MTitle = [[UILabel alloc] init];
    MTitle.textColor = [UIColor blackColor];
    [MTitle setFrame:CGRectMake(0,20,self.view.frame.size.width, 40)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"Card Details";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:MTitle];
    
    
    ///////////////////////////// Top View\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    TopView =[[UIView alloc]init];
    TopView.frame=CGRectMake(0, MTitle.frame.origin.y+40, self.view.frame.size.width,140);
    TopView.backgroundColor=[UIColor colorWithRed:52.0f/255.0f green:51.0f/255.0f blue:49.0f/255.0f alpha:1.0];
    [scrollview addSubview:TopView];
    
    ///////////////////////////// Top View Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    textlable = [[UILabel alloc] init];
    textlable.textColor = [UIColor blackColor];
    [textlable setFrame:CGRectMake(10,5,self.view.frame.size.width-20, 63)];
    textlable.backgroundColor=[UIColor clearColor];
    textlable.textColor=[UIColor whiteColor];
    textlable.userInteractionEnabled=NO;
    
    textlable.numberOfLines=0;
    [textlable setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
    
    
    NSMutableParagraphStyle *style  = [[NSMutableParagraphStyle alloc] init];
    style.minimumLineHeight = 20.f;
    style.maximumLineHeight = 20.f;
    NSDictionary *attributtes = @{NSParagraphStyleAttributeName : style,};
    
    textlable.attributedText = [[NSAttributedString alloc] initWithString:@"Your credit card will only be pre-authorized for the set amount and will only be charged upon successful delivery confirmation"
                                                               attributes:attributtes];
    
    textlable.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    textlable.textAlignment=NSTextAlignmentCenter;
    [TopView addSubview:textlable];
    
    
    ///////////////////////////// Top View Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    scan_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [scan_BTN addTarget:self
                 action:@selector(Scan_btn:)
       forControlEvents:UIControlEventTouchUpInside];
    scan_BTN.backgroundColor=[UIColor colorWithRed:52.0f/255.0f green:51.0f/255.0f blue:49.0f/255.0f alpha:1.0];
    [scan_BTN setTitle:@"Scan your Card" forState:UIControlStateNormal];
    scan_BTN.titleLabel.font=[UIFont fontWithName:@"bariol-regular" size:18.0f];
    [scan_BTN setTitleColor:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    scan_BTN.layer.cornerRadius=20;
    scan_BTN.clipsToBounds = YES;
    scan_BTN.layer.borderWidth=1;
    scan_BTN.layer.borderColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0].CGColor;
    scan_BTN.frame = CGRectMake(30, textlable.frame.origin.y+70,self.view.frame.size.width-60, 45.0);
    [TopView addSubview:scan_BTN];
    
    //////////////////////////
    
    
    
    ///////////////////////////// First Name\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    
    
    Card_name_LB = [[UILabel alloc] init];
    Card_name_LB.textColor = [UIColor blackColor];
    [Card_name_LB setFrame:CGRectMake(30,TopView.frame.origin.y+140,250, 30)];
    Card_name_LB.backgroundColor=[UIColor clearColor];
    Card_name_LB.textColor=[UIColor whiteColor];
    Card_name_LB.userInteractionEnabled=NO;
    [Card_name_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Card_name_LB.text= @"Card name Or Business Name";
    Card_name_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Card_name_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Card_name_LB];
    
    
    
    Card_name_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,Card_name_LB.frame.origin.y+10,self.view.frame.size.width-60, 40)];
    Card_name_TXT.borderStyle = UITextBorderStyleNone;
    Card_name_TXT.font = [UIFont systemFontOfSize:15];
    // Fname_TXT.placeholder = @"First Name";
    Card_name_TXT.text=@"";
    Card_name_TXT.keyboardType = UIKeyboardTypeDefault;
    Card_name_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Card_name_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Card_name_TXT.delegate = self;
    Card_name_TXT.backgroundColor=[UIColor clearColor];
    Card_name_TXT.textColor=[UIColor whiteColor];
    [Card_name_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Card_name_TXT.tag=001;
    Card_name_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Card_name_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [Card_name_TXT setRightViewMode:UITextFieldViewModeAlways];
    
    [scrollview addSubview:Card_name_TXT];
    
    
    ///////////////////////////// Last Name\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    card_number_LB = [[UILabel alloc] init];
    card_number_LB.textColor = [UIColor blackColor];
    [card_number_LB setFrame:CGRectMake(30,Card_name_TXT.frame.origin.y+50,250, 30)];
    card_number_LB.backgroundColor=[UIColor clearColor];
    card_number_LB.textColor=[UIColor whiteColor];
    card_number_LB.userInteractionEnabled=NO;
    [card_number_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    card_number_LB.text= @"Card Number";
    card_number_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    card_number_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:card_number_LB];
    
    
    
    card_number_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, card_number_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    card_number_TXT.borderStyle = UITextBorderStyleNone;
    card_number_TXT.font = [UIFont systemFontOfSize:15];
    card_number_TXT.text= @"";
    card_number_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    card_number_TXT.keyboardType = UIKeyboardTypeNumberPad;
    card_number_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    card_number_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    card_number_TXT.delegate = self;
    card_number_TXT.backgroundColor=[UIColor clearColor];
    card_number_TXT.textColor=[UIColor whiteColor];
    card_number_TXT.tag=002;
    [card_number_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    card_number_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [card_number_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:card_number_TXT];
    [card_number_TXT setRightViewMode:UITextFieldViewModeAlways];
    
     card_number_TXT.inputAccessoryView=ptoolbar_card;
    
    
    
    
    
    ///////////////////////////// Email Id\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    card_type_LB = [[UILabel alloc] init];
    card_type_LB.textColor = [UIColor blackColor];
    [card_type_LB setFrame:CGRectMake(30,card_number_TXT.frame.origin.y+50,250, 30)];
    card_type_LB.backgroundColor=[UIColor clearColor];
    card_type_LB.textColor=[UIColor whiteColor];
    card_type_LB.userInteractionEnabled=NO;
    [card_type_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    card_type_LB.text= @"Card Type";
    card_type_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    card_type_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:card_type_LB];
    
    
    
    
    
    card_type_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,card_type_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    card_type_TXT.borderStyle = UITextBorderStyleNone;
    card_type_TXT.font = [UIFont systemFontOfSize:15];
    card_type_TXT.text=@"";
    card_type_TXT.keyboardType = UIKeyboardTypeDefault;
    card_type_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    card_type_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    card_type_TXT.delegate = self;
    card_type_TXT.backgroundColor=[UIColor clearColor];
    card_type_TXT.textColor=[UIColor whiteColor];
    [card_type_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    card_type_TXT.tag=003;
    [card_type_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
       card_type_TXT.inputView=pPickerState;
    [pPickerState removeFromSuperview];

    card_type_TXT.inputAccessoryView=ptoolbar;

    
    card_type_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [card_type_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [card_type_TXT setRightViewMode:UITextFieldViewModeAlways];
    
    
    UIImageView *imgView_card_type = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 14, 7)];
    imgView_card_type.image = [UIImage imageNamed:@"dropdown-icon-2.png"];
    UIView *paddingView_card_type = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [paddingView_card_type addSubview:imgView_card_type];
    [card_type_TXT setRightViewMode:UITextFieldViewModeAlways];
    [card_type_TXT setRightView:paddingView_card_type];
    
    
    [scrollview addSubview:card_type_TXT];
    
    
    
    
    ///////////////////////////// Password \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    CVV_LB = [[UILabel alloc] init];
    CVV_LB.textColor = [UIColor blackColor];
    [CVV_LB setFrame:CGRectMake(30,card_type_TXT.frame.origin.y+50,250, 30)];
    CVV_LB.backgroundColor=[UIColor clearColor];
    CVV_LB.textColor=[UIColor whiteColor];
    CVV_LB.userInteractionEnabled=NO;
    [CVV_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    CVV_LB.text= @"CVV";
    CVV_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    CVV_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:CVV_LB];
    
    
    
    CVV_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, CVV_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    CVV_TXT.borderStyle = UITextBorderStyleNone;
    CVV_TXT.text=@"";
    CVV_TXT.font = [UIFont systemFontOfSize:15];
    CVV_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    CVV_TXT.keyboardType = UIReturnKeyDefault;
    CVV_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    CVV_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    CVV_TXT.delegate = self;
    CVV_TXT.backgroundColor=[UIColor clearColor];
    CVV_TXT.textColor=[UIColor whiteColor];
    CVV_TXT.tag=004;
    [CVV_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    CVV_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [CVV_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    
   
    [scrollview addSubview:CVV_TXT];
    [CVV_TXT setRightViewMode:UITextFieldViewModeAlways];
    
    
    
    /////////////////////////////Confirm Password \\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Expiary_Month_STR = [[UILabel alloc] init];
    Expiary_Month_STR.textColor = [UIColor blackColor];
    [Expiary_Month_STR setFrame:CGRectMake(30,CVV_TXT.frame.origin.y+50,250, 30)];
    Expiary_Month_STR.backgroundColor=[UIColor clearColor];
    Expiary_Month_STR.textColor=[UIColor whiteColor];
    Expiary_Month_STR.userInteractionEnabled=NO;
    [Expiary_Month_STR setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Expiary_Month_STR.text= @"Expiry Month";
    Expiary_Month_STR.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Expiary_Month_STR.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Expiary_Month_STR];
    
    
    Expiary_Month_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, Expiary_Month_STR.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Expiary_Month_TXT.borderStyle = UITextBorderStyleNone;
    Expiary_Month_TXT.text=@"";
    Expiary_Month_TXT.font = [UIFont systemFontOfSize:15];
    Expiary_Month_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Expiary_Month_TXT.keyboardType = UIReturnKeyDefault;
    Expiary_Month_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Expiary_Month_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Expiary_Month_TXT.delegate = self;
    Expiary_Month_TXT.backgroundColor=[UIColor clearColor];
    Expiary_Month_TXT.textColor=[UIColor whiteColor];
    Expiary_Month_TXT.tag=005;
    [Expiary_Month_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Expiary_Month_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Expiary_Month_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    
    Expiary_Month_TXT.inputView=pPickerState;
    [pPickerState removeFromSuperview];

    Expiary_Month_TXT.inputAccessoryView=ptoolbar;
    
    UIImageView *imgView_Expiary_Month = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 14, 7)];
    imgView_Expiary_Month.image = [UIImage imageNamed:@"dropdown-icon-2.png"];
    UIView *paddingView_Expiary_Month = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [paddingView_Expiary_Month addSubview:imgView_Expiary_Month];
    [Expiary_Month_TXT setRightViewMode:UITextFieldViewModeAlways];
    [Expiary_Month_TXT setRightView:paddingView_Expiary_Month];
    
    
    [scrollview addSubview:Expiary_Month_TXT];
    
    
    
    [Expiary_Month_TXT setRightViewMode:UITextFieldViewModeAlways];
    
  
    
    /////////////////////////////Confirm Password \\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Expiary_Year_STR = [[UILabel alloc] init];
    Expiary_Year_STR.textColor = [UIColor blackColor];
    [Expiary_Year_STR setFrame:CGRectMake(30,Expiary_Month_TXT.frame.origin.y+50,250, 30)];
    Expiary_Year_STR.backgroundColor=[UIColor clearColor];
    Expiary_Year_STR.textColor=[UIColor whiteColor];
    Expiary_Year_STR.userInteractionEnabled=NO;
    [Expiary_Year_STR setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Expiary_Year_STR.text= @"Expiry Year";
    Expiary_Year_STR.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Expiary_Year_STR.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Expiary_Year_STR];
    
    
    Expiary_Year_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, Expiary_Year_STR.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Expiary_Year_TXT.borderStyle = UITextBorderStyleNone;
    Expiary_Year_TXT.text=@"";
    Expiary_Year_TXT.font = [UIFont systemFontOfSize:15];
    Expiary_Year_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Expiary_Year_TXT.keyboardType = UIReturnKeyDefault;
    Expiary_Year_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Expiary_Year_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Expiary_Year_TXT.delegate = self;
    Expiary_Year_TXT.backgroundColor=[UIColor clearColor];
    Expiary_Year_TXT.textColor=[UIColor whiteColor];
    Expiary_Year_TXT.tag=006;
    [Expiary_Year_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Expiary_Year_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Expiary_Year_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    
    Expiary_Year_TXT.inputView=pPickerState;
    [pPickerState removeFromSuperview];

    Expiary_Year_TXT.inputAccessoryView=ptoolbar;
    
    
    UIImageView *imgView_Expiary_Year = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 14, 7)];
    imgView_Expiary_Year.image = [UIImage imageNamed:@"dropdown-icon-2.png"];
    UIView *paddingView_Expiary_Year = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [paddingView_Expiary_Year addSubview:imgView_Expiary_Year];
    [Expiary_Year_TXT setRightViewMode:UITextFieldViewModeAlways];
    [Expiary_Year_TXT setRightView:paddingView_Expiary_Year];

    
    [scrollview addSubview:Expiary_Year_TXT];
    [Expiary_Year_TXT setRightViewMode:UITextFieldViewModeAlways];
    
    
    
    
    Next_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Next_BTN addTarget:self
                 action:@selector(Next:)
       forControlEvents:UIControlEventTouchUpInside];
    Next_BTN.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0];
    [Next_BTN setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    [Next_BTN setTitle:@"Next" forState:UIControlStateNormal];
    [Next_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    
    Next_BTN.layer.cornerRadius=20;
    Next_BTN.clipsToBounds = YES;
    Next_BTN.layer.borderColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0].CGColor;
    Next_BTN.alpha=0.3;
    Next_BTN.userInteractionEnabled=NO;
    Next_BTN.layer.borderWidth=1;
    Next_BTN.frame = CGRectMake((scrollview.frame.size.width-120)/2,Expiary_Year_TXT.frame.origin.y+Expiary_Year_TXT.frame.size.height+10,120, 40.0);
    [scrollview addSubview:Next_BTN];
    
    
//    
//    Skip_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [Skip_BTN addTarget:self
//                 action:@selector(Skip:)
//       forControlEvents:UIControlEventTouchUpInside];
//    [Skip_BTN setTitleColor:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
//    [Skip_BTN setTitle:@"Skip and Go" forState:UIControlStateNormal];
//    [Skip_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
//    
//    Skip_BTN.layer.cornerRadius=20;
//    Skip_BTN.clipsToBounds = YES;
//    Skip_BTN.layer.borderWidth=1;
//    Skip_BTN.layer.borderColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0].CGColor;
//    Skip_BTN.frame = CGRectMake(facke_view.frame.size.width-100,0, 100, 40.0);
//    [facke_view addSubview:Skip_BTN];
    
    [self performSelector:@selector(CalltheServer) withObject:nil afterDelay:0.5];
    [self mActivityIndicater];
    
    
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 630);
    
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


-(void)viewWillAppear:(BOOL)animated
{
  
    [Card_name_TXT becomeFirstResponder];
    
    [CardIOUtilities preload];

    

}


#pragma mark - -*********************
#pragma mark  CalltheServer
#pragma mark - -*********************


-(void)CalltheServer
{
    
    
    
    
    
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"]]:[NSString stringWithFormat:@"%@sender_creditcard_detail",[Utility API_link_url]]];
        
        NSLog(@"%@",responseString);
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
             check_card_value=false;
            card_number_TXT.userInteractionEnabled=NO;
            
             card_number_TXT.frame = CGRectMake(30, card_number_LB.frame.origin.y+10, self.view.frame.size.width-130, 40);
            
            ///////////////////////////// Code apply  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
            
            Edit_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
            [Edit_BTN addTarget:self action:@selector(Edit_Btn:)forControlEvents:UIControlEventTouchUpInside];
            Edit_BTN.frame = CGRectMake(card_number_TXT.frame.origin.x+card_number_TXT.frame.size.width+5,card_number_LB.frame.origin.y+10,80,40);
            
            [Edit_BTN setTitleColor:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
            [Edit_BTN setTitle:@"Edit" forState:UIControlStateNormal];
            [Edit_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
            Edit_BTN.layer.cornerRadius=20;
            Edit_BTN.clipsToBounds = YES;
            Edit_BTN.layer.borderWidth=1;
            Edit_BTN.layer.borderColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0].CGColor;
            [scrollview addSubview:Edit_BTN];
            

            
            NSLog(@"%lu",(unsigned long)[[dict valueForKey:@"Pending_Packages"]count]);
            
            
            Card_name_TXT.text=[[dict valueForKey:@"data"]valueForKey:@"name_on_card"];
          card_number_TXT.text=[[dict valueForKey:@"data"]valueForKey:@"card_number"];
           card_type_TXT.text=[[dict valueForKey:@"data"]valueForKey:@"card_type"];
            CVV_TXT.text=[[dict valueForKey:@"data"]valueForKey:@"card_cvv"];
            Expiary_Month_TXT.text=[[dict valueForKey:@"data"]valueForKey:@"card_exp_month"];
            Expiary_Year_TXT.text=[[dict valueForKey:@"data"]valueForKey:@"card_exp_year"];

              Next_BTN.alpha=1.0;
            Next_BTN.userInteractionEnabled=YES;
            
            
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
                
            
            check_card_value=true;
            
            alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
            
            
            Next_BTN.alpha=0.3;
            Next_BTN.userInteractionEnabled=NO;
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


-(void)Back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)Edit_Btn:(UIButton *)sender
{
    card_number_TXT.frame = CGRectMake(30, card_number_LB.frame.origin.y+10, self.view.frame.size.width-60, 40);

    check_card_value=true;
    
    card_number_TXT.userInteractionEnabled=YES;
    card_number_TXT.text=@"";
    Edit_BTN.hidden=YES;

}
-(void)Next:(UIButton *)sender
{
    
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"Vechile_info_View"]);
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"InsuranceView"]);
    
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"Bank_info_View"]);
    
    if ([[Card_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[card_number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[card_type_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[CVV_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Expiary_Month_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Expiary_Year_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
        Next_BTN.alpha=0.3;
        Next_BTN.userInteractionEnabled=NO;
        
    }
    
    else if ([card_number_TXT.text length]>16)
    {
        
        
        NSLog(@"%lu",(unsigned long)[card_number_TXT.text length]);
        
        
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Card Number Lenghth maximum 16 character" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert2 show];
    }
    

    else if ([card_number_TXT.text length]<15)
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Card Number Lenghth minimum 15 character" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert2 show];
    }
    

    
    else if ([CVV_TXT.text length]>4)
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"CVV Number Lenghth maximum 4 character" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert2 show];
    }
    

    
    else if ([CVV_TXT.text length]<3)
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"CVV Number Lenghth minimum 3 character" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert2 show];
    }
    
    
    else
    {
        
        Billing_Information_ViewController *objBilling_Information_ViewController=[[Billing_Information_ViewController alloc]init];
        
        objBilling_Information_ViewController.Card_name_STR=Card_name_TXT.text;
        
        if (check_card_value==false) {
            
            objBilling_Information_ViewController.card_number_STR=@"NULL";
            
        }
        else
        {
            objBilling_Information_ViewController.card_number_STR=card_number_TXT.text;
        }
        
        
       // objBilling_Information_ViewController.card_number_STR=card_number_TXT.text;
         objBilling_Information_ViewController.card_type_STR=card_type_TXT.text;
         objBilling_Information_ViewController.CVV_STR=CVV_TXT.text;
         objBilling_Information_ViewController.Expiary_Month_STR=Expiary_Month_TXT.text;
         objBilling_Information_ViewController.Expiary_Year_STR=Expiary_Year_TXT.text;
        
        
        
         objBilling_Information_ViewController.Business_name_STR=[[dict valueForKey:@"data"]valueForKey:@"card_first_name"];
         objBilling_Information_ViewController.Last_name_STR=[[dict valueForKey:@"data"]valueForKey:@"card_last_name"];
         objBilling_Information_ViewController.Address1_STR=[[dict valueForKey:@"data"]valueForKey:@"card_address"];
         objBilling_Information_ViewController.Address2_STR=[[dict valueForKey:@"data"]valueForKey:@"card_address2"];
         objBilling_Information_ViewController.City_STR=[[dict valueForKey:@"data"]valueForKey:@"card_city"];
        
        objBilling_Information_ViewController.State_STR=[[dict valueForKey:@"data"]valueForKey:@"card_state"];
        
         objBilling_Information_ViewController.Zip_code_STR=[[dict valueForKey:@"data"]valueForKey:@"card_zip"];
        
         objBilling_Information_ViewController.Country_STR=[[dict valueForKey:@"data"]valueForKey:@"card_country"];
      
        [self.navigationController pushViewController:objBilling_Information_ViewController animated:YES];
        
        
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 630);
        }
 }


-(void)Scan_btn:(UIButton *)sender
{
    
    CardIOPaymentViewController *scanViewController = [[CardIOPaymentViewController alloc] initWithPaymentDelegate:self];
    scanViewController.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:scanViewController animated:YES completion:nil];
    
    
    
//    CardIOPaymentViewController *scanViewController = [[CardIOPaymentViewController alloc] initWithPaymentDelegate:self];
//    
//    scanViewController.modalPresentationStyle = UIModalPresentationFormSheet;
//    
//    [self presentViewController:scanViewController animated:YES completion:nil];
    
}
#pragma mark - CardIOPaymentViewControllerDelegate

- (void)userDidProvideCreditCardInfo:(CardIOCreditCardInfo *)info inPaymentViewController:(CardIOPaymentViewController *)paymentViewController {
    NSLog(@"Scan succeeded with info: %@", info.redactedCardNumber);
    // Do whatever needs to be done to deliver the purchased items.
    [self dismissViewControllerAnimated:YES completion:nil];
    
    NSString *VisaCard=@"^4[0-9]{6,}$";
    NSPredicate *VisaCard_textpredicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@", VisaCard];
    
    
    NSString *mastercard=@"^5[1-5][0-9]{5,}$";
    NSPredicate *mastercard_textpredicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@", mastercard];
    
    
    NSString *discover=@"^6(?:011|5[0-9]{2})[0-9]{3,}$";
    NSPredicate *discover_textpredicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@", discover];
    
    
    NSString *American=@"^3[47][0-9]{5,}$";
    NSPredicate *American_textpredicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@", American];
    
    
    NSString *jcb=@"^(?:2131|1800|35[0-9]{3})[0-9]{3,}$";
    NSPredicate *jcb_textpredicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@", jcb];

    
   
    check_card_value=true;
    
    
    if([VisaCard_textpredicate evaluateWithObject:[NSString stringWithFormat:@"%@", info.cardNumber]])
    {
          card_type_TXT.text=@"Visa";
    }
    else if ([mastercard_textpredicate evaluateWithObject:[NSString stringWithFormat:@"%@", info.cardNumber]])
    {
          card_type_TXT.text=@"Mastercard";
    }
    else if ([discover_textpredicate evaluateWithObject:[NSString stringWithFormat:@"%@", info.cardNumber]])
    {
          card_type_TXT.text=@"Discover";
    }
    
    else if ([American_textpredicate evaluateWithObject:[NSString stringWithFormat:@"%@", info.cardNumber]])
    {
          card_type_TXT.text=@"Amex";
    }
    
    else if ([jcb_textpredicate evaluateWithObject:[NSString stringWithFormat:@"%@", info.cardNumber]])
    {
          card_type_TXT.text=@"JCB";
    }
    
    else
    {
         card_type_TXT.text=@"";
    }
    
    card_number_TXT.text=[NSString stringWithFormat:@"%@", info.cardNumber];
    CVV_TXT.text=[NSString stringWithFormat:@"%@",info.cvv];
    Expiary_Month_TXT.text=[NSString stringWithFormat:@"%02lu",(unsigned long)info.expiryMonth];
    Expiary_Year_TXT.text=[NSString stringWithFormat:@"%lu",(unsigned long)info.expiryYear];
    
    }

- (void)userDidCancelPaymentViewController:(CardIOPaymentViewController *)paymentViewController {
    NSLog(@"User cancelled scan");
    [self dismissViewControllerAnimated:YES completion:nil];
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
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 630);
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
       [pPickerState selectRow:0 inComponent:0 animated:YES];
}


#pragma mark - -*********************
#pragma mark Toolbar Done methods
#pragma mark - -*********************

-(void)Done
{
    
    
    if (tagvale==003) {
        
        if ([pickre_STR isEqualToString:@""]||[pickre_STR isEqualToString:nil] || [pickre_STR isEqual:nil] || [pickre_STR length]==0) {
            
            
            card_type_TXT.text=[Demo_array objectAtIndex:0];
            
        }
        else
        {
            
            
            card_type_TXT.text=pickre_STR;
        }
        
        
    }
    else if (tagvale==005)
    {
        if ([pickre_STR isEqualToString:@""]||[pickre_STR isEqualToString:nil] || [pickre_STR isEqual:nil] || [pickre_STR length]==0) {
            
            
            Expiary_Month_TXT.text=[Demo_array objectAtIndex:0];
            
        }
        else
        {
            
            Expiary_Month_TXT.text=pickre_STR;
        }
        
    }
    else if (tagvale==006)
    {
        if ([pickre_STR isEqualToString:@""]||[pickre_STR isEqualToString:nil] || [pickre_STR isEqual:nil] || [pickre_STR length]==0) {
            
            
            Expiary_Year_TXT.text=[Demo_array objectAtIndex:0];
            
        }
        else
        {
            
            Expiary_Year_TXT.text=pickre_STR;
        }
        
    }
    else
    {
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 630);
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view endEditing:YES];
        [UIView commitAnimations];
    });
    
    if ([[Card_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[card_number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[card_type_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[CVV_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Expiary_Month_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Expiary_Year_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {

        
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



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [self.view endEditing:YES];
    
    return YES;
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
     pickre_STR=nil;
    
    pickre_STR=nil;
    [pPickerState selectRow:0 inComponent:0 animated:YES];
    [pPickerState reloadAllComponents];
    
    tagvale=textField.tag;
    
    if (textField.tag==002 || textField.tag==004) {
        
         }
    
    
    else
    {
    }
    
    
     if (textField.tag==003)
    {
        [Demo_array removeAllObjects];
        
        [Demo_array addObjectsFromArray:card_type_array];
        
    }
    else if (textField.tag==005)
    {
        [Demo_array removeAllObjects];
        
        [Demo_array addObjectsFromArray:exp_month_array];
    }
    
    else if (textField.tag==006)
    {
        [Demo_array removeAllObjects];
        
        [Demo_array addObjectsFromArray:exp_Year_array];
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
    
    
     if ([[Card_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[card_number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[card_type_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[CVV_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Expiary_Month_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Expiary_Year_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
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
    
    
     if ([[Card_name_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[card_number_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[card_type_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[CVV_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Expiary_Month_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Expiary_Year_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
        Next_BTN.alpha=0.3;
        Next_BTN.userInteractionEnabled=NO;
        
    }
    
    else
    {
        Next_BTN.alpha=1.0;
        Next_BTN.userInteractionEnabled=YES;
        
    }
    
     BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
    
    if (textField.tag==002) {
        
        
        
        return newLength <= 16 || returnKey;
    }
    
    else if (textField.tag==004)
    {
          return newLength <= 4 || returnKey;
    }

    
    
    
    return YES;
    
    
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



-(void)updateTextLabelsWithText:(NSString *)string
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
