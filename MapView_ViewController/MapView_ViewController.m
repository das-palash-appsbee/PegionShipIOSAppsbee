//
//  MapView_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 08/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "MapView_ViewController.h"
#import <MapKit/MapKit.h>
#import "MFSideMenu.h"
#import "Find_items_ViewController.h"
#import "Item_Detail_ViewController.h"
#import "API.h"
#import "JSON.h"
#import "AppDelegate.h"
#import "Utility.h"

@interface MapView_ViewController ()
@property (strong, readwrite, nonatomic) MKMapView *mapper;
@end

@implementation MapView_ViewController
@synthesize clusterer;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSUserDefaults standardUserDefaults]setValue:@"NO" forKey:@"Fin_check"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate]; 

}

-(void)viewWillAppear:(BOOL)animated
{
    
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
    [Back_BTN setImage:[UIImage imageNamed:@"nav_button.png"] forState:UIControlStateNormal];
     Back_BTN.frame = CGRectMake(10,15,35,35);
   // Back_BTN.backgroundColor=[UIColor redColor];
    [scrollview addSubview:Back_BTN];
    
       
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    MTitle = [[UILabel alloc] init];
    MTitle.textColor = [UIColor blackColor];
    [MTitle setFrame:CGRectMake(0,0,self.view.frame.size.width, 64)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"PigeonShip";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:MTitle];
    
    ///////////////////////////// Top View\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    TopView =[[UIView alloc]init];
    TopView.frame=CGRectMake(0, 64, self.view.frame.size.width,31);
    TopView.backgroundColor=[UIColor colorWithRed:52.0f/255.0f green:51.0f/255.0f blue:49.0f/255.0f alpha:1.0];
    [scrollview addSubview:TopView];
    
    ///////////////////////////// Top View Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    textlable = [[UILabel alloc] init];
    [textlable setFrame:CGRectMake(10,0,self.view.frame.size.width-100,31)];
    textlable.backgroundColor=[UIColor clearColor];
    textlable.textColor=[UIColor whiteColor];
    textlable.userInteractionEnabled=NO;
    
    textlable.numberOfLines=0;
    [textlable setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
    textlable.text=@"Searching...";
    
    
    textlable.textColor=[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0];
    textlable.textAlignment=NSTextAlignmentCenter;
    // [textlable sizeToFit];
    [TopView addSubview:textlable];
    
    
    ///////////////////////////// Map_view_BTN Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Map_view_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [Map_view_BTN addTarget:self
                     action:@selector(Map_view_action:)
           forControlEvents:UIControlEventTouchUpInside];
    [Map_view_BTN setBackgroundImage:[UIImage imageNamed:@"book.png"] forState:UIControlStateNormal];
    Map_view_BTN.frame = CGRectMake(TopView.frame.size.width-80,0,38,31);
    [TopView addSubview:Map_view_BTN];
    
    ///////////////////////////// Tableview_view_BTN Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Table_view_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [Table_view_BTN addTarget:self
                       action:@selector(Table_view_Action:)
             forControlEvents:UIControlEventTouchUpInside];
    [Table_view_BTN setBackgroundImage:[UIImage imageNamed:@"list_.png"] forState:UIControlStateNormal];
    Table_view_BTN.frame = CGRectMake(TopView.frame.size.width-38,0,38,31);
    [TopView addSubview:Table_view_BTN];
    
    
    ////////////////////////////    MapView Show \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    self.mapper = [[MKMapView alloc] init];
    
    self.mapper.frame=CGRectMake(0,TopView.frame.origin.y+TopView.frame.size.height,self.view.frame.size.width, self.view.frame.size.height-TopView.frame.origin.y+TopView.frame.size.height);
    self.mapper.delegate = self;
    self.mapper.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [scrollview addSubview:self.mapper];
    
    
    ////////////////////////////    UitableView Show \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    mtableview = [[UITableView alloc] initWithFrame:CGRectMake(0, TopView.frame.origin.y+TopView.frame.size.height, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height-(TopView.frame.origin.y+TopView.frame.size.height)) style:UITableViewStylePlain];
    mtableview.delegate = self;
    mtableview.dataSource = self;
    mtableview.allowsSelection = NO;
    mtableview.hidden=YES;
  mtableview.separatorColor=[UIColor clearColor];
    mtableview.backgroundColor = [UIColor clearColor];
    
  
    [self.view addSubview:mtableview];
    mtableview.separatorInset = UIEdgeInsetsZero;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7){
        mtableview.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    }
    
    //    ////////////////////////////    Finder Button \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Finder_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Finder_BTN addTarget:self
                   action:@selector(Pigen:)
         forControlEvents:UIControlEventTouchUpInside];
    Finder_BTN.backgroundColor=[UIColor colorWithRed:52.0f/255.0f green:51.0f/255.0f blue:49.0f/255.0f alpha:0.5];
    [Finder_BTN setTitle:@"Find items" forState:UIControlStateNormal];
    [Finder_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    [Finder_BTN setTitleColor:[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    Finder_BTN.layer.cornerRadius=20;
    Finder_BTN.clipsToBounds = YES;
    Finder_BTN.frame = CGRectMake(30,self.view.frame.size.height-60,self.view.frame.size.width-60, 40.0);
    [scrollview addSubview:Finder_BTN];
    
    
//    //    ////////////////////////////    Pigeon Button \\\\\\\\\\\\\\\\\\\\\\\\
//    
//    
//    
//    Pigeon_ship = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [Pigeon_ship addTarget:self
//                    action:@selector(Sender:)
//          forControlEvents:UIControlEventTouchUpInside];
//    Pigeon_ship.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0];
//    [Pigeon_ship setTitle:@"PigeonShip it" forState:UIControlStateNormal];
//    [Pigeon_ship setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
//    [Pigeon_ship setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
//    
//    
//    Pigeon_ship.layer.cornerRadius=20;
//    Pigeon_ship.clipsToBounds = YES;
//    Pigeon_ship.frame = CGRectMake(30, Finder_BTN.frame.origin.y+70,self.view.frame.size.width-60, 40.0);
//    [scrollview addSubview:Pigeon_ship];
//    
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 568);

    [self performSelector:@selector(CalltheServer) withObject:nil afterDelay:0.5];
    [self mActivityIndicater];

}

#pragma mark - -*********************
#pragma mark  CalltheServer_ACCEPT
#pragma mark - -*********************


-(void)CalltheServer_ACCEPT:(NSString *)tagvalue
{
    
    
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@&package_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"],PACKAGE_ID]:[NSString stringWithFormat:@"%@package_accept",[Utility API_link_url]]];
        
        NSLog(@"%@",responseString);
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        DEMOdict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
      

        
               if ([[DEMOdict valueForKey:@"status2"] isEqualToString:@"true"]) {
                   
                   
                   
            [[dict valueForKey:@"Package Detail"]removeObjectAtIndex:[tagvalue integerValue]];
                   
                   for (id<MKAnnotation> annotation in self.mapper.annotations)
                   {
                       [self.mapper removeAnnotation:annotation];
                       // change coordinates etc
                      
                   }
                   
                   if ([[dict valueForKey:@"Package Detail"]count]==0) {
                       
                       
                       
                       alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:@"There are no packages available right now, you will be notified if any package matches your route." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                       alert.tag=80123;
                       [alert show];
                       
                       textlable.text = @"All items have been accepted by Pigeons";

                       
                   }
                   else
                   {
                       CLLocationCoordinate2D center;
                       center.latitude = [[[[dict valueForKey:@"Package Detail"]objectAtIndex:0]valueForKey:@"lat"] floatValue];
                       center.longitude = [[[[dict valueForKey:@"data"]objectAtIndex:0]valueForKey:@"lng"] floatValue];
                       
                       
                       //declare span of map (height and width in degrees)
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
                           
                           
                           if ([[[dict valueForKey:@"Package Detail"]objectAtIndex:aa]valueForKey:@"lat"] == (id)[NSNull null]  || [[[dict valueForKey:@"Package Detail"]objectAtIndex:aa]valueForKey:@"lng"] == (id)[NSNull null] )
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
                                   [_mapper setCenterCoordinate:myCoordinate animated:YES];
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
                         textlable.text = [NSString stringWithFormat:@"%lu item(s) are found in your radius",(unsigned long)[[dict valueForKey:@"Package Detail"]count]];

                   }
                   
                   
                   
            
                   
                   alert = [[UIAlertView alloc] initWithTitle:@"Accepted" message:@"Item Successfully Accepted. Sender will be notified." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                   alert.tag=1007;
                   [alert show];
                   
                   
                   
                   
                   
                  // [dict removeAllObjects];
                   
                 //  [dict addEntriesFromDictionary:DEMOdict];
                   
                   
                  
                   
                   
                   
            
                      [mtableview reloadData];
            
        }
        
        else
        {
            
            
            if ([[DEMOdict valueForKey:@"error_type"]isEqualToString:@"0"]) {
                
                
                
                alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[DEMOdict valueForKey:@"message2"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                alert.tag=1005;
                [alert show];
                
            }
            else
            {
            
            alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[DEMOdict valueForKey:@"message2"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
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
    
    
    else if (alert.tag==1001) {
        
        NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
        NSDictionary * dicts = [defs dictionaryRepresentation];
        for (id key in dicts) {
            [defs removeObjectForKey:key];
        }
        [defs synchronize];
        
        [appDelegate LogOut_Method];
        
        
        [[NSUserDefaults standardUserDefaults]setObject:@"Logout" forKey:@"LoginStatues"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
    }
    else
    {
    }
}

#pragma mark - -*********************
#pragma mark  CalltheServer
#pragma mark - -*********************


-(void)CalltheServer
{
   
    
    
   

    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        
        if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fin_check"]isEqualToString:@"NO"]) {
            
            NSString *responseString = [API makeCallPostData_ALL:[NSString stringWithFormat:@"security_token=%@&access_token=%@&user_id=%@",[Utility Pigeon_security_token],[[NSUserDefaults standardUserDefaults]valueForKey:@"access_token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"User_ID"]]:[NSString stringWithFormat:@"%@packagelist",[Utility API_link_url]]];

      
        
        NSLog(@"%@",responseString);
        
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
          ;
            
        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
            
            
            if ([[[dict valueForKey:@"Package Detail"]objectAtIndex:0]valueForKey:@"lat"] == (id)[NSNull null] ||[[[dict valueForKey:@"Package Detail"]objectAtIndex:0]valueForKey:@"lng"] == (id)[NSNull null] || [[[[dict valueForKey:@"Package Detail"]objectAtIndex:0]valueForKey:@"lat"] isKindOfClass:[NSNull class]] || [[[[dict valueForKey:@"Package Detail"]objectAtIndex:0]valueForKey:@"lng"] isKindOfClass:[NSNull class]] || [[[[dict valueForKey:@"Package Detail"]objectAtIndex:0]valueForKey:@"lng"] isEqual:[NSNull null]] || [[[[dict valueForKey:@"Package Detail"]objectAtIndex:0]valueForKey:@"lat"] isEqual:[NSNull null]])
            {
                
            }
            else
            {
                CLLocationCoordinate2D center;
                center.latitude = [[[[dict valueForKey:@"Package Detail"]objectAtIndex:0]valueForKey:@"lat"] floatValue];
                center.longitude = [[[[dict valueForKey:@"data"]objectAtIndex:0]valueForKey:@"lng"] floatValue];
                
                
                //declare span of map (height and width in degrees)
                MKCoordinateSpan span;
                span.latitudeDelta = 10;
                span.longitudeDelta = 10;
                
                
                region.center = center;
                region.span = span;
                
                
                NSLog(@"%f",region.center.longitude);
                NSLog(@"%f",region.center.longitude);
                
                [self.mapper setRegion:region animated:NO];

            }

            
            
            
            
            for (int aa=0; aa<[[dict valueForKey:@"Package Detail"]count]; aa++) {
                
                
                if ( [[[dict valueForKey:@"Package Detail"]objectAtIndex:aa]valueForKey:@"lat"] == (id)[NSNull null] ||[[[dict valueForKey:@"Package Detail"]objectAtIndex:aa]valueForKey:@"lng"] == (id)[NSNull null] || [[[[dict valueForKey:@"Package Detail"]objectAtIndex:aa]valueForKey:@"lat"] isKindOfClass:[NSNull class]] || [[[[dict valueForKey:@"Package Detail"]objectAtIndex:aa]valueForKey:@"lng"] isKindOfClass:[NSNull class]] || [[[[dict valueForKey:@"Package Detail"]objectAtIndex:aa]valueForKey:@"lng"] isEqual:[NSNull null]] || [[[[dict valueForKey:@"Package Detail"]objectAtIndex:aa]valueForKey:@"lat"] isEqual:[NSNull null]])
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
                        [_mapper setCenterCoordinate:myCoordinate animated:YES];
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

            
            textlable.text = [NSString stringWithFormat:@"%lu item(s) are found in your radius",(unsigned long)[[dict valueForKey:@"Package Detail"]count]];
            

            [mtableview reloadData];
            
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

            
//            alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
//            [alert show];
            
            [mtableview reloadData];
            }

            
        }
        }
        
        
    }
        
        else
        {
            [dict removeAllObjects];
            
            [dict addEntriesFromDictionary:[[NSUserDefaults standardUserDefaults]valueForKey:@"Find_Data"]];
            
            NSLog(@"%@",dict);
            
            
            
            CLLocationCoordinate2D center;
            center.latitude = [[[[dict valueForKey:@"Package Detail"]objectAtIndex:0]valueForKey:@"lat"] floatValue];
            center.longitude = [[[[dict valueForKey:@"data"]objectAtIndex:0]valueForKey:@"lng"] floatValue];
            
            
            //declare span of map (height and width in degrees)
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
                
                
                if ([[[dict valueForKey:@"Package Detail"]objectAtIndex:aa]valueForKey:@"lat"] == (id)[NSNull null] || [[[dict valueForKey:@"Package Detail"]objectAtIndex:aa]valueForKey:@"lng"] == (id)[NSNull null] )
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
                        [_mapper setCenterCoordinate:myCoordinate animated:YES];
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
            
            textlable.text = [NSString stringWithFormat:@"%lu item(s) are found in your radius",(unsigned long)[[dict valueForKey:@"Package Detail"]count]];
            
             [mtableview reloadData];
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
-(void)Back:(UIButton *)sender
{
    [self leftSideMenuButtonPressed];
    
}
-(void)Pigen:(UIButton *)sender
{
       Find_items_ViewController *objFind_items_ViewController=[[Find_items_ViewController alloc]init];
    [self.navigationController pushViewController:objFind_items_ViewController animated:YES];
}

-(void)Sender:(UIButton *)sender
{
    
}

-(void)Map_view_action:(UIButton *)sender
{

     [Map_view_BTN setBackgroundImage:[UIImage imageNamed:@"book.png"] forState:UIControlStateNormal];
    [Table_view_BTN setBackgroundImage:[UIImage imageNamed:@"list_.png"] forState:UIControlStateNormal];
    self.mapper.hidden=NO;
    mtableview.hidden=YES;
    Pigeon_ship.hidden=NO;
    Finder_BTN.hidden=NO;
}

-(void)Table_view_Action:(UIButton *)sender
{
    
    [Map_view_BTN setBackgroundImage:[UIImage imageNamed:@"book_.png"] forState:UIControlStateNormal];
    [Table_view_BTN setBackgroundImage:[UIImage imageNamed:@"list.png"] forState:UIControlStateNormal];
    self.mapper.hidden=YES;
    mtableview.hidden=NO;
    Pigeon_ship.hidden=YES;
    Finder_BTN.hidden=YES;
}

#pragma mark - UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 190;
}

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return [[dict valueForKey:@"Package Detail"]count];
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    NSArray *views=[cell.contentView subviews];
    for(int i=0;i<[views count];i++)
    {
        UIView *tempView=[views objectAtIndex:i];
        [tempView removeFromSuperview];
        tempView = nil;
    }
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
        
        
    }
    
   
///////////////////////////////////   BackGround view /////////////////////////////////////////////////
    mtable_bacground=[[UIView alloc]initWithFrame:CGRectMake(0, 0, mtableview.frame.size.width, 200)];
    mtableview.backgroundColor=[UIColor clearColor];
    [cell.contentView addSubview:mtable_bacground];
    
    if (indexPath.row==0) {
        
        mtable_bacground.frame=CGRectMake(0, 5, mtableview.frame.size.width, 210);
        
    }
    
    else
    {
        mtable_bacground.frame=CGRectMake(0, 0, mtableview.frame.size.width, 220);
    }
    

    
    
    //    ////////////////////////////   Top Left   Lable \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    topLeft_LB = [[UILabel alloc] init];
    topLeft_LB.textColor = [UIColor blackColor];
    [topLeft_LB setFrame:CGRectMake(10,10,100, 30)];
    topLeft_LB.backgroundColor=[UIColor clearColor];
    topLeft_LB.textColor=[UIColor whiteColor];
    topLeft_LB.userInteractionEnabled=NO;
    [topLeft_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    topLeft_LB.text= @"Pick-up origin";
    topLeft_LB.textColor=[UIColor colorWithRed:196.0f/255.0f green:196.0f/255.0f blue:196.0f/255.0f alpha:1.0];
    topLeft_LB.textAlignment=NSTextAlignmentCenter;
    [mtable_bacground addSubview:topLeft_LB];
    
    
    
    
    //    ////////////////////////////   Top Left   Location Image \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    topLeft_location_IMG = [[UIImageView alloc] initWithFrame:CGRectMake(46,topLeft_LB.frame.origin.x+30, 19, 19)];
    
    if (indexPath.row%2==0) {
        
          topLeft_location_IMG.image = [UIImage imageNamed:@"mpp.png"];
        
       /// Middle_Round_LB.backgroundColor=[UIColor colorWithRed:83.0f/255.0f green:83.0f/255.0f blue:83.0f/255.0f alpha:1.0];
        
    }
    else
    {
        
          topLeft_location_IMG.image = [UIImage imageNamed:@"mpp.png"];
       /// Middle_Round_LB.backgroundColor=[UIColor colorWithRed:120.0f/255.0f green:117.0f/255.0f blue:114.0f/255.0f alpha:1.0];
    }

    
    
    topLeft_location_IMG.layer.cornerRadius=15*0.5;
    [mtable_bacground addSubview:topLeft_location_IMG];
    

  //    ////////////////////////////   Middle Line Image \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Middle_Line_IMG = [[UIImageView alloc] initWithFrame:CGRectMake(65,topLeft_LB.frame.origin.x+40, self.view.frame.size.width-135, 0.5)];
    Middle_Line_IMG.image = [UIImage imageNamed:@"line__.png"];
     [mtable_bacground addSubview:Middle_Line_IMG];
    

     //    ////////////////////////////   Middle Round Image \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    Middle_Round_LB = [[UILabel alloc] init];
    Middle_Round_LB.textColor = [UIColor blackColor];
    [Middle_Round_LB setFrame:CGRectMake((Middle_Line_IMG.frame.size.width-30)/2,-20,40, 40)];
    Middle_Round_LB.layer.cornerRadius=40*0.5;
    Middle_Round_LB.clipsToBounds=YES;
    
    if (indexPath.row%2==0) {
       
        Middle_Round_LB.backgroundColor=[UIColor colorWithRed:83.0f/255.0f green:83.0f/255.0f blue:83.0f/255.0f alpha:1.0];

    }
    else
    {
         Middle_Round_LB.backgroundColor=[UIColor colorWithRed:83.0f/255.0f green:83.0f/255.0f blue:83.0f/255.0f alpha:1.0];
    }

    
      Middle_Round_LB.textColor=[UIColor whiteColor];
    Middle_Round_LB.userInteractionEnabled=NO;
    [Middle_Round_LB setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
    Middle_Round_LB.text=[NSString stringWithFormat:@"$%@",[[[dict valueForKey:@"Package Detail"]objectAtIndex:indexPath.row]valueForKey:@"Price"]];
   /// Middle_Round_LB.textColor=[UIColor colorWithRed:59.0f/255.0f green:89.0f/255.0f blue:132.0f/255.0f alpha:1.0];
      Middle_Round_LB.adjustsFontSizeToFitWidth=YES;
    Middle_Round_LB.textAlignment=NSTextAlignmentCenter;
    [Middle_Line_IMG addSubview:Middle_Round_LB];

    
    
     //    ////////////////////////////   Middle Left Address \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Middle_Left_Address_LB = [[UILabel alloc] init];
    Middle_Left_Address_LB.textColor = [UIColor blackColor];
    [Middle_Left_Address_LB setFrame:CGRectMake(10,Middle_Line_IMG.frame.origin.y+10,100, 30)];
    Middle_Left_Address_LB.backgroundColor=[UIColor clearColor];
    Middle_Left_Address_LB.textColor=[UIColor whiteColor];
    Middle_Left_Address_LB.userInteractionEnabled=NO;
    [Middle_Left_Address_LB setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
    Middle_Left_Address_LB.text= [[[dict valueForKey:@"Package Detail"]objectAtIndex:indexPath.row]valueForKey:@"Source_address"];
    Middle_Left_Address_LB.textColor=[UIColor whiteColor];
    Middle_Left_Address_LB.textAlignment=NSTextAlignmentCenter;
    Middle_Left_Address_LB.numberOfLines=0;
    Middle_Left_Address_LB.lineBreakMode = NSLineBreakByWordWrapping;
    [mtable_bacground addSubview:Middle_Left_Address_LB];
    

    
    //    ////////////////////////////   Top Right   Lable \\\\\\\\\\\\\\\\\\\\\\\\

    
    topRight_LB = [[UILabel alloc] init];
    topRight_LB.textColor = [UIColor blackColor];
    [topRight_LB setFrame:CGRectMake(mtable_bacground.frame.size.width-130,10,120, 30)];
    topRight_LB.backgroundColor=[UIColor clearColor];
    topRight_LB.textColor=[UIColor whiteColor];
    topRight_LB.userInteractionEnabled=NO;
    [topRight_LB setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    topRight_LB.text= @"Drop Destination";
    topRight_LB.textColor=[UIColor colorWithRed:196.0f/255.0f green:196.0f/255.0f blue:196.0f/255.0f alpha:1.0];
    topRight_LB.textAlignment=NSTextAlignmentCenter;
    [mtable_bacground addSubview:topRight_LB];
    
    
    
    //    ////////////////////////////   Top Right   Location Image \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    topRight_location_IMG = [[UIImageView alloc] initWithFrame:CGRectMake(mtable_bacground.frame.size.width-74,topLeft_LB.frame.origin.x+30, 19, 19)];
  ///  topRight_location_IMG.image = [UIImage imageNamed:@"map.png"];
    
    if (indexPath.row%2==0) {
        
        topRight_location_IMG.image = [UIImage imageNamed:@"mpp.png"];
        
        /// Middle_Round_LB.backgroundColor=[UIColor colorWithRed:83.0f/255.0f green:83.0f/255.0f blue:83.0f/255.0f alpha:1.0];
        
    }
    else
    {
        
        topRight_location_IMG.image = [UIImage imageNamed:@"mpp.png"];
        /// Middle_Round_LB.backgroundColor=[UIColor colorWithRed:120.0f/255.0f green:117.0f/255.0f blue:114.0f/255.0f alpha:1.0];
    }
    

    
    topRight_location_IMG.layer.cornerRadius=15*0.5;
    [mtable_bacground addSubview:topRight_location_IMG];


    //    ////////////////////////////   Middle Right Address \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Middle_Right_Address_LB = [[UILabel alloc] init];
    Middle_Right_Address_LB.textColor = [UIColor blackColor];
    [Middle_Right_Address_LB setFrame:CGRectMake(mtable_bacground.frame.size.width-110,Middle_Line_IMG.frame.origin.y+10,100, 30)];

    Middle_Right_Address_LB.backgroundColor=[UIColor clearColor];
    Middle_Right_Address_LB.textColor=[UIColor whiteColor];
    Middle_Right_Address_LB.userInteractionEnabled=NO;
    [Middle_Right_Address_LB setFont:[UIFont fontWithName:@"bariol-regular" size:14.0]];
    Middle_Right_Address_LB.text= [[[dict valueForKey:@"Package Detail"]objectAtIndex:indexPath.row]valueForKey:@"Destination_address"];
    Middle_Right_Address_LB.textColor=[UIColor whiteColor];
      Middle_Right_Address_LB.numberOfLines=0;
    Middle_Right_Address_LB.textAlignment=NSTextAlignmentCenter;
    [mtable_bacground addSubview:Middle_Right_Address_LB];
    
    
    
    //    ////////////////////////////   Pack_type_str_LB  Lable \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Pack_type_str_LB = [[UILabel alloc] init];
    Pack_type_str_LB.textColor = [UIColor blackColor];
    [Pack_type_str_LB setFrame:CGRectMake(15,Middle_Right_Address_LB.frame.origin.y+Middle_Right_Address_LB.frame.size.height+2,100, 30)];

    Pack_type_str_LB.backgroundColor=[UIColor clearColor];
    Pack_type_str_LB.textColor=[UIColor whiteColor];
    Pack_type_str_LB.userInteractionEnabled=NO;
    [Pack_type_str_LB setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Pack_type_str_LB.text= @"Package Type";
    Pack_type_str_LB.textColor=[UIColor colorWithRed:196.0f/255.0f green:196.0f/255.0f blue:196.0f/255.0f alpha:1.0];
    Pack_type_str_LB.textAlignment=NSTextAlignmentLeft;
    [mtable_bacground addSubview:Pack_type_str_LB];

    //    ////////////////////////////   Pack_type_Dynamic Lable \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Pack_type_dyn_LB = [[UILabel alloc] init];
    Pack_type_dyn_LB.textColor = [UIColor blackColor];
    [Pack_type_dyn_LB setFrame:CGRectMake(15,Pack_type_str_LB.frame.origin.y+20,150, 30)];
    Pack_type_dyn_LB.backgroundColor=[UIColor clearColor];
    Pack_type_dyn_LB.textColor=[UIColor whiteColor];
    Pack_type_dyn_LB.userInteractionEnabled=NO;
    [Pack_type_dyn_LB setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    
    if ([[[[dict valueForKey:@"Package Detail"]objectAtIndex:indexPath.row]valueForKey:@"classified"]isEqualToString:@"TRUE"]) {
        
         Pack_type_dyn_LB.text=[[[[dict valueForKey:@"Package Detail"]objectAtIndex:indexPath.row]valueForKey:@"Package_type"] stringByAppendingString:@"(Classified)"];
        
       
        
    }
    
    else
    {
    Pack_type_dyn_LB.text= [[[dict valueForKey:@"Package Detail"]objectAtIndex:indexPath.row]valueForKey:@"Package_type"];
    }
    Pack_type_dyn_LB.textColor=[UIColor whiteColor];
    Pack_type_dyn_LB.textAlignment=NSTextAlignmentLeft;
    [mtable_bacground addSubview:Pack_type_dyn_LB];

    
    //    ////////////////////////////   Pack_type_str_LB  Lable \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Delivered_Before_str_LB = [[UILabel alloc] init];
    Delivered_Before_str_LB.textColor = [UIColor blackColor];
    [Delivered_Before_str_LB setFrame:CGRectMake((mtable_bacground.frame.size.width-15)-150,Middle_Right_Address_LB.frame.origin.y+Middle_Right_Address_LB.frame.size.height+2,150, 30)];

    Delivered_Before_str_LB.backgroundColor=[UIColor clearColor];
    Delivered_Before_str_LB.textColor=[UIColor whiteColor];
    Delivered_Before_str_LB.userInteractionEnabled=NO;
    [Delivered_Before_str_LB setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Delivered_Before_str_LB.text= @"To be delivered before";
    Delivered_Before_str_LB.textColor=[UIColor colorWithRed:196.0f/255.0f green:196.0f/255.0f blue:196.0f/255.0f alpha:1.0];
    Delivered_Before_str_LB.textAlignment=NSTextAlignmentRight;
    [mtable_bacground addSubview:Delivered_Before_str_LB];
    
    //    ////////////////////////////   Pack_type_Dynamic Lable \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Delivered_Before_dyn_LB = [[UILabel alloc] init];
    Delivered_Before_dyn_LB.textColor = [UIColor blackColor];
    [Delivered_Before_dyn_LB setFrame:CGRectMake((mtable_bacground.frame.size.width-15)-150,Delivered_Before_str_LB.frame.origin.y+20,150, 30)];
    Delivered_Before_dyn_LB.backgroundColor=[UIColor clearColor];
    Delivered_Before_dyn_LB.textColor=[UIColor whiteColor];
    Delivered_Before_dyn_LB.userInteractionEnabled=NO;
    [Delivered_Before_dyn_LB setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    Delivered_Before_dyn_LB.text= [[[dict valueForKey:@"Package Detail"]objectAtIndex:indexPath.row]valueForKey:@"Delivery_date"];
    Delivered_Before_dyn_LB.textColor=[UIColor whiteColor];
    Delivered_Before_dyn_LB.textAlignment=NSTextAlignmentRight;
    [mtable_bacground addSubview:Delivered_Before_dyn_LB];


       //    ////////////////////////////   View_Deatil Button \\\\\\\\\\\\\\\\\\\\\\\
    
    View_Detail_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [View_Detail_BTN addTarget:self
                  action:@selector(View_Detail:)
        forControlEvents:UIControlEventTouchUpInside];
    View_Detail_BTN.backgroundColor=[UIColor clearColor];
    [View_Detail_BTN setTitle:@"View Detail" forState:UIControlStateNormal];
    View_Detail_BTN.tag=indexPath.row;
    [View_Detail_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    [View_Detail_BTN setTitleColor:[UIColor colorWithRed:218.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1.0] forState:UIControlStateNormal];

    
    View_Detail_BTN.layer.cornerRadius=12;
    View_Detail_BTN.clipsToBounds = YES;
    View_Detail_BTN.layer.borderWidth=1;
    View_Detail_BTN.layer.borderColor=[UIColor colorWithRed:218.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1.0].CGColor;


    View_Detail_BTN.frame = CGRectMake(30, Delivered_Before_dyn_LB.frame.origin.y+30,90, 25.0);
    [mtable_bacground addSubview:View_Detail_BTN];
    
       //    ////////////////////////////   Accept Button \\\\\\\\\\\\\\\\\\\\\\\
    
    Accept_BTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Accept_BTN addTarget:self
                   action:@selector(Accept_action:)
         forControlEvents:UIControlEventTouchUpInside];
    Accept_BTN.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0];
    [Accept_BTN setTitle:@"Accept" forState:UIControlStateNormal];
     Accept_BTN.tag=indexPath.row;
    [Accept_BTN setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    [Accept_BTN setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    
    
    Accept_BTN.layer.cornerRadius=12;
    Accept_BTN.clipsToBounds = YES;
    Accept_BTN.frame = CGRectMake(self.view.frame.size.width-120, Delivered_Before_dyn_LB.frame.origin.y+30,90, 25);
    [mtable_bacground addSubview:Accept_BTN];
    
    
    if (indexPath.row%2==0) {
        cell.backgroundColor=[UIColor colorWithRed:120.0f/255.0f green:117.0f/255.0f blue:114.0f/255.0f alpha:0.4];

    }
    else
    {
        cell.backgroundColor=[UIColor colorWithRed:104.0f/255.0f green:101.0f/255.0f blue:98.0f/255.0f alpha:0.4];

    }
    
       return cell;

}

-(void)Accept_action:(UIButton *)sender
{
    
    PACKAGE_ID=[[[dict valueForKey:@"Package Detail"]objectAtIndex:sender.tag]valueForKey:@"Package_id"];
    
    [self performSelector:@selector(CalltheServer_ACCEPT:) withObject:[NSString stringWithFormat:@"%ld",(long)sender.tag]afterDelay:0.5];
    [self mActivityIndicater];
}

-(void)View_Detail:(UIButton *)sender
{
    Item_Detail_ViewController *objItem_Detail_ViewController=[[Item_Detail_ViewController alloc]init];
    objItem_Detail_ViewController.Pack_Key=[[[dict valueForKey:@"Package Detail"]objectAtIndex:sender.tag]valueForKey:@"Package_id"];
    
    [self.navigationController pushViewController:objItem_Detail_ViewController animated:YES];
    
}

#pragma mark - UITableViewDelegate
// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %d row", indexPath.row);
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
    NSInteger annotationValue = [_mapper.annotations indexOfObject:annotation];
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
            
            Item_Detail_ViewController *objItem_Detail_ViewController=[[Item_Detail_ViewController alloc]init];
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

-(void)viewDidDisappear:(BOOL)animated
{
}
@end

