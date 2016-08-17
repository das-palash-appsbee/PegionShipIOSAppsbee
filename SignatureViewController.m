
#import "SignatureViewController.h"
#import "SignatureView.h"
#import "MFSideMenu.h"

#import "AppDelegate.h"
#import "UIImageView+WebCache.h"
#import "API.h"
#import "JSON.h"
#import "Utility.h"

@interface SignatureViewController ()

@end

@implementation SignatureViewController
@synthesize Pack_Key;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.title = @"Signature View";
    
    _signatureView=[[SignatureView alloc]init];
    _signatureView.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-150);
    [self.view addSubview:_signatureView];
    
    
    [_signatureView setLineWidth:2.0];
    _signatureView.foregroundLineColor = [UIColor blackColor];
    _signatureView.backgroundLineColor = [UIColor blackColor];
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    
    
    RE_Do_Photo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [RE_Do_Photo addTarget:self
                   action:@selector(RE_Do_Photo:)
         forControlEvents:UIControlEventTouchUpInside];
    RE_Do_Photo.backgroundColor=[UIColor clearColor];
    [RE_Do_Photo setTitle:@"Re-Do" forState:UIControlStateNormal];
    [RE_Do_Photo setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    RE_Do_Photo.layer.cornerRadius=12;
    RE_Do_Photo.clipsToBounds = YES;
    [RE_Do_Photo setTitleColor:[UIColor colorWithRed:52.0f/255.0f green:51.0f/255.0f blue:49.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    RE_Do_Photo.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0];
    RE_Do_Photo.userInteractionEnabled=YES;
    RE_Do_Photo.frame = CGRectMake(10, self.view.frame.size.height-100,95, 30);
    [self.view addSubview:RE_Do_Photo];
    [RE_Do_Photo setTitleColor:[UIColor colorWithRed:52.0f/255.0f green:51.0f/255.0f blue:49.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    RE_Do_Photo.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0];
    RE_Do_Photo.userInteractionEnabled=YES;
        
        
    
    
    
    Upload_Button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Upload_Button addTarget:self
                         action:@selector(Upload_Signature:)
               forControlEvents:UIControlEventTouchUpInside];
    Upload_Button.backgroundColor=[UIColor clearColor];
    [Upload_Button setTitle:@"Upload" forState:UIControlStateNormal];
    [Upload_Button setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Upload_Button.layer.cornerRadius=12;
    Upload_Button.clipsToBounds = YES;
    [Upload_Button setTitleColor:[UIColor colorWithRed:52.0f/255.0f green:51.0f/255.0f blue:49.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    Upload_Button.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0];
    Upload_Button.userInteractionEnabled=YES;
    Upload_Button.frame = CGRectMake((self.view.frame.size.width-100)/2, self.view.frame.size.height-100,100, 30);
    [self.view addSubview:Upload_Button];
    
[Upload_Button setTitleColor:[UIColor colorWithRed:52.0f/255.0f green:51.0f/255.0f blue:49.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
Upload_Button.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0];
Upload_Button.userInteractionEnabled=YES;
    
    
    
    
    Cancel_Button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Cancel_Button addTarget:self
                      action:@selector(Cancel_Button:)
            forControlEvents:UIControlEventTouchUpInside];
    Cancel_Button.backgroundColor=[UIColor clearColor];
    [Cancel_Button setTitle:@"Cancel" forState:UIControlStateNormal];
    [Cancel_Button setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Cancel_Button.layer.cornerRadius=12;
    Cancel_Button.clipsToBounds = YES;
    [Cancel_Button setTitleColor:[UIColor colorWithRed:52.0f/255.0f green:51.0f/255.0f blue:49.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    Cancel_Button.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0];
    Cancel_Button.userInteractionEnabled=YES;
    Cancel_Button.frame = CGRectMake(self.view.frame.size.width-105, self.view.frame.size.height-100,95, 30);
    [self.view addSubview:Cancel_Button];
    
    
    
    
    [Cancel_Button setTitleColor:[UIColor colorWithRed:52.0f/255.0f green:51.0f/255.0f blue:49.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    Cancel_Button.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0];
    Cancel_Button.userInteractionEnabled=YES;
    
    
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


-(void)Cancel_Button:(UIButton *)sender
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)RE_Do_Photo:(UIButton *)sender
{
    [_signatureView clear];
    
}


-(void)Upload_Signature:(UIButton *)sender
{
    [self performSelector:@selector(CalltheServer_Upload_image) withObject:nil afterDelay:0.5];
    [self mActivityIndicater];
}


#pragma mark - -*********************
#pragma mark  Login _ With _ verification code
#pragma mark - -*********************


-(void)CalltheServer_Upload_image
{
    
    
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        
        NSData *imgData = [_signatureView signatureData];
        
      
        image_base_64 = [imgData base64Encoding];
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&package_id=%@&img_url=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],Pack_Key,image_base_64]:[NSString stringWithFormat:@"%@signature_detail",[Utility API_link_url]]];
        NSLog(@"%@",responseString);
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
             [self dismissViewControllerAnimated:YES completion:nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"notificationName" object:nil];
            
        }
        
        else
        {
            
            
            alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
            
            
        }
        
    }
    
    else
    {
        
        alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Not connected to the internet" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
    
    [loader removeFromSuperview];
    
}




@end
