//
//  Edit_Account_Info_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 13/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Edit_Account_Info_ViewController.h"

#import "Email_validation.h"
#import "Selfi_ViewController.h"
#import "Login_ViewController.h"
#import "Confirmcode_ViewController.h"
#import "Utility.h"

#import "API.h"
#import "JSON.h"
#define MAXLENGTH 7
#define MINILENGTH 5



@interface Edit_Account_Info_ViewController ()

@end

@implementation Edit_Account_Info_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
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
    
    
    ///////////////////////////// Back Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Back_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [Back_BTN addTarget:self
                 action:@selector(Back:)
       forControlEvents:UIControlEventTouchUpInside];
    [Back_BTN setImage:[UIImage imageNamed:@"back_.png"] forState:UIControlStateNormal];
    
    
    Back_BTN.frame = CGRectMake(10,10,49,26);
    [scrollview addSubview:Back_BTN];

    
    
    self.navigationController.navigationBarHidden=YES;
    
    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    MTitle = [[UILabel alloc] init];
    MTitle.textColor = [UIColor blackColor];
    [MTitle setFrame:CGRectMake(0,10,self.view.frame.size.width, 40)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"Account Info";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:MTitle];
    
    
    ///////////////////////////// First Name\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Fname_LB = [[UILabel alloc] init];
    Fname_LB.textColor = [UIColor blackColor];
    [Fname_LB setFrame:CGRectMake(30,MTitle.frame.origin.y+50,250, 30)];
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
    [Lname_LB setFrame:CGRectMake(30,Fname_TXT.frame.origin.y+50,250, 30)];
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
    [email_LB setFrame:CGRectMake(30,Lname_TXT.frame.origin.y+50,250, 30)];
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
    [email_TXT setRightView:paddingView_email];
    
    
    
    
    /////////////////////////////Phone naumber \\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Pnumber_LB = [[UILabel alloc] init];
    Pnumber_LB.textColor = [UIColor blackColor];
    [Pnumber_LB setFrame:CGRectMake(30,email_TXT.frame.origin.y+50,100, 30)];
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
    
    
    
    
    
    
    
    
    
    
    ///////////////////////////// Email Alert_Check_Uncheck  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Email_alter_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [Email_alter_BTN addTarget:self action:@selector(Email_alter_BTN_action:)forControlEvents:UIControlEventTouchUpInside];
    Email_alter_BTN.frame = CGRectMake(20,Pnumber_TXT.frame.origin.y+Pnumber_TXT.frame.size.height+15,30,30);
    [Email_alter_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_checkbox.png"] forState:UIControlStateNormal];
    [scrollview addSubview:Email_alter_BTN];
    
    
    
    ///////////////////////////// Tiny Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Email_alter_LB = [[UILabel alloc] init];
    Email_alter_LB.textColor = [UIColor blackColor];
    [Email_alter_LB setFrame:CGRectMake(47,Pnumber_TXT.frame.origin.y+Pnumber_TXT.frame.size.height+20,200, 22)];
    Email_alter_LB.backgroundColor=[UIColor clearColor];
    Email_alter_LB.textColor=[UIColor whiteColor];
    Email_alter_LB.userInteractionEnabled=NO;
    [Email_alter_LB setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
    Email_alter_LB.text=@"Email Alert";
    Email_alter_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Email_alter_LB];

    
    
    
    
    
    
    ///////////////////////////// SMS Alert_Check_Uncheck  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Sms_alter_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [Sms_alter_BTN addTarget:self action:@selector(Sms_alter_BTN_action:)forControlEvents:UIControlEventTouchUpInside];
    Sms_alter_BTN.frame = CGRectMake(20,Email_alter_BTN.frame.origin.y+Email_alter_BTN.frame.size.height+15,30,30);
    [Sms_alter_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_checkbox.png"] forState:UIControlStateNormal];
    [scrollview addSubview:Sms_alter_BTN];
    
    
    
    ///////////////////////////// Tiny Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Sms_alter_LB = [[UILabel alloc] init];
    Sms_alter_LB.textColor = [UIColor blackColor];
    [Sms_alter_LB setFrame:CGRectMake(47,Email_alter_BTN.frame.origin.y+Email_alter_BTN.frame.size.height+20,200, 22)];
    Sms_alter_LB.backgroundColor=[UIColor clearColor];
    Sms_alter_LB.textColor=[UIColor whiteColor];
    Sms_alter_LB.userInteractionEnabled=NO;
    [Sms_alter_LB setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
    Sms_alter_LB.text=@"SMS Alert";
    Sms_alter_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Sms_alter_LB];

    


    ///////////////////////////// Newsletter_Check_Uncheck  Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Newsletter_alter_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [Newsletter_alter_BTN addTarget:self action:@selector(Newsletter_alter_BTN_action:)forControlEvents:UIControlEventTouchUpInside];
    Newsletter_alter_BTN.frame = CGRectMake(20,Sms_alter_BTN.frame.origin.y+Sms_alter_BTN.frame.size.height+15,30,30);
    [Newsletter_alter_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_checkbox.png"] forState:UIControlStateNormal];
    [scrollview addSubview:Newsletter_alter_BTN];
    
    
    
    ///////////////////////////// Tiny Text lable\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Newsletter_alter_LB = [[UILabel alloc] init];
    Newsletter_alter_LB.textColor = [UIColor blackColor];
    [Newsletter_alter_LB setFrame:CGRectMake(47,Sms_alter_BTN.frame.origin.y+Sms_alter_BTN.frame.size.height+20,200, 22)];
    Newsletter_alter_LB.backgroundColor=[UIColor clearColor];
    Newsletter_alter_LB.textColor=[UIColor whiteColor];
    Newsletter_alter_LB.userInteractionEnabled=NO;
    [Newsletter_alter_LB setFont:[UIFont fontWithName:@"bariol-regular" size:12.0]];
    Newsletter_alter_LB.text=@"Newsletter";
    Newsletter_alter_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Newsletter_alter_LB];
    
    
    
    
    textlable = [[UILabel alloc] init];
    textlable.textColor = [UIColor blackColor];
    [textlable setFrame:CGRectMake(10,Newsletter_alter_LB.frame.origin.y+Newsletter_alter_LB.frame.size.height+5,self.view.frame.size.width-20, 50)];
    textlable.backgroundColor=[UIColor clearColor];
    textlable.textColor=[UIColor whiteColor];
    textlable.userInteractionEnabled=NO;
    
    textlable.numberOfLines=0;
    [textlable setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    
   
    
    textlable.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    textlable.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:textlable];


    
    BTN_sign_In = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [BTN_sign_In addTarget:self
                    action:@selector(NEXT_VIEW:)
          forControlEvents:UIControlEventTouchUpInside];
    BTN_sign_In.backgroundColor=[UIColor colorWithRed:228.0f/255.0f green:183.0f/255.0f blue:44.0f/255.0f alpha:1.0];
    [BTN_sign_In setTitle:@"Save" forState:UIControlStateNormal];
    [BTN_sign_In setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    [BTN_sign_In setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    BTN_sign_In.layer.cornerRadius=20;
    BTN_sign_In.clipsToBounds = YES;
    BTN_sign_In.frame = CGRectMake(30,textlable.frame.origin.y+70,self.view.frame.size.width-60, 44.0);
    [scrollview addSubview:BTN_sign_In];
    
        ///  self.view.backgroundColor=[UIColor whiteColor];
    
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
    
    //
    
    
    
    
    
     Email_alter_check=false;
     Sms_alter_check=false;
     Newsletter_alter_check=false;

    
    [self mActivityIndicater];
    
    [self performSelector:@selector(Show_CallTheServer_data) withObject:nil afterDelay:0.5];
    

    
}



-(void)Email_alter_BTN_action:(UIButton *)sender
{
    
    if ( Email_alter_check==false) {
        
        
        Email_alter_check=true;
        
        
         [Email_alter_BTN setBackgroundImage:[UIImage imageNamed:@"check_checkbox.png"] forState:UIControlStateNormal];
        
        
        [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"email_alert"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        
    }
    else
    {
         [Email_alter_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_checkbox.png"] forState:UIControlStateNormal];
        
         Email_alter_check=false;
        
        
        [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"email_alert"];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
   
    
    
   

}

-(void)Sms_alter_BTN_action:(UIButton *)sender
{
    
    
    if ( Sms_alter_check==false) {
        
        
        [Sms_alter_BTN setBackgroundImage:[UIImage imageNamed:@"check_checkbox.png"] forState:UIControlStateNormal];
        
        Sms_alter_check=true;
        
        
        [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"sms"];
        [[NSUserDefaults standardUserDefaults]synchronize];
      
        

    }
    else
    {
        [Sms_alter_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_checkbox.png"] forState:UIControlStateNormal];
        
        Sms_alter_check=false;
        
        [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"sms"];
        [[NSUserDefaults standardUserDefaults]synchronize];



    }

    
  
    
}


-(void)Newsletter_alter_BTN_action:(UIButton *)sender
{
    
    if ( Newsletter_alter_check==false) {
        
        
        [Newsletter_alter_BTN setBackgroundImage:[UIImage imageNamed:@"check_checkbox.png"] forState:UIControlStateNormal];
        
        
        Newsletter_alter_check=true;
        
        
        [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"newsletter"];
        [[NSUserDefaults standardUserDefaults]synchronize];
       
        
    }
    else
    {
        [Newsletter_alter_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_checkbox.png"] forState:UIControlStateNormal];
        
        
         Newsletter_alter_check=false;
        
        
        [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"newsletter"];
        [[NSUserDefaults standardUserDefaults]synchronize];

        
    }
    

    
   
}




-(void)Show_CallTheServer_data
{
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"]]                                                             :[NSString stringWithFormat:@"%@view_profile",[Utility API_link_url]]];
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            Fname_TXT.text=[[dict valueForKey:@"User_data"]valueForKey:@"User_Firstname"];
            
            Lname_TXT.text=[[dict valueForKey:@"User_data"]valueForKey:@"User_Lastname"];
            email_TXT.text=[[dict valueForKey:@"User_data"]valueForKey:@"User_Emailaddress"];
            
            
            Pnumber_TXT.text=[[dict valueForKey:@"User_data"]valueForKey:@"User_Phonenumber"];
            
            
            
            
            NSMutableParagraphStyle *style  = [[NSMutableParagraphStyle alloc] init];
            style.minimumLineHeight = 25.f;
            style.maximumLineHeight = 25.f;
            NSDictionary *attributtes = @{NSParagraphStyleAttributeName : style,};
            
            textlable.attributedText = [[NSAttributedString alloc] initWithString:[[dict valueForKey:@"User_data"]valueForKey:@"alertText"]
                                                                       attributes:attributtes];
            
            
            if ([[[dict valueForKey:@"User_data"]valueForKey:@"email"] isEqualToString:@"0"]) {
                
                
                Email_alter_check=false;
                [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"email_alert"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                
                [Email_alter_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_checkbox.png"] forState:UIControlStateNormal];
            }
            else
            {
                [Email_alter_BTN setBackgroundImage:[UIImage imageNamed:@"check_checkbox.png"] forState:UIControlStateNormal];
                
                Email_alter_check=true;
                
                [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"email_alert"];
                [[NSUserDefaults standardUserDefaults]synchronize];

            }
            
            
            
            if ([[[dict valueForKey:@"User_data"]valueForKey:@"sms"] isEqualToString:@"0"]) {
                
                
                [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"sms"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                [Sms_alter_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_checkbox.png"] forState:UIControlStateNormal];
                
                Sms_alter_check=false;
                
                
            }
            else
            {
                
                [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"sms"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                [Sms_alter_BTN setBackgroundImage:[UIImage imageNamed:@"check_checkbox.png"] forState:UIControlStateNormal];
                
                Sms_alter_check=true;
                
                
            }
            if ([[[dict valueForKey:@"User_data"]valueForKey:@"newsletter"] isEqualToString:@"0"]) {
                
                
                
                               [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"newsletter"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                

                
                [Newsletter_alter_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_checkbox.png"] forState:UIControlStateNormal];
                
                
                Newsletter_alter_check=false;
                
            }
            else
            {
                [Newsletter_alter_BTN setBackgroundImage:[UIImage imageNamed:@"check_checkbox.png"] forState:UIControlStateNormal];
                
                
                Newsletter_alter_check=true;
                
                [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"newsletter"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                
                
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




-(void)Back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
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
    
    [Pnumber_TXT resignFirstResponder];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view endEditing:YES];
        [UIView commitAnimations];
    });
    
    
    
    
    
    if ([[Fname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Lname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[email_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Pnumber_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
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
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view endEditing:YES];
        [UIView commitAnimations];
    });
    
    
    [Pnumber_TXT resignFirstResponder];
}

//-(void)NEXT_VIEW:(UIButton *)sender
//{
//
//
//
//    Confirmcode_ViewController *OBJSelfi_ViewController=[[Confirmcode_ViewController alloc]init];
//    [self.navigationController pushViewController:OBJSelfi_ViewController animated:YES];
//
//
//
//
//}

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

-(void)Facebook:(UIButton *)sender
{
    
}

-(void)Google_Plues:(UIButton *)sender
{
    
}



-(void)Update_CallTheServer_data
{
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        NSString *unfilteredString = Pnumber_TXT.text;
        NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"] invertedSet];
        NSString *resultString = [[unfilteredString componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
        

        
        
        NSString * strippedNumber = [Passwprd_TXT.text stringByReplacingOccurrencesOfString:@"[^0-9]" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, [Passwprd_TXT.text length])];
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&first_name=%@&last_name=%@&email=%@&phone_number=%@&email_alert=%@&sms=%@&newsletter=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],Fname_TXT.text,Lname_TXT.text,email_TXT.text,resultString,[[NSUserDefaults standardUserDefaults]valueForKey:@"email_alert"],[[NSUserDefaults standardUserDefaults]valueForKey:@"sms"],[[NSUserDefaults standardUserDefaults]valueForKey:@"newsletter"]]                                                            :[NSString stringWithFormat:@"%@edit_accountinfo",[Utility API_link_url]]];
        
        
        
        
        
        
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
    
            [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%@ %@",Fname_TXT.text,Lname_TXT.text] forKey:@"User_name"];
            [[NSUserDefaults standardUserDefaults]setValue:email_TXT.text forKey:@"User_Email_Id"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            
            [[NSNotificationCenter defaultCenter]
             postNotificationName:@"Update_Data"
             object:self];
            
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
    
    [self.navigationController popViewControllerAnimated:YES];
    }
    
}



-(void)NEXT_VIEW:(UIButton *)sender
{
    
    NSLog(@"%lu",(unsigned long)Pnumber_TXT.text.length);
    
    
    NSString *myRegex = @"[A-Z0-9a-z_ ]*";
    NSPredicate *myTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", myRegex];
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
    
    
    
    if ([[Fname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Lname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[email_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]  || [[Pnumber_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
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
        
        
        if ([[Pnumber_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
            
            
            
            [Pnumber_TXT shake:10
                     withDelta:5.0
                      andSpeed:0.04
                shakeDirection:ShakeDirectionHorizontal];
        }
        
        
        
    }
    else if(![Email_validation validateEmail:[email_TXT text]]) {
        // user entered invalid email address
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Enter a valid email address." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert2 show];
    }
    
      else if ([Pnumber_TXT.text length]<10)
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Wrong phone number Try again?" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert2 show];
    }
    
    else {
        
        [self mActivityIndicater];
        
        [self performSelector:@selector(Update_CallTheServer_data) withObject:nil afterDelay:0.5];

        
    }
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
    scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view endEditing:YES];
    
}




- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
        scrollview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view endEditing:YES];
        [UIView commitAnimations];
    });
    
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField.tag==005 || textField.tag==006) {
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.5];
            [UIView setAnimationCurve:UIViewAnimationCurveLinear];
            scrollview.frame=CGRectMake(0, -70, self.view.frame.size.width, self.view.frame.size.height);
            
            scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 650);
            [UIView commitAnimations];
        });
        
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
    
    
    if ([[Fname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Lname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[email_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]||[[Pnumber_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
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
    
    if ([[Fname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Lname_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[email_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Pnumber_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || newLength==0) {
        
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
        
//        if(length == 3)
//        {
//            NSString *num = [self formatNumber:textField.text];
//            textField.text = [NSString stringWithFormat:@"(%@) ",num];
//            if(range.length > 0)
//                textField.text = [NSString stringWithFormat:@"%@",[num substringToIndex:3]];
//        }
//        else if(length == 6)
//        {
//            NSString *num = [self formatNumber:textField.text];
//            //NSLog(@"%@",[num  substringToIndex:3]);
//            //NSLog(@"%@",[num substringFromIndex:3]);
//            textField.text = [NSString stringWithFormat:@"(%@) %@-",[num  substringToIndex:3],[num substringFromIndex:3]];
//            if(range.length > 0)
//                textField.text = [NSString stringWithFormat:@"(%@) %@",[num substringToIndex:3],[num substringFromIndex:3]];
//        }
        
    }
    
    return YES;
    
    
}



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

@end
