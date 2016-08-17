//
//  Drop_Address.m
//  PigeonShip
//
//  Created by Bhushan Bawa on 05/05/16.
//  Copyright © 2016 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Drop_Address.h"
#import "How_many.h"
@interface Drop_Address ()

@end

@implementation Drop_Address


-(void)Back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
  
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
    [Back_BTN setImage:[UIImage imageNamed:@"back_.png"] forState:UIControlStateNormal];
    
    
    Back_BTN.frame = CGRectMake(10,10,49,26);
    [self.view addSubview:Back_BTN];
    
    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    sMTitle = [[UILabel alloc] init];
    sMTitle.textColor = [UIColor blackColor];
    [sMTitle setFrame:CGRectMake(0,10,self.view.frame.size.width, 40)];
    sMTitle.backgroundColor=[UIColor clearColor];
    sMTitle.textColor=[UIColor whiteColor];
    sMTitle.userInteractionEnabled=NO;
    [sMTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    sMTitle.text= @"Step 2-Drop Address";
    sMTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    sMTitle.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:sMTitle];

    
    
    
    //drop label
    UILabel *dropOffLabel=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.origin.x+30, sMTitle.frame.origin.y+sMTitle.frame.size.height+10, self.view.frame.size.width-60,15)];
    dropOffLabel.text=@"Drop off : Street address";
    [dropOffLabel setTextAlignment:NSTextAlignmentLeft];
    [dropOffLabel setFont:[UIFont systemFontOfSize:15]];
    [dropOffLabel setTextColor:[UIColor colorWithRed:205.0f/255.0f green:205.0f/255.0f blue:203.0f/255.0f alpha:1.0 ]];
    [self.view addSubview:dropOffLabel];
    UITextField *dropOffTxt=[[UITextField alloc] initWithFrame:CGRectMake(dropOffLabel.frame.origin.x, dropOffLabel.frame.origin.y+dropOffLabel.frame.size.height+6, dropOffLabel.frame.size.width,20)];
    [self.view addSubview:dropOffTxt];
    
    CALayer *dropLayer=[CALayer layer];
    dropLayer.backgroundColor =[UIColor colorWithRed:205.0f/255.0f green:205.0f/255.0f blue:203.0f/255.0f alpha:1.0 ].CGColor ;
    dropLayer.frame = CGRectMake(dropOffLabel.frame.origin.x,dropOffLabel.frame.origin.y+dropOffLabel.frame.size.height+25,dropOffLabel.frame.size.width,1);
    [self.view.layer addSublayer:dropLayer];
    //apt label
    UILabel *aptLabel=[[UILabel alloc]initWithFrame:CGRectMake(dropOffLabel.frame.origin.x, dropLayer.frame.origin.y+dropLayer.frame.size.height+20, dropOffLabel.frame.size.width,dropOffLabel.frame.size.height)];
    aptLabel.text=@"Apt,Ste,Others";
    [aptLabel setTextAlignment:NSTextAlignmentLeft];
    [aptLabel setFont:[UIFont systemFontOfSize:15]];
    [aptLabel setTextColor:[UIColor colorWithRed:205.0f/255.0f green:205.0f/255.0f blue:203.0f/255.0f alpha:1.0 ]];
    [self.view addSubview:aptLabel];
    UITextField *AptTxt=[[UITextField alloc] initWithFrame:CGRectMake(dropOffLabel.frame.origin.x, aptLabel.frame.origin.y+aptLabel.frame.size.height+6, dropOffLabel.frame.size.width,20)];
    [self.view addSubview:AptTxt];
    
    CALayer *aptLayer=[CALayer layer];
    aptLayer.backgroundColor =[UIColor colorWithRed:205.0f/255.0f green:205.0f/255.0f blue:203.0f/255.0f alpha:1.0 ].CGColor ;
    aptLayer.frame = CGRectMake(dropOffLabel.frame.origin.x,aptLabel.frame.origin.y+aptLabel.frame.size.height+25,dropOffLabel.frame.size.width,1);
    [self.view.layer addSublayer:aptLayer];
    //drop off city
    UILabel *dropOffCityLabel=[[UILabel alloc]initWithFrame:CGRectMake(dropOffLabel.frame.origin.x, aptLayer.frame.origin.y+aptLayer.frame.size.height+20, dropOffLabel.frame.size.width,dropOffLabel.frame.size.height)];
    dropOffCityLabel.text=@"Drop off : City";
    [dropOffCityLabel setTextAlignment:NSTextAlignmentLeft];
    [dropOffCityLabel setFont:[UIFont systemFontOfSize:15]];
    [dropOffCityLabel setTextColor:[UIColor colorWithRed:205.0f/255.0f green:205.0f/255.0f blue:203.0f/255.0f alpha:1.0 ]];
    [self.view addSubview:dropOffCityLabel];
    UITextField *cityTxt=[[UITextField alloc] initWithFrame:CGRectMake(dropOffLabel.frame.origin.x, dropOffCityLabel.frame.origin.y+dropOffCityLabel.frame.size.height+6, dropOffLabel.frame.size.width,20)];
    [self.view addSubview:cityTxt];
    
    CALayer *dropOffCityLayer=[CALayer layer];
    dropOffCityLayer.backgroundColor =[UIColor colorWithRed:205.0f/255.0f green:205.0f/255.0f blue:203.0f/255.0f alpha:1.0 ].CGColor ;
    dropOffCityLayer.frame = CGRectMake(dropOffCityLabel.frame.origin.x,dropOffCityLabel.frame.origin.y+dropOffCityLabel.frame.size.height+25,dropOffLabel.frame.size.width,1);
    [self.view.layer addSublayer:dropOffCityLayer];
    //drop off state
    UILabel *dropOffStateLabel=[[UILabel alloc]initWithFrame:CGRectMake(dropOffLabel.frame.origin.x, dropOffCityLayer.frame.origin.y+dropOffCityLayer.frame.size.height+20,dropOffLabel.frame.size.width,dropOffLabel.frame.size.height)];
    dropOffStateLabel.text=@"Drop off : State";
    [dropOffStateLabel setTextAlignment:NSTextAlignmentLeft];
    [dropOffStateLabel setFont:[UIFont systemFontOfSize:15]];
    [dropOffStateLabel setTextColor:[UIColor colorWithRed:205.0f/255.0f green:205.0f/255.0f blue:203.0f/255.0f alpha:1.0 ]];
    [self.view addSubview:dropOffStateLabel];
    UITextField *stateTxt=[[UITextField alloc] initWithFrame:CGRectMake(dropOffLabel.frame.origin.x, dropOffStateLabel.frame.origin.y+dropOffCityLabel.frame.size.height+6, dropOffStateLabel.frame.size.width,20)];
    [self.view addSubview:stateTxt];
    
    CALayer *dropOffStateLayer=[CALayer layer];
    dropOffStateLayer.backgroundColor =[UIColor colorWithRed:205.0f/255.0f green:205.0f/255.0f blue:203.0f/255.0f alpha:1.0 ].CGColor ;
    dropOffStateLayer.frame = CGRectMake(dropOffStateLabel.frame.origin.x,dropOffStateLabel.frame.origin.y+dropOffStateLabel.frame.size.height+25,dropOffLabel.frame.size.width,1);
    [self.view.layer addSublayer:dropOffStateLayer];
    //zip
    UILabel *dropOffZipLabel=[[UILabel alloc]initWithFrame:CGRectMake(dropOffLabel.frame.origin.x, dropOffStateLayer.frame.origin.y+dropOffStateLayer.frame.size.height+20,dropOffLabel.frame.size.width,dropOffLabel.frame.size.height)];
    dropOffZipLabel.text=@"Drop off : Zip";
    [dropOffZipLabel setTextAlignment:NSTextAlignmentLeft];
    [dropOffZipLabel setFont:[UIFont systemFontOfSize:15]];
    [dropOffZipLabel setTextColor:[UIColor colorWithRed:205.0f/255.0f green:205.0f/255.0f blue:203.0f/255.0f alpha:1.0 ]];
    [self.view addSubview:dropOffZipLabel];
    UITextField *ZipTxt=[[UITextField alloc] initWithFrame:CGRectMake(dropOffLabel.frame.origin.x, dropOffZipLabel.frame.origin.y+dropOffCityLabel.frame.size.height+6, dropOffZipLabel.frame.size.width,20)];
    [self.view addSubview:ZipTxt];
    
    CALayer *dropOffZipLayer=[CALayer layer];
    dropOffZipLayer.backgroundColor =[UIColor colorWithRed:205.0f/255.0f green:205.0f/255.0f blue:203.0f/255.0f alpha:1.0 ].CGColor ;
    dropOffZipLayer.frame = CGRectMake(dropOffStateLabel.frame.origin.x,dropOffZipLabel.frame.origin.y+dropOffZipLabel.frame.size.height+25,dropOffLabel.frame.size.width,1);
    [self.view.layer addSublayer:dropOffZipLayer];
    //enter additional information label
    UILabel *additionalInfoLabel=[[UILabel alloc]initWithFrame:CGRectMake(dropOffLabel.frame.origin.x, dropOffZipLayer.frame.origin.y+dropOffZipLayer.frame.size.height+20,dropOffLabel.frame.size.width,dropOffLabel.frame.size.height)];
    additionalInfoLabel.text=@"Enter any additional Info";
    [additionalInfoLabel setTextAlignment:NSTextAlignmentLeft];
    [additionalInfoLabel setFont:[UIFont systemFontOfSize:15]];
    [additionalInfoLabel setTextColor:[UIColor colorWithRed:205.0f/255.0f green:205.0f/255.0f blue:203.0f/255.0f alpha:1.0 ]];
    [self.view addSubview:additionalInfoLabel];
    
    
    
    UITextView *additionalTxt=[[UITextView alloc] initWithFrame:CGRectMake(dropOffLabel.frame.origin.x, additionalInfoLabel.frame.origin.y+additionalInfoLabel.frame.size.height+15, dropOffZipLabel.frame.size.width,100)];
    additionalTxt.backgroundColor=[UIColor clearColor];
    additionalTxt.layer.borderWidth=1;
    additionalTxt.layer.borderColor=[UIColor colorWithRed:205.0f/255.0f green:205.0f/255.0f blue:203.0f/255.0f alpha:1.0 ].CGColor ;
    [self.view addSubview:additionalTxt];
    [additionalTxt setFont:[UIFont fontWithName:@"ArialMT" size:18]];
    //button for enter drop info
    
    UIButton *enterDropInfoBtn=[[UIButton alloc] initWithFrame:CGRectMake(dropOffLabel.frame.origin.x,additionalTxt.frame.origin.y+additionalTxt.frame.size.height+50,dropOffLabel.frame.size.width,50)];
    [enterDropInfoBtn setTitle:@"Enter Drop off" forState:UIControlStateNormal];
    [enterDropInfoBtn setTitleColor:[UIColor colorWithRed:114.0f/255.0f green:110.0f/255.0f blue:107.0f/255.0f alpha:1.0 ] forState:UIControlStateNormal];
    enterDropInfoBtn.backgroundColor=[UIColor colorWithRed:252.0f/255.0f green:207.0f/255.0f blue:0.0f/255.0f alpha:1.0 ];
    enterDropInfoBtn.layer.cornerRadius=25;
    
    [enterDropInfoBtn addTarget:self
                     action:@selector(enterDropInfoBtn:)
           forControlEvents:UIControlEventTouchUpInside];

    
    
    [self.view addSubview:enterDropInfoBtn];
    
    
    
}

-(void)enterDropInfoBtn:(UIButton *)sender
{
    How_many *objItem_Detail_ViewController=[[How_many alloc]init];
    [self.navigationController pushViewController:objItem_Detail_ViewController animated:YES];
    

}

@end
