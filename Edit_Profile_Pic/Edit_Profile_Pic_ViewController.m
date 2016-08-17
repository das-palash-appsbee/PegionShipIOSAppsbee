//
//  Edit_Profile_Pic_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 13/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Edit_Profile_Pic_ViewController.h"
#import "License_ViewController.h"

#import "UIImageView+WebCache.h"
#import "Utility.h"


@interface Edit_Profile_Pic_ViewController ()

@end

@implementation Edit_Profile_Pic_ViewController

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
    
    
    self.navigationController.navigationBarHidden=YES;
    
    ///////////////////////////// Back Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Back_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [Back_BTN addTarget:self
                 action:@selector(back:)
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
    MTitle.text= @"Profile Pic";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:MTitle];
    
    
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
    
    
    
    
    Selfi_image = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-170)/2, MTitle.frame.origin.y+100, 170, 170)];
    mValide_key=[[NSMutableArray alloc]init];
    [scrollview addSubview:Selfi_image];
    
    Selfi_image.layer.cornerRadius=170*0.5;
    Selfi_image.layer.borderColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0].CGColor;
    Selfi_image.layer.borderWidth=5;
    Selfi_image.clipsToBounds=YES;
    Selfi_image.userInteractionEnabled=YES;
    
    [Selfi_image sd_setImageWithURL:[NSURL URLWithString:[[NSUserDefaults standardUserDefaults] valueForKey:@"picture"]]
                   placeholderImage:[UIImage imageNamed:@"default_pic.png"]];

    
    [scrollview addSubview:Selfi_image];
    
    
    UITapGestureRecognizer *gestureRecognizers = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFroms:)];
    [Selfi_image addGestureRecognizer:gestureRecognizers];
    gestureRecognizers.cancelsTouchesInView = NO;
    
    
    Upload_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Upload_BTN addTarget:self
                   action:@selector(CHOOSE_PIC:)
         forControlEvents:UIControlEventTouchUpInside];
    Upload_BTN.backgroundColor=[UIColor colorWithRed:52.0f/255.0f green:51.0f/255.0f blue:49.0f/255.0f alpha:1.0];
    [Upload_BTN setTitle:@"Choose Picture" forState:UIControlStateNormal];
    [Upload_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    [Upload_BTN setTitleColor:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    Upload_BTN.layer.cornerRadius=20;
    Upload_BTN.clipsToBounds = YES;
    Upload_BTN.frame = CGRectMake(30, Selfi_image.frame.origin.y+200,self.view.frame.size.width-60, 40.0);
    [scrollview addSubview:Upload_BTN];
  //  picture
    
    UIImageView *List_image=[[UIImageView alloc]init];
    List_image.frame=CGRectMake(20, 10, 26, 20);
    List_image.image=[UIImage imageNamed:@"pic.png"];
    [Upload_BTN addSubview:List_image];
    
    
//    [self mActivityIndicater];
//    
//    [self performSelector:@selector(Show_CallTheServer_data) withObject:nil afterDelay:0.5];
//    
//
    
    
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
    Next_BTN.frame = CGRectMake(30, Upload_BTN.frame.origin.y+70,self.view.frame.size.width-60, 41.0);
    [scrollview addSubview:Next_BTN];

    
}

-(void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];

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

-(void)Update_CallTheServer_data
{
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        
        NSData *imgData=UIImageJPEGRepresentation(Selfi_image.image, 0.6);
        NSString *encodedString = [imgData base64Encoding];
        
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&img_url=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],encodedString]                                                            :[NSString stringWithFormat:@"%@updateprofile_pic",[Utility API_link_url]]];
        
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            [[NSUserDefaults standardUserDefaults] setObject:[dict valueForKey:@"profile_pic"] forKey:@"picture"];
            [[NSUserDefaults standardUserDefaults] synchronize];

            
            
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



-(void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) handleTapFroms: (UITapGestureRecognizer *)recognizer
{
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing=YES;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
    else
    {
        UIAlertView   *alert = [[UIAlertView alloc] initWithTitle:@"Message!!" message:@"Camera is not available , Please choose Picture from Library" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok",nil];
        [alert show];
        
    }
    
    
}

-(void)CHOOSE_PIC:(UIButton *)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing=YES;
    
    
    
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
    
    
    
    
}


#pragma mark - -*********************
#pragma mark Image Picker Controller delegate methods
#pragma mark - -*********************


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    chosenImage = info[UIImagePickerControllerEditedImage];
    [[NSUserDefaults standardUserDefaults] setObject: UIImageJPEGRepresentation(chosenImage, 0.6) forKey:@"pro_image"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    Svalues=[[NSUserDefaults standardUserDefaults] objectForKey:@"pro_image"];
    CHeck_image=true;
    
    
    Selfi_image.image=chosenImage;
    Selfi_image.layer.borderColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0].CGColor;
    Selfi_image.layer.borderWidth=5;
    Selfi_image.clipsToBounds=YES;
    
    
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

-(void)Save_Data:(UIButton *)sender
{
    if (CHeck_image==true) {
        
        
        [self mActivityIndicater];
        
        [self performSelector:@selector(Update_CallTheServer_data) withObject:nil afterDelay:0.5];
    }
    
    else
    {
        
        UIAlertView   *alert = [[UIAlertView alloc] initWithTitle:@"Message!!" message:@"Please Select profile picture image" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok",nil];
        [alert show];
    }

    
   
    
    
   }


-(void)Skip:(UIButton *)sender
{
    
    [[NSUserDefaults standardUserDefaults]setValue:@"" forKey:@"pro_image"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    License_ViewController *OBJLicense_ViewController=[[License_ViewController alloc]init];
    [self.navigationController pushViewController:OBJLicense_ViewController animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
