//
//  ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 31/03/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Sign_Up_ViewController.h"
#import "Login_ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImageView *img=[[UIImageView alloc]init];
    img.frame=CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width,  [[UIScreen mainScreen]bounds].size.height);
   img.contentMode=UIViewContentModeScaleToFill;
    img.image=[UIImage imageNamed:@"main_slider_bg.jpg"];
    
    [self.view addSubview:img];
    
    
    image_array=[[NSMutableArray alloc]initWithObjects:@"ic _intro_2x.png",@"ic_intro_3x.png",@"ic_intro_4.png",@"ic_intro_5x.png",@"ic _intro_1x.png",@"ic _intro_1x.png", nil];
    
    
    Title_array=[[NSMutableArray alloc]initWithObjects:@"Avoid the Trip,\nPigeonShip!",@"Same Day\nYour Way",@"Next Day\nAny Day",@"Weekend or\na Holiday",@"PigeonShip is here\nto Stay!", nil];
    
    
    
    self.navigationController.navigationBarHidden=YES;
    
    //create the scrollview with specific frame
    ALScrollViewPaging *scrollView = [[ALScrollViewPaging alloc] initWithFrame:CGRectMake(0, 0,[[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height-180)];
    [scrollView setShowsHorizontalScrollIndicator:NO];
    [scrollView setShowsVerticalScrollIndicator:NO];
    //array for views to add to the scrollview
    NSMutableArray *views = [[NSMutableArray alloc] init];
    //array for colors of views
    
    
    for (int i = 0; i <5; i++) {
        
        
        UIImageView *Demoimg=[[UIImageView alloc]init];
        Demoimg.frame=CGRectMake(0,0, img.frame.size.width,  img.frame.size.height-170);
        Demoimg.contentMode=UIViewContentModeScaleAspectFill;
        Demoimg.backgroundColor=[UIColor clearColor];
        
        
        UIImageView *Logo_image=[[UIImageView alloc]init];
        Logo_image.frame=CGRectMake((Demoimg.frame.size.width-90)/2, (Demoimg.frame.size.height-80)/2, 90,  90);
        Logo_image.contentMode=UIViewContentModeScaleAspectFill;
        Logo_image.image=[UIImage imageNamed:[image_array objectAtIndex:i]];

        
        NSLog(@"%f",Demoimg.frame.size.width);
        
    NSLog(@"%f",Demoimg.frame.size.height);
        
        
        NSLog(@"%f",Logo_image.frame.origin.x);
        

        
        NSLog(@"%f",Logo_image.frame.origin.y);
        

        
        
        Title=[[UILabel alloc]init];
        Title.frame=CGRectMake(10, self.view.frame.origin.y+50, [[UIScreen mainScreen]bounds].size.width-20, 100);
        
        
        
        if (self.view.frame.size.height==480) {
            
             Title.frame=CGRectMake(10, self.view.frame.origin.y+10, [[UIScreen mainScreen]bounds].size.width-20, 100);
            
            //Logo_image.frame=CGRectMake((Demoimg.frame.size.width-90)/2, (Demoimg.frame.size.height+160)/2, 90,  90);

            
        }
        else
        {
             Title.frame=CGRectMake(10, self.view.frame.origin.y+30, [[UIScreen mainScreen]bounds].size.width-20, 100);
            
           // Logo_image.frame=CGRectMake((Demoimg.frame.size.width-90)/2, (Demoimg.frame.size.height+100)/2, 90,  90);

        }
        
        Title.numberOfLines=0;
        
        NSMutableParagraphStyle *style  = [[NSMutableParagraphStyle alloc] init];
        style.minimumLineHeight = 40.f;
        style.maximumLineHeight = 40.f;
        NSDictionary *attributtes = @{NSParagraphStyleAttributeName : style,};
        
        Title.attributedText = [[NSAttributedString alloc] initWithString:[Title_array objectAtIndex:i]
                                                                 attributes:attributtes];
        Title.textAlignment=NSTextAlignmentCenter;
        Title.textColor= [UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
       [Title setFont:[UIFont fontWithName:@"bariol-regular" size:28.0]];
        
        
        [Demoimg addSubview:Title];
        
        [Demoimg addSubview:Logo_image];
      
        
        [views addObject:Demoimg];
        
    }
    
    
    //add pages to scrollview
    [scrollView addPages:views];
    
    //add scrollview to the view
    [self.view addSubview:scrollView];
    
    [scrollView setHasPageControl:YES];
    
    _New_user=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_New_user addTarget:self action:@selector(New_user:) forControlEvents:UIControlEventTouchDown];
    [_New_user setTitle:@"Sign In" forState:UIControlStateNormal];
    [_New_user setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    _New_user.layer.cornerRadius=20;
    _New_user.clipsToBounds = YES;
    _New_user.layer.borderColor=[UIColor clearColor].CGColor;
    _New_user.layer.borderWidth=0.5;
    
    _New_user.backgroundColor=[UIColor colorWithRed:218.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1.0];
    [_New_user setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    _New_user.frame =CGRectMake(30, [[UIScreen mainScreen]bounds].size.height-140, [[UIScreen mainScreen]bounds].size.width-60, 40);
    [self.view addSubview:_New_user];
    
    
    
    _Returning_user =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_Returning_user addTarget:self action:@selector(Returning_user:) forControlEvents:UIControlEventTouchDown];
    _Returning_user.backgroundColor=[UIColor colorWithRed:218.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1.0];
    
    [_Returning_user setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    
    [_Returning_user setTitle:@"Sign Up" forState:UIControlStateNormal];
    [_Returning_user setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    
    
    
    _Returning_user.layer.cornerRadius=20;
    _Returning_user.clipsToBounds = YES;
    _Returning_user.layer.borderColor=[UIColor clearColor].CGColor;
    _Returning_user.layer.borderWidth=0.5;
    
    _Returning_user.frame =CGRectMake(30, [[UIScreen mainScreen]bounds].size.height-75, [[UIScreen mainScreen]bounds].size.width-60, 40);
    [self.view addSubview:_Returning_user];
    

    
    self.view.backgroundColor=[UIColor colorWithRed:52.0f/255.0f green:51.0f/255.0f blue:49.0f/255.0f alpha:0.4];
    
}


-(void)New_user:(UIButton *)sender
{
    Login_ViewController *objViewController=[[Login_ViewController alloc]init];
    
    
    [self.navigationController pushViewController:objViewController animated:YES];

    
    
}


-(void)Returning_user:(UIButton *)sender
{
    Sign_Up_ViewController *objViewController=[[Sign_Up_ViewController alloc]init];
    
    
    [self.navigationController pushViewController:objViewController animated:YES];
    
    
}


-(void) viewWillDisappear:(BOOL) animated
{
    if (self.navigationController.delegate == self)
    {
        self.navigationController.delegate = nil;
    }
}


-(void) dealloc
{
    if (self.navigationController.delegate == self)
    {
        self.navigationController.delegate = nil;
    }
}

@end
