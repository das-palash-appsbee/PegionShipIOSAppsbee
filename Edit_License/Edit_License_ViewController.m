//
//  Edit_License_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 13/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Edit_License_ViewController.h"
#import "Insurance_ViewController.h"
#import "Profile_ViewController.h"
#import "UIImageView+WebCache.h"
#import "Utility.h"


@interface Edit_License_ViewController ()

@end

@implementation Edit_License_ViewController
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
    
    
    
    livImage=[[UIImageView alloc]init];
    [TopView addSubview:livImage];

    
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
    [Lname_LB setFrame:CGRectMake(30,Fname_TXT.frame.origin.y+50,250, 30)];
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
    [Address_LB setFrame:CGRectMake(30,Lname_TXT.frame.origin.y+50,250, 30)];
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
    [City_LB setFrame:CGRectMake(30,Address_TXT.frame.origin.y+50,250, 30)];
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
    Next_BTN.frame = CGRectMake(30, State_TXT.frame.origin.y+65,self.view.frame.size.width-60, 41.0);
    [scrollview addSubview:Next_BTN];

    
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 640);
    [self mActivityIndicater];
    
    [self performSelector:@selector(Show_CallTheServer_data) withObject:nil afterDelay:0.5];
    

}

-(void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
}
-(void)Show_CallTheServer_data
{
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        
        
        
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"]]                                                             :[NSString stringWithFormat:@"%@licence_detail",[Utility API_link_url]]];
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            Fname_TXT.text=[[dict valueForKey:@"License Detail"]valueForKey:@"Licence_number"];
            
            Lname_TXT.text=[[dict valueForKey:@"License Detail"]valueForKey:@"zip"];
            Address_TXT.text=[[dict valueForKey:@"License Detail"]valueForKey:@"Address"];
            
            
            City_TXT.text=[[dict valueForKey:@"License Detail"]valueForKey:@"City"];
            
            
            State_TXT.text=[[dict valueForKey:@"License Detail"]valueForKey:@"State"];
            
            if ([[[dict valueForKey:@"License Detail"]valueForKey:@"license"]length]>=5) {
                
                
                checkactionSheet=true;
                
                [livImage sd_setImageWithURL:[NSURL URLWithString:[[dict valueForKey:@"License Detail"]valueForKey:@"license"]]
                               placeholderImage:[UIImage imageNamed:@"default_pic.png"]];
                
                livImage.frame=CGRectMake(10, textlable.frame.origin.y+65, self.view.frame.size.width-20, 150);
               
                
                
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
                
                Next_BTN.frame = CGRectMake(30, State_TXT.frame.origin.y+65,self.view.frame.size.width-60, 41.0);

                
                scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 730);
                
            }
            
            
        }
        
        else
        {
            
            alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[dict valueForKey:@"message"] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
            
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

        
        alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Not connected to the internet" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
        }
    }
    
    [loader removeFromSuperview];
    
    
    
}



-(void)Update_CallTheServer_data
{
    if ([API connectedToInternet]==YES) {
        
        
        
        if (livImage.image==nil) {
            
             PUser_image_str=@"";
           
        }
        else
        {
            NSData *PCover_User_imageData = UIImagePNGRepresentation(livImage.image);
            PUser_image_str=[PCover_User_imageData base64Encoding];
            
           
        }

        
        
        //------------ Call API for signup With Post Method --------------//
        
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&licence_number=%@&zip=%@&address=%@&city=%@&state=%@&license_img=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],Fname_TXT.text,Lname_TXT.text,Address_TXT.text,City_TXT.text,State_TXT.text,PUser_image_str] :[NSString stringWithFormat:@"%@edit_licencedetail",[Utility API_link_url]]];
        
        
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            ////////////      Edited By Appsbee 08/17/2016 for Popup title change from Alert to Done  ////////////////////////
            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            alert = [[UIAlertView alloc] initWithTitle:@"Done" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
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



-(void)Back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

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
    
    Next_BTN.frame = CGRectMake(30, State_TXT.frame.origin.y+65,self.view.frame.size.width-60, 41.0);
    
    
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 730);

    
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}




-(void)Save_Data:(UIButton *)sender
{
    
    
    
    
    if ([[Fname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Lname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[City_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]|| [[State_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[Address_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
        Next_BTN.alpha=0.3;
        Next_BTN.userInteractionEnabled=NO;
        
    }
    
    else
    {
        
        
        
        [self mActivityIndicater];
        
        [self performSelector:@selector(Update_CallTheServer_data) withObject:nil afterDelay:0.5];

        
    
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
        if (checkactionSheet==false) {
            
            scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 630);
        }
        else
        {
            scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 730);
        }

        
        
        
        
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








- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [self.view endEditing:YES];
    
    
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
//            if (checkactionSheet==false) {
//                
//                scrollview.frame=CGRectMake(0, -100, self.view.frame.size.width, self.view.frame.size.height);
//                
//                scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 650);
//                
//            }
//            else
//            {
//                scrollview.frame=CGRectMake(0, -220, self.view.frame.size.width, self.view.frame.size.height);
//                
//                scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 730);
//            }
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
//


//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
//
//
//
//
//    if (textField.tag==001) {
//
//         [[NSUserDefaults standardUserDefaults]setValue:newString forKey:@"pro_Licence_number"];
//
//    }
//    else   if (textField.tag==002) {
//
//        [[NSUserDefaults standardUserDefaults]setValue:newString forKey:@"pro_Zip_code"];

//
//
//    }
//    else   if (textField.tag==003) {
//
//        [[NSUserDefaults standardUserDefaults]setValue:newString forKey:@"pro_Address"];
//
//
//    }
//    else   if (textField.tag==004) {
//
//        [[NSUserDefaults standardUserDefaults]setValue:newString forKey:@"pro_City"];
//
//    }
//    else   if (textField.tag==005) {
//
//          [[NSUserDefaults standardUserDefaults]setValue:newString forKey:@"pro_State"];
//
//    }
//
//
//
//    return YES;
//}


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
