//
//  License_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 04/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "License_ViewController.h"
#import "Insurance_ViewController.h"
#import "Profile_ViewController.h"

@interface License_ViewController ()

@end

@implementation License_ViewController
@synthesize activeTextView;


#pragma mark - -*********************
#pragma mark    AutoScroll UItextfeild Methods
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
#pragma mark    viewDidLoad
#pragma mark - -*********************


- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    MTitle.text= @"Driver License";
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
    
    textlable.attributedText = [[NSAttributedString alloc] initWithString:@"To protect both Pigeons and Senders, a valid driver license is required."
                                                                  attributes:attributtes];
    
    textlable.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    textlable.textAlignment=NSTextAlignmentCenter;
    [TopView addSubview:textlable];
    
    
    
    livImage=[[UIImageView alloc]init];
    [TopView addSubview:livImage];

    
    
    ///////////////////////////// Top View Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

    scan_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [scan_BTN addTarget:self
                   action:@selector(Scan_btn:)
         forControlEvents:UIControlEventTouchUpInside];
    scan_BTN.backgroundColor=[UIColor colorWithRed:52.0f/255.0f green:51.0f/255.0f blue:49.0f/255.0f alpha:1.0];
    [scan_BTN setTitle:@"Take a Photo of your License" forState:UIControlStateNormal];
    scan_BTN.titleLabel.font=[UIFont fontWithName:@"bariol-regular" size:14.0f];
    [scan_BTN setTitleColor:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    scan_BTN.layer.cornerRadius=20;
    scan_BTN.clipsToBounds = YES;
    scan_BTN.layer.borderWidth=1;
    scan_BTN.layer.borderColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0].CGColor;
    scan_BTN.frame = CGRectMake(30, textlable.frame.origin.y+65,self.view.frame.size.width-60, 45.0);
    [TopView addSubview:scan_BTN];
    
//////////////////////////
    
    
    
    ///////////////////////////// First Name\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
   

    
    Fname_LB = [[UILabel alloc] init];
    Fname_LB.textColor = [UIColor blackColor];
    [Fname_LB setFrame:CGRectMake(30,TopView.frame.origin.y+TopView.frame.size.height+10,250, 30)];
    Fname_LB.backgroundColor=[UIColor clearColor];
    Fname_LB.textColor=[UIColor whiteColor];
    Fname_LB.userInteractionEnabled=NO;
    [Fname_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Fname_LB.text= @"License number";
    Fname_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Fname_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Fname_LB];
    
    
    
    Fname_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,Fname_LB.frame.origin.y+10,self.view.frame.size.width-60, 40)];
    Fname_TXT.borderStyle = UITextBorderStyleNone;
    Fname_TXT.font = [UIFont systemFontOfSize:15];
    // Fname_TXT.placeholder = @"First Name";
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
    [Fname_TXT setRightViewMode:UITextFieldViewModeAlways];
    
    [scrollview addSubview:Fname_TXT];
    
    
    ///////////////////////////// Last Name\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Lname_LB = [[UILabel alloc] init];
    Lname_LB.textColor = [UIColor blackColor];
    [Lname_LB setFrame:CGRectMake(30,Fname_TXT.frame.origin.y+50,100, 30)];
    Lname_LB.backgroundColor=[UIColor clearColor];
    Lname_LB.textColor=[UIColor whiteColor];
    Lname_LB.userInteractionEnabled=NO;
    [Lname_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Lname_LB.text= @"Zip code";
    Lname_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Lname_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Lname_LB];
    
  
    
    Lname_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30, Lname_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Lname_TXT.borderStyle = UITextBorderStyleNone;
    Lname_TXT.font = [UIFont systemFontOfSize:15];
    Lname_TXT.text= @"";
    Lname_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Lname_TXT.keyboardType = UIKeyboardTypeNumberPad;
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
    [Lname_TXT setRightViewMode:UITextFieldViewModeAlways];
  
    
    
    ///////////////////////////// Email Id\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Address_LB = [[UILabel alloc] init];
    Address_LB.textColor = [UIColor blackColor];
    [Address_LB setFrame:CGRectMake(30,Lname_TXT.frame.origin.y+50,100, 30)];
    Address_LB.backgroundColor=[UIColor clearColor];
    Address_LB.textColor=[UIColor whiteColor];
    Address_LB.userInteractionEnabled=NO;
    [Address_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Address_LB.text= @"Address";
    Address_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Address_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Address_LB];
    
    
    
    
   
    Address_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,Address_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    Address_TXT.borderStyle = UITextBorderStyleNone;
    Address_TXT.font = [UIFont systemFontOfSize:15];
    Address_TXT.text=@"";
    Address_TXT.keyboardType = UIKeyboardTypeDefault;
    Address_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Address_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Address_TXT.delegate = self;
    Address_TXT.backgroundColor=[UIColor clearColor];
    Address_TXT.textColor=[UIColor whiteColor];
    [Address_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Address_TXT.tag=003;
    [Address_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    
    
    Address_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Address_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [Address_TXT setRightViewMode:UITextFieldViewModeAlways];
    [scrollview addSubview:Address_TXT];
    
    
    
    
    ///////////////////////////// Password \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    City_LB = [[UILabel alloc] init];
    City_LB.textColor = [UIColor blackColor];
    [City_LB setFrame:CGRectMake(30,Address_TXT.frame.origin.y+50,100, 30)];
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
    City_TXT.text=@"";
    City_TXT.font = [UIFont systemFontOfSize:15];
    City_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    City_TXT.keyboardType = UIReturnKeyDefault;
    City_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    City_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    City_TXT.delegate = self;
    City_TXT.backgroundColor=[UIColor clearColor];
    City_TXT.textColor=[UIColor whiteColor];
    City_TXT.tag=004;
    [City_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    City_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [City_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:City_TXT];
    [City_TXT setRightViewMode:UITextFieldViewModeAlways];
    
    
    
    /////////////////////////////Confirm Password \\\\\\\\\\\\\\\\\\\\\\\\\\
    
    State_LB = [[UILabel alloc] init];
    State_LB.textColor = [UIColor blackColor];
    [State_LB setFrame:CGRectMake(30,City_TXT.frame.origin.y+50,100, 30)];
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
    State_TXT.text=@"";
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
    
    facke_view=[[UIView alloc]init];
    facke_view.frame= CGRectMake(30, State_TXT.frame.origin.y+State_TXT.frame.size.height+10,self.view.frame.size.width-60, 60.0);
    facke_view.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:facke_view];

    
    
    
    Next_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Next_BTN addTarget:self
                 action:@selector(Next:)
       forControlEvents:UIControlEventTouchUpInside];
    Next_BTN.backgroundColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    [Next_BTN setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    [Next_BTN setTitle:@"Next" forState:UIControlStateNormal];
    [Next_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    
    Next_BTN.layer.cornerRadius=20;
    Next_BTN.clipsToBounds = YES;
    Next_BTN.layer.borderColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0].CGColor;
    Next_BTN.alpha=0.3;
    Next_BTN.userInteractionEnabled=NO;
    Next_BTN.layer.borderWidth=1;
    Next_BTN.frame = CGRectMake(5, 0,120, 40.0);
    [facke_view addSubview:Next_BTN];
    
    
    
    Skip_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Skip_BTN addTarget:self
                 action:@selector(Skip:)
       forControlEvents:UIControlEventTouchUpInside];
    [Skip_BTN setTitleColor:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    [Skip_BTN setTitle:@"Skip and Go" forState:UIControlStateNormal];
    [Skip_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    Skip_BTN.layer.cornerRadius=20;
    Skip_BTN.clipsToBounds = YES;
    Skip_BTN.layer.borderWidth=1;
    Skip_BTN.layer.borderColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0].CGColor;
    Skip_BTN.frame = CGRectMake(facke_view.frame.size.width-100,0, 110, 40.0);
    [facke_view addSubview:Skip_BTN];
    

    
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"Lice_image"];
    [[NSUserDefaults standardUserDefaults]synchronize];

    
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);

}

-(void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
}


#pragma mark - -*********************
#pragma mark    Back Button Action
#pragma mark - -*********************

-(void)Back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];

}



#pragma mark - -*********************
#pragma mark    Next And Skip Button Action
#pragma mark - -*********************


-(void)Next:(UIButton *)sender
{
    
    
    if ([[Fname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Lname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[City_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[State_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Address_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
        Next_BTN.alpha=0.3;
        Next_BTN.userInteractionEnabled=NO;
        
    }
    
    else
    {
        
        
        [[NSUserDefaults standardUserDefaults]setValue:Fname_TXT.text forKey:@"pro_Licence_number"];
        [[NSUserDefaults standardUserDefaults]setValue:Lname_TXT.text forKey:@"pro_Zip_code"];
        [[NSUserDefaults standardUserDefaults]setValue:City_TXT.text forKey:@"pro_City"];
        [[NSUserDefaults standardUserDefaults]setValue:Address_TXT.text forKey:@"pro_Address"];
        [[NSUserDefaults standardUserDefaults]setValue:State_TXT.text forKey:@"pro_State"];
        
        
        [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%@ %@ %@ %@",Address_TXT.text,City_TXT.text,State_TXT.text,Lname_TXT.text] forKey:@"pro_Location"];
        
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
         if (checkactionSheet==false) {
        
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
         }
        else
        {
             scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 700);
        }
       
        Profile_ViewController *OBJProfile_ViewController=[[Profile_ViewController alloc]init];
        [self.navigationController pushViewController:OBJProfile_ViewController animated:YES];

        
        
        
    }
    
    
    
    
    
}

-(void)Skip:(UIButton *)sender
{
    
    
    [[NSUserDefaults standardUserDefaults]setValue:@"" forKey:@"pro_Licence_number"];
    [[NSUserDefaults standardUserDefaults]setValue:@"" forKey:@"pro_Zip_code"];
    [[NSUserDefaults standardUserDefaults]setValue:@"" forKey:@"pro_City"];
    [[NSUserDefaults standardUserDefaults]setValue:@"" forKey:@"pro_Address"];
    [[NSUserDefaults standardUserDefaults]setValue:@"" forKey:@"pro_State"];
    
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"pro_Location"];
    

    [[NSUserDefaults standardUserDefaults]synchronize];
    Profile_ViewController *OBJProfile_ViewController=[[Profile_ViewController alloc]init];
    [self.navigationController pushViewController:OBJProfile_ViewController animated:YES];
    
   }


#pragma mark - -*********************
#pragma mark   Open action sheet for Camera or Gallery
#pragma mark - -*********************


-(void)Scan_btn:(UIButton *)sender
{
    
    actionSheets = [[UIActionSheet alloc]
                    initWithTitle:@"Select your Option"
                    delegate:self
                    cancelButtonTitle:@"Cancel"
                    destructiveButtonTitle:nil
                    otherButtonTitles:@"Camera", @"Photos",nil];
    actionSheets.tag=202;
    [actionSheets showInView:self.view];

}

#pragma mark - -*********************
#pragma mark ActionSheet clickedButton Method
#pragma mark - -*********************

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing=YES;
    if ([[actionSheet buttonTitleAtIndex:buttonIndex]isEqualToString:@"Camera"])
    {
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            
            [self presentViewController:picker animated:YES completion:NULL];
        }
        else
        {
          UIAlertView  *alert = [[UIAlertView alloc] initWithTitle:@"Message!!" message:@"Camera is not available , Please choose Picture from Library" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok",nil];
            [alert show];
            
        }
        
    }
    else if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Photos"])
    {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:picker animated:YES completion:NULL];
    }
    
   
    
}

#pragma mark - -*********************
#pragma mark Image Picker Controller delegate methods
#pragma mark - -*********************


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    checkactionSheet=true;
    
    chosenImage = info[UIImagePickerControllerEditedImage];
    [[NSUserDefaults standardUserDefaults] setObject: UIImageJPEGRepresentation(chosenImage, 0.6) forKey:@"Lice_image"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    
    livImage.frame=CGRectMake(10, textlable.frame.origin.y+65, self.view.frame.size.width-20, 150);
    livImage.image=chosenImage;
    
    livImage.contentMode = UIViewContentModeScaleAspectFit;
    [livImage setClipsToBounds:YES];

     TopView.frame=CGRectMake(0, MTitle.frame.origin.y+40, self.view.frame.size.width,280);
    scan_BTN.frame = CGRectMake(30, livImage.frame.origin.y+livImage.frame.size.height+5,self.view.frame.size.width-60, 45.0);
    
    [Fname_LB setFrame:CGRectMake(30,TopView.frame.origin.y+TopView.frame.size.height+10,250, 30)];
    Fname_TXT.frame = CGRectMake(30,Fname_LB.frame.origin.y+10,self.view.frame.size.width-60, 40);
    [Lname_LB setFrame:CGRectMake(30,Fname_TXT.frame.origin.y+50,100, 30)];
    Lname_TXT.frame = CGRectMake(30, Lname_LB.frame.origin.y+10, self.view.frame.size.width-60, 40);
    [Address_LB setFrame:CGRectMake(30,Lname_TXT.frame.origin.y+50,100, 30)];
    Address_TXT.frame = CGRectMake(30,Address_LB.frame.origin.y+10, self.view.frame.size.width-60, 40);
    
    [City_LB setFrame:CGRectMake(30,Address_TXT.frame.origin.y+50,100, 30)];
    
    City_TXT.frame = CGRectMake(30, City_LB.frame.origin.y+10, self.view.frame.size.width-60, 40);
    
    [State_LB setFrame:CGRectMake(30,City_TXT.frame.origin.y+50,100, 30)];
    
    State_TXT.frame =CGRectMake(30, State_LB.frame.origin.y+10, self.view.frame.size.width-60, 40);
    
    facke_view.frame= CGRectMake(30, State_TXT.frame.origin.y+State_TXT.frame.size.height+10,self.view.frame.size.width-60, 60.0);
    Skip_BTN.frame = CGRectMake(facke_view.frame.size.width-100,0, 110, 40.0);
    
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 700);
    
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}




#pragma mark - -*********************
#pragma mark    UITextField Method
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
    
    
    if ([[Fname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Lname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[City_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[State_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Address_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
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
    
    
    if ([[Fname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Lname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[City_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[State_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Address_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]  || newLength==0) {
        
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


-(void)updateTextLabelsWithText:(NSString *)string
{
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
