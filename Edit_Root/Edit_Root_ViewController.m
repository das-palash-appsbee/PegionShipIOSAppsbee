#import "Edit_Root_ViewController.h"
#import "Insurance_ViewController.h"
#import "UITextField+Shake.h"


@interface Edit_Root_ViewController ()
{
    AppDelegate *appDelegate;
}

@end

@implementation Edit_Root_ViewController

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
    Pptoolbar_card = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    Pptoolbar_card.barStyle = UIBarStyleBlackOpaque;
    UIBarButtonItem* cancel_card = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:self action:@selector(cancel_card)];
    UIBarButtonItem* flexSpace_cxard = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *done_card = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(Done_card)];
    [Pptoolbar_card setItems:[NSArray arrayWithObjects:cancel_card, flexSpace_cxard,done_card, nil] animated:NO];
}

-(void)cancel_card
{
    
}
-(void)Done_card
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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    arrayTextFields=[[NSMutableArray alloc]init];
    arrayTextFields_lable=[[NSMutableArray alloc]init];
    arrayTextFields_button=[[NSMutableArray alloc]init];
    
    
    frames_Tag_value=0;
    
    
    [self createInputAccessoryView_cardnumber];
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
    /////////////////////////// Back Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
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
    MTitle.text= @"Edit ROUTE";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:MTitle];
    
    /////////////////////////////ORIGEN _ ZIP\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    ORIGEN_ZIP_LB = [[UILabel alloc] init];
    ORIGEN_ZIP_LB.textColor = [UIColor blackColor];
    [ORIGEN_ZIP_LB setFrame:CGRectMake(30,MTitle.frame.origin.y+50,250, 30)];
    ORIGEN_ZIP_LB.backgroundColor=[UIColor clearColor];
    ORIGEN_ZIP_LB.textColor=[UIColor whiteColor];
    ORIGEN_ZIP_LB.userInteractionEnabled=NO;
    [ORIGEN_ZIP_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    ORIGEN_ZIP_LB.text= @"Origin Zip";
    ORIGEN_ZIP_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    ORIGEN_ZIP_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:ORIGEN_ZIP_LB];
    
    ORIGEN_ZIP_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,ORIGEN_ZIP_LB.frame.origin.y+10,self.view.frame.size.width-80, 40)];
    ORIGEN_ZIP_TXT.borderStyle = UITextBorderStyleNone;
    ORIGEN_ZIP_TXT.font = [UIFont systemFontOfSize:15];
    ORIGEN_ZIP_TXT.keyboardType = UIKeyboardTypeDefault;
    ORIGEN_ZIP_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    ORIGEN_ZIP_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    ORIGEN_ZIP_TXT.delegate = self;
    ORIGEN_ZIP_TXT.backgroundColor=[UIColor clearColor];
    ORIGEN_ZIP_TXT.textColor=[UIColor whiteColor];
    [ORIGEN_ZIP_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
    ORIGEN_ZIP_TXT.tag=001;
    ORIGEN_ZIP_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [ORIGEN_ZIP_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [ORIGEN_ZIP_TXT setRightViewMode:UITextFieldViewModeAlways];
    ORIGEN_ZIP_TXT.text=@"";
    [scrollview addSubview:ORIGEN_ZIP_TXT];
    
    /////////////////////////////DESTINATION _ ZIP\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    DESTINATION_ZIP_LB = [[UILabel alloc] init];
    DESTINATION_ZIP_LB.textColor = [UIColor blackColor];
    [DESTINATION_ZIP_LB setFrame:CGRectMake(30,ORIGEN_ZIP_TXT.frame.origin.y+ORIGEN_ZIP_TXT.frame.size.height+10,250, 30)];
    DESTINATION_ZIP_LB.backgroundColor=[UIColor clearColor];
    DESTINATION_ZIP_LB.textColor=[UIColor whiteColor];
    DESTINATION_ZIP_LB.userInteractionEnabled=NO;
    [DESTINATION_ZIP_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    DESTINATION_ZIP_LB.text= @"Destination Zip";
    DESTINATION_ZIP_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    DESTINATION_ZIP_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:DESTINATION_ZIP_LB];
    
    DESTINATION_ZIP_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,DESTINATION_ZIP_LB.frame.origin.y+10,self.view.frame.size.width-80, 40)];
    DESTINATION_ZIP_TXT.borderStyle = UITextBorderStyleNone;
    DESTINATION_ZIP_TXT.font = [UIFont systemFontOfSize:15];
    DESTINATION_ZIP_TXT.keyboardType = UIKeyboardTypeDefault;
    DESTINATION_ZIP_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    DESTINATION_ZIP_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    DESTINATION_ZIP_TXT.delegate = self;
    DESTINATION_ZIP_TXT.backgroundColor=[UIColor clearColor];
    DESTINATION_ZIP_TXT.textColor=[UIColor whiteColor];
    [DESTINATION_ZIP_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
    DESTINATION_ZIP_TXT.tag=002;
    DESTINATION_ZIP_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [DESTINATION_ZIP_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [DESTINATION_ZIP_TXT setRightViewMode:UITextFieldViewModeAlways];
    DESTINATION_ZIP_TXT.text=@"";
    [scrollview addSubview:DESTINATION_ZIP_TXT];
    
    /////////////////////////////Radiues_ ZIP\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Radiues_LB = [[UILabel alloc] init];
    Radiues_LB.textColor = [UIColor blackColor];
    [Radiues_LB setFrame:CGRectMake(30,DESTINATION_ZIP_TXT.frame.origin.y+ORIGEN_ZIP_TXT.frame.size.height+10,250, 30)];
    Radiues_LB.backgroundColor=[UIColor clearColor];
    Radiues_LB.textColor=[UIColor whiteColor];
    Radiues_LB.userInteractionEnabled=NO;
    [Radiues_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Radiues_LB.text= @"Radius";
    Radiues_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Radiues_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Radiues_LB];
    
    Radiues_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,Radiues_LB.frame.origin.y+10,self.view.frame.size.width-80, 40)];
    Radiues_TXT.borderStyle = UITextBorderStyleNone;
    Radiues_TXT.font = [UIFont systemFontOfSize:15];
    Radiues_TXT.keyboardType = UIKeyboardTypeDefault;
    Radiues_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Radiues_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Radiues_TXT.delegate = self;
    Radiues_TXT.text=@"";
    Radiues_TXT.backgroundColor=[UIColor clearColor];
    Radiues_TXT.textColor=[UIColor whiteColor];
    [Radiues_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
    Radiues_TXT.tag=003;
    Radiues_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Radiues_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [Radiues_TXT setRightViewMode:UITextFieldViewModeAlways];
    
    [scrollview addSubview:Radiues_TXT];
    
    
    frames_LB_X=Radiues_TXT.frame.origin.y+ORIGEN_ZIP_TXT.frame.size.height+10;
    frames_TX_X=Additional_info_LB.frame.origin.y+10,self.view.frame.size.width-80;
    
    
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
    
    
    [self mActivityIndicater];
    
    [self performSelector:@selector(Show_CallTheServer_data) withObject:nil afterDelay:0.5];
    
}

-(void)Back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)Show_CallTheServer_data
{
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"]]:[NSString stringWithFormat:@"%@viewroute",[Utility API_link_url]]];
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
     NSLog(@"%@",dict);
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            ORIGEN_ZIP_TXT.text=[[dict valueForKey:@"data"]valueForKey:@"origin_zip"];
            
            DESTINATION_ZIP_TXT.text=[[dict valueForKey:@"data"]valueForKey:@"destination_zip"];
            Radiues_TXT.text=[[dict valueForKey:@"data"]valueForKey:@"radius"];
            
            
            NSLog(@"%lu",(unsigned long)[[[dict valueForKey:@"data"]valueForKey:@"zips"]count]);
            
            
            
            for (tag_value=0; tag_value<[[[dict valueForKey:@"data"]valueForKey:@"zips"]count]; tag_value++) {
                
                
              
                /////////////////////////////DESTINATION _ ZIP\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
                
                Additional_info_LB = [[UILabel alloc] init];
                Additional_info_LB.textColor = [UIColor blackColor];
                [Additional_info_LB setFrame:CGRectMake(30,frames_LB_X,250, 30)];
                Additional_info_LB.backgroundColor=[UIColor clearColor];
                Additional_info_LB.textColor=[UIColor whiteColor];
                Additional_info_LB.userInteractionEnabled=NO;
                [Additional_info_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
                Additional_info_LB.text= @"Enter addition City(s) or Zip(s)";
                Additional_info_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
                Additional_info_LB.textAlignment=NSTextAlignmentLeft;
                Additional_info_LB.tag=tag_value;
                [scrollview addSubview:Additional_info_LB];
                
                
                Additional_info_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,Additional_info_LB.frame.origin.y+10,self.view.frame.size.width-80, 40)];
                Additional_info_TXT.borderStyle = UITextBorderStyleNone;
                Additional_info_TXT.font = [UIFont systemFontOfSize:15];
                Additional_info_TXT.keyboardType = UIKeyboardTypeDefault;
                Additional_info_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
                Additional_info_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
                Additional_info_TXT.delegate = self;
                Additional_info_TXT.backgroundColor=[UIColor clearColor];
                Additional_info_TXT.textColor=[UIColor whiteColor];
                [Additional_info_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
                Additional_info_TXT.tag=tag_value;
                Additional_info_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
                [Additional_info_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
                [Additional_info_TXT setRightViewMode:UITextFieldViewModeAlways];
                Additional_info_TXT.text=[[[[dict valueForKey:@"data"]valueForKey:@"zips"]objectAtIndex:tag_value]valueForKey:@"zip_code"];
                [scrollview addSubview:Additional_info_TXT];
                
                
                [arrayTextFields addObject:Additional_info_TXT];
                
                [arrayTextFields_lable addObject:Additional_info_LB];

                
                

                
                
                
                frames_LB=Radiues_TXT.frame.origin.y+ORIGEN_ZIP_TXT.frame.size.height+10;
                frames_TX=Additional_info_LB.frame.origin.y+10;
                
                
                
                ////////////////////////////    ADD Plues Button \\\\\\\\\\\\\\\\\\\\\\\\
                
                Sub_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                [Sub_BTN addTarget:self
                              action:@selector(Sub_track:)
                    forControlEvents:UIControlEventTouchUpInside];
                Sub_BTN.backgroundColor=[UIColor clearColor];
               // [Sub_BTN setBackgroundImage:[UIImage imageNamed:@"plus.png"] forState:UIControlStateNormal];
                [Sub_BTN setTitle:@"-" forState:UIControlStateNormal];
                [Sub_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
                [Sub_BTN setTitleColor:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
                Sub_BTN.frame = CGRectMake(Additional_info_TXT.frame.origin.x+Additional_info_TXT.frame.size.width+12, Additional_info_TXT.frame.origin.y+20,22, 22);
                Sub_BTN.tag=tag_value;
                [scrollview addSubview:Sub_BTN];
                
                
                [arrayTextFields_button addObject:Sub_BTN];
                
                
                frames_LB_X+=50;
                frames_TX_X+=50;

            }
            
            tag_value+=1;
            
                /////////////////////////////DESTINATION _ ZIP\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
            
                Additional_info_LB = [[UILabel alloc] init];
                Additional_info_LB.textColor = [UIColor blackColor];
                [Additional_info_LB setFrame:CGRectMake(30,frames_LB_X,250, 30)];
                Additional_info_LB.backgroundColor=[UIColor clearColor];
                Additional_info_LB.textColor=[UIColor whiteColor];
                Additional_info_LB.userInteractionEnabled=NO;
                [Additional_info_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
                Additional_info_LB.text= @"Enter addition City(s) or Zip(s)";
                Additional_info_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
                Additional_info_LB.textAlignment=NSTextAlignmentLeft;
                [scrollview addSubview:Additional_info_LB];
            
            
                Additional_info_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,Additional_info_LB.frame.origin.y+10,self.view.frame.size.width-80, 40)];
                Additional_info_TXT.borderStyle = UITextBorderStyleNone;
                Additional_info_TXT.font = [UIFont systemFontOfSize:15];
                Additional_info_TXT.keyboardType = UIKeyboardTypeDefault;
                Additional_info_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
                Additional_info_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
                Additional_info_TXT.delegate = self;
                Additional_info_TXT.backgroundColor=[UIColor clearColor];
                Additional_info_TXT.textColor=[UIColor whiteColor];
                [Additional_info_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
                Additional_info_TXT.tag=tag_value;
                Additional_info_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
                [Additional_info_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
                [Additional_info_TXT setRightViewMode:UITextFieldViewModeAlways];
                [scrollview addSubview:Additional_info_TXT];
            
            
                frames_LB=Radiues_TXT.frame.origin.y+ORIGEN_ZIP_TXT.frame.size.height+10;
                frames_TX=Additional_info_LB.frame.origin.y+10;
            
            
            
                ////////////////////////////    ADD Plues Button \\\\\\\\\\\\\\\\\\\\\\\\
            
                Plues_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                [Plues_BTN addTarget:self
                              action:@selector(Plues:)
                    forControlEvents:UIControlEventTouchUpInside];
                Plues_BTN.backgroundColor=[UIColor clearColor];
                [Plues_BTN setBackgroundImage:[UIImage imageNamed:@"plus.png"] forState:UIControlStateNormal];
                
                [Plues_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
                [Plues_BTN setTitleColor:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
                Plues_BTN.frame = CGRectMake(Additional_info_TXT.frame.origin.x+Additional_info_TXT.frame.size.width+12, Additional_info_TXT.frame.origin.y+20,22, 22);
                [scrollview addSubview:Plues_BTN];

            
           
            facke_view=[[UIView alloc]init];
            facke_view.frame= CGRectMake(60, Additional_info_TXT.frame.origin.y+100,self.view.frame.size.width-120, 60.0);
            facke_view.backgroundColor=[UIColor clearColor];
            [scrollview addSubview:facke_view];
            
            Next_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [Next_BTN addTarget:self
                         action:@selector(Next:)
               forControlEvents:UIControlEventTouchUpInside];
            Next_BTN.backgroundColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
            [Next_BTN setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
            [Next_BTN setTitle:@"Save" forState:UIControlStateNormal];
            [Next_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
            Next_BTN.layer.cornerRadius=20;
            Next_BTN.clipsToBounds = YES;
            Next_BTN.layer.borderColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0].CGColor;
            Next_BTN.layer.borderWidth=1;
            Next_BTN.frame = CGRectMake(60, Additional_info_TXT.frame.origin.y+100,120, 40.0);
            [scrollview addSubview:Next_BTN];
            
            
            
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


-(void)Sub_track:(UIButton *)sender
{
    
    UITextField *textField=(UITextField *)[arrayTextFields objectAtIndex:sender.tag];
    [textField removeFromSuperview]; //Remove textField
    
    UILabel *textField_lable=(UILabel *)[arrayTextFields_lable objectAtIndex:sender.tag];
    [textField_lable removeFromSuperview]; //Remove textField

    
    
    UIButton *textField_button=(UIButton *)[arrayTextFields_button objectAtIndex:sender.tag];
    [textField_button removeFromSuperview]; //Remove textField

    
    [arrayTextFields removeObjectAtIndex:sender.tag];
    [arrayTextFields_lable removeObjectAtIndex:sender.tag];
    [arrayTextFields_button removeObjectAtIndex:sender.tag];
    
    
}

-(void)Plues:(UIButton *)sender
{
      tag_value+=1;
     frames_LB_X+=50;
    frames_TX_X+=50;
    
      /////////////////////////////DESTINATION _ ZIP\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Additional_info_LB = [[UILabel alloc] init];
    Additional_info_LB.textColor = [UIColor blackColor];
    [Additional_info_LB setFrame:CGRectMake(30,frames_LB_X,250, 30)];
    Additional_info_LB.backgroundColor=[UIColor clearColor];
    Additional_info_LB.textColor=[UIColor whiteColor];
    Additional_info_LB.userInteractionEnabled=NO;
    [Additional_info_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Additional_info_LB.text= @"Enter addition City(s) or Zip(s)";
    Additional_info_LB.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    Additional_info_LB.textAlignment=NSTextAlignmentLeft;
    [scrollview addSubview:Additional_info_LB];
    
    
    Additional_info_TXT = [[UITextField alloc] initWithFrame:CGRectMake(30,Additional_info_LB.frame.origin.y+10,self.view.frame.size.width-80, 40)];
    Additional_info_TXT.borderStyle = UITextBorderStyleNone;
    Additional_info_TXT.font = [UIFont systemFontOfSize:15];
    Additional_info_TXT.keyboardType = UIKeyboardTypeDefault;
    Additional_info_TXT.clearButtonMode = UITextFieldViewModeWhileEditing;
    Additional_info_TXT.autocorrectionType = UITextAutocorrectionTypeNo;
    Additional_info_TXT.delegate = self;
    Additional_info_TXT.backgroundColor=[UIColor clearColor];
    Additional_info_TXT.textColor=[UIColor whiteColor];
    [Additional_info_TXT setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
    Additional_info_TXT.tag=frames_Tag_value;
    Additional_info_TXT.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
    [Additional_info_TXT setBackground:[UIImage imageNamed:@"line-1.png"]];
    [Additional_info_TXT setRightViewMode:UITextFieldViewModeAlways];
    [scrollview addSubview:Additional_info_TXT];
    
    Next_BTN.frame = CGRectMake(60,frames_LB_X+100,120, 40.0);
    
    
    NSLog(@"%f",facke_view.frame.origin.y);
    
    NSLog(@"%ld",frames_LB+150);
    
    Plues_BTN.frame = CGRectMake(Additional_info_TXT.frame.origin.x+Additional_info_TXT.frame.size.width+12, Additional_info_TXT.frame.origin.y+20,22, 22);
    
    if (facke_view.frame.origin.y>=500) {
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, frames_LB_X+150);
    }
    
}
-(void)Next:(UIButton *)sender
{
    
    arrr=[[NSMutableArray alloc]init];
    
    
    if ([[ORIGEN_ZIP_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[DESTINATION_ZIP_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
        
        if ([[ORIGEN_ZIP_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
            
            
            
            [ORIGEN_ZIP_TXT shake:10
                        withDelta:5.0
                         andSpeed:0.04
                   shakeDirection:ShakeDirectionHorizontal];
            
        }
        
        if ([[DESTINATION_ZIP_TXT.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
            
            
            
            [DESTINATION_ZIP_TXT shake:10
                             withDelta:5.0
                              andSpeed:0.04
                        shakeDirection:ShakeDirectionHorizontal];
        }
        
    }
    
    
    else
    {
        for (int sss=1001; sss<=frames_Tag_value; sss++) {
            
            
            UITextField *myTextField = (UITextField *)[self.view viewWithTag:sss];
            
            
            NSLog(@"%@",myTextField.text);
            
            
            if(![myTextField.text isEqualToString:@""])
            {
                NSMutableDictionary *vale1=[[NSMutableDictionary alloc]init];
                [vale1 setValue:myTextField.text forKey:@"zip_code"];
                [arrr addObject:vale1];
            }
            
            
        }
        
        NSMutableDictionary *all_data=[[NSMutableDictionary alloc]init];
        
        [all_data setValue:ORIGEN_ZIP_TXT.text forKey:@"origin_zip"];
        [all_data setValue:DESTINATION_ZIP_TXT.text forKey:@"destination_zip"];
        [all_data setValue:Radiues_TXT.text forKey:@"radius"];
        if(!arrr.count==0)
        {
            [all_data setValue:arrr forKey:@"zips"];
        }
        
        [[NSUserDefaults standardUserDefaults]setValue:all_data forKey:@"Add_route"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        NSLog(@"%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"Add_route"]);
        
        
        Insurance_ViewController *objInsurance_ViewController=[[Insurance_ViewController alloc]init];
        [self.navigationController pushViewController:objInsurance_ViewController animated:YES];
    }
    
    
}
-(void)Skip:(UIButton *)sender
{
     [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"Add_route"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    Insurance_ViewController *objInsurance_ViewController=[[Insurance_ViewController alloc]init];
    [self.navigationController pushViewController:objInsurance_ViewController animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    
    
    return YES;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
