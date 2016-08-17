//
//  Pigeon_Posting_PIGEON_ViewController.m
//  PigeonShip
//
//  Created by Bhushan Bawa on 28/09/15.
//  Copyright © 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Pigeon_Posting_PIGEON_ViewController.h"
#import "Utility.h"
#import "MFSideMenu.h"
#import "Item_Detail_ViewController.h"
#import "Pigeon_Posting_Deatil_PIGEON_ViewController.h"
#import "Pigeon_Posting_Map_view_ViewController.h"
@interface Pigeon_Posting_PIGEON_ViewController  ()<CLLocationManagerDelegate>
{
    CLGeocoder *geocoder;
    
    
    
    
    
}
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *location;


@end

@implementation Pigeon_Posting_PIGEON_ViewController
@synthesize mapper;


-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
    
    [[NSUserDefaults standardUserDefaults]setObject:@"40.3021779" forKey:@"Latitude"];
    [[NSUserDefaults standardUserDefaults]setObject:@"-111.6564738" forKey:@"Longitude"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    [self.locationManager stopUpdatingLocation];
    

    
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
    
    CLLocationCoordinate2D coordinate = [[locations lastObject] coordinate];
    [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%f", coordinate.latitude] forKey:@"Latitude"];
    [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%f", coordinate.longitude] forKey:@"Longitude"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    
    [[NSUserDefaults standardUserDefaults]setObject:@"40.3021779" forKey:@"Latitude"];
    [[NSUserDefaults standardUserDefaults]setObject:@"-111.6564738" forKey:@"Longitude"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    
    
    [self.locationManager stopUpdatingLocation];
    
    
    
    
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




-(void)Back:(UIButton *)sender
{
    [self leftSideMenuButtonPressed];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Demo_array=[[NSMutableArray alloc]init];
    
    
    
    UIImageView *backGround=[[UIImageView alloc]init];
    backGround.image=[UIImage imageNamed:@"main_slider_bg.jpg"];
    backGround.frame=CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height);
    backGround.userInteractionEnabled=YES;
    [self.view addSubview:backGround];
    
    //------------ UIpicker view for show State list --------------//
    
    
    
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
    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    sMTitle = [[UILabel alloc] init];
    sMTitle.textColor = [UIColor blackColor];
    [sMTitle setFrame:CGRectMake(0,10,self.view.frame.size.width, 40)];
    sMTitle.backgroundColor=[UIColor clearColor];
    sMTitle.textColor=[UIColor whiteColor];
    sMTitle.userInteractionEnabled=NO;
    [sMTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    sMTitle.text= @"Pigeon Posting";
    sMTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    sMTitle.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:sMTitle];
    
    
    
    ///////////////////////////// Top View\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    TopView =[[UIView alloc]init];
    TopView.frame=CGRectMake(0, sMTitle.frame.origin.y+50, self.view.frame.size.width,50);
    TopView.backgroundColor=[UIColor colorWithRed:52.0f/255.0f green:51.0f/255.0f blue:49.0f/255.0f alpha:1.0];
    [scrollview addSubview:TopView];
    
    ///////////////////////////// Top View Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    textlable = [[UILabel alloc] init];
    textlable.textColor = [UIColor blackColor];
    [textlable setFrame:CGRectMake(20,10,250, 30)];
    textlable.backgroundColor=[UIColor clearColor];
    textlable.textColor=[UIColor whiteColor];
    textlable.userInteractionEnabled=NO;
    textlable.textAlignment=NSTextAlignmentLeft;
    
    textlable.numberOfLines=0;
    [textlable setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    textlable.text=@"Off";
    [TopView addSubview:textlable];
    
    
    
    mySwitch = [[UISwitch alloc] initWithFrame:CGRectMake(TopView.frame.size.width-71, 9.5, 0, 0)];
    mySwitch.backgroundColor = [UIColor clearColor];
    mySwitch.onTintColor = [UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    [mySwitch addTarget:self action:@selector(changeSwitch:) forControlEvents:UIControlEventValueChanged];
    [TopView addSubview:mySwitch];
    
    
    
    
    
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = 1000.0f;
    self.locationManager.delegate = self;
    self.locationManager.activityType = CLActivityTypeAutomotiveNavigation;
    
    
    
    
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8) {
        [self.locationManager requestAlwaysAuthorization];
    }
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9) {
       
    }
    [self.locationManager startUpdatingLocation];

    
    
      scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);
    
    }


-(void)viewWillAppear:(BOOL)animated
{
    
    
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Pigeon_posting_statues"]isEqualToString:@"1"])
    {
    [mySwitch setOn:YES animated:NO];
        [self Show_map_itme];
      
       }
    else
    {
        
        [mySwitch setOn:NO animated:NO];
        
        [self show_message_Middle_screen];
        
        
        
    }

}

-(void)show_message_Middle_screen
{
    
    DemoText = [[UILabel alloc] init];
    DemoText.textColor = [UIColor blackColor];
    [DemoText setFrame:CGRectMake(20,((scrollview.frame.size.height-(TopView.frame.origin.y+TopView.frame.size.height))-50)/2,scrollview.frame.size.width-40, 50)];
    DemoText.backgroundColor=[UIColor clearColor];
    DemoText.textColor=[UIColor whiteColor];
    DemoText.userInteractionEnabled=NO;
    
    DemoText.numberOfLines=0;
    [DemoText setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    
    NSMutableParagraphStyle *style  = [[NSMutableParagraphStyle alloc] init];
    style.minimumLineHeight = 25.f;
    style.maximumLineHeight = 25.f;
    NSDictionary *attributtes = @{NSParagraphStyleAttributeName : style,};
    
    DemoText.lineBreakMode = NSLineBreakByWordWrapping;
    
    DemoText.attributedText = [[NSAttributedString alloc] initWithString:@"If Pigeon decides to not use location services,a pop up should read: Are you sure? Turning off location services prevent us from matching items convenient to your route."
                                                              attributes:attributtes];
    
    DemoText.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    DemoText.textAlignment=NSTextAlignmentCenter;
    [DemoText sizeToFit];
    [TopView addSubview:DemoText];
}


-(void)Show_map_itme
{
    
    ////////////////////////////    MapView Show \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    self.mapper = [[MKMapView alloc] init];
    
    self.mapper.frame=CGRectMake(0,TopView.frame.origin.y+TopView.frame.size.height,self.view.frame.size.width, self.view.frame.size.height-TopView.frame.origin.y+TopView.frame.size.height);
    self.mapper.delegate = self;
    self.mapper.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [scrollview addSubview:self.mapper];
    
     [loader removeFromSuperview];
    [self performSelector:@selector(CalltheServer) withObject:nil afterDelay:0.5];
    [self mActivityIndicater];
    
    

}



- (void)changeSwitch:(id)sender{
    
    if([sender isOn])
        
    {
        
         [loader removeFromSuperview];
        [self performSelector:@selector(CalltheServer_Button_statues) withObject:nil afterDelay:0.5];
        [self mActivityIndicater];

        
        statues=@"true";
        
        
        
        
                    }
    
    else
        
    {
        
        
        textlable.text = @"Off";

        
        [loader removeFromSuperview];
        [self performSelector:@selector(CalltheServer_Button_statues) withObject:nil afterDelay:0.5];
        [self mActivityIndicater];

         statues=@"false";
        
        [self show_message_Middle_screen];
        
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



-(void)CalltheServer_Button_statues
{
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&status=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],statues]:[NSString stringWithFormat:@"%@updateposting",[Utility Pigeon_post_link_url]]];
        
        NSLog(@"%@",responseString);
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict2 = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        if ([[dict2 valueForKey:@"status"] isEqualToString:@"true"])
        {
            
            
            if ([statues isEqualToString:@"true"]) {
                
                if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8) {
                    [self.locationManager requestAlwaysAuthorization];
                }
                if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9) {
                }
                [self.locationManager startUpdatingLocation];
                [self Show_map_itme];
                
                
                [DemoText removeFromSuperview];
                
                
              

                
            }
            else
            {
                [self show_message_Middle_screen];
                
                [self.mapper removeFromSuperview];
                
            }
            
           
            

            }
        
        else
        {
            if ([[dict2 valueForKey:@"message"] isEqualToString:@"Access token expired"] || [[dict2 valueForKey:@"message"] isEqualToString:@"Security token mismatch ,Contact admin"]) {
                
                
                alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[dict2 valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                alert.tag=786;
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



#pragma mark - -*********************
#pragma mark  CalltheServer
#pragma mark - -*********************


-(void)CalltheServer
{
    
  
    
    
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        
//        if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fin_check"]isEqualToString:@"NO"]) {
        
            NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&lat=%@&lon=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],[[NSUserDefaults standardUserDefaults]valueForKey:@"Latitude"],[[NSUserDefaults standardUserDefaults]valueForKey:@"Longitude"]]:[NSString stringWithFormat:@"%@pigeonposting_items",[Utility Pigeon_post_link_url]]];
            
            
            
            NSLog(@"%@",responseString);
            
            
            NSDictionary *responseDict = [responseString JSONValue];
            dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
            
            
            
            
            if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
                
                
                if ([[dict valueForKey:@"accepted"]isEqualToString:@"true"]) {
                    
                    
                    Pigeon_Posting_Map_view_ViewController *objItem_Detail_ViewController=[[Pigeon_Posting_Map_view_ViewController alloc]init];
                    objItem_Detail_ViewController.Fetch_data=dict;
                    
                    [self.navigationController pushViewController:objItem_Detail_ViewController animated:YES];

                    
                }
                else
                {
                    

                
                
                
                CLLocationCoordinate2D center;
                center.latitude = [[[[dict valueForKey:@"Package Detail"]objectAtIndex:0]valueForKey:@"lat"] floatValue];
                center.longitude = [[[[dict valueForKey:@"data"]objectAtIndex:0]valueForKey:@"lng"] floatValue];
                
                MKCoordinateSpan span;
                span.latitudeDelta = 10;
                span.longitudeDelta = 10;
                
                
                MKCoordinateRegion region;
                region.center = center;
                region.span = span;
                
                
                NSLog(@"%f",region.center.longitude);
                NSLog(@"%f",region.center.longitude);
                
                [self.mapper setRegion:region animated:NO];
                
                
                for (int aa=0; aa<[[dict valueForKey:@"Package Detail"]count]; aa++) {
                    
                    
                    if ( [[[dict valueForKey:@"Package Detail"]objectAtIndex:aa]valueForKey:@"lat"] == (id)[NSNull null] ||[[[dict valueForKey:@"Package Detail"]objectAtIndex:aa]valueForKey:@"lng"] == (id)[NSNull null] )
                    {
                        
                    }
                    
                    else
                    {
                        
                        
                        if(region.center.longitude ==-180.00000000 ||region.center.latitude==-180.00000000 ){
                            
                            NSLog(@"Invalid region!");
                            
                        }else{
                            annotations = [[NSMutableArray alloc]init];
                            
                            
                            double lati = [[[[dict valueForKey:@"Package Detail"]objectAtIndex:aa]valueForKey:@"lat"] doubleValue];
                            double lngi = [[[[dict valueForKey:@"Package Detail"]objectAtIndex:aa]valueForKey:@"lng"]doubleValue];
                            
                            
                            // Create your coordinate
                            CLLocationCoordinate2D myCoordinate = { lati, lngi };
                            
                            if (aa == 0) {
                                [self.mapper setCenterCoordinate:myCoordinate animated:YES];
                            }
                            
                            //Create your annotation
                            MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
                            // Set your annotation to point at your coordinate
                            point.coordinate = myCoordinate;
                            NSString *address = [[[dict valueForKey:@"Package Detail"]objectAtIndex:aa]valueForKey:@"Destination_address"];
                            
                            point.title = [[[dict valueForKey:@"Package Detail"]objectAtIndex:aa]valueForKey:@"Destination_address"];
                            
                            point.subtitle = address;
                            
                            
                            NSString *pic_map_Detail=[[NSString stringWithFormat:@"$%@",[[[dict valueForKey:@"Package Detail"]objectAtIndex:aa]valueForKey:@"Price"]]retain];
                            
                            
                            MapViewAnnotation *annotation = [[MapViewAnnotation alloc] initWithTitle:pic_map_Detail AndCoordinate:myCoordinate annID:[[[dict valueForKey:@"Package Detail"]objectAtIndex:aa]valueForKey:@"Package_id"]];
                            [annotations addObject:annotation];
                            
                            
                            
                        }
                    }
                    
                    [self.mapper addAnnotations:annotations];
                }
                
                NSLog(@"%@",[dict valueForKey:@"Package Detail"]);
                NSLog(@"%@",[[[dict valueForKey:@"Package Detail"]objectAtIndex:0]valueForKey:@"Delivery_date"]);
                
                textlable.text = @"On";
                
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
                
                alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:@"There are no packages available right now, you will be notified if any package matches your route." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                alert.tag=80123;
                [alert show];
                
                
                textlable.text = @"All items have been accepted by Pigeons";
                
                if ([[dict valueForKey:@"error_type"]isEqualToString:@"0"]) {
                    
                    
                    
                    alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                    alert.tag=1005;
                    [alert show];
                    
                }
                else
                {
                    
                    
              
                    
                                   }
                
                
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



#pragma mark -
#pragma mark - ***** MKMAPVIEW Callbacks*****
#pragma mark -


#pragma mark -
#pragma mark MKMapViewDeletate

- (MKAnnotationView *)mapView:(MKMapView *)mapview viewForAnnotation:(id <MKAnnotation> )annotation {
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    static NSString *AnnotationIdentifier = @"AnnotationIdentifier";
    MKPinAnnotationView *annView=[[MKPinAnnotationView alloc]
                                  initWithAnnotation:annotation reuseIdentifier:AnnotationIdentifier];
    NSInteger annotationValue = [self.mapper.annotations indexOfObject:annotation];
    annView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    annView.pinColor = MKPinAnnotationColorRed;
    annView.canShowCallout = YES;
    annView.tag = annotationValue;
    return annView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    
    MapViewAnnotation *ann = view.annotation;
    
    for (int i= 0 ; i<[[dict valueForKey:@"Package Detail"]count]; i++) {
        if ([[[[dict valueForKey:@"Package Detail"]objectAtIndex:i]valueForKey:@"Package_id"] isEqualToString:ann.annotationID]) {
            
            
            NSLog(@"%@",[[[dict valueForKey:@"Package Detail"]objectAtIndex:i]valueForKey:@"Package_id"]);
            
            Pigeon_Posting_Deatil_PIGEON_ViewController *objItem_Detail_ViewController=[[Pigeon_Posting_Deatil_PIGEON_ViewController alloc]init];
            objItem_Detail_ViewController.Pack_Key=[[[dict valueForKey:@"Package Detail"]objectAtIndex:i]valueForKey:@"Package_id"];
            
            [self.navigationController pushViewController:objItem_Detail_ViewController animated:YES];
            
        }
    }
    
}

- (void)mapView:(MKMapView *)mapV didAddAnnotationViews:(NSArray *)views {
    for (MKAnnotationView *annotationView in views) {
        if (annotationView.annotation == mapV.userLocation) {
            MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.02);
            MKCoordinateRegion region = MKCoordinateRegionMake(mapV.userLocation.coordinate, span);
            [mapV setRegion:region animated:YES];
            [mapV regionThatFits:region];
            
        }
    }
}

@end
