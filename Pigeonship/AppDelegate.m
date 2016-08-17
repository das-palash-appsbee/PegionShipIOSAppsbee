//
//  AppDelegate.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 31/03/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "Login_ViewController.h"
#import "Sign_Up_ViewController.h"

#import "Selfi_ViewController.h"

#import "Confirmcode_ViewController.h"
#import "Profile_ViewController.h"
#import "Vechile_Info_ViewController.h"
#import "Bank_info_ViewController.h"
#import "Find_items_ViewController.h"

#import "MapView_ViewController.h"
#import "Delivery_Charged_ViewController.h"
#import "Tomorrow_Day_ViewController.h"
#import "Specific_Day_ViewController.h"
#import "SetPrice_ViewController.h"
#import "Set_Date_Time_ViewController.h"
#import "SELECT_ITEM_ViewController.h"
#import "Item_Detail_ViewController.h"
#import "MFSideMenuContainerViewController.h"
#import "SliderView_ViewController.h"
#import <GooglePlus/GooglePlus.h>
#import <SCFacebook/SCFacebook.h>

#import "License_ViewController.h"
#import "Insurance_ViewController.h"
#import "SliderView_Pigeon_ViewController.h"
#import "MY_WITHDRAWALS_ViewController.h"
#import "Post_package_ViewController.h"
#import "ANY_TIME_ViewController.h"
#import "Spec_ROOT_ViewController.h"
#import "Flurry.h"
#import "FlurryAds.h"
#import "Pigeon_Posting_Map_view_ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "Item_Detail_ViewController.h"
#import "new_item_notification.h"
#import "Pending_items_sender_deatil.h"
#import "Accepted_items_sender_detail.h"
#import "Delivered_item_sender_detail.h"

#import "Accepted_item_Detail_Page.h"
#import "Delivered_Item_Detail_Page.h"
#define kBaseURL @"http://myServer.com"


#define SYSTEM_VERSION_EQUAL_TO @"http://myServer.com"

#ifdef DEBUG
#define kAPIEndpointHost @"http://example.dev"
#else
#define kAPIEndpointHost @"http://www.example.com"
#endif
@interface AppDelegate ()<GPPDeepLinkDelegate>
{
 
}

@end

@implementation AppDelegate


static NSString * const kClientID =
@"924551345734-gucdps7ruc4dsa8sh0vbh2p8sp0kb5s1.apps.googleusercontent.com";

+ (NSString *)clientID {
    return kClientID;
}


- (MapView_ViewController *)demoController {
    return [[MapView_ViewController alloc] init];
}

- (UINavigationController *)navigationController {
    return [[UINavigationController alloc]
            initWithRootViewController:[self demoController]];
}


- (Post_package_ViewController *)demoControllers {
    return [[Post_package_ViewController alloc] init];
}



//The event handling method
- (void)aMethod:(UIButton *)sender {
    
    if ([[dicts valueForKey:@"dashboard"]isEqualToString:@"sender"]) {
        
        
        
        
        if ([[dicts valueForKey:@"type"]isEqualToString:@"item_new"]) {
            
            
            
            Pending_items_sender_deatil *obj=[[Pending_items_sender_deatil alloc]init];
            obj.Pack_Key=[dicts valueForKey:@"id"];
            obj.post_type=@"Notification";
            UINavigationController *HomeNavController =[[UINavigationController alloc]initWithRootViewController:obj];
            [self.window.rootViewController presentViewController:HomeNavController animated:YES completion:NULL];
            
            
            
        }
        
        else if ([[dicts valueForKey:@"type"]isEqualToString:@"item_accept"])
        {
            
            
            Accepted_items_sender_detail *obj=[[Accepted_items_sender_detail alloc]init];
            obj.Pack_Key=[dicts valueForKey:@"id"];
            obj.post_type=@"Notification";
            UINavigationController *HomeNavController =[[UINavigationController alloc]initWithRootViewController:obj];
            [self.window.rootViewController presentViewController:HomeNavController animated:YES completion:NULL];
            
        }
        
        
        else if ([[dicts valueForKey:@"type"]isEqualToString:@"item_deliver"])
        {
            
            
            Delivered_item_sender_detail *obj=[[Delivered_item_sender_detail alloc]init];
            obj.Pack_Key=[dicts valueForKey:@"id"];
            obj.post_type=@"Notification";
            UINavigationController *HomeNavController =[[UINavigationController alloc]initWithRootViewController:obj];
            [self.window.rootViewController presentViewController:HomeNavController animated:YES completion:NULL];
            
        }
        
        
        else if ([[dicts valueForKey:@"type"]isEqualToString:@"item_rejected"])
        {
            
            
        }
        
        else
        {
        }
        
        
        
        
        
        
        
    }
    else
    {
        
        
        
        
        if ([[dicts valueForKey:@"type"]isEqualToString:@"item_new"]) {
            
            
            
            Item_Detail_ViewController *obj=[[Item_Detail_ViewController alloc]init];
            obj.Pack_Key=[dicts valueForKey:@"id"];
            obj.post_type=@"Notification";
            UINavigationController *HomeNavController =[[UINavigationController alloc]initWithRootViewController:obj];
            [self.window.rootViewController presentViewController:HomeNavController animated:YES completion:NULL];
            
            
            
        }
        
        else if ([[dicts valueForKey:@"type"]isEqualToString:@"item_accept"])
        {
            
            
            Accepted_item_Detail_Page *obj=[[Accepted_item_Detail_Page alloc]init];
            obj.Pack_Key=[dicts valueForKey:@"id"];
            obj.post_type=@"Notification";
            UINavigationController *HomeNavController =[[UINavigationController alloc]initWithRootViewController:obj];
            [self.window.rootViewController presentViewController:HomeNavController animated:YES completion:NULL];
            
        }
        
        
        else if ([[dicts valueForKey:@"type"]isEqualToString:@"item_deliver"])
        {
            
            
            Delivered_Item_Detail_Page *obj=[[Delivered_Item_Detail_Page alloc]init];
            obj.Pack_Key=[dicts valueForKey:@"id"];
            obj.post_type=@"Notification";
            UINavigationController *HomeNavController =[[UINavigationController alloc]initWithRootViewController:obj];
            [self.window.rootViewController presentViewController:HomeNavController animated:YES completion:NULL];
            
        }
        
        
        else if ([[dicts valueForKey:@"type"]isEqualToString:@"item_rejected"])
        {
            
            
        }
        
        else
        {
        }
        
        
    }
    
    

    
}



- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    application.applicationIconBadgeNumber = 0;
    NSLog(@"userInfo %@",userInfo);
    for (id key in userInfo) {
        NSLog(@"key: %@, value: %@", key, [userInfo objectForKey:key]);
    }
    
    [application setApplicationIconBadgeNumber:[[[userInfo objectForKey:@"aps"] objectForKey:@"badge"] intValue]];
       NSLog(@"Badge %d",[[[userInfo objectForKey:@"aps"] objectForKey:@"id"] intValue]);
    NSLog(@"Badge %d",[[[userInfo objectForKey:@"aps"] objectForKey:@"type"] intValue]);
    
    
    dicts=[[NSMutableDictionary alloc]init];
    [dicts setValue:[[userInfo objectForKey:@"aps"] objectForKey:@"id"] forKey:@"id"];
    [dicts setValue:[[userInfo objectForKey:@"aps"] objectForKey:@"type"] forKey:@"type"];
    [dicts setValue:[[userInfo objectForKey:@"aps"] objectForKey:@"dashboard"] forKey:@"dashboard"];
   
    
    
    
    
    if (application.applicationState == UIApplicationStateActive)
    {
        
        //Create a view to hold the label and add images or whatever, place it off screen at -100
        UIView *alertview = [[UIView alloc] initWithFrame:CGRectMake(0, -100, CGRectGetWidth(self.window.bounds), 120)];
        alertview.userInteractionEnabled=YES;
        alertview.backgroundColor=[UIColor whiteColor];
        
        
        [self.window addSubview:alertview];
        
        
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self
                   action:@selector(aMethod:)
         forControlEvents:UIControlEventTouchUpInside];
        // [button setTitle:@"Show View" forState:UIControlStateNormal];
        // button.backgroundColor=[UIColor redColor];
        button.frame = CGRectMake(0,0, alertview.frame.size.width,alertview.frame.size.height);
        [self.window addSubview:button];

      
        
        UIImageView *logoimg=[[UIImageView alloc]init];
        logoimg.frame=CGRectMake(20, 20, 29, 29);
        logoimg.image=[UIImage imageNamed:@"180-180.png"];
         logoimg.userInteractionEnabled=YES;
        [alertview addSubview:logoimg];
        
        
        
        //Create a label to display the message and add it to the alertView
        UILabel *app_name = [[UILabel alloc] initWithFrame:CGRectMake(logoimg.frame.origin.x+logoimg.frame.size.width+10, 20, 100, 15)];
        app_name.text = @"PigeonShip";
        app_name.font=[UIFont boldSystemFontOfSize:14];
        app_name.textColor=[UIColor colorWithRed:36.0f/255.0f green:41.0f/255.0f blue:49.0f/255.0f alpha:1.0];
        app_name.backgroundColor=[UIColor clearColor];
         app_name.userInteractionEnabled=YES;
        [alertview addSubview:app_name];
        
        
        
        
        
        //Create a label to display the message and add it to the alertView
        UILabel *theMessage = [[UILabel alloc] initWithFrame:CGRectMake(logoimg.frame.origin.x+logoimg.frame.size.width+10, app_name.frame.origin.y+app_name.frame.size.height,alertview.frame.size.width-(logoimg.frame.origin.x+logoimg.frame.size.width+10), 35)];
        
        theMessage.lineBreakMode = NSLineBreakByWordWrapping;
        theMessage.numberOfLines = 0;
        
        theMessage.text = [[[userInfo objectForKey:@"aps"] objectForKey:@"alert"]valueForKey:@"body"];
        theMessage.textColor=[UIColor colorWithRed:36.0f/255.0f green:41.0f/255.0f blue:49.0f/255.0f alpha:1.0];
        theMessage.font=[UIFont systemFontOfSize:12];
        theMessage.backgroundColor=[UIColor clearColor];
       // [theMessage sizeToFit];
         theMessage.userInteractionEnabled=YES;
        [alertview addSubview:theMessage];
        
      
        
        
        [UIView animateWithDuration:1.0
                              delay:0.0
                            options: UIViewAnimationOptionCurveLinear
                         animations:^{
                             alertview.frame =CGRectMake(0, 0, CGRectGetWidth(self.window.bounds), 90);
                             
                             
                                [self performSelector:@selector(remove_value) withObject:nil afterDelay:6.5];

                             
                             [UIView animateWithDuration:1.0
                                                   delay:7.0
                                                 options: UIViewAnimationOptionCurveLinear
                                              animations:^{
                                                  
                                               
                                                  
                                              

                                                  alertview.frame =CGRectMake(0, -120, CGRectGetWidth(self.window.bounds), 90);
                                                  
                                                  
                                                  
                                              }
                                              completion:nil];
                             
                             
                             
                             
                             
                         }
                         completion:nil];
        
        
    }
    else
    {
        
          if ([[dicts valueForKey:@"dashboard"]isEqualToString:@"sender"]) {
              
              
              
              
              if ([[dicts valueForKey:@"type"]isEqualToString:@"item_new"]) {
                  
                  
                  
                  Pending_items_sender_deatil *obj=[[Pending_items_sender_deatil alloc]init];
                  obj.Pack_Key=[dicts valueForKey:@"id"];
                  obj.post_type=@"Notification";
                  UINavigationController *HomeNavController =[[UINavigationController alloc]initWithRootViewController:obj];
                  [self.window.rootViewController presentViewController:HomeNavController animated:YES completion:NULL];
                  
                  
                  
              }
              
              else if ([[dicts valueForKey:@"type"]isEqualToString:@"item_accept"])
              {
                  
                  
                  Accepted_items_sender_detail *obj=[[Accepted_items_sender_detail alloc]init];
                  obj.Pack_Key=[dicts valueForKey:@"id"];
                  obj.post_type=@"Notification";
                  UINavigationController *HomeNavController =[[UINavigationController alloc]initWithRootViewController:obj];
                  [self.window.rootViewController presentViewController:HomeNavController animated:YES completion:NULL];
                  
              }
              
              
              else if ([[dicts valueForKey:@"type"]isEqualToString:@"item_deliver"])
              {
                  
                  
                  Delivered_item_sender_detail *obj=[[Delivered_item_sender_detail alloc]init];
                  obj.Pack_Key=[dicts valueForKey:@"id"];
                  obj.post_type=@"Notification";
                  UINavigationController *HomeNavController =[[UINavigationController alloc]initWithRootViewController:obj];
                  [self.window.rootViewController presentViewController:HomeNavController animated:YES completion:NULL];
                  
              }
              
              
              else if ([[dicts valueForKey:@"type"]isEqualToString:@"item_rejected"])
              {
   
                  
              }
              
              else
              {
              }

              
              
              
              
              
              
          }
        else
        {
            
            
            
            
            if ([[dicts valueForKey:@"type"]isEqualToString:@"item_new"]) {
                
                
                
                Item_Detail_ViewController *obj=[[Item_Detail_ViewController alloc]init];
                obj.Pack_Key=[dicts valueForKey:@"id"];
                obj.post_type=@"Notification";
                UINavigationController *HomeNavController =[[UINavigationController alloc]initWithRootViewController:obj];
                [self.window.rootViewController presentViewController:HomeNavController animated:YES completion:NULL];
                
                
                
            }
            
            else if ([[dicts valueForKey:@"type"]isEqualToString:@"item_accept"])
            {
                
                
                Accepted_item_Detail_Page *obj=[[Accepted_item_Detail_Page alloc]init];
                obj.Pack_Key=[dicts valueForKey:@"id"];
                obj.post_type=@"Notification";
                UINavigationController *HomeNavController =[[UINavigationController alloc]initWithRootViewController:obj];
                [self.window.rootViewController presentViewController:HomeNavController animated:YES completion:NULL];
                
            }
            
            
            else if ([[dicts valueForKey:@"type"]isEqualToString:@"item_deliver"])
            {
                
                
                Delivered_Item_Detail_Page *obj=[[Delivered_Item_Detail_Page alloc]init];
                obj.Pack_Key=[dicts valueForKey:@"id"];
                obj.post_type=@"Notification";
                UINavigationController *HomeNavController =[[UINavigationController alloc]initWithRootViewController:obj];
                [self.window.rootViewController presentViewController:HomeNavController animated:YES completion:NULL];
                
            }
            
            
            else if ([[dicts valueForKey:@"type"]isEqualToString:@"item_rejected"])
            {
                
                
            }
            
            else
            {
            }
            
            
        }
        
        
        
        
    }
  
    
    
}


-(void)remove_value
{
    [button removeFromSuperview];
}

- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    
    
    
    NSString *newToken = [deviceToken description];
    newToken = [newToken stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    newToken = [newToken stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    
    [[NSUserDefaults standardUserDefaults]setObject:newToken forKey:@"device_token"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    
    NSLog(@"My token is: %@", deviceToken);
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
    NSLog(@"Failed to get token, error: %@", error);
    
    
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"device_token"];
   
    
    [[NSUserDefaults standardUserDefaults]synchronize];

    
}



- (UINavigationController *)navigationControllers {
    
    return [[UINavigationController alloc]
            initWithRootViewController:[self demoControllers]];
    
}

//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
//    return [[FBSDKApplicationDelegate sharedInstance] application:application
//                                                          openURL:url
//                                                sourceApplication:sourceApplication
//                                                       annotation:annotation
//            ];
//}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSLog(@"%@",kAPIEndpointHost);
    
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    else
    {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
         (UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)];
    }

    
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    
    [Flurry startSession:@"S27MHB4NSWS3ZZS3RS42"];

    
    [[NSUserDefaults standardUserDefaults]setValue:@"Facebook" forKey:@"LoginVlaues"];
    [[NSUserDefaults standardUserDefaults]synchronize];

    
    [SCFacebook initWithPermissions:@[@"user_about_me",
                                      @"email",
                                      @"user_photos",
                                    @"public_profile"]];
    
     [GPPSignIn sharedInstance].clientID = kClientID;
    
    [GPPDeepLink setDelegate:self];
    [GPPDeepLink readDeepLinkAfterInstall];

     self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
     [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    
    
ViewController    *_ViewController_viewController = [[ViewController alloc]init];
    [application setStatusBarHidden:YES];
    
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    NSObject * object = [prefs objectForKey:@"LoginStatues"];
   
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"LoginStatues"]isEqualToString:@"Logout"] || object==nil) {
        
        UINavigationController *navigation = [[UINavigationController alloc]initWithRootViewController:_ViewController_viewController];
        
        
        sleep(1.5);
        
        self.window.rootViewController = navigation;
        
        [self.window makeKeyAndVisible];

        
    }
    
    else
    {
        
        if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"User_Role"]isEqualToString:@"pigeon"]) {
            
            
            [self Become_Pigeon];
            
        }
        
        if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"User_Role"]isEqualToString:@"sender"]) {
            
            
            
            
            [self Become_sender];
            
        }
        
        else
        {
            
            DashBoard_ViewController *objProfile_ViewController=[[DashBoard_ViewController alloc]init];
            
            UINavigationController *navigation = [[UINavigationController alloc]initWithRootViewController:objProfile_ViewController];
            
            
            sleep(1.5);
            
            self.window.rootViewController = navigation;
            
            [self.window makeKeyAndVisible];

            
        }

    }
          return NO;
}


-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
               NSLog(@"%@",url);
    
    return YES;
    
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"LoginVlaues"]isEqualToString:@"Facebook"]) {
        
        
         return [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
        
        
        
        return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                              openURL:url
                                                    sourceApplication:sourceApplication
                                                           annotation:annotation
                ];

        
    }
    else
    {
        
        
       
        
        return [GPPURLHandler handleURL:url
                      sourceApplication:sourceApplication
                             annotation:annotation];

    }
    
    
    
    if ([sourceApplication isEqualToString:@"com.Pigeonship.appL"])
    {
        NSLog(@"Calling Application Bundle ID: %@", sourceApplication);
        NSLog(@"URL scheme:%@", [url scheme]);
        NSLog(@"URL query: %@", [url query]);
        
        return YES;
    }
    else
        return NO;
    
   
    return NO;
    
}


#pragma mark - GPPDeepLinkDelegate

- (void)didReceiveDeepLink:(GPPDeepLink *)deepLink {
    // An example to handle the deep link data.
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Deep-link Data"
                          message:[deepLink deepLinkID]
                          delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert show];
}
-(void)LogOut_Method
{
    
    
    NSString *device_token=[[NSUserDefaults standardUserDefaults]valueForKey:@"device_token"];
 
    
    
    NSArray *subViewArray = [self.window subviews];
    for (id obj in subViewArray)
    {
        [obj removeFromSuperview];
        
    }
    
    
    [[NSUserDefaults standardUserDefaults]setObject:device_token forKey:@"device_token"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    

    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    
    _ViewController_viewController = [[ViewController alloc]init];
    UINavigationController *navigation = [[UINavigationController alloc]initWithRootViewController:_ViewController_viewController];
    
    self.window.rootViewController = navigation;
    [self.window makeKeyAndVisible];
}
-(void)Add_Slider_View_App_Delegate
{
     NSArray *subViewArray = [self.window subviews];
    for (id obj in subViewArray)
    {
        [obj removeFromSuperview];
    }
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
   
      if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Pro_userrole"]isEqualToString:@"pigeon"]) {
        
        
        SliderView_Pigeon_ViewController  *leftMenuViewController_Pigeon = [[SliderView_Pigeon_ViewController alloc] init];
        
        container = [MFSideMenuContainerViewController
                                                        containerWithCenterViewController:[self navigationController]
                                                        leftMenuViewController:leftMenuViewController_Pigeon
                                                        rightMenuViewController:nil];
    }
    else
    {
 SliderView_ViewController *leftMenuViewController_Sender = [[SliderView_ViewController alloc] init];
        
        container = [MFSideMenuContainerViewController
                                                        containerWithCenterViewController:[self navigationControllers]
                                                        leftMenuViewController:leftMenuViewController_Sender
                                                        rightMenuViewController:nil];
         }
    self.window.rootViewController = container;
    [self.window makeKeyAndVisible];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
}
-(void)Become_Pigeon
{
    NSArray *subViewArray = [self.window subviews];
    for (id obj in subViewArray)
    {
        [obj removeFromSuperview];
    }
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    SliderView_Pigeon_ViewController  *leftMenuViewController_Pigeon = [[SliderView_Pigeon_ViewController alloc] init];
    container = [MFSideMenuContainerViewController
                 containerWithCenterViewController:[self navigationController]
                 leftMenuViewController:leftMenuViewController_Pigeon
                 rightMenuViewController:nil];
    self.window.rootViewController = container;
    [self.window makeKeyAndVisible];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
}
-(void)Become_sender
{
    NSArray *subViewArray = [self.window subviews];
    for (id obj in subViewArray)
    {
        [obj removeFromSuperview];
    }
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    SliderView_ViewController *leftMenuViewController_Sender = [[SliderView_ViewController alloc] init];
    container = [MFSideMenuContainerViewController
                 containerWithCenterViewController:[self navigationControllers]
                 leftMenuViewController:leftMenuViewController_Sender
                 rightMenuViewController:nil];

    self.window.rootViewController = container;
    [self.window makeKeyAndVisible];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];

 }
-(void)New_user:(UIButton *)sender
{
    Login_ViewController *objViewController=[[Login_ViewController alloc]init];
    UINavigationController *obj=[[UINavigationController alloc]initWithRootViewController:objViewController];
    self.window.rootViewController=obj;
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
}

-(void)Returning_user:(UIButton *)sender
{
    Sign_Up_ViewController *objViewController=[[Sign_Up_ViewController alloc]init];
    UINavigationController *obj=[[UINavigationController alloc]initWithRootViewController:objViewController];
    self.window.rootViewController=obj;
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
 }
- (void)applicationWillResignActive:(UIApplication *)application {
   }

- (void)applicationDidEnterBackground:(UIApplication *)application {
   
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
   }

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    [FBSDKAppEvents activateApp];
    
}
- (void)applicationWillTerminate:(UIApplication *)application {
   }
@end
