//
//  Pigeon_Posting_Map_view_ViewController.m
//  PigeonShip
//
//  Created by Bhushan Bawa on 15/10/15.
//  Copyright © 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//
#import "UIImageView+WebCache.h"
#import "Pigeon_Posting_Map_view_ViewController.h"
#import "MFSideMenu.h"
#import "Utility.h"

@interface Pigeon_Posting_Map_view_ViewController ()

@end

@implementation Pigeon_Posting_Map_view_ViewController
@synthesize mapper;
@synthesize routeLine;
@synthesize routeLineView;
@synthesize Fetch_data;
@synthesize Pack_Key;

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
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

-(void)viewDidDisappear:(BOOL)animated {
    [timer invalidate];
     timer = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",Fetch_data);
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
    
    ///////////////////////////// Back Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Back_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [Back_BTN addTarget:self
                 action:@selector(Back:)
       forControlEvents:UIControlEventTouchUpInside];
    [Back_BTN setImage:[UIImage imageNamed:@"back_.png"] forState:UIControlStateNormal];
    
    
    Back_BTN.frame = CGRectMake(10,10,49,26);
    [scrollview addSubview:Back_BTN];

    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    sMTitle = [[UILabel alloc] init];
    sMTitle.textColor = [UIColor blackColor];
    [sMTitle setFrame:CGRectMake(0,10,self.view.frame.size.width, 40)];
    sMTitle.backgroundColor=[UIColor clearColor];
    sMTitle.textColor=[UIColor whiteColor];
    sMTitle.userInteractionEnabled=NO;
    [sMTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    sMTitle.text= @"Item Tracking";
    sMTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    sMTitle.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:sMTitle];
    
    
    
    ///////////////////////////// Top View\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    TopView =[[UIView alloc]init];
    TopView.frame=CGRectMake(0, 60, self.view.frame.size.width,120);
    TopView.backgroundColor=[UIColor colorWithRed:181.0f/255.0f green:181.0f/255.0f blue:181.0f/255.0f alpha:0.8];
    [scrollview addSubview:TopView];
    
    
    ///////////////////////////// Top View Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Pick_addresslable = [[UILabel alloc] init];
    Pick_addresslable.textColor = [UIColor blackColor];
    [Pick_addresslable setFrame:CGRectMake(20,5,TopView.frame.size.width-40, 20)];
    Pick_addresslable.backgroundColor=[UIColor clearColor];
    Pick_addresslable.textColor=[UIColor darkGrayColor];
    Pick_addresslable.userInteractionEnabled=NO;
    Pick_addresslable.textAlignment=NSTextAlignmentLeft;
    [Pick_addresslable setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Pick_addresslable.text=@"Pickup Address";
    [TopView addSubview:Pick_addresslable];
    
    
    Addresslable = [[UILabel alloc] init];
    Addresslable.textColor = [UIColor blackColor];
    [Addresslable setFrame:CGRectMake(20,Pick_addresslable.frame.origin.y+Pick_addresslable.frame.size.height,TopView.frame.size.width-40, 30)];
    Addresslable.backgroundColor=[UIColor clearColor];
    Addresslable.textColor=[UIColor whiteColor];
    Addresslable.userInteractionEnabled=NO;
    Addresslable.textAlignment=NSTextAlignmentLeft;
    [Addresslable setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Addresslable.text=[Fetch_data valueForKey:@"Package_Pickaddress"];
    [TopView addSubview:Addresslable];
    
    
    
    
    // Time label bottom border
    CALayer *TimebottomBorder = [CALayer layer];
    TimebottomBorder.frame = CGRectMake(0, Addresslable.frame.origin.y+Addresslable.frame.size.height+5, self.view.frame.size.width, 1.5f);
    TimebottomBorder.backgroundColor = [UIColor darkGrayColor].CGColor;
    [TopView.layer addSublayer:TimebottomBorder];

    
    
    
    
    ////////////////////////////  DROP_OFF_Address Screen \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    DROP_OFF_addresslable = [[UILabel alloc] init];
    DROP_OFF_addresslable.textColor = [UIColor blackColor];
    [DROP_OFF_addresslable setFrame:CGRectMake(20,TimebottomBorder.frame.origin.y+TimebottomBorder.frame.size.height+5,TopView.frame.size.width-40, 20)];
    DROP_OFF_addresslable.backgroundColor=[UIColor clearColor];
    DROP_OFF_addresslable.textColor=[UIColor darkGrayColor];
    DROP_OFF_addresslable.userInteractionEnabled=NO;
    DROP_OFF_addresslable.textAlignment=NSTextAlignmentLeft;
    [DROP_OFF_addresslable setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    DROP_OFF_addresslable.text=@"Delivery Address";
    [TopView addSubview:DROP_OFF_addresslable];
    
    
    DROP_OFFlable = [[UILabel alloc] init];
    DROP_OFFlable.textColor = [UIColor blackColor];
    [DROP_OFFlable setFrame:CGRectMake(20,DROP_OFF_addresslable.frame.origin.y+DROP_OFF_addresslable.frame.size.height,TopView.frame.size.width-40, 30)];
    DROP_OFFlable.backgroundColor=[UIColor clearColor];
    DROP_OFFlable.textColor=[UIColor whiteColor];
    DROP_OFFlable.userInteractionEnabled=NO;
    DROP_OFFlable.textAlignment=NSTextAlignmentLeft;
    [DROP_OFFlable setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    DROP_OFFlable.text=[Fetch_data valueForKey:@"Package_Dropaddress"];
    [TopView addSubview:DROP_OFFlable];

    
       
    ////////////////////////////    MapView Show \\\\\\\\\\\\\\\\\\\\\\\\
    
    
   
    
    
    ///////////////////////////// Top View\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Bottom_view =[[UIView alloc]init];
    Bottom_view.frame=CGRectMake(0, self.view.frame.size.height-100, self.view.frame.size.width,100);
    Bottom_view.backgroundColor=[UIColor colorWithRed:56/255.0f green:56.0f/255.0f blue:56.0f/255.0f alpha:1.0];
    [scrollview addSubview:Bottom_view];
    
    
    Nmae_LB = [[UILabel alloc] init];
    Nmae_LB.textColor = [UIColor blackColor];
    [Nmae_LB setFrame:CGRectMake(20,30,150, 40)];
    Nmae_LB.backgroundColor=[UIColor clearColor];
    Nmae_LB.textColor=[UIColor whiteColor];
    Nmae_LB.userInteractionEnabled=NO;
    Nmae_LB.textAlignment=NSTextAlignmentLeft;
    Nmae_LB.numberOfLines=0;
    [Nmae_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Nmae_LB.text=[Fetch_data valueForKey:@"Package_Acceptedby"];
    [Nmae_LB sizeToFit];
    [Bottom_view addSubview:Nmae_LB];
    
    
    
    
    

    
    Phone_Number_LB = [[UILabel alloc] init];
    Phone_Number_LB.textColor = [UIColor blackColor];
    [Phone_Number_LB setFrame:CGRectMake(Bottom_view.frame.size.width-160,30,150, 20)];
    Phone_Number_LB.backgroundColor=[UIColor clearColor];
    Phone_Number_LB.textColor=[UIColor whiteColor];
    Phone_Number_LB.userInteractionEnabled=NO;
    Phone_Number_LB.textAlignment=NSTextAlignmentRight;
    Phone_Number_LB.numberOfLines=0;
    [Phone_Number_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    Phone_Number_LB.text=[Fetch_data valueForKey:@"pigeon_mobile"];
    [Bottom_view addSubview:Phone_Number_LB];
    
    
    
    
    ///////////////////////////// profile Pic\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    user_image = [[UIImageView alloc] initWithFrame:CGRectMake(Phone_Number_LB.frame.origin.x-40, 15, 50, 50)];
    user_image.layer.cornerRadius=50*0.5;
    user_image.layer.borderColor=[UIColor whiteColor].CGColor;
    user_image.layer.borderWidth=1;
    user_image.clipsToBounds=YES;
    
    [user_image sd_setImageWithURL:[NSURL URLWithString:[Fetch_data valueForKey:@"pigeon_image"]]
                  placeholderImage:[UIImage imageNamed:@"default_pic.png"]];
    
    [Bottom_view addSubview:user_image];
    
    
    
    
    self.mapper = [[MKMapView alloc] init];
    
    self.mapper.frame=CGRectMake(0,TopView.frame.origin.y+TopView.frame.size.height,self.view.frame.size.width,Bottom_view.frame.origin.y-(TopView.frame.origin.y+TopView.frame.size.height));
    self.mapper.delegate = self;
    self.mapper.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [scrollview addSubview:self.mapper];
    
    CLLocationCoordinate2D coordinateArray[2];
    coordinateArray[0] = CLLocationCoordinate2DMake([[Fetch_data valueForKey:@"drop_lat"]floatValue],[[Fetch_data valueForKey:@"drop_lon"]floatValue]);
    coordinateArray[1] = CLLocationCoordinate2DMake([[Fetch_data valueForKey:@"pick_lat"]floatValue], [[Fetch_data valueForKey:@"pick_lon"]floatValue]);
    
    self.routeLine = [MKPolyline polylineWithCoordinates:coordinateArray count:2];
    [self.mapper setVisibleMapRect:[self.routeLine boundingMapRect]]; //If you want the route to be visible
    
    [self.mapper addOverlay:self.routeLine];
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Background work
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (timer == nil) {
                
                [timer invalidate];
                timer = nil;
                
                timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(timerCalled:) userInfo:nil repeats:YES];
                
            }
            
            
            
        });
    });



    
}


- (void)drawLine {
    
    
    //initialize your map view and add it to your view hierarchy - **set its delegate to self***
    CLLocationCoordinate2D coordinateArray[2];
    coordinateArray[0] = CLLocationCoordinate2DMake([[Fetch_data valueForKey:@"drop_lat"]floatValue], [[Fetch_data valueForKey:@"drop_lon"]floatValue]);
    coordinateArray[1] = CLLocationCoordinate2DMake([[Fetch_data valueForKey:@"pick_lat"]floatValue], [[Fetch_data valueForKey:@"pick_lon"]floatValue]);
    
    
    self.routeLine = [MKPolyline polylineWithCoordinates:coordinateArray count:2];
    [self.mapper setVisibleMapRect:[self.routeLine boundingMapRect]]; //If you want the route to be visible
    
    [ self.mapper addOverlay:self.routeLine];
    

    
    
    // remove polyline if one exists
    [self.mapper removeOverlay:self.routeLine];
    
    // create an array of coordinates from allPins
   
      // create a polyline with all cooridnates
  
    
   self.routeLine = routeLine;
    
    // create an MKPolylineView and add it to the map view
   MKPolylineView *lineView = [[MKPolylineView alloc]initWithPolyline:self.routeLine];
    lineView.strokeColor = [UIColor redColor];
    lineView.lineWidth = 5;
    
}


#pragma mark - -*********************
#pragma mark  CalltheServer
#pragma mark - -*********************


-(void)CalltheServer
{
    
    
    
    
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&package_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],[Fetch_data valueForKey:@"sender_mobile"]]:[NSString stringWithFormat:@"%@update_package_status",[Utility Pigeon_post_link_url]]];
        
        
        
        NSLog(@"%@",responseString);
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        
        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            
            
                
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
            alert.tag=80123;
            [alert show];
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



-(void)timerCalled:(NSTimer *)timer

{
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
         [self performSelectorInBackground:@selector(timer_call_back) withObject:nil];
    });
    
    
   
    
    
    
    
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    static NSString * const identifier = @"MapViewAnnotation";
    
    MKAnnotationView* annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation
                                                  reuseIdentifier:identifier];
    
    
    [annotationView removeFromSuperview];
    
    MapViewAnnotation *annot = annotation;
    
    
    if([annot isEqual:[self.mapper userLocation]])
    {
        
        annotationView.canShowCallout = NO;
        
    }
    else
    {
        
        
       // NSUInteger index = [annot.tagValue integerValue];
        
        [annotationView setImage:[self makeRoundedImage:[UIImage imageNamed:@"pigeon_location_icn.png"] radius:40*0.5]];
        
        
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        annotationView.canShowCallout = YES;
        return annotationView;

        
   
    }
    
    return nil;
    
}


-(UIImage *)makeRoundedImage:(UIImage *) image

                      radius: (float) radius;

{
    
    CALayer *imageLayer = [CALayer layer];
    
    imageLayer.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    
    imageLayer.contents = (id) image.CGImage;
    
    
    
    imageLayer.masksToBounds = YES;
    
    imageLayer.cornerRadius = radius;
    
    
    
    UIGraphicsBeginImageContext(image.size);
    
    [imageLayer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *roundedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    
    return roundedImage;
    
}



-(void)timer_call_back
{
    if ([API connectedToInternet]==YES) {
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&package_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],Pack_Key]:[NSString stringWithFormat:@"%@get_pigeon_location",[Utility Pigeon_post_link_url]]];
        NSLog(@"%@",responseString);
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        CLLocationCoordinate2D annotationCenter;
        MapViewAnnotation *annotation;

        
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            if ([mstring_last_LAT isEqualToString:@""] || [mstring_last_LON isEqualToString:@""]) {
                
                
                NSArray *existingpoints = self.mapper.annotations;
                if ([existingpoints count] > 0)
                    [self.mapper removeAnnotations:existingpoints];
                
                
                mstring_last_LAT=[dict valueForKey:@"lat"];
                mstring_last_LON=[dict valueForKey:@"lon"];
                
                
                annotationCenter.latitude =[[dict valueForKey:@"lat"]doubleValue];
                annotationCenter.longitude =  [[dict valueForKey:@"lon"]doubleValue];
                
                
                annotation = [[MapViewAnnotation alloc]initWithTitle:@"" AndCoordinate:annotationCenter annID:nil];
                
                [self.mapper addAnnotation:annotation];

                
                
            }
            else
            {
                
                 if ([mstring_last_LAT isEqualToString:[dict valueForKey:@"lat"]] && [mstring_last_LON isEqualToString:[dict valueForKey:@"lon"]]) {
                     
                     
                 }
                
                else
                {
                    
                    if (!annotation) {
                        
                    
                    mstring_last_LAT=[dict valueForKey:@"lat"];
                    mstring_last_LON=[dict valueForKey:@"lon"];
                    
                    
                    annotationCenter.latitude =[[dict valueForKey:@"lat"]doubleValue];
                    annotationCenter.longitude =  [[dict valueForKey:@"lon"]doubleValue];
                    
                    
                    annotation = [[MapViewAnnotation alloc]initWithTitle:@"" AndCoordinate:annotationCenter annID:nil];
                    [self.mapper addAnnotation:annotation];
                        
                    }
                    else
                    {
                        
                        
                        NSArray *existingpoints = self.mapper.annotations;
                        if ([existingpoints count] > 0)
                            [self.mapper removeAnnotations:existingpoints];
                        
                        
                        mstring_last_LAT=[dict valueForKey:@"lat"];
                        mstring_last_LON=[dict valueForKey:@"lon"];
                        
                        
                        annotationCenter.latitude =[[dict valueForKey:@"lat"]doubleValue];
                        annotationCenter.longitude =  [[dict valueForKey:@"lon"]doubleValue];
                        
                        
                        annotation = [[MapViewAnnotation alloc]initWithTitle:@"" AndCoordinate:annotationCenter annID:nil];
                        
                        
                        
                        [self.mapper removeAnnotation:annotation];
                      //  [annotation setCoordinate:annotationCenter];
                        [self.mapper addAnnotation:annotation];
                        
                        
                    }

                }
                
            }
            
                }
        
        else
        {
            
        }
        
    }
    
                
                     else
    {
        
        
        
    }
    
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


-(MKOverlayRenderer *)mapView:(MKMapView *)mapView
           rendererForOverlay:(id<MKOverlay>)overlay {
    
    MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    renderer.strokeColor = [UIColor redColor];
    renderer.lineWidth = 5.0;
    
    return renderer;
}


//-(MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay
//{
//    if(overlay == self.routeLine)
//    {
//        if(nil == self.routeLineView)
//        {
//            self.routeLineView = [[[MKPolylineView alloc] initWithPolyline:self.routeLine] autorelease];
//            self.routeLineView.fillColor = [UIColor redColor];
//            self.routeLineView.strokeColor = [UIColor redColor];
//            self.routeLineView.lineWidth = 5;
//            
//        }
//        
//        return self.routeLineView;
//    }
//    
//    return nil;
//}
//- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay
//{
//    MKPolylineView *polylineView = [[MKPolylineView alloc] initWithPolyline:overlay];
//    polylineView.strokeColor = [UIColor colorWithRed:204/255. green:45/255. blue:70/255. alpha:1.0];
//    polylineView.lineWidth = 1;
//    
//    return polylineView;
//}

//- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
//{
//    static NSString *annotaionIdentifier=@"annotationIdentifier";
//    MKPinAnnotationView *aView=(MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:annotaionIdentifier ];
//    if (aView==nil) {
//        
//        aView=[[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:annotaionIdentifier];
//        aView.pinColor = MKPinAnnotationColorRed;
//        aView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
//        aView.animatesDrop=TRUE;
//        aView.canShowCallout = YES;
//        aView.calloutOffset = CGPointMake(-5, 5);
//    }
//    
//    return aView;
//}

-(void)Done_BTN
{
    
    [self performSelector:@selector(CalltheServer) withObject:nil afterDelay:0.5];
    [self mActivityIndicater];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   }


@end
