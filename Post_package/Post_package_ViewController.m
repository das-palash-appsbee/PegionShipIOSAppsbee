//
//  Post_package_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 18/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Post_package_ViewController.h"
#import <AddressBookUI/AddressBookUI.h>
#import "MFSideMenu.h"
#import "Edit_LIST_SENDER_ViewController.h"
#import "Credit_Card_ ViewController.h"
#import "SELECT_ITEM_ViewController.h"
#import "Utility.h"
@interface Post_package_ViewController (){
    NSString *test;
    CLPlacemark * myPlacemark;
    NSMutableArray *mainarrr;
}


@end

@implementation Post_package_ViewController
@synthesize autoCompleter = _autoCompleter;
@synthesize activeTextView;


- (void)textViewDidBeginEditing:(UITextView *)textView
{
    
    if (textView.tag==5002 || textView.tag==5001) {
        
    }
    else
    {
    
    // save the text view that is being edited
    self.activeTextView = textView;
    }
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
      scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 1350);
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
    
     scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 1350);
    
    [pPickerState selectRow:0 inComponent:0 animated:YES];
}


#pragma mark - -*********************
#pragma mark Toolbar Done methods
#pragma mark - -*********************

-(void)Done
{
    
         if (tagvale==001)
        {
            if ([pickre_STR isEqualToString:@""]||[pickre_STR isEqualToString:nil] || [pickre_STR isEqual:nil] || [pickre_STR length]==0) {
                
                
                Chosse_Pick_Up_address_TF.text=[[Demo_array objectAtIndex:0]valueForKey:@"Pick_detail"];
                
                City_TXT.text=[[Demo_array objectAtIndex:0]valueForKey:@"Pick_City"];
                State_TXT.text=[[Demo_array objectAtIndex:0]valueForKey:@"Pick_State"];
                Zip_TXT.text=[[Demo_array objectAtIndex:0]valueForKey:@"Pick_Zip"];
                Busines_name_TF.text=[[Demo_array objectAtIndex:0]valueForKey:@"Pick_Address"];
                
                
                
            }
            
            
            else
            {
                Chosse_Pick_Up_address_TF.text=pickre_STR;
                
                City_TXT.text=[[Demo_array objectAtIndex:pickre_row]valueForKey:@"Pick_City"];
                State_TXT.text=[[Demo_array objectAtIndex:pickre_row]valueForKey:@"Pick_State"];
                Zip_TXT.text=[[Demo_array objectAtIndex:pickre_row]valueForKey:@"Pick_Zip"];
                Busines_name_TF.text=[[Demo_array objectAtIndex:pickre_row]valueForKey:@"Pick_Address"];
                

            }
        }

    
    
    if (tagvale==1001)
    {

    
        if ([pickre_STR isEqualToString:@""]||[pickre_STR isEqualToString:nil] || [pickre_STR isEqual:nil] || [pickre_STR length]==0) {
            
            
            Chosse_Pick_Up_address_TF_Drop.text=[[Demo_array objectAtIndex:0]valueForKey:@"Drop_detail"];
            
            
            
            City_TXT_Drop.text=[[Demo_array objectAtIndex:0]valueForKey:@"Drop_city"];
            State_TXT_Drop.text=[[Demo_array objectAtIndex:0]valueForKey:@"Drop_State"];
            Zip_TXT_Drop.text=[[Demo_array objectAtIndex:0]valueForKey:@"Drop_Zip"];
            Busines_name_TF_Drop.text=[[Demo_array objectAtIndex:0]valueForKey:@"Drop_Address"];

            
            
            
        }
        else
        {
            
            
            Chosse_Pick_Up_address_TF_Drop.text=pickre_STR;
            
            
            City_TXT_Drop.text=[[Demo_array objectAtIndex:pickre_row]valueForKey:@"Drop_city"];
            State_TXT_Drop.text=[[Demo_array objectAtIndex:pickre_row]valueForKey:@"Drop_State"];
            Zip_TXT_Drop.text=[[Demo_array objectAtIndex:pickre_row]valueForKey:@"Drop_Zip"];
            Busines_name_TF_Drop.text=[[Demo_array objectAtIndex:pickre_row]valueForKey:@"Drop_Address"];


            
        }
        
    }
    
       else
        {
            
            
         
            
          
        }
  
 scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 1350);
    [self.view endEditing:YES];
    
}
- (void) receiveTestNotification:(NSNotification *) notification
{
    Chosse_Pick_Up_address_TF.text=@"";
    Busines_name_TF.text=@"";
    Full_address_TF.text=@"";
    App_setp_TXT.text=@"";
    City_TXT.text=@"";
    State_TXT.text=@"";
    Zip_TXT.text=@"";
    other_pic_up_name.text=@"";
    Addition_info_TXT_View.text=@"";
    Chosse_Pick_Up_address_TF_Drop.text=@"";
    Busines_name_TF_Drop.text=@"";
    Full_address_TF_Drop.text=@"";
    App_setp_TXT_Drop.text=@"";
    City_TXT_Drop.text=@"";
    State_TXT_Drop.text=@"";
    Zip_TXT_Drop.text=@"";
    other_drop_down_name.text=@"";
    Addition_info_TXT_View_Drop.text=@"";
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardDidHideNotification object:nil];
    
     appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [self createInputAccessoryView];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestNotification:)
                                                 name:@"ResetClass"
                                               object:nil];
    
   
    
    Demo_array=[[NSMutableArray alloc]init];
    
    
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
    scrollview.delegate=self;
    [backGround addSubview:scrollview];
    
    
  
    
    self.navigationController.navigationBarHidden=YES;
    
    ///////////////////////////// Back Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Back_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [Back_BTN addTarget:self
                 action:@selector(Back:)
       forControlEvents:UIControlEventTouchUpInside];
    [Back_BTN setImage:[UIImage imageNamed:@"nav_button.png"] forState:UIControlStateNormal];
    Back_BTN.frame = CGRectMake(10,15,35,35);
    // Back_BTN.backgroundColor=[UIColor redColor];
    [scrollview addSubview:Back_BTN];

    
    ////////////////// Pick Up Address\\\\\\\\\\\\\\\\\\\\

    
    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    MTitle = [[UILabel alloc] init];
    MTitle.textColor = [UIColor blackColor];
    [MTitle setFrame:CGRectMake(0,10,self.view.frame.size.width, 40)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"Pick Up Address";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:MTitle];
    
    
    ///////////////////////////// First Name\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Chosse_Pick_Up_address_LB = [[UILabel alloc] init];
    Chosse_Pick_Up_address_LB.textColor = [UIColor blackColor];
    [Chosse_Pick_Up_address_LB setFrame:CGRectMake(30,MTitle.frame.origin.y+50,250, 30)];
    Chosse_Pick_Up_address_LB.backgroundColor=[UIColor clearColor];
    Chosse_Pick_Up_address_LB.textColor=[UIColor whiteColor];
    Chosse_Pick_Up_address_LB.userInteractionEnabled=NO;
    [Chosse_Pick_Up_address_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Chosse_Pick_Up_address_LB.text= @"Choose Previous Address";
    Chosse_Pick_Up_address_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Chosse_Pick_Up_address_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Chosse_Pick_Up_address_LB];
    
    //    ////////////////////////
    //
    //       [[NSUserDefaults standardUserDefaults]setValue:Cpassword_TXT.text forKey:@"pro_ConfirMpassword"];
    //    [[NSUserDefaults standardUserDefaults]setValue:Pnumber_TXT.text forKey:@"pro_MOBILE"];
    //
    /////////////////////////
    
    
    Chosse_Pick_Up_address_TF = [[UITextField alloc] initWithFrame:CGRectMake(30,Chosse_Pick_Up_address_LB.frame.origin.y+10,self.view.frame.size.width-60, 40)];
    
    Chosse_Pick_Up_address_TF.font = [UIFont systemFontOfSize:15];
    // Fname_TXT.text = @"Bhushan";
    Chosse_Pick_Up_address_TF.text=@"";
    Chosse_Pick_Up_address_TF.keyboardType = UIKeyboardTypeDefault;
   // Chosse_Pick_Up_address_TF.clearButtonMode = UITextFieldViewModeWhileEditing;
    Chosse_Pick_Up_address_TF.autocorrectionType = UITextAutocorrectionTypeNo;
    Chosse_Pick_Up_address_TF.delegate = self;
    Chosse_Pick_Up_address_TF.backgroundColor=[UIColor clearColor];
    Chosse_Pick_Up_address_TF.textColor=[UIColor whiteColor];
    [Chosse_Pick_Up_address_TF setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Chosse_Pick_Up_address_TF.tag=001;
    Chosse_Pick_Up_address_TF.inputView=pPickerState;
    [pPickerState removeFromSuperview];
    
    Chosse_Pick_Up_address_TF.inputAccessoryView=ptoolbar;
    Chosse_Pick_Up_address_TF.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Chosse_Pick_Up_address_TF setBackground:[UIImage imageNamed:@"line-1.png"]];
    
    
    
    
//    UIImageView *imgView_Fname = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 14, 7)];
//    imgView_Fname.image = [UIImage imageNamed:@"dropdown-icon-2.png"];
//    imgView_Fname.tag=001;
//    imgView_Fname.userInteractionEnabled=YES;
//    
//    UIView *paddingView_Fname = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
//    [paddingView_Fname addSubview:imgView_Fname];
//    paddingView_Fname.userInteractionEnabled=YES;
    
    
//    [Chosse_Pick_Up_address_TF setRightViewMode:UITextFieldViewModeAlways];
//    [Chosse_Pick_Up_address_TF setRightView:paddingView_Fname];
//    
//    UITapGestureRecognizer *frameTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFroms_Image:)];
//    [paddingView_Fname addGestureRecognizer:frameTapGesture];
    
    [scrollview addSubview:Chosse_Pick_Up_address_TF];
    
    
    ///////////////////////////// Last Name\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Busines_name_LB = [[UILabel alloc] init];
    Busines_name_LB.textColor = [UIColor blackColor];
    [Busines_name_LB setFrame:CGRectMake(30,Chosse_Pick_Up_address_TF.frame.origin.y+50,200, 30)];
    Busines_name_LB.backgroundColor=[UIColor clearColor];
    Busines_name_LB.textColor=[UIColor whiteColor];
    Busines_name_LB.userInteractionEnabled=NO;
    [Busines_name_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    Busines_name_LB.text= @"Enter Full Address";
    Busines_name_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Busines_name_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Busines_name_LB];
    
    
    Busines_name_TF = [[UITextField alloc] initWithFrame:CGRectMake(30, Busines_name_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    // Lname_TXT.text=@"Rana";
    Busines_name_TF.text=@"";
    Busines_name_TF.borderStyle = UITextBorderStyleNone;
    Busines_name_TF.font = [UIFont systemFontOfSize:15];
    Busines_name_TF.autocorrectionType = UITextAutocorrectionTypeNo;
    Busines_name_TF.keyboardType = UIReturnKeyDefault;
   // Busines_name_TF.clearButtonMode = UITextFieldViewModeWhileEditing;
    Busines_name_TF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Busines_name_TF.delegate = self;
    Busines_name_TF.backgroundColor=[UIColor clearColor];
    Busines_name_TF.textColor=[UIColor whiteColor];
    Busines_name_TF.tag=002;
    [Busines_name_TF setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    Busines_name_TF.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Busines_name_TF setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:Busines_name_TF];
    
    
    [Busines_name_TF addTarget:_autoCompleter action:@selector(textFieldValueChanged:) forControlEvents:UIControlEventEditingChanged];

    
    UIImageView *imgView_Busines_name = [[UIImageView alloc] initWithFrame:CGRectMake(Busines_name_TF.frame.origin.x+Busines_name_TF.frame.size.width, Busines_name_TF.frame.origin.y+17, 35, 35)];
    imgView_Busines_name.image = [UIImage imageNamed:@"locatio.png"];
    imgView_Busines_name.userInteractionEnabled=YES;
    [scrollview addSubview:imgView_Busines_name];
    
    UITapGestureRecognizer *gestureRecognizers = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFroms:)];
    [imgView_Busines_name addGestureRecognizer:gestureRecognizers];
    gestureRecognizers.cancelsTouchesInView = NO;
    

    
    ///////////////////////////// Email Id\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Full_address_LB = [[UILabel alloc] init];
    Full_address_LB.textColor = [UIColor blackColor];
    [Full_address_LB setFrame:CGRectMake(30,Busines_name_TF.frame.origin.y+50,300, 30)];
    Full_address_LB.backgroundColor=[UIColor clearColor];
    Full_address_LB.textColor=[UIColor whiteColor];
    Full_address_LB.userInteractionEnabled=NO;
    [Full_address_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Full_address_LB.text= @"Enter Business Name (if applicable)";
    Full_address_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Full_address_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Full_address_LB];
    
    
    
    
    Full_address_TF = [[UITextField alloc] initWithFrame:CGRectMake(30,Full_address_LB.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    /// email_TXT.text=@"ranabhushan87@gmail.com";
    Full_address_TF.text=@"";
    Full_address_TF.borderStyle = UITextBorderStyleNone;
    Full_address_TF.font = [UIFont systemFontOfSize:15];
    Full_address_TF.keyboardType = UIKeyboardTypeDefault;
   // Full_address_TF.clearButtonMode = UITextFieldViewModeWhileEditing;
    Full_address_TF.autocorrectionType = UITextAutocorrectionTypeNo;
    Full_address_TF.delegate = self;
    Full_address_TF.backgroundColor=[UIColor clearColor];
    Full_address_TF.textColor=[UIColor whiteColor];
    [Full_address_TF setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Full_address_TF.tag=003;
    [Full_address_TF setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    Full_address_TF.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Full_address_TF setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:Full_address_TF];
    
    
    
    /////////////////////////////Add Zip Code\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    App_setp_LB = [[UILabel alloc] init];
    App_setp_LB.textColor = [UIColor blackColor];
    [App_setp_LB setFrame:CGRectMake(30,Full_address_TF.frame.origin.y+Full_address_TF.frame.size.height+10,150, 30)];
    App_setp_LB.backgroundColor=[UIColor clearColor];
    App_setp_LB.textColor=[UIColor whiteColor];
    App_setp_LB.userInteractionEnabled=NO;
    [App_setp_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    App_setp_LB.text= @"App,Ste,Other";
    
    App_setp_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    App_setp_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:App_setp_LB];
    
    
    
    App_setp_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,App_setp_LB.frame.origin.y+10, self.view.frame.size.width-200, 40)];
    App_setp_TXT.borderStyle = UITextBorderStyleNone;
    App_setp_TXT.font = [UIFont systemFontOfSize:15];
    App_setp_TXT.keyboardType = UIKeyboardTypeDefault;
    /// Add_Zip_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    App_setp_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    App_setp_TXT.delegate = self;
    App_setp_TXT.backgroundColor=[UIColor clearColor];
    App_setp_TXT.textColor=[UIColor whiteColor];
    [App_setp_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    App_setp_TXT.tag=004;
    [App_setp_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    App_setp_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [App_setp_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [App_setp_TXT setRightViewMode:UITextFieldViewModeAlways];
    [scrollview addSubview:App_setp_TXT];
    
    
    
    
    
    
    ///////////////////////////// Add Radius  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    City_LB = [[UILabel alloc] init];
    City_LB.textColor = [UIColor blackColor];
    [City_LB setFrame:CGRectMake(170,Full_address_TF.frame.origin.y+Full_address_TF.frame.size.height+10,100, 30)];
    City_LB.backgroundColor=[UIColor clearColor];
    City_LB.textColor=[UIColor whiteColor];
    City_LB.userInteractionEnabled=NO;
        [City_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    City_LB.text= @"City";
    City_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    City_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:City_LB];
    
    
    City_TXT = [[UITextField alloc] initWithFrame:CGRectMake(170, City_LB.frame.origin.y+10, self.view.frame.size.width-200, 40)];
    City_TXT.borderStyle = UITextBorderStyleNone;
    City_TXT.font = [UIFont systemFontOfSize:15];
    City_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    City_TXT.keyboardType = UIReturnKeyDefault;
    //  Add_Radius_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
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
    
    
    
    ///////////////////////////// second Row  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    /////////////////////////////Add Zip Code\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    State_LB = [[UILabel alloc] init];
    State_LB.textColor = [UIColor blackColor];
    [State_LB setFrame:CGRectMake(30,City_TXT.frame.origin.y+City_TXT.frame.size.height+10,150, 30)];
    State_LB.backgroundColor=[UIColor clearColor];
    State_LB.textColor=[UIColor whiteColor];
    State_LB.userInteractionEnabled=NO;
    [State_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    State_LB.text= @"State";
    
    State_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    State_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:State_LB];
    
    
    
    State_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,State_LB.frame.origin.y+10, self.view.frame.size.width-200, 40)];
    State_TXT.borderStyle = UITextBorderStyleNone;
    State_TXT.font = [UIFont systemFontOfSize:15];
    State_TXT.keyboardType = UIKeyboardTypeDefault;
    // Add_Zip_TXT2.clearButtonMode = UITextFieldViewModeWhileEditing;
    State_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    State_TXT.delegate = self;
    State_TXT.backgroundColor=[UIColor clearColor];
    State_TXT.textColor=[UIColor whiteColor];
    [State_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    State_TXT.tag=006;
    [State_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    State_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [State_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [State_TXT setRightViewMode:UITextFieldViewModeAlways];
    [scrollview addSubview:State_TXT];
    
    
    ///////////////////////////// Add Radius  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Zip_LB = [[UILabel alloc] init];
    Zip_LB.textColor = [UIColor blackColor];
    [Zip_LB setFrame:CGRectMake(170,City_TXT.frame.origin.y+City_TXT.frame.size.height+10,100, 30)];
    Zip_LB.backgroundColor=[UIColor clearColor];
    Zip_LB.textColor=[UIColor whiteColor];
    Zip_LB.userInteractionEnabled=NO;
    
    [Zip_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Zip_LB.text= @"Zip";
    Zip_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Zip_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Zip_LB];
    
    
    Zip_TXT = [[UITextField alloc] initWithFrame:CGRectMake(170, Zip_LB.frame.origin.y+10, self.view.frame.size.width-200, 40)];
    Zip_TXT.borderStyle = UITextBorderStyleNone;
    Zip_TXT.font = [UIFont systemFontOfSize:15];
    Zip_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Zip_TXT.keyboardType = UIReturnKeyDefault;
    // Add_Radius_TXT2.clearButtonMode = UITextFieldViewModeWhileEditing;
    Zip_TXT.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Zip_TXT.delegate = self;
    Zip_TXT.backgroundColor=[UIColor clearColor];
    Zip_TXT.textColor=[UIColor whiteColor];
    Zip_TXT.tag=007;
    [Zip_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Zip_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Zip_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:Zip_TXT];
    [Zip_TXT setRightViewMode:UITextFieldViewModeAlways];
    
    
    /////////////////////////////  Meet_With_Pigeon  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Meet_With_Pigeon = [[UILabel alloc] init];
    Meet_With_Pigeon.textColor = [UIColor blackColor];
    [Meet_With_Pigeon setFrame:CGRectMake(30,Zip_TXT.frame.origin.y+Zip_TXT.frame.size.height+15,200, 30)];
    Meet_With_Pigeon.backgroundColor=[UIColor clearColor];
    Meet_With_Pigeon.textColor=[UIColor whiteColor];
    Meet_With_Pigeon.userInteractionEnabled=NO;
    
    [Meet_With_Pigeon setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Meet_With_Pigeon.text= @"Who will meet the pigeon?";
    Meet_With_Pigeon.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Meet_With_Pigeon.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Meet_With_Pigeon];
    
    //    ////////////////////////////  Bottom Radio Button \\\\\\\\\\\\\\\\\\\\\\\
   
    Me_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Me_BTN addTarget:self
                         action:@selector(Me_Btn_action:)
               forControlEvents:UIControlEventTouchUpInside];
    [Me_BTN setBackgroundImage:[UIImage imageNamed:@"check_radio.png"] forState:UIControlStateNormal];
    
    Me_BTN.frame = CGRectMake(30, Meet_With_Pigeon.frame.origin.y+Meet_With_Pigeon.frame.size.height+9,25, 25);
    [scrollview addSubview:Me_BTN];

    
    Me_LB = [[UILabel alloc] init];
    Me_LB.textColor = [UIColor blackColor];
    [Me_LB setFrame:CGRectMake(60,Meet_With_Pigeon.frame.origin.y+Meet_With_Pigeon.frame.size.height+12,70, 18)];
    Me_LB.backgroundColor=[UIColor clearColor];
    Me_LB.textColor=[UIColor whiteColor];
    Me_LB.userInteractionEnabled=NO;
    
    [Me_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Me_LB.text= @"Me";
    Me_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Me_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Me_LB];

    
    
    //    ////////////////////////////  Bottom Radio Button \\\\\\\\\\\\\\\\\\\\\\\
    
    Other_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Other_BTN addTarget:self
                         action:@selector(Other_Btn_Action:)
               forControlEvents:UIControlEventTouchUpInside];
    [Other_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    Other_BTN.frame = CGRectMake(110, Meet_With_Pigeon.frame.origin.y+Meet_With_Pigeon.frame.size.height+9,25, 25);
    [scrollview addSubview:Other_BTN];

    
    Other_LB = [[UILabel alloc] init];
    Other_LB.textColor = [UIColor blackColor];
    [Other_LB setFrame:CGRectMake(140,Meet_With_Pigeon.frame.origin.y+Meet_With_Pigeon.frame.size.height+12,70, 18)];
    Other_LB.backgroundColor=[UIColor clearColor];
    Other_LB.textColor=[UIColor whiteColor];
    Other_LB.userInteractionEnabled=NO;
    
    [Other_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Other_LB.text= @"Other";
    Other_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Other_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Other_LB];
    
    
    other_pic_up_LB = [[UILabel alloc] init];
    other_pic_up_LB.textColor = [UIColor blackColor];
    [other_pic_up_LB setFrame:CGRectMake(30,Other_LB.frame.origin.y+Other_LB.frame.size.height+5,200, 30)];
    other_pic_up_LB.backgroundColor=[UIColor clearColor];
    other_pic_up_LB.textColor=[UIColor whiteColor];
    other_pic_up_LB.userInteractionEnabled=NO;
    
    [other_pic_up_LB setFont:[UIFont fontWithName:@"bariol-regular" size:15.0]];
    other_pic_up_LB.text= @"Enter other name";
    other_pic_up_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    other_pic_up_LB.alpha=0.5;
    other_pic_up_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:other_pic_up_LB];

    
    
    other_pic_up_name = [[UITextField alloc] initWithFrame:CGRectMake(30, other_pic_up_LB.frame.origin.y+5, self.view.frame.size.width-215, 40)];
    other_pic_up_name.borderStyle = UITextBorderStyleNone;
    other_pic_up_name.font = [UIFont systemFontOfSize:15];
    other_pic_up_name.autocorrectionType = UITextAutocorrectionTypeNo;
    other_pic_up_name.keyboardType = UIReturnKeyDefault;
    // Add_Radius_TXT2.clearButtonMode = UITextFieldViewModeWhileEditing;
    other_pic_up_name.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    other_pic_up_name.delegate = self;
    other_pic_up_name.backgroundColor=[UIColor clearColor];
    other_pic_up_name.textColor=[UIColor whiteColor];
    other_pic_up_name.tag=1007;
    [other_pic_up_name setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    other_pic_up_name.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [other_pic_up_name setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:other_pic_up_name];
    other_pic_up_name.alpha=0.5;
    other_pic_up_name.userInteractionEnabled=NO;

    [other_pic_up_name setRightViewMode:UITextFieldViewModeAlways];



    Addition_info = [[UILabel alloc] init];
    Addition_info.textColor = [UIColor blackColor];
    [Addition_info setFrame:CGRectMake(30,other_pic_up_name.frame.origin.y+other_pic_up_name.frame.size.height+10,200, 30)];
    Addition_info.backgroundColor=[UIColor clearColor];
    Addition_info.textColor=[UIColor whiteColor];
    Addition_info.userInteractionEnabled=NO;
    
    [Addition_info setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    Addition_info.text= @"Enter any additional info";
    Addition_info.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Addition_info.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Addition_info];


    
    
    Addition_info_TXT_View = [[UITextView alloc] initWithFrame:CGRectMake(30,Addition_info.frame.origin.y+Addition_info.frame.size.height+10, self.view.frame.size.width-60, 100)];
    [Addition_info_TXT_View setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    [Addition_info_TXT_View setScrollEnabled:YES];
    Addition_info_TXT_View.tag=5001;
    Addition_info_TXT_View.autocorrectionType=NO;
    Addition_info_TXT_View.spellCheckingType=NO;
    [Addition_info_TXT_View setUserInteractionEnabled:YES];
    [Addition_info_TXT_View setBackgroundColor:[UIColor clearColor]];
    Addition_info_TXT_View.layer.cornerRadius=5;
    Addition_info_TXT_View.clipsToBounds=YES;
    Addition_info_TXT_View.layer.borderColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0].CGColor;
    Addition_info_TXT_View.layer.borderWidth=1;
    Addition_info_TXT_View.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Addition_info_TXT_View.delegate=self;
   [scrollview addSubview:Addition_info_TXT_View];
    
    
    
    
    
    ////////////////// Drop Up Address  \\\\\\\\\\\\\\\\\\\\

    
    
    ////////////////// Pick Up Address\\\\\\\\\\\\\\\\\\\\
    
    
    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    MTitle_Drop = [[UILabel alloc] init];
    MTitle_Drop.textColor = [UIColor blackColor];
    [MTitle_Drop setFrame:CGRectMake(0,Addition_info_TXT_View.frame.origin.y+Addition_info_TXT_View.frame.size.height+10,self.view.frame.size.width, 40)];
    MTitle_Drop.backgroundColor=[UIColor clearColor];
    MTitle_Drop.textColor=[UIColor whiteColor];
    MTitle_Drop.userInteractionEnabled=NO;
    [MTitle_Drop setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle_Drop.text= @"Drop Off Address";
    MTitle_Drop.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle_Drop.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:MTitle_Drop];
    
    
    ///////////////////////////// First Name\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Chosse_Pick_Up_address_LB_Drop = [[UILabel alloc] init];
    Chosse_Pick_Up_address_LB_Drop.textColor = [UIColor blackColor];
    [Chosse_Pick_Up_address_LB_Drop setFrame:CGRectMake(30,MTitle_Drop.frame.origin.y+50,250, 30)];
    Chosse_Pick_Up_address_LB_Drop.backgroundColor=[UIColor clearColor];
    Chosse_Pick_Up_address_LB_Drop.textColor=[UIColor whiteColor];
    Chosse_Pick_Up_address_LB_Drop.userInteractionEnabled=NO;
    [Chosse_Pick_Up_address_LB_Drop setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    Chosse_Pick_Up_address_LB_Drop.text= @"Choose Previous Address";
    Chosse_Pick_Up_address_LB_Drop.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Chosse_Pick_Up_address_LB_Drop.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Chosse_Pick_Up_address_LB_Drop];
    
    
    
    NSLog(@"%f",Chosse_Pick_Up_address_TF_Drop.frame.origin.y+10);
    
    
    //    ////////////////////////
    //
    //       [[NSUserDefaults standardUserDefaults]setValue:Cpassword_TXT.text forKey:@"pro_ConfirMpassword"];
    //    [[NSUserDefaults standardUserDefaults]setValue:Pnumber_TXT.text forKey:@"pro_MOBILE"];
    //
    /////////////////////////
    
    
    Chosse_Pick_Up_address_TF_Drop = [[UITextField alloc] initWithFrame:CGRectMake(30,Chosse_Pick_Up_address_LB_Drop.frame.origin.y+10,self.view.frame.size.width-60, 40)];
    
    Chosse_Pick_Up_address_TF_Drop.font = [UIFont systemFontOfSize:15];
    // Fname_TXT.text = @"Bhushan";
    Chosse_Pick_Up_address_TF_Drop.text=@"";
    Chosse_Pick_Up_address_TF_Drop.keyboardType = UIKeyboardTypeDefault;
   // Chosse_Pick_Up_address_TF_Drop.clearButtonMode = UITextFieldViewModeWhileEditing;
    Chosse_Pick_Up_address_TF_Drop.autocorrectionType = UITextAutocorrectionTypeNo;
    Chosse_Pick_Up_address_TF_Drop.delegate = self;
    Chosse_Pick_Up_address_TF_Drop.backgroundColor=[UIColor clearColor];
    Chosse_Pick_Up_address_TF_Drop.textColor=[UIColor whiteColor];
    [Chosse_Pick_Up_address_TF_Drop setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    Chosse_Pick_Up_address_TF_Drop.tag=1001;
    
    Chosse_Pick_Up_address_TF_Drop.inputView=pPickerState;
    [pPickerState removeFromSuperview];
    
    Chosse_Pick_Up_address_TF_Drop.inputAccessoryView=ptoolbar;
    Chosse_Pick_Up_address_TF_Drop.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Chosse_Pick_Up_address_TF_Drop setBackground:[UIImage imageNamed:@"line-1.png"]];
    
    
    
    
//    UIImageView *imgView_Fname_drop = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 14, 7)];
//    imgView_Fname_drop.image = [UIImage imageNamed:@"dropdown-icon-2.png"];
//    imgView_Fname_drop.tag=1001;
//    
//     imgView_Fname_drop.userInteractionEnabled=YES;
//    UIView *paddingView_Fname_drop = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
//    [paddingView_Fname_drop addSubview:imgView_Fname_drop];
//    [Chosse_Pick_Up_address_TF_Drop setRightViewMode:UITextFieldViewModeAlways];
//    [Chosse_Pick_Up_address_TF_Drop setRightView:paddingView_Fname_drop];
//    
//    
//    UITapGestureRecognizer *frameTapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFroms_Image:)];
//    [paddingView_Fname_drop addGestureRecognizer:frameTapGesture1];
    
    [scrollview addSubview:Chosse_Pick_Up_address_TF_Drop];
    
    
    ///////////////////////////// Last Name\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Busines_name_LB_Drop = [[UILabel alloc] init];
    Busines_name_LB_Drop.textColor = [UIColor blackColor];
    [Busines_name_LB_Drop setFrame:CGRectMake(30,Chosse_Pick_Up_address_TF_Drop.frame.origin.y+50,250, 30)];
    Busines_name_LB_Drop.backgroundColor=[UIColor clearColor];
    Busines_name_LB_Drop.textColor=[UIColor whiteColor];
    Busines_name_LB_Drop.userInteractionEnabled=NO;
    [Busines_name_LB_Drop setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    Busines_name_LB_Drop.text= @"Enter Full Address";
    Busines_name_LB_Drop.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Busines_name_LB_Drop.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Busines_name_LB_Drop];
    
   

    
    
    Busines_name_TF_Drop = [[UITextField alloc] initWithFrame:CGRectMake(30, Busines_name_LB_Drop.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    // Lname_TXT.text=@"Rana";
    Busines_name_TF_Drop.text=@"";
    Busines_name_TF_Drop.borderStyle = UITextBorderStyleNone;
    Busines_name_TF_Drop.font = [UIFont systemFontOfSize:15];
    Busines_name_TF_Drop.autocorrectionType = UITextAutocorrectionTypeNo;
    Busines_name_TF_Drop.keyboardType = UIReturnKeyDefault;
   // Busines_name_TF_Drop.clearButtonMode = UITextFieldViewModeWhileEditing;
    Busines_name_TF_Drop.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Busines_name_TF_Drop.delegate = self;
    Busines_name_TF_Drop.backgroundColor=[UIColor clearColor];
    Busines_name_TF_Drop.textColor=[UIColor whiteColor];
    Busines_name_TF_Drop.tag=1002;
    [Busines_name_TF_Drop setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    Busines_name_TF_Drop.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Busines_name_TF_Drop setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:Busines_name_TF_Drop];
    
    [Busines_name_TF_Drop addTarget:_autoCompleter action:@selector(textFieldValueChanged:) forControlEvents:UIControlEventEditingChanged];
    UIImageView *imgView_Lname_drop = [[UIImageView alloc] initWithFrame:CGRectMake(Busines_name_TF_Drop.frame.origin.x+Busines_name_TF_Drop.frame.size.width, Busines_name_TF_Drop.frame.origin.y+17, 35, 35)];
    imgView_Lname_drop.image = [UIImage imageNamed:@"locatio.png"];
    imgView_Lname_drop.userInteractionEnabled=YES;
    [scrollview addSubview:imgView_Lname_drop];
    
    UITapGestureRecognizer *gestureRecognizers_drop = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFroms_drop:)];
    [imgView_Lname_drop addGestureRecognizer:gestureRecognizers_drop];
    gestureRecognizers.cancelsTouchesInView = NO;
    
    ///////////////////////////// Email Id\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Full_address_LB_Drop = [[UILabel alloc] init];
    Full_address_LB_Drop.textColor = [UIColor blackColor];
    [Full_address_LB_Drop setFrame:CGRectMake(30,Busines_name_TF_Drop.frame.origin.y+50,300, 30)];
    Full_address_LB_Drop.backgroundColor=[UIColor clearColor];
    Full_address_LB_Drop.textColor=[UIColor whiteColor];
    Full_address_LB_Drop.userInteractionEnabled=NO;
    [Full_address_LB_Drop setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    Full_address_LB_Drop.text= @"Enter Business Name (if applicable)";
    Full_address_LB_Drop.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Full_address_LB_Drop.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Full_address_LB_Drop];
    
    
    
    Full_address_TF_Drop = [[UITextField alloc] initWithFrame:CGRectMake(30,Full_address_LB_Drop.frame.origin.y+10, self.view.frame.size.width-60, 40)];
    /// email_TXT.text=@"ranabhushan87@gmail.com";
    Full_address_TF_Drop.text=@"";
    Full_address_TF_Drop.borderStyle = UITextBorderStyleNone;
    Full_address_TF_Drop.font = [UIFont systemFontOfSize:15];
    Full_address_TF_Drop.keyboardType = UIKeyboardTypeDefault;
   // Full_address_TF_Drop.clearButtonMode = UITextFieldViewModeWhileEditing;
    Full_address_TF_Drop.autocorrectionType = UITextAutocorrectionTypeNo;
    Full_address_TF_Drop.delegate = self;
    Full_address_TF_Drop.backgroundColor=[UIColor clearColor];
    Full_address_TF_Drop.textColor=[UIColor whiteColor];
    [Full_address_TF_Drop setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    Full_address_TF_Drop.tag=1003;
    [Full_address_TF_Drop setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    
    Full_address_TF_Drop.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Full_address_TF_Drop setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:Full_address_TF_Drop];
    
    
    
    /////////////////////////////Add Zip Code\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    App_setp_LB_Drop = [[UILabel alloc] init];
    App_setp_LB_Drop.textColor = [UIColor blackColor];
    [App_setp_LB_Drop setFrame:CGRectMake(30,Full_address_TF_Drop.frame.origin.y+Full_address_TF_Drop.frame.size.height+10,150, 30)];
    App_setp_LB_Drop.backgroundColor=[UIColor clearColor];
    App_setp_LB_Drop.textColor=[UIColor whiteColor];
    App_setp_LB_Drop.userInteractionEnabled=NO;
    [App_setp_LB_Drop setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    App_setp_LB_Drop.text= @"App,Ste,Other";
    
    App_setp_LB_Drop.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    App_setp_LB_Drop.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:App_setp_LB_Drop];
    
    
    
    App_setp_TXT_Drop = [[UITextField alloc] initWithFrame:CGRectMake(30,App_setp_LB_Drop.frame.origin.y+10, self.view.frame.size.width-200, 40)];
    App_setp_TXT_Drop.borderStyle = UITextBorderStyleNone;
    App_setp_TXT_Drop.font = [UIFont systemFontOfSize:15];
    App_setp_TXT_Drop.keyboardType = UIKeyboardTypeDefault;
    /// Add_Zip_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    App_setp_TXT_Drop.autocorrectionType = UITextAutocorrectionTypeNo;
    App_setp_TXT_Drop.delegate = self;
    App_setp_TXT_Drop.backgroundColor=[UIColor clearColor];
    App_setp_TXT_Drop.textColor=[UIColor whiteColor];
    [App_setp_TXT_Drop setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    App_setp_TXT_Drop.tag=1004;
    [App_setp_TXT_Drop setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    
    App_setp_TXT_Drop.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [App_setp_TXT_Drop setBackground:[UIImage imageNamed:@"line-1.png"]];
    [App_setp_TXT_Drop setRightViewMode:UITextFieldViewModeAlways];
    [scrollview addSubview:App_setp_TXT_Drop];
    
    
    
    
    
    
    ///////////////////////////// Add Radius  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    City_LB_Drop = [[UILabel alloc] init];
    City_LB_Drop.textColor = [UIColor blackColor];
    [City_LB_Drop setFrame:CGRectMake(170,Full_address_TF_Drop.frame.origin.y+Full_address_TF_Drop.frame.size.height+10,100, 30)];
    City_LB_Drop.backgroundColor=[UIColor clearColor];
    City_LB_Drop.textColor=[UIColor whiteColor];
    City_LB_Drop.userInteractionEnabled=NO;
    [City_LB_Drop setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    City_LB_Drop.text= @"City";
    City_LB_Drop.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    City_LB_Drop.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:City_LB_Drop];
    
    
    City_TXT_Drop = [[UITextField alloc] initWithFrame:CGRectMake(170, City_LB_Drop.frame.origin.y+10, self.view.frame.size.width-200, 40)];
    City_TXT_Drop.borderStyle = UITextBorderStyleNone;
    City_TXT_Drop.font = [UIFont systemFontOfSize:15];
    City_TXT_Drop.autocorrectionType = UITextAutocorrectionTypeNo;
    City_TXT_Drop.keyboardType = UIReturnKeyDefault;
    //  Add_Radius_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    City_TXT_Drop.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    City_TXT_Drop.delegate = self;
    City_TXT_Drop.backgroundColor=[UIColor clearColor];
    City_TXT_Drop.textColor=[UIColor whiteColor];
    City_TXT_Drop.tag=1005;
    [City_TXT_Drop setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    City_TXT_Drop.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [City_TXT_Drop setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:City_TXT_Drop];
    [City_TXT_Drop setRightViewMode:UITextFieldViewModeAlways];
    
    
    
    ///////////////////////////// second Row  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    /////////////////////////////Add Zip Code\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    State_LB_Drop = [[UILabel alloc] init];
    State_LB_Drop.textColor = [UIColor blackColor];
    [State_LB_Drop setFrame:CGRectMake(30,City_TXT_Drop.frame.origin.y+City_TXT_Drop.frame.size.height+10,150, 30)];
    State_LB_Drop.backgroundColor=[UIColor clearColor];
    State_LB_Drop.textColor=[UIColor whiteColor];
    State_LB_Drop.userInteractionEnabled=NO;
    [State_LB_Drop setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    State_LB_Drop.text= @"State";
    
    State_LB_Drop.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    State_LB_Drop.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:State_LB_Drop];
    
    
    
    State_TXT_Drop = [[UITextField alloc] initWithFrame:CGRectMake(30,State_LB_Drop.frame.origin.y+10, self.view.frame.size.width-200, 40)];
    State_TXT_Drop.borderStyle = UITextBorderStyleNone;
    State_TXT_Drop.font = [UIFont systemFontOfSize:15];
    State_TXT_Drop.keyboardType = UIKeyboardTypeDefault;
    // Add_Zip_TXT2.clearButtonMode = UITextFieldViewModeWhileEditing;
    State_TXT_Drop.autocorrectionType = UITextAutocorrectionTypeNo;
    State_TXT_Drop.delegate = self;
    State_TXT_Drop.backgroundColor=[UIColor clearColor];
    State_TXT_Drop.textColor=[UIColor whiteColor];
    [State_TXT_Drop setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    State_TXT_Drop.tag=1006;
    [State_TXT_Drop setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    
    State_TXT_Drop.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [State_TXT_Drop setBackground:[UIImage imageNamed:@"line-1.png"]];
    [State_TXT_Drop setRightViewMode:UITextFieldViewModeAlways];
    [scrollview addSubview:State_TXT_Drop];
    
    
    ///////////////////////////// Add Radius  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Zip_LB_Drop = [[UILabel alloc] init];
    Zip_LB_Drop.textColor = [UIColor blackColor];
    [Zip_LB_Drop setFrame:CGRectMake(170,City_TXT_Drop.frame.origin.y+City_TXT_Drop.frame.size.height+10,100, 30)];
    Zip_LB_Drop.backgroundColor=[UIColor clearColor];
    Zip_LB_Drop.textColor=[UIColor whiteColor];
    Zip_LB_Drop.userInteractionEnabled=NO;
    
    [Zip_LB_Drop setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    Zip_LB_Drop.text= @"Zip";
    Zip_LB_Drop.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Zip_LB_Drop.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Zip_LB_Drop];
    
    
    Zip_TXT_Drop = [[UITextField alloc] initWithFrame:CGRectMake(170, Zip_LB_Drop.frame.origin.y+10, self.view.frame.size.width-200, 40)];
    Zip_TXT_Drop.borderStyle = UITextBorderStyleNone;
    Zip_TXT_Drop.font = [UIFont systemFontOfSize:15];
    Zip_TXT_Drop.autocorrectionType = UITextAutocorrectionTypeNo;
    Zip_TXT_Drop.keyboardType = UIReturnKeyDefault;
    // Add_Radius_TXT2.clearButtonMode = UITextFieldViewModeWhileEditing;
    Zip_TXT_Drop.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Zip_TXT_Drop.delegate = self;
    Zip_TXT_Drop.backgroundColor=[UIColor clearColor];
    Zip_TXT_Drop.textColor=[UIColor whiteColor];
    Zip_TXT_Drop.tag=1008;
    [Zip_TXT_Drop setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    Zip_TXT_Drop.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Zip_TXT_Drop setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:Zip_TXT_Drop];
    [Zip_TXT_Drop setRightViewMode:UITextFieldViewModeAlways];
    
    
    /////////////////////////////  Meet_With_Pigeon  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Meet_With_Pigeon_Drop = [[UILabel alloc] init];
    Meet_With_Pigeon_Drop.textColor = [UIColor blackColor];
    [Meet_With_Pigeon_Drop setFrame:CGRectMake(30,Zip_TXT_Drop.frame.origin.y+Zip_TXT_Drop.frame.size.height+15,200, 30)];
    Meet_With_Pigeon_Drop.backgroundColor=[UIColor clearColor];
    Meet_With_Pigeon_Drop.textColor=[UIColor whiteColor];
    Meet_With_Pigeon_Drop.userInteractionEnabled=NO;
    
    [Meet_With_Pigeon_Drop setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    Meet_With_Pigeon_Drop.text= @"Who will meet the pigeon?";
    Meet_With_Pigeon_Drop.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Meet_With_Pigeon_Drop.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Meet_With_Pigeon_Drop];
    
    //    ////////////////////////////  Bottom Radio Button \\\\\\\\\\\\\\\\\\\\\\\
    
    Me_BTN_Drop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Me_BTN_Drop addTarget:self
               action:@selector(Me_Btn_action_drop:)
     forControlEvents:UIControlEventTouchUpInside];
    [Me_BTN_Drop setBackgroundImage:[UIImage imageNamed:@"check_radio.png"] forState:UIControlStateNormal];
    
    Me_BTN_Drop.frame = CGRectMake(30, Meet_With_Pigeon_Drop.frame.origin.y+Meet_With_Pigeon_Drop.frame.size.height+9,25, 25);
    [scrollview addSubview:Me_BTN_Drop];
    
    
    Me_LB_Drop = [[UILabel alloc] init];
    Me_LB_Drop.textColor = [UIColor blackColor];
    [Me_LB_Drop setFrame:CGRectMake(60,Meet_With_Pigeon_Drop.frame.origin.y+Meet_With_Pigeon_Drop.frame.size.height+11,70, 18)];
    Me_LB_Drop.backgroundColor=[UIColor clearColor];
    Me_LB_Drop.textColor=[UIColor whiteColor];
    Me_LB_Drop.userInteractionEnabled=NO;
    
    [Me_LB_Drop setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    Me_LB_Drop.text= @"Me";
    Me_LB_Drop.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Me_LB_Drop.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Me_LB_Drop];
    
    
    
    //    ////////////////////////////  Bottom Radio Button \\\\\\\\\\\\\\\\\\\\\\\
    
    Other_BTN_Drop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Other_BTN_Drop addTarget:self
                  action:@selector(Other_Btn_Action_drop:)
        forControlEvents:UIControlEventTouchUpInside];
    [Other_BTN_Drop setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
    Other_BTN_Drop.frame = CGRectMake(110, Meet_With_Pigeon_Drop.frame.origin.y+Meet_With_Pigeon_Drop.frame.size.height+9,25, 25);
    [scrollview addSubview:Other_BTN_Drop];
    
    
    Other_LB_Drop = [[UILabel alloc] init];
    Other_LB_Drop.textColor = [UIColor blackColor];
    [Other_LB_Drop setFrame:CGRectMake(140,Meet_With_Pigeon_Drop.frame.origin.y+Meet_With_Pigeon_Drop.frame.size.height+12,70, 18)];
    Other_LB_Drop.backgroundColor=[UIColor clearColor];
    Other_LB_Drop.textColor=[UIColor whiteColor];
    Other_LB_Drop.userInteractionEnabled=NO;
    
    [Other_LB_Drop setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    Other_LB_Drop.text= @"Other";
    Other_LB_Drop.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Other_LB_Drop.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Other_LB_Drop];
    
    
    
    
    other_drop_down_LB = [[UILabel alloc] init];
    other_drop_down_LB.textColor = [UIColor blackColor];
    [other_drop_down_LB setFrame:CGRectMake(30,Other_LB_Drop.frame.origin.y+Other_LB_Drop.frame.size.height+5,200, 30)];
    other_drop_down_LB.backgroundColor=[UIColor clearColor];
    other_drop_down_LB.textColor=[UIColor whiteColor];
    other_drop_down_LB.userInteractionEnabled=NO;
    
    [other_drop_down_LB setFont:[UIFont fontWithName:@"bariol-regular" size:15]];
    other_drop_down_LB.text= @"Enter other name";
    other_drop_down_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    other_drop_down_LB.alpha=0.5;
    other_drop_down_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:other_drop_down_LB];
    
    
    
    other_drop_down_name = [[UITextField alloc] initWithFrame:CGRectMake(30, other_drop_down_LB.frame.origin.y+5, self.view.frame.size.width-215, 40)];
    other_drop_down_name.borderStyle = UITextBorderStyleNone;
    other_drop_down_name.font = [UIFont systemFontOfSize:15];
    other_drop_down_name.autocorrectionType = UITextAutocorrectionTypeNo;
    other_drop_down_name.keyboardType = UIReturnKeyDefault;
    // Add_Radius_TXT2.clearButtonMode = UITextFieldViewModeWhileEditing;
    other_drop_down_name.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    other_drop_down_name.delegate = self;
    other_drop_down_name.backgroundColor=[UIColor clearColor];
    other_drop_down_name.textColor=[UIColor whiteColor];
    other_drop_down_name.tag=1009;
    [other_drop_down_name setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    other_drop_down_name.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [other_drop_down_name setBackground:[UIImage imageNamed:@"line-1.png"]];
    [scrollview addSubview:other_drop_down_name];
    other_drop_down_name.alpha=0.5;
    other_drop_down_name.userInteractionEnabled=NO;
    
    [other_drop_down_name setRightViewMode:UITextFieldViewModeAlways];
    

    
    
    
    Addition_info_Drop_Drop = [[UILabel alloc] init];
    Addition_info_Drop_Drop.textColor = [UIColor blackColor];
    [Addition_info_Drop_Drop setFrame:CGRectMake(30,other_drop_down_name.frame.origin.y+other_drop_down_name.frame.size.height+10,200, 30)];
    Addition_info_Drop_Drop.backgroundColor=[UIColor clearColor];
    Addition_info_Drop_Drop.textColor=[UIColor whiteColor];
    Addition_info_Drop_Drop.userInteractionEnabled=NO;
    
    [Addition_info_Drop_Drop setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    Addition_info_Drop_Drop.text= @"Enter any additional info";
    Addition_info_Drop_Drop.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Addition_info_Drop_Drop.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Addition_info_Drop_Drop];
    
    
    
    
    Addition_info_TXT_View_Drop = [[UITextView alloc] initWithFrame:CGRectMake(30,Addition_info_Drop_Drop.frame.origin.y+Addition_info_Drop_Drop.frame.size.height+10, self.view.frame.size.width-60, 100)];
    [Addition_info_TXT_View_Drop setFont:[UIFont fontWithName:@"bariol-regular" size:18]];
    [Addition_info_TXT_View_Drop setScrollEnabled:YES];
    Addition_info_TXT_View_Drop.tag=5002;
    [Addition_info_TXT_View_Drop setUserInteractionEnabled:YES];
    [Addition_info_TXT_View_Drop setBackgroundColor:[UIColor clearColor]];
    Addition_info_TXT_View_Drop.layer.cornerRadius=5;
    Addition_info_TXT_View_Drop.clipsToBounds=YES;
    Addition_info_TXT_View_Drop.layer.borderColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0].CGColor;
    Addition_info_TXT_View_Drop.layer.borderWidth=1;
    Addition_info_TXT_View_Drop.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Addition_info_TXT_View_Drop.delegate=self;
        Addition_info_TXT_View_Drop.autocorrectionType=NO;
    Addition_info_TXT_View_Drop.spellCheckingType=NO;
    
    [scrollview addSubview:Addition_info_TXT_View_Drop];
    

    
    facke_view=[[UIView alloc]init];
    facke_view.frame= CGRectMake(25, Addition_info_TXT_View_Drop.frame.origin.y+120,self.view.frame.size.width-50, 60.0);
    facke_view.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:facke_view];
    
    
    
    Reset = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Reset addTarget:self
                 action:@selector(Reset_BTN:)
       forControlEvents:UIControlEventTouchUpInside];
  
    [Reset setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    [Reset setTitle:@"Start over" forState:UIControlStateNormal];
    [Reset setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Reset.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0];

    
    Reset.layer.cornerRadius=20;
    Reset.clipsToBounds = YES;
    Reset.layer.borderColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0].CGColor;

    Reset.frame = CGRectMake(0, 0,90, 40.0);
    [facke_view addSubview:Reset];
    
   
    
    Choose_size = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Choose_size addTarget:self
                 action:@selector(Choose_BTN:)
       forControlEvents:UIControlEventTouchUpInside];
    [Choose_size setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    [Choose_size setTitle:@"Choose Size of Item" forState:UIControlStateNormal];
    [Choose_size setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    
    Choose_size.layer.cornerRadius=20;
    Choose_size.clipsToBounds = YES;
    Choose_size.layer.borderColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0].CGColor;
    Choose_size.frame = CGRectMake(facke_view.frame.size.width-160,0, 160, 40.0);
      Choose_size.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0];
    [facke_view addSubview:Choose_size];

    mtableview = [[[UITableView alloc] initWithFrame:CGRectMake(50,300,100,400) style:UITableViewStylePlain] autorelease];
    mtableview.dataSource = self;
    mtableview.delegate = self;
    mtableview.hidden=YES;
    mtableview.tableFooterView = [UIView new];
    
    [scrollview addSubview:mtableview];
    
     scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 1350);

}

-(void)Back:(UIButton *)sender
{
    [self leftSideMenuButtonPressed];
    
}


-(void)viewWillAppear:(BOOL)animated
{
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate=self;
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    locationManager.distanceFilter=kCLDistanceFilterNone;
    [locationManager requestWhenInUseAuthorization];
    [locationManager startMonitoringSignificantLocationChanges];
    
    [self mActivityIndicater];
    
    [self performSelector:@selector(CalltheServer) withObject:nil afterDelay:0.5];

}


-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
//    UIAlertView *errorAlert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"There was an error retrieving your location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//    [errorAlert show];
//    NSLog(@"Error: %@",error.description);
//    
    
      [locationManager stopUpdatingLocation];
    
    [loader removeFromSuperview];
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    currentLocation = [locations objectAtIndex:0];
    [locationManager stopUpdatingLocation];
    
    
    
     
    CLGeocoder *geocoder = [[CLGeocoder alloc] init] ;
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error)
     {
         if (!(error))
         {
             
             
             
             CLPlacemark *placemark = [placemarks objectAtIndex:0];
             NSLog(@"\nCurrent Location Detected\n");
             NSLog(@"placemark %@",placemark);
            // NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
             
             
             if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Address_statues"]isEqualToString:@"Pick_up_address"]) {
                 
                 
                 City_TXT.text=[[NSString alloc]initWithString:placemark.locality];
                 State_TXT.text=[[NSString alloc]initWithString:placemark.administrativeArea];
                 Zip_TXT.text=[[NSString alloc]initWithString:placemark.postalCode];
                 Busines_name_TF.text=[[NSString alloc]initWithString:placemark.subLocality];
                 
             }
             else
             {
                 City_TXT_Drop.text=[[NSString alloc]initWithString:placemark.locality];
                 State_TXT_Drop.text=[[NSString alloc]initWithString:placemark.administrativeArea];
                 Zip_TXT_Drop.text=[[NSString alloc]initWithString:placemark.postalCode];
                 Busines_name_TF_Drop.text=[[NSString alloc]initWithString:placemark.subLocality];
             }
             
//             Current_Location_TXT.text = [[NSString alloc]initWithString:locatedAt];
//             Zipcode = [[NSString alloc]initWithString:placemark.postalCode];
////             NSLog(@"%@",Zipcode);
             
             
             
              [loader removeFromSuperview];
         }
         else
         {
             NSLog(@"Geocode failed with error %@", error);
             
              [loader removeFromSuperview];
             // Error handling must required
         }
     }];
}


- (void) handleTapFroms: (UITapGestureRecognizer *)recognizer
{
    
    [loader removeFromSuperview];
    [self mActivityIndicater];

    [[NSUserDefaults standardUserDefaults]setObject:@"Pick_up_address" forKey:@"Address_statues"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    

    
    [locationManager startUpdatingLocation];
    
}


- (void) handleTapFroms_drop: (UITapGestureRecognizer *)recognizer
{
    
    [loader removeFromSuperview];
    [self mActivityIndicater];
    
    [[NSUserDefaults standardUserDefaults]setObject:@"Drop_address" forKey:@"Address_statues"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    [locationManager startUpdatingLocation];
    
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
    
    
    
    
    
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"]]:[NSString stringWithFormat:@"%@package_address",[Utility API_link_url]]];
        
        NSLog(@"%@",responseString);
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        
        
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
           // Pick_Up_Array
        }
        
        else
        {
            
            if ([[dict valueForKey:@"message"] isEqualToString:@"Access token expired"] || [[dict valueForKey:@"message"] isEqualToString:@"Security token mismatch ,Contact admin"]) {
                
                
                alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                alert.tag=786;
                [alert show];
                
            }
            
            
          else  if ([[dict valueForKey:@"error_type"]isEqualToString:@"0"]) {
                
                alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                alert.tag=1001;
                [alert show];
                
                
            }
            else
            {

                      Chosse_Pick_Up_address_TF.userInteractionEnabled=NO;
            Chosse_Pick_Up_address_TF.alpha=0.5;
            
          
            UIColor *color = [UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
            Chosse_Pick_Up_address_TF.attributedPlaceholder =
            [[NSAttributedString alloc] initWithString:@"No Previous Address found"
                                            attributes:@{
                                                         NSForegroundColorAttributeName: color,
                                                         NSFontAttributeName : [UIFont fontWithName:@"bariol-regular" size:13.0]
                                                         }
             ];
            
            
            
            
            UIColor *colors = [UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
            Chosse_Pick_Up_address_TF_Drop.attributedPlaceholder =
            [[NSAttributedString alloc] initWithString:@"No Previous Address found"
                                            attributes:@{
                                                         NSForegroundColorAttributeName: colors,
                                                         NSFontAttributeName : [UIFont fontWithName:@"bariol-regular" size:13.0]
                                                         }
             ];
            Chosse_Pick_Up_address_TF_Drop.userInteractionEnabled=NO;
            Chosse_Pick_Up_address_TF_Drop.alpha=0.5;

            
//            if ([[dict valueForKey:@"credit_card"]isEqualToString:@"false"]) {
//                
//                alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
//                
//                [alert show];
//                
//                
//            }
//            else
//            {
                
                
//                alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[dict valueForKey:@"message"] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
//                
//                [alert show];
                
            //}
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

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alert.tag==1001 ||alert.tag==786) {
        
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

        if (buttonIndex==1) {
            
            Credit_Card__ViewController *objBilling_Information_ViewController=[[Credit_Card__ViewController alloc]init];
            [self.navigationController pushViewController:objBilling_Information_ViewController animated:YES];
            
        }
        else
        {
            
        }
        
    
    }
   

}

-(void)Reset_BTN:(UIButton *)sender
{
  Chosse_Pick_Up_address_TF.text=@"";
  Busines_name_TF.text=@"";
   Full_address_TF.text=@"";
    App_setp_TXT.text=@"";
   City_TXT.text=@"";
    State_TXT.text=@"";
    Zip_TXT.text=@"";
    other_pic_up_name.text=@"";
   Addition_info_TXT_View.text=@"";
    Chosse_Pick_Up_address_TF_Drop.text=@"";
    Busines_name_TF_Drop.text=@"";
    Full_address_TF_Drop.text=@"";
   App_setp_TXT_Drop.text=@"";
    City_TXT_Drop.text=@"";
   State_TXT_Drop.text=@"";
    Zip_TXT_Drop.text=@"";
    other_drop_down_name.text=@"";
    Addition_info_TXT_View_Drop.text=@"";
    
    
    
}
-(void)Choose_BTN:(UIButton *)sender
{
    
     mtableview.hidden=YES;
    if ([[Busines_name_TF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]  ||[[City_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[State_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Zip_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]
        
        
        
         || [[Busines_name_TF_Drop.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[City_TXT_Drop.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[State_TXT_Drop.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[Zip_TXT_Drop.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
        
        UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please fill all required fields" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alter show];
        
        
        
    }
    
    else
    {

        if (check_Who_meet_pick==true && check_Who_meet_drop==true) {
            
            
            if ([[other_pic_up_name.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ||[[other_drop_down_name.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
                
                UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please fill all required fields" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alter show];

                
            }
            
            else
            {
                [self mActivityIndicater];
                
                [self performSelector:@selector(CalltheServer_Choose) withObject:nil afterDelay:0.5];
            }
            
        }
        
       else if (check_Who_meet_pick==true && check_Who_meet_drop==false) {
            
            
            if ([[other_pic_up_name.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ) {
                
                UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please fill all required fields" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alter show];
                
                
            }
            
            else
            {
                [self mActivityIndicater];
                
                [self performSelector:@selector(CalltheServer_Choose) withObject:nil afterDelay:0.5];
            }
            
        }

       else if (check_Who_meet_pick==false && check_Who_meet_drop==true) {
           
           
           if ([[other_drop_down_name.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ) {
               
               UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please fill all required fields" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
               [alter show];
               
               
           }
           
           else
           {
               [self mActivityIndicater];
               
               [self performSelector:@selector(CalltheServer_Choose) withObject:nil afterDelay:0.5];
           }
           
       }
        
        else
        {
            [self mActivityIndicater];
            
            [self performSelector:@selector(CalltheServer_Choose) withObject:nil afterDelay:0.5];
        }
        

        
    
    
    }
    
    
    
}


#pragma mark - -*********************
#pragma mark  CalltheServer_Choose
#pragma mark - -*********************


-(void)CalltheServer_Choose
{
    
    
    
    
    
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        
        
        
        
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&source=%@&destination=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],[NSString stringWithFormat:@"%@,%@,%@,%@",Busines_name_TF.text,City_TXT.text,State_TXT.text,Zip_TXT.text],[NSString stringWithFormat:@"%@,%@,%@,%@",Busines_name_TF_Drop.text,City_TXT_Drop.text,State_TXT_Drop.text,Zip_TXT_Drop.text]]:[NSString stringWithFormat:@"%@package_price",[Utility API_link_url]]];
        
        NSLog(@"%@",responseString);
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        
        
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
        
            
            
            
            [[NSUserDefaults standardUserDefaults]setValue:[dict valueForKey:@"Admin_suggested_price"] forKey:@"Admin_suggested_price"];
             [[NSUserDefaults standardUserDefaults]setValue:[dict valueForKey:@"Total_miles"] forKey:@"Total_miles"];
             [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%.2f",[[dict valueForKey:@"Total_price"]floatValue]] forKey:@"Total_price"];
            
            [[NSUserDefaults standardUserDefaults]synchronize];
            
            
           
            
            
            [[NSUserDefaults standardUserDefaults]setValue:Busines_name_TF.text forKey:@"Busines_name_TF"];

            [[NSUserDefaults standardUserDefaults]setValue:Full_address_TF.text forKey:@"Full_address_TF"];

            [[NSUserDefaults standardUserDefaults]setValue:App_setp_TXT.text forKey:@"App_setp_TXT"];
          

            [[NSUserDefaults standardUserDefaults]setValue:City_TXT.text forKey:@"City_TXT"];

            [[NSUserDefaults standardUserDefaults]setValue:State_TXT.text forKey:@"State_TXT"];

            [[NSUserDefaults standardUserDefaults]setValue:Zip_TXT.text forKey:@"Zip_TXT"];

            [[NSUserDefaults standardUserDefaults]setValue:other_pic_up_name.text forKey:@"other_pic_up_name"];
            [[NSUserDefaults standardUserDefaults]setValue:Addition_info_TXT_View.text forKey:@"Addition_info_TXT_View"];
            
            
            
            [[NSUserDefaults standardUserDefaults]setValue:Busines_name_TF_Drop.text forKey:@"Busines_name_TF_Drop"];
            [[NSUserDefaults standardUserDefaults]setValue:Full_address_TF_Drop.text forKey:@"Full_address_TF_Drop"];

            [[NSUserDefaults standardUserDefaults]setValue:App_setp_TXT_Drop.text forKey:@"App_setp_TXT_Drop"];
            
            
            [[NSUserDefaults standardUserDefaults]setValue:City_TXT_Drop.text forKey:@"City_TXT_Drop"];
            [[NSUserDefaults standardUserDefaults]setValue:State_TXT_Drop.text forKey:@"State_TXT_Drop"];
            
            
            [[NSUserDefaults standardUserDefaults]setValue:Zip_TXT_Drop.text forKey:@"Zip_TXT_Drop"];
            
            [[NSUserDefaults standardUserDefaults]setValue:other_drop_down_name.text forKey:@"other_drop_down_name"];
            
            [[NSUserDefaults standardUserDefaults]setValue:Addition_info_TXT_View_Drop.text forKey:@"Addition_info_TXT_View_Drop"];
            
            
            [[NSUserDefaults standardUserDefaults]synchronize];
            
            
            
            [[NSUserDefaults standardUserDefaults]setValue:@"NO" forKey:@"Pigeon_posting"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            

            
            
            
              SELECT_ITEM_ViewController *objSELECT_ITEM_ViewController=[[SELECT_ITEM_ViewController alloc]init];
                [self.navigationController pushViewController:objSELECT_ITEM_ViewController animated:YES];
        }
        
        else
        {
            
            
            Chosse_Pick_Up_address_TF.userInteractionEnabled=NO;
            Chosse_Pick_Up_address_TF.alpha=0.5;
            
            
            UIColor *color = [UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
            Chosse_Pick_Up_address_TF.attributedPlaceholder =
            [[NSAttributedString alloc] initWithString:@"No Previous Address found"
                                            attributes:@{
                                                         NSForegroundColorAttributeName: color,
                                                         NSFontAttributeName : [UIFont fontWithName:@"bariol-regular" size:13.0]
                                                         }
             ];
            
            
            
            
            UIColor *colors = [UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
            Chosse_Pick_Up_address_TF_Drop.attributedPlaceholder =
            [[NSAttributedString alloc] initWithString:@"No Previous Address found"
                                            attributes:@{
                                                         NSForegroundColorAttributeName: colors,
                                                         NSFontAttributeName : [UIFont fontWithName:@"bariol-regular" size:13.0]
                                                         }
             ];
            Chosse_Pick_Up_address_TF_Drop.userInteractionEnabled=NO;
            Chosse_Pick_Up_address_TF_Drop.alpha=0.5;
            
            
            
            if ([[dict valueForKey:@"credit_card"]isEqualToString:@"false"]) {
                
                alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
                
                [alert show];
                
                
            }
            else
            {
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


-(void)Other_Btn_Action:(UIButton *)sender
{
     mtableview.hidden=YES;
    
     check_Who_meet_pick=true;
    
    

    
    other_pic_up_LB.alpha=1;
    other_pic_up_name.alpha=1;
    other_pic_up_name.userInteractionEnabled=YES;

    [Other_BTN setBackgroundImage:[UIImage imageNamed:@"check_radio.png"] forState:UIControlStateNormal];
    [Me_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    
}

-(void)Me_Btn_action:(UIButton *)sender
{
     mtableview.hidden=YES;
    check_Who_meet_pick=false;
    
    other_pic_up_LB.alpha=0.5;
    other_pic_up_name.alpha=0.5;
    other_pic_up_name.userInteractionEnabled=NO;
    other_pic_up_name.text=@"";

    [Other_BTN setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    [Me_BTN setBackgroundImage:[UIImage imageNamed:@"check_radio.png"] forState:UIControlStateNormal];
}



-(void)Other_Btn_Action_drop:(UIButton *)sender
{
     mtableview.hidden=YES;
     check_Who_meet_drop=true;
    other_drop_down_name.alpha=1;
    other_drop_down_LB.alpha=1;
    other_drop_down_name.userInteractionEnabled=YES;
    
    [Other_BTN_Drop setBackgroundImage:[UIImage imageNamed:@"check_radio.png"] forState:UIControlStateNormal];
    [Me_BTN_Drop setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];

}

-(void)Me_Btn_action_drop:(UIButton *)sender
{
     mtableview.hidden=YES;
    check_Who_meet_drop=false;
    other_drop_down_name.alpha=0.5;
    other_drop_down_LB.alpha=0.5;
    other_drop_down_name.userInteractionEnabled=NO;
    other_drop_down_name.text=@"";
    
    [Other_BTN_Drop setBackgroundImage:[UIImage imageNamed:@"uncheck_radio.png"] forState:UIControlStateNormal];
    [Me_BTN_Drop setBackgroundImage:[UIImage imageNamed:@"check_radio.png"] forState:UIControlStateNormal];
}


- (void) handleTapFroms_Image: (UITapGestureRecognizer *)recognizer
{
    
    
    UIView *view = recognizer.view; //cast pointer to the derived class if needed
    
    pickre_STR=nil;
    [pPickerState selectRow:0 inComponent:0 animated:YES];
    [pPickerState reloadAllComponents];
    //  scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 1530);
    
    tagvale=view.tag;
    
    if (view.tag==001) {
        
        
        
        [Demo_array removeAllObjects];
        [Demo_array addObjectsFromArray:[dict valueForKey:@"Pick_Address"]
         ];
        
    }
    else if (view.tag==1001)
    {
        [Demo_array removeAllObjects];
        [Demo_array addObjectsFromArray:[dict valueForKey:@"Drop_Address"]
         ];
    }

}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    pickre_STR=nil;
    [pPickerState selectRow:0 inComponent:0 animated:YES];
    [pPickerState reloadAllComponents];
    //  scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 1530);
    
    tagvale=textField.tag;
    
    if (textField.tag==001) {
        
        [Demo_array removeAllObjects];
        [Demo_array addObjectsFromArray:[dict valueForKey:@"Pick_Address"]
         ];
        
    }
   else if (textField.tag==1001)
   {
       [Demo_array removeAllObjects];
       [Demo_array addObjectsFromArray:[dict valueForKey:@"Drop_Address"]
        ];

   }
    
    else if (textField.tag==002)
    {
        check_feils=false;
    }
    else if (textField.tag==1002)
    {
        check_feils=true;
    }
    
    
    if (textField.tag==002 || textField.tag==1002) {
        
    }
    else
    {
        mtableview.hidden=YES;
    }
    
    return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
     mtableview.hidden=YES;
    
  
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [self.view endEditing:YES];
    return YES;
}

-(void)textFieldDidChange :(UITextField *)theTextField{
    NSLog( @"text changed: %@", theTextField.text);
    
    


}


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
    {
        
        if (textField.tag==002) {
            
            NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];

            [self performSelectorInBackground:@selector(CalltheServer_google_place:) withObject:newString];
            
            
            mtableview.frame=CGRectMake(Busines_name_TF.frame.origin.x, Busines_name_TF.frame.origin.y+Busines_name_TF.frame.size.height, Busines_name_TF.frame.size.width, 150);
          
            
         //  [self performSelector:@selector(CalltheServer_google_place:) withObject:newString afterDelay:0.0];
          
           
            
        }
        
        else if (textField.tag==1002)
        {
            NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
            
            [self performSelectorInBackground:@selector(CalltheServer_google_place:) withObject:newString];
            
            
            mtableview.frame=CGRectMake(Busines_name_TF_Drop.frame.origin.x, Busines_name_TF_Drop.frame.origin.y+Busines_name_TF_Drop.frame.size.height, Busines_name_TF_Drop.frame.size.width, 200);

        }
        
        return YES;
    }

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
     mtableview.hidden=YES;
}

-(void)updateTextLabelsWithText:(NSString *)string
{
   }


#pragma mark - -*********************
#pragma mark  CalltheServer_google_place
#pragma mark - -*********************


-(void)CalltheServer_google_place:(NSString *)string
{
    
    
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
      
        
        google_api = [[NSMutableDictionary alloc ]init];
        
        
        
        google_api= [API HomeScreen:[NSString stringWithFormat:@"%@%@",@"https://maps.googleapis.com/maps/api/place/autocomplete/json?key=AIzaSyAU9ShujnIg3IDQxtPr7Q1qOvFVdwNmWc4& types=@“geocode”&components=country:US&input=",string]];
        
        
        if ([[google_api valueForKey:@"predictions"]count]>=1) {
            mtableview.hidden=NO;
            dispatch_async(dispatch_get_main_queue(), ^{
                  [mtableview reloadData];
            });
    
          
            
            
         NSLog(@"%@",[[google_api valueForKey:@"predictions"]valueForKey:@"description" ]);
        
            
            
        }
        
        else
        {
            
            mtableview.hidden=YES;
           // [mtableview reloadData];

            
        }
        
        
        
    }
    
    else
    {
        
        
        
        alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Not connected to the internet" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
    
    [loader removeFromSuperview];
    
    
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[google_api valueForKey:@"predictions"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        
    }
    
    // Configure the cell...
    cell.textLabel.text = [[[google_api valueForKey:@"predictions"]valueForKey:@"description" ] objectAtIndex:indexPath.row];
    cell.textLabel.font=[UIFont fontWithName:@"bariol-regular" size:14.0];
    
    cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
    cell.textLabel.numberOfLines = 0;
    

    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
                  CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    
                [geocoder geocodeAddressString:[[[google_api valueForKey:@"predictions"]valueForKey:@"description" ]objectAtIndex:indexPath.row]completionHandler:^(NSArray *placemarks, NSError *error) {
                    //Error checking
                  
    
                    if ([placemarks count] >=1) { // one city returned. set location accordingly
                        CLPlacemark *placemark = [placemarks objectAtIndex:0];
    
                        NSDictionary *addressDictionary =
                        placemark.addressDictionary;
                        NSLog(@"%@ ", addressDictionary);
                       
                        NSString *city = [addressDictionary
                                          objectForKey:(NSString *)kABPersonAddressCityKey];
                        NSString *state = [addressDictionary
                                           objectForKey:(NSString *)kABPersonAddressStateKey];
                        NSString *zip = [addressDictionary
                                         objectForKey:(NSString *)kABPersonAddressZIPKey];
    
    
                        NSLog(@"%@ %@ %@",city, state, zip);
    
                    /// NSString   *uuid_String = [[[NSString alloc]initWithString:placemark.postalCode]retain];
    
                        if (zip == (id)[NSNull null] || zip==(id) [NSNull null] || [zip isEqualToString:@""] ||[zip length]==0 ||zip == nil || NSNull.null == (id)zip || state == (id)[NSNull null] || state==(id) [NSNull null] || [state isEqualToString:@""] ||[state length]==0 ||state == nil || NSNull.null == (id)state ||city == (id)[NSNull null] || city==(id) [NSNull null] || [city isEqualToString:@""] ||[city length]==0 ||city == nil || NSNull.null == (id)city) {
                            
                            
                            UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Address Not found" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                            [alter show];
                            
                            
                            if (check_feils==false) {
                                
                                City_TXT.text=@"";
                                State_TXT.text=@"";
                                Zip_TXT.text=@"";
                                Busines_name_TF.text=@"";
                                
                            }
                            else
                            {
                                City_TXT_Drop.text=@"";
                                State_TXT_Drop.text=@"";
                                Zip_TXT_Drop.text=@"";
                                Busines_name_TF_Drop.text=@"";
                            }
                            
                          
                            
                            mtableview.hidden=YES;
    
    
                        }
                        else
                        {
    
                            if (check_feils==false) {
                                
                                City_TXT.text=[[NSString alloc]initWithString:placemark.locality];
                                State_TXT.text=[[NSString alloc]initWithString:placemark.administrativeArea];
                                Zip_TXT.text=[[NSString alloc]initWithString:placemark.postalCode];
                                
                                
                                NSString *testss = [addressDictionary
                                                 objectForKey:(NSString *)kABPersonAddressStreetKey];
                                
                                
                                if (testss == (id)[NSNull null] || testss==(id) [NSNull null] || [testss isEqualToString:@""] ||[testss length]==0 ||testss == nil || NSNull.null == (id)testss) {
                                    
                                    
                                     Busines_name_TF.text=@"";
                                    
                                }
                                else
                                {
                                
                                Busines_name_TF.text=testss;
                                }
                                
                            }
                            else
                            {
                                
                                City_TXT_Drop.text=[[NSString alloc]initWithString:placemark.locality];
                                State_TXT_Drop.text=[[NSString alloc]initWithString:placemark.administrativeArea];
                                Zip_TXT_Drop.text=[[NSString alloc]initWithString:placemark.postalCode];
                                
                                
                                NSString *tests = [addressDictionary
                                                  objectForKey:(NSString *)kABPersonAddressStreetKey];
                                
                                
                                if (tests == (id)[NSNull null] || tests==(id) [NSNull null] || [tests isEqualToString:@""] ||[tests length]==0 ||tests == nil || NSNull.null == (id)tests) {
                                    
                                     Busines_name_TF_Drop.text=@"";
                                    
                                }
                                else
                                {
                                Busines_name_TF_Drop.text=tests;
                                }
                            }
    
                       
                            
                            
                            mtableview.hidden=YES;
                        }
                        
                                       }
                    
                }];
                
    

}



- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    
    
    
    if([text isEqualToString:@"\n"]) {
           [self.view endEditing:YES];
          scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 1350);
        scrollview.frame=CGRectMake(0, 0,[[UIScreen mainScreen]bounds].size.width,[[UIScreen mainScreen]bounds].size.height);

        return NO;
    }
    
    return YES;
}


#pragma mark -
#pragma mark - *****UIBarButtonItems*****
#pragma mark -

- (void)setupMenuBarButtonItems {
    //    self.navigationItem.rightBarButtonItem = [self rightMenuBarButtonItem];
    if(self.menuContainerViewController.menuState == MFSideMenuStateClosed &&
       ![[self.navigationController.viewControllers objectAtIndex:0] isEqual:self]) {
        self.navigationItem.leftBarButtonItem = [self backBarButtonItem];
    } else {
        self.navigationItem.leftBarButtonItem = [self leftMenuBarButtonItem];
    }
}

- (UIBarButtonItem *)leftMenuBarButtonItem {
    return [[UIBarButtonItem alloc]
            initWithImage:[UIImage imageNamed:@"menu-icon.png"] style:UIBarButtonItemStyleBordered
            target:self
            action:@selector(leftSideMenuButtonPressed:)];
}

- (UIBarButtonItem *)rightMenuBarButtonItem {
    return [[UIBarButtonItem alloc]
            initWithImage:[UIImage imageNamed:@"menu-icon.png"] style:UIBarButtonItemStyleBordered
            target:self
            action:@selector(rightSideMenuButtonPressed:)];
}

- (UIBarButtonItem *)backBarButtonItem {
    return [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back-arrow"]
                                            style:UIBarButtonItemStyleBordered
                                           target:self
                                           action:@selector(backButtonPressed:)];
}


#pragma mark -
#pragma mark - *****UIBarButtonItem Callbacks*****
#pragma mark -

- (void)backButtonPressed:(id)sender {
    
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)leftSideMenuButtonPressed {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{
        [self setupMenuBarButtonItems];
    }];
}

- (void)rightSideMenuButtonPressed:(id)sender {
    [self.menuContainerViewController toggleRightSideMenuCompletion:^{
        [self setupMenuBarButtonItems];
    }];
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
    
    pickre_row=row;
    
    
    if (tagvale==001) {
        
         return [[Demo_array objectAtIndex:row]valueForKey:@"Pick_detail"];
        
    }
    else
    {
         return [[Demo_array objectAtIndex:row]valueForKey:@"Drop_detail"];
    }
   
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
{
    
    
    if (tagvale==001) {
        
         pickre_STR=[[Demo_array objectAtIndex:row]valueForKey:@"Pick_detail"];
        
    }
    else
    {
         pickre_STR=[[Demo_array objectAtIndex:row]valueForKey:@"Drop_detail"];
    }

    
    
}

- (AutocompletionTableView *)autoCompleter
{
    if (!_autoCompleter)
    {
        NSMutableDictionary *options = [NSMutableDictionary dictionaryWithCapacity:2];
        [options setValue:[NSNumber numberWithBool:YES] forKey:ACOCaseSensitive];
        [options setValue:nil forKey:ACOUseSourceFont];
        
       _autoCompleter = [[AutocompletionTableView alloc] initWithTextField:Busines_name_TF inViewController:self withOptions:options];
        _autoCompleter.autoCompleteDelegate = self;
       _autoCompleter.suggestionsDictionary = [NSArray arrayWithObjects:@"hostel",@"caret",@"carrot",@"house",@"horse", nil];
    }
    return _autoCompleter;
}


#pragma mark - AutoCompleteTableViewDelegate

- (NSArray*) autoCompletion:(AutocompletionTableView*) completer suggestionsFor:(NSString*) string{
    // with the prodided string, build a new array with suggestions - from DB, from a service, etc.
    return [NSArray arrayWithObjects:@"hostel",@"caret",@"carrot",@"house",@"horse", nil];
}

- (void) autoCompletion:(AutocompletionTableView*) completer didSelectAutoCompleteSuggestionWithIndex:(NSInteger) index{
    // invoked when an available suggestion is selected
    NSLog(@"%@ - Suggestion chosen: %d", completer, index);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
