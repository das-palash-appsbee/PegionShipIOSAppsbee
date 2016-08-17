//
//  AppDelegate.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 31/03/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "Spec_ROOT_ViewController.h"
#import "Edit_Root_ViewController.h"

@class GTMOAuth2Authentication;
@class MFSideMenuContainerViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITextViewDelegate,UINavigationControllerDelegate>
{
    
    
    MFSideMenuContainerViewController *container;
    
    NSMutableDictionary *dicts;
    UIButton *button;
    

}

@property(nonatomic,retain)UIButton *New_user;
@property(nonatomic,retain)UIButton *Returning_user;
@property(nonatomic,retain) UITextView *textField;
@property(nonatomic,retain)UIImageView *LOGO_Img;

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *ViewController_viewController;
- (void)sessionStateChanged:(FBSession *)session state:(FBSessionState) state error:(NSError *)error;

-(void)Add_Slider_View_App_Delegate;

-(void)Become_Pigeon;
-(void)Become_sender;

-(void)LogOut_Method;
@end

