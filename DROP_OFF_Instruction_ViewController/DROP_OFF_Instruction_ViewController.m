//
//  DROP_OFF_Instruction_ViewController.m
//  PigeonShip
//
//  Created by Bhushan Bawa on 21/06/16.
//  Copyright © 2016 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "DROP_OFF_Instruction_ViewController.h"

#import "MFSideMenu.h"

#import "AppDelegate.h"
#import "UIImageView+WebCache.h"
#import "API.h"
#import "JSON.h"
#import "Utility.h"
#import "SignatureViewController.h"
@interface DROP_OFF_Instruction_ViewController ()

@end

@implementation DROP_OFF_Instruction_ViewController

-(void)Slider_Back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

-(void)somethingHappens:(NSNotification*)notification
{
     [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(somethingHappens:) name:@"notificationName" object:nil];
    
    list_Instruction=[[NSMutableArray alloc]initWithObjects:@"",@"",@"",@"", nil];
    
    
    
    UIImageView *backGround=[[UIImageView alloc]init];
    backGround.image=[UIImage imageNamed:@"main_slider_bg.jpg"];
    backGround.frame=CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height);
    backGround.userInteractionEnabled=YES;
    [self.view addSubview:backGround];
    
    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    MTitle = [[UILabel alloc] init];
    MTitle.textColor = [UIColor blackColor];
    [MTitle setFrame:CGRectMake(0,0,self.view.frame.size.width, 64)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"Accepted items";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:MTitle];
    
    
    ///////////////////////////// Back Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Slider_Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [Slider_Button addTarget:self
                      action:@selector(Slider_Back:)
            forControlEvents:UIControlEventTouchUpInside];
    [Slider_Button setImage:[UIImage imageNamed:@"back_.png"] forState:UIControlStateNormal];
    Slider_Button.frame =CGRectMake(10,15,49,26);
    [self.view addSubview:Slider_Button];
    
    
    txtview =[[UITextView alloc]initWithFrame:CGRectMake(30, 64,self.view.frame.size.width-60, 400)];
    txtview.userInteractionEnabled=NO;
    txtview.editable=NO;
    txtview.textColor=[UIColor whiteColor];
    txtview.font=[UIFont boldSystemFontOfSize:20];
    txtview.backgroundColor=[UIColor clearColor];
    
    txtview.text = @"1. Take photo of item at delivery (not of the person) to validate it’s in the same condition as pickup.\n\n"
     "2. Get recipient’s signature.\n\n" "3. Give receiver your Pigeon card.";
    [self.view addSubview:txtview];
    
    
    
    take_Photo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [take_Photo addTarget:self
                   action:@selector(take_Photo:)
         forControlEvents:UIControlEventTouchUpInside];
    take_Photo.backgroundColor=[UIColor clearColor];
    [take_Photo setTitle:@"Take Photo" forState:UIControlStateNormal];
    [take_Photo setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    take_Photo.layer.cornerRadius=12;
    take_Photo.clipsToBounds = YES;
    [take_Photo setTitleColor:[UIColor colorWithRed:52.0f/255.0f green:51.0f/255.0f blue:49.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    take_Photo.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0];
    take_Photo.userInteractionEnabled=YES;
    take_Photo.frame = CGRectMake(30, self.view.frame.size.height-60,110, 30);
    [self.view addSubview:take_Photo];
    
    
    
    
    
    if ([_drop_photo isEqualToString:@""]) {
        
        
        [take_Photo setTitleColor:[UIColor colorWithRed:52.0f/255.0f green:51.0f/255.0f blue:49.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
        take_Photo.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0];
        take_Photo.userInteractionEnabled=YES;
        
        
        
    }
    else
    {
        take_Photo.backgroundColor=[UIColor colorWithRed:218.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1.0];
        [take_Photo setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
        take_Photo.userInteractionEnabled=NO;
        
    }

    
    
    
    
    Signature_Button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Signature_Button addTarget:self
                      action:@selector(Upload_Signature:)
            forControlEvents:UIControlEventTouchUpInside];
    Signature_Button.backgroundColor=[UIColor clearColor];
    [Signature_Button setTitle:@"Get Signature" forState:UIControlStateNormal];
    [Signature_Button setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Signature_Button.layer.cornerRadius=12;
    Signature_Button.clipsToBounds = YES;
    [Signature_Button setTitleColor:[UIColor colorWithRed:52.0f/255.0f green:51.0f/255.0f blue:49.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    Signature_Button.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0];
    Signature_Button.userInteractionEnabled=YES;
    Signature_Button.frame = CGRectMake(self.view.frame.size.width-160, self.view.frame.size.height-60,110, 30);
    [self.view addSubview:Signature_Button];
    

    
    if ([_signature isEqualToString:@""]) {
        
        
        if ([_drop_photo isEqualToString:@""]) {
            
            Signature_Button.backgroundColor=[UIColor colorWithRed:218.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1.0];
            [Signature_Button setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
            Signature_Button.userInteractionEnabled=NO;

            
        }
        else
        {
            [Signature_Button setTitleColor:[UIColor colorWithRed:52.0f/255.0f green:51.0f/255.0f blue:49.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
            Signature_Button.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0];
            Signature_Button.userInteractionEnabled=YES;
        }
        
        
       
        
        
        
    }
    else
    {
        Signature_Button.backgroundColor=[UIColor colorWithRed:218.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1.0];
        [Signature_Button setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
        Signature_Button.userInteractionEnabled=NO;
        
    }
    
    
}

-(void)take_Photo:(UIButton *)sender
{
    
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing=YES;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
    else
    {
        UIAlertView   *alert = [[UIAlertView alloc] initWithTitle:@"Message!!" message:@"Camera is not available." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok",nil];
        [alert show];
        
    }
    
    
}

-(void)Upload_Signature:(UIButton *)sender
{
    SignatureViewController *obj=[[SignatureViewController alloc]init];
    obj.Pack_Key=_Pack_Key;
    
        UINavigationController *HomeNavController =[[UINavigationController alloc]initWithRootViewController:obj];
    [self.navigationController.topViewController presentViewController:HomeNavController animated:YES completion:NULL];
    
}





#pragma mark - -*********************
#pragma mark Image Picker Controller delegate methods
#pragma mark - -*********************


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    chosenImage = info[UIImagePickerControllerEditedImage];
    [[NSUserDefaults standardUserDefaults] setObject: UIImageJPEGRepresentation(chosenImage, 0.6) forKey:@"pro_image"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    CHeck_image=true;
    
    [take_Photo setTitle:@"Retake" forState:UIControlStateNormal];
    take_Photo.frame = CGRectMake(50, self.view.frame.size.height-60,110, 30);
    
    
    Signature_Button.hidden=YES;
    
    
    
    Upload_Button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Upload_Button addTarget:self
                      action:@selector(Upload_Photo:)
            forControlEvents:UIControlEventTouchUpInside];
    Upload_Button.backgroundColor=[UIColor clearColor];
    [Upload_Button setTitle:@"Upload Photo" forState:UIControlStateNormal];
    [Upload_Button setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Upload_Button.layer.cornerRadius=12;
    Upload_Button.clipsToBounds = YES;
    [Upload_Button setTitleColor:[UIColor colorWithRed:52.0f/255.0f green:51.0f/255.0f blue:49.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    Upload_Button.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0];
    Upload_Button.userInteractionEnabled=YES;
    Upload_Button.frame = CGRectMake(self.view.frame.size.width-150, self.view.frame.size.height-60,110, 30);
    [self.view addSubview:Upload_Button];
    

    
    
    
    
    txtview.hidden=YES;
    
    
    
    
    
    Pick_Up_Photo=[[UIImageView alloc]init];
    Pick_Up_Photo.frame=CGRectMake(50, 100, self.view.frame.size.width-100,  self.view.frame.size.width-100);
    Pick_Up_Photo.image=chosenImage;
    [self.view addSubview:Pick_Up_Photo];
    
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

-(void)Upload_Photo:(UIButton *)sender
{
    [self performSelector:@selector(CalltheServer_Upload_image) withObject:nil afterDelay:0.5];
    [self mActivityIndicater];
    
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - -*********************
#pragma mark  Login _ With _ verification code
#pragma mark - -*********************


-(void)CalltheServer_Upload_image
{
    
    
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        
        NSData *imgData=UIImageJPEGRepresentation(chosenImage, 0.6);
        image_base_64 = [imgData base64Encoding];
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&package_id=%@&img_url=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],_Pack_Key,image_base_64]:[NSString stringWithFormat:@"%@drop_detail",[Utility API_link_url]]];
        NSLog(@"%@",responseString);
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            [self.navigationController popViewControllerAnimated:YES];
            
            
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




@end
