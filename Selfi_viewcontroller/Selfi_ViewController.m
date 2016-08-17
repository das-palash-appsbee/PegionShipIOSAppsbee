
#import "Selfi_ViewController.h"
#import "License_ViewController.h"

@interface Selfi_ViewController ()

@end

@implementation Selfi_ViewController


#pragma mark - -*********************
#pragma mark       viewDidLoad Mthodes
#pragma mark - -*********************



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"pro_image"];
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
    
    
    Svalues=[[NSUserDefaults standardUserDefaults] objectForKey:@"pro_image"];
    
    
    if (Svalues==nil ||  [Svalues length]==0) {
        
        Selfi_image.image = [UIImage imageNamed:@"take_selfie.png"];
        [mValide_key addObject:@""];
        
        
        
    }
    
    else
    {
        imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"pro_image"];
        chosenImage = [UIImage imageWithData:imageData];
        Selfi_image.image = chosenImage;
        [mValide_key addObject:[imageData base64EncodedStringWithOptions:0]];
        CHeck_image=true;
        
    }
    
    
    [scrollview addSubview:Selfi_image];
    Selfi_image.layer.cornerRadius=170*0.5;
    Selfi_image.layer.borderColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0].CGColor;
    Selfi_image.layer.borderWidth=5;
    Selfi_image.clipsToBounds=YES;
    Selfi_image.userInteractionEnabled=YES;
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
    
    
   UIImageView *List_image=[[UIImageView alloc]init];
    List_image.frame=CGRectMake(20, 10, 26, 20);
    List_image.image=[UIImage imageNamed:@"pic.png"];
    [Upload_BTN addSubview:List_image];

    

    
    facke_view=[[UIView alloc]init];
    facke_view.frame= CGRectMake(30, Upload_BTN.frame.origin.y+100,self.view.frame.size.width-60, 60.0);
    facke_view.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:facke_view];
    

    
    Next_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Next_BTN addTarget:self
                     action:@selector(Next:)
           forControlEvents:UIControlEventTouchUpInside];
    Next_BTN.backgroundColor=[UIColor colorWithRed:228.0f/255.0f green:183.0f/255.0f blue:44.0f/255.0f alpha:1.0];
    [Next_BTN setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    [Next_BTN setTitle:@"Next" forState:UIControlStateNormal];
    [Next_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    
    Next_BTN.layer.cornerRadius=20;
    Next_BTN.clipsToBounds = YES;
   // Next_BTN.layer.borderColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0].CGColor;
 //   Next_BTN.layer.borderWidth=1;
    Next_BTN.frame = CGRectMake(5, 0,120, 40.0);
    [facke_view addSubview:Next_BTN];
    
    
    
    Skip_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Skip_BTN addTarget:self
                         action:@selector(Skip:)
               forControlEvents:UIControlEventTouchUpInside];
    [Skip_BTN setTitleColor:[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    [Skip_BTN setTitle:@"Skip" forState:UIControlStateNormal];
    [Skip_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    Skip_BTN.layer.cornerRadius=20;
    Skip_BTN.clipsToBounds = YES;
    Skip_BTN.layer.borderWidth=1;
    Skip_BTN.layer.borderColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0].CGColor;
    Skip_BTN.frame = CGRectMake(facke_view.frame.size.width-100,0, 100, 40.0);
    [facke_view addSubview:Skip_BTN];


}

-(void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];

}


#pragma mark - -*********************
#pragma mark       back Button Mthodes
#pragma mark - -*********************


-(void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}



#pragma mark - -*********************
#pragma mark       TapGesture Mthodes for Add image
#pragma mark - -*********************


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




#pragma mark - -*********************
#pragma mark    Next And Skip Button Action
#pragma mark - -*********************


-(void)Next:(UIButton *)sender
{

    
    
    
    if (CHeck_image==true) {
        
      
[[NSUserDefaults standardUserDefaults] setObject: UIImageJPEGRepresentation(chosenImage, 0.6) forKey:@"pro_image"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
    
       
    License_ViewController *OBJLicense_ViewController=[[License_ViewController alloc]init];
    [self.navigationController pushViewController:OBJLicense_ViewController animated:YES];
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

}



@end
