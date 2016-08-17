//
//  Deliver_FoodViewController.m
//  PigeonShip
//
//  Created by Bhushan Bawa on 05/05/16.
//  Copyright © 2016 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Deliver_FoodViewController.h"
#import "MFSideMenu.h"
#import "ThreeSteps.h"
@interface Deliver_FoodViewController ()

@end

@implementation Deliver_FoodViewController



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
-(void)Back:(UIButton *)sender
{
    [self leftSideMenuButtonPressed];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *backGround=[[UIImageView alloc]init];
    backGround.image=[UIImage imageNamed:@"main_slider_bg.jpg"];
    backGround.frame=CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height);
    backGround.userInteractionEnabled=YES;
    [self.view addSubview:backGround];
    
    
    
    
    
    ///////////////////////////// Back Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    Back_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [Back_BTN addTarget:self
                 action:@selector(Back:)
       forControlEvents:UIControlEventTouchUpInside];
    [Back_BTN setImage:[UIImage imageNamed:@"nav_button.png"] forState:UIControlStateNormal];
    
    
    Back_BTN.frame = CGRectMake(10,10,35,35);
    [self.view addSubview:Back_BTN];


    
    
    //label for title
    UILabel *labelTitle = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-300)/2,10, 300, 50)];
    [labelTitle setTextColor:[UIColor colorWithRed:205.0f/255.0f green:205.0f/255.0f blue:203.0f/255.0f alpha:1.0 ]];
    labelTitle.textAlignment = NSTextAlignmentCenter;
    labelTitle.numberOfLines = 0;
    labelTitle.text = @"Have A Pigeon";
    [labelTitle setFont:[UIFont fontWithName:@"Helvetica" size:22]];
    [self.view addSubview:labelTitle];
    
    //take a button for pigeon image
    UIButton *Pigeonbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    Pigeonbtn.frame = CGRectMake((self.view.frame.size.width-200)/2, labelTitle.frame.size.height+labelTitle.frame.origin.y+30, 200,200);
    [Pigeonbtn setBackgroundImage:[UIImage imageNamed:@"logo.png"]
                         forState:UIControlStateNormal];
    //Pigeonbtn.backgroundColor=[UIColor redColor];
    // [btn addTarget:self
    //action:@selector(btnSendComment_pressed:)
    //forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Pigeonbtn];
    
    //image button for image
    UIButton *Imagebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    Imagebtn.frame = CGRectMake((self.view.frame.size.width-350)/2, Pigeonbtn.frame.size.height+Pigeonbtn.frame.origin.y+30, 350,200);
    [Imagebtn setBackgroundImage:[UIImage imageNamed:@"food.png"]
                        forState:UIControlStateNormal];
    Imagebtn.backgroundColor=[UIColor redColor];
    // [btn addTarget:self
    //action:@selector(btnSendComment_pressed:)
    //forControlEvents:UIControlEventTouchUpInside];
    Imagebtn.layer.borderColor=[UIColor whiteColor].CGColor;
    Imagebtn.layer.borderWidth=2;
    [self.view addSubview:Imagebtn];
    
    //delivery food button for action
    UIButton *delieverybtn = [UIButton buttonWithType:UIButtonTypeCustom];
    delieverybtn.frame = CGRectMake((self.view.frame.size.width-250)/2, Imagebtn.frame.size.height+Imagebtn.frame.origin.y+60, 250,40);
    
    delieverybtn.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0 ] ;
     [delieverybtn addTarget:self
    action:@selector(delieverybtn:)
    forControlEvents:UIControlEventTouchUpInside];
    delieverybtn.layer.borderColor=[UIColor whiteColor].CGColor;
    [delieverybtn setTitle:@"Deliver Food" forState:UIControlStateNormal];
    [delieverybtn setTitleColor:[UIColor colorWithRed:114.0f/255.0f green:110.0f/255.0f blue:107.0f/255.0f alpha:1.0 ] forState:UIControlStateNormal];
    delieverybtn.layer.cornerRadius=20;
    [self.view addSubview:delieverybtn];
 
}

-(void)delieverybtn:(UIButton *)sender
{
    ThreeSteps *objItem_Detail_ViewController=[[ThreeSteps alloc]init];
   [self.navigationController pushViewController:objItem_Detail_ViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   }

@end
