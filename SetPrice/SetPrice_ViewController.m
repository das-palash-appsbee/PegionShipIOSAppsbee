//
//  SetPrice_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 15/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "SetPrice_ViewController.h"
#import "SELECT_ITEM_ViewController.h"
#import "Set_Date_Time_ViewController.h"
#import "Utility.h"
#import "ANY_TIME_ViewController.h"
@interface SetPrice_ViewController ()

@end

@implementation SetPrice_ViewController
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

    
    [[NSUserDefaults standardUserDefaults]setValue:@"" forKey:@"promo_code"];
    [[NSUserDefaults standardUserDefaults]synchronize];

    
    
    [[NSUserDefaults standardUserDefaults]setValue:@"any pigeon" forKey:@"pigeon_type"];
    [[NSUserDefaults standardUserDefaults]synchronize];

    
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
    [MTitle setFrame:CGRectMake(0,35,self.view.frame.size.width, 40)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"Set Price";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:MTitle];
    
    
    ///////////////////////////// Suggested price Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    SUB_Title = [[UILabel alloc] init];
    SUB_Title.textColor = [UIColor blackColor];
    [SUB_Title setFrame:CGRectMake(20,MTitle.frame.origin.y+MTitle.frame.size.height+10,130, 40)];
    SUB_Title.backgroundColor=[UIColor clearColor];
    SUB_Title.textColor=[UIColor whiteColor];
    SUB_Title.userInteractionEnabled=NO;
    [SUB_Title setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    SUB_Title.text= @"Suggested price:";
    SUB_Title.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    SUB_Title.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:SUB_Title];

    
    ///////////////////////////// SUB Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    SUB_Title_Price = [[UILabel alloc] init];
    SUB_Title_Price.textColor = [UIColor blackColor];
    [SUB_Title_Price setFrame:CGRectMake(130,MTitle.frame.origin.y+MTitle.frame.size.height+10,100, 40)];
    SUB_Title_Price.backgroundColor=[UIColor clearColor];
    SUB_Title_Price.textColor=[UIColor whiteColor];
    SUB_Title_Price.userInteractionEnabled=NO;
    [SUB_Title_Price setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    SUB_Title_Price.text=[NSString stringWithFormat:@"$ %@",[[NSUserDefaults standardUserDefaults]valueForKey:@"Total_price"]];
    SUB_Title_Price.textColor=[UIColor whiteColor];
    SUB_Title_Price.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:SUB_Title_Price];
    
    
    
    ///////////////////////////// Suggested price Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Wtext_lable = [[UILabel alloc] init];
    Wtext_lable.textColor = [UIColor blackColor];
    [Wtext_lable setFrame:CGRectMake(10,SUB_Title_Price.frame.origin.y+SUB_Title_Price.frame.size.height+20,300, 40)];
    Wtext_lable.backgroundColor=[UIColor clearColor];
    Wtext_lable.textColor=[UIColor whiteColor];
    Wtext_lable.userInteractionEnabled=NO;
    [Wtext_lable setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
    Wtext_lable.text= @"Increase price for faster response!";
    Wtext_lable.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Wtext_lable.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Wtext_lable];

    ///////////////////////////// show price  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

    
    
    Price_TXT = [[UITextField alloc] initWithFrame:CGRectMake(20,Wtext_lable.frame.origin.y+30,self.view.frame.size.width-80, 40)];
    Price_TXT.borderStyle = UITextBorderStyleNone;
    Price_TXT.font = [UIFont systemFontOfSize:15];
    // Fname_TXT.placeholder = @"First Name";
    Price_TXT.text=[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"Total_price"]];
    Price_TXT.keyboardType = UIKeyboardTypeDefault;
    ///Price_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Price_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Price_TXT.delegate = self;
    Price_TXT.backgroundColor=[UIColor clearColor];
    Price_TXT.textColor=[UIColor whiteColor];
    [Price_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Price_TXT.tag=001;
    Price_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Price_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [Price_TXT setRightViewMode:UITextFieldViewModeAlways];
    
    [scrollview addSubview:Price_TXT];
    
    ///////////////////////////// Plues  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Plues = [UIButton buttonWithType:UIButtonTypeCustom];
    [Plues addTarget:self action:@selector(Plues_Btn:)forControlEvents:UIControlEventTouchUpInside];
    Plues.frame = CGRectMake(Price_TXT.frame.origin.x+Price_TXT.frame.size.width,Wtext_lable.frame.origin.y+Wtext_lable.frame.size.height-17,30,30);
    [Plues setTitle:@"+" forState:UIControlStateNormal];
     [Plues setFont:[UIFont fontWithName:@"bariol-regular" size:40.0]];
   // Plues.backgroundColor=[UIColor redColor];
    [scrollview addSubview:Plues];
    

    
    
    ///////////////////////////// mines  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

    mines = [UIButton buttonWithType:UIButtonTypeCustom];
    [mines addTarget:self action:@selector(mines_Btn:)forControlEvents:UIControlEventTouchUpInside];
    mines.frame = CGRectMake(Price_TXT.frame.origin.x+Price_TXT.frame.size.width,Wtext_lable.frame.origin.y+Wtext_lable.frame.size.height+14,30,30);
   // mines.backgroundColor=[UIColor purpleColor];
    [mines setFont:[UIFont fontWithName:@"bariol-regular" size:40.0]];
    [mines setTitle:@"-" forState:UIControlStateNormal];
    
    [scrollview addSubview:mines];
    
 ///////////////////////////// What_should_i_pay_LB  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    What_should_i_pay_LB = [[UILabel alloc] init];
    What_should_i_pay_LB.textColor = [UIColor blackColor];
    [What_should_i_pay_LB setFrame:CGRectMake(20,Price_TXT.frame.origin.y+Price_TXT.frame.size.height+5,300, 40)];
    What_should_i_pay_LB.backgroundColor=[UIColor clearColor];
    What_should_i_pay_LB.textColor=[UIColor whiteColor];
    What_should_i_pay_LB.userInteractionEnabled=NO;
    [What_should_i_pay_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    What_should_i_pay_LB.text= @"What should I pay?";
    What_should_i_pay_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    What_should_i_pay_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:What_should_i_pay_LB];
    
    
    
    
    //////////////////// code_value_TXT Textfeild\\\\\\\\\\\\\\
    
    code_value_TXT = [[UITextField alloc] initWithFrame:CGRectMake(20, What_should_i_pay_LB.frame.origin.y+What_should_i_pay_LB.frame.size.height-5, 150, 40)];
    code_value_TXT.borderStyle = UITextBorderStyleNone;
    UIColor *color = [UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    code_value_TXT.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:@"Enter promo code here"
                                    attributes:@{
                                                 NSForegroundColorAttributeName: color,
                                                 NSFontAttributeName : [UIFont fontWithName:@"bariol-regular" size:13.0]
                                                 }
     ];
    
    
    code_value_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    code_value_TXT.keyboardType = UIReturnKeyDefault;
    code_value_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    code_value_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    code_value_TXT.delegate = self;
    code_value_TXT.text=@"";
    ///code_value_TXT.backgroundColor=[UIColor clearColor];
    code_value_TXT.textColor=[UIColor whiteColor];
    code_value_TXT.tag=002;
    code_value_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [code_value_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:code_value_TXT];
    
    
 ///////////////////////////// Code apply  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    CodeApple = [UIButton buttonWithType:UIButtonTypeCustom];
    [CodeApple addTarget:self action:@selector(CodeApple_Btn:)forControlEvents:UIControlEventTouchUpInside];
    CodeApple.frame = CGRectMake(code_value_TXT.frame.origin.x+code_value_TXT.frame.size.width+10,What_should_i_pay_LB.frame.origin.y+What_should_i_pay_LB.frame.size.height+5,110,40);
       
    [CodeApple setTitleColor:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    [CodeApple setTitle:@"Apply" forState:UIControlStateNormal];
    [CodeApple setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
       CodeApple.layer.cornerRadius=20;
    CodeApple.clipsToBounds = YES;
    CodeApple.layer.borderWidth=1;
    CodeApple.layer.borderColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0].CGColor;
    [scrollview addSubview:CodeApple];



    
    
//    ///////////////////////////// Suggested price Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//    
//    Fastertext_lable = [[UILabel alloc] init];
//    Fastertext_lable.textColor = [UIColor blackColor];
//    [Fastertext_lable setFrame:CGRectMake(20,code_value_TXT.frame.origin.y+code_value_TXT.frame.size.height+20,300, 40)];
//    Fastertext_lable.backgroundColor=[UIColor clearColor];
//    Fastertext_lable.textColor=[UIColor whiteColor];
//    Fastertext_lable.userInteractionEnabled=NO;
//    [Fastertext_lable setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
//    Fastertext_lable.text= @"Pigeon Type?";
//    Fastertext_lable.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
//    Fastertext_lable.textAlignment=NSTextAlignmentLeft;
//    [scrollview addSubview:Fastertext_lable];
//
//
//    ///////////////////////////// Radio  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//    
//    Check_Uncheck = [UIButton buttonWithType:UIButtonTypeCustom];
//    [Check_Uncheck addTarget:self action:@selector(Check_Btn:)forControlEvents:UIControlEventTouchUpInside];
//    Check_Uncheck.frame = CGRectMake(20,Fastertext_lable.frame.origin.y+Fastertext_lable.frame.size.height+17,25,25);
//   [Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
//    [scrollview addSubview:Check_Uncheck];
//    
//    
//    
//    ///////////////////////////// Text for Radsio BUtton\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//    
//    
//    
//    Demo_LB = [[UILabel alloc] init];
//    Demo_LB.textColor = [UIColor blackColor];
//    [Demo_LB setFrame:CGRectMake(50,Fastertext_lable.frame.origin.y+Fastertext_lable.frame.size.height+20,115, 22)];
//    Demo_LB.backgroundColor=[UIColor clearColor];
//    Demo_LB.textColor=[UIColor whiteColor];
//    Demo_LB.userInteractionEnabled=NO;
//    [Demo_LB setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
//    Demo_LB.text= @"Positive Feedback";
//    Demo_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
//    Demo_LB.textAlignment=NSTextAlignmentLeft;
//    [scrollview addSubview:Demo_LB];
//    
//    
//    
//    ///////////////////////////// Radio2  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//    
//    RIGHT_Check_Uncheck = [UIButton buttonWithType:UIButtonTypeCustom];
//    [RIGHT_Check_Uncheck addTarget:self action:@selector(RIGHT_Check_Btn:)forControlEvents:UIControlEventTouchUpInside];
//    RIGHT_Check_Uncheck.frame = CGRectMake(170,Fastertext_lable.frame.origin.y+Fastertext_lable.frame.size.height+17,25,25);
//   [RIGHT_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"check_radio.png"] forState:UIControlStateNormal];    [scrollview addSubview:RIGHT_Check_Uncheck];
//    
//    
//    
//    ///////////////////////////// Text2 for Radsio BUtton\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//    
//    
//    
//    RIGHT_Demo_LB = [[UILabel alloc] init];
//    RIGHT_Demo_LB.textColor = [UIColor blackColor];
//    [RIGHT_Demo_LB setFrame:CGRectMake(200,Fastertext_lable.frame.origin.y+Fastertext_lable.frame.size.height+20,100, 22)];
//    RIGHT_Demo_LB.backgroundColor=[UIColor clearColor];
//    RIGHT_Demo_LB.textColor=[UIColor whiteColor];
//    RIGHT_Demo_LB.userInteractionEnabled=NO;
//    [RIGHT_Demo_LB setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
//    RIGHT_Demo_LB.text= @"Any Pigeon";
//    RIGHT_Demo_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
//    RIGHT_Demo_LB.textAlignment=NSTextAlignmentLeft;
//    [scrollview addSubview:RIGHT_Demo_LB];
//    
//    
//    
//    
    ////////////////////Deliver By Button\\\\\\\\\\\\\\
    
    Deliver_by = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Deliver_by addTarget:self
                    action:@selector(Deliver_by:)
          forControlEvents:UIControlEventTouchUpInside];
      [Deliver_by setTitle:@"Deliver By" forState:UIControlStateNormal];
    [Deliver_by setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Deliver_by.backgroundColor=[UIColor colorWithRed:228.0f/255.0f green:183.0f/255.0f blue:44.0f/255.0f alpha:1.0];
    [Deliver_by setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    
    Deliver_by.layer.cornerRadius=20;
    Deliver_by.clipsToBounds = YES;
    Deliver_by.frame = CGRectMake(30, code_value_TXT.frame.origin.y+code_value_TXT.frame.size.height+20,self.view.frame.size.width-60, 40.0);
    [scrollview addSubview:Deliver_by];
    
     scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"original_price"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"Discount"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
}


-(void)viewWillAppear:(BOOL)animated
{
    
}

-(void)CodeApple_Btn:(UIButton *)sender
{
    
   
    [self mActivityIndicater];
    
    [self performSelector:@selector(CallTheServer) withObject:nil afterDelay:0.5];
    

    
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


-(void)Plues_Btn:(UIButton *)sender
{
    
    if (check_value==true) {
        
        if ([Price_TXT.text floatValue]<[[[NSUserDefaults standardUserDefaults]valueForKey:@"Admin_suggested_price"]floatValue]) {
            
            Price_TXT.text=[[NSUserDefaults standardUserDefaults]valueForKey:@"Admin_suggested_price"];

        }
        else
        {
            
            vvalue=[Price_TXT.text floatValue];
            
            Price_TXT.text=[NSString stringWithFormat:@"%.02f",vvalue+1];
        }

        
    }
    
    else
    {
    
     vvalue=[Price_TXT.text floatValue];
    
    Price_TXT.text=[NSString stringWithFormat:@"%.02f",vvalue+1];
    }
    
    
    
}

-(void)mines_Btn:(UIButton *)sender
{
    if (check_value==true) {
        
        
        NSLog(@"%@",Price_TXT.text);
        NSLog(@"%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"Admin_suggested_price"]);
        
        
        if ([Price_TXT.text floatValue]==[[[NSUserDefaults standardUserDefaults]valueForKey:@"Admin_suggested_price"]floatValue]) {
            
            Price_TXT.text=[[NSUserDefaults standardUserDefaults]valueForKey:@"Discount"];
            
        }
        else
        {
            if ([Price_TXT.text floatValue]<=[[[NSUserDefaults standardUserDefaults]valueForKey:@"Discount"]floatValue]) {
                
            }
            else
            {
                

            vvalue=[Price_TXT.text floatValue];
            
            Price_TXT.text=[NSString stringWithFormat:@"%.02f",vvalue-1];
            }
        }
        
        
    }
    
    else
    {
        
        

    NSLog(@"%ld",(long)vvalue);
     NSLog(@"%@",Price_TXT.text);
    
    if ([Price_TXT.text floatValue]<=[[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"Total_price"]]floatValue]) {
        
    }
    else
    {
    
    vvalue=[Price_TXT.text floatValue];
    
    Price_TXT.text=[NSString stringWithFormat:@"%.02f",vvalue-1];
    }
        
    }

}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    
    
    return YES;
}

-(void)CallTheServer
{
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&price=%@&promo_code=%@&user_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],Price_TXT.text,code_value_TXT.text,[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"]]:[NSString stringWithFormat:@"%@promo_code",[Utility API_link_url]]];
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        
        
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            [[NSUserDefaults standardUserDefaults]setValue:code_value_TXT.text forKey:@"promo_code"];
            
             [[NSUserDefaults standardUserDefaults]setValue:Price_TXT.text forKey:@"original_price"];
            
            [[NSUserDefaults standardUserDefaults]synchronize];
            
            
            
            code_value_TXT.userInteractionEnabled=NO;
            code_value_TXT.alpha=0.5;
            CodeApple.userInteractionEnabled=NO;
            CodeApple.alpha=0.5;
           
            
            
            
            check_value=true;
            
            [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%@",[dict valueForKey:@"Coupon_value"]] forKey:@"Discount"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            Price_TXT.text=[NSString stringWithFormat:@"%.02f",[[dict valueForKey:@"Coupon_value"]floatValue]];
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
        
    }

}

-(void)Check_Btn:(UIButton *)sender
{
    [[NSUserDefaults standardUserDefaults]setValue:@"positive feedback" forKey:@"pigeon_type"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    [Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"check_radio.png"] forState:UIControlStateNormal];
    [RIGHT_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
}

-(void)RIGHT_Check_Btn:(UIButton *)sender
{
    [[NSUserDefaults standardUserDefaults]setValue:@"any pigeon" forKey:@"pigeon_type"];
    [[NSUserDefaults standardUserDefaults]synchronize];

    
    [Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    [RIGHT_Check_Uncheck setBackgroundImage:[UIImage imageNamed:@"check_radio.png"] forState:UIControlStateNormal];
}


-(void)Deliver_by:(UIButton *)sender
{
    
     NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSObject * object = [prefs objectForKey:@"Discount"];
    if(object == nil){
        
        
        if ([Price_TXT.text floatValue]<[[[NSUserDefaults standardUserDefaults]valueForKey:@"Admin_suggested_price"]floatValue]) {

        alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"You cannot enter less then Suggested price" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
        
         Price_TXT.text=[[NSUserDefaults standardUserDefaults]valueForKey:@"Admin_suggested_price"];
        }
        
        else
        {
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            NSObject * object = [prefs objectForKey:@"original_price"];
            if(object == nil){
                
                [[NSUserDefaults standardUserDefaults]setValue:Price_TXT.text forKey:@"original_price"];
                
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                
            }
            
            [[NSUserDefaults standardUserDefaults]setValue:Price_TXT.text forKey:@"after_discount"];
            
            [[NSUserDefaults standardUserDefaults]synchronize];
            
            
            
            
            if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Pigeon_posting"]isEqualToString:@"YES"]) {
                
                
                ANY_TIME_ViewController *objTomorrow_Day_ViewController=[[ANY_TIME_ViewController alloc]init];
                
                [self.navigationController pushViewController:objTomorrow_Day_ViewController animated:YES];
                
            }
            
            else
            {
            
            Set_Date_Time_ViewController *objSet_Date_Time_ViewController=[[Set_Date_Time_ViewController alloc]init];
            [self.navigationController pushViewController:objSet_Date_Time_ViewController animated:YES];
            }
            
        }
        

        }
    
    
    else
    {
        if ([Price_TXT.text floatValue]<[[[NSUserDefaults standardUserDefaults]valueForKey:@"Discount"]floatValue]) {
            
            alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"You cannot enter less then Suggested price" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
            
            Price_TXT.text=[[NSUserDefaults standardUserDefaults]valueForKey:@"Discount"];
        }
        
        else
        {
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            
            NSObject * object = [prefs objectForKey:@"original_price"];
            if(object == nil){
                
                [[NSUserDefaults standardUserDefaults]setValue:Price_TXT.text forKey:@"original_price"];
                
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                
            }
            
            [[NSUserDefaults standardUserDefaults]setValue:Price_TXT.text forKey:@"after_discount"];
            
            [[NSUserDefaults standardUserDefaults]synchronize];
            
            
            
            if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Pigeon_posting"]isEqualToString:@"YES"]) {
                
                
                ANY_TIME_ViewController *objTomorrow_Day_ViewController=[[ANY_TIME_ViewController alloc]init];
                
                [self.navigationController pushViewController:objTomorrow_Day_ViewController animated:YES];
                
            }
            
            else
            {
                
                Set_Date_Time_ViewController *objSet_Date_Time_ViewController=[[Set_Date_Time_ViewController alloc]init];
                [self.navigationController pushViewController:objSet_Date_Time_ViewController animated:YES];
            }

            
        }
        

        }

   
    
    
   
}
-(void)Back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
     
@end
