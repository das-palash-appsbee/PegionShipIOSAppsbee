//
//  Secure_A_Pigeon.m
//  PigeonShip
//
//  Created by Bhushan Bawa on 05/05/16.
//  Copyright © 2016 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Secure_A_Pigeon.h"
#import "Make_A_Paid.h"
@interface Secure_A_Pigeon ()

@end

@implementation Secure_A_Pigeon

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
    sMTitle.text= @"Step 4-Secure A Pigeon";
    sMTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    sMTitle.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:sMTitle];
    
    
       //current time label
    UILabel *currentTimeLabel=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.origin.x+30, sMTitle.frame.origin.y+sMTitle.frame.size.height+10, self.view.frame.size.width-60, 40)];
    [currentTimeLabel setText:@"Current Time-11.33 AM"];
    [currentTimeLabel setTextAlignment:NSTextAlignmentCenter];
    [currentTimeLabel setTextColor:[UIColor whiteColor]];
    currentTimeLabel.font=[UIFont systemFontOfSize:15];
    [self.view addSubview:currentTimeLabel];
    //message label
    UILabel *messageLabel=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.origin.x+30, currentTimeLabel.frame.origin.y+sMTitle.frame.size.height-50, self.view.frame.size.width-60,currentTimeLabel.frame.size.height)];
    [messageLabel setText:@"I want this delivered before"];
    [messageLabel setTextAlignment:NSTextAlignmentCenter];
    [messageLabel setTextColor:[UIColor whiteColor]];
    messageLabel.font=[UIFont systemFontOfSize:15];
    [self.view addSubview:messageLabel];
    // left time button
    UIButton *leftTimeBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.origin.x+30, messageLabel.frame.origin.y+messageLabel.frame.size.height+20, self.view.frame.size.width/2-60,30)];
    [leftTimeBtn setTitle:@"12:33 PM" forState:UIControlStateNormal];
    [leftTimeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    leftTimeBtn.layer.borderWidth=1;
    leftTimeBtn.layer.borderColor=[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0 ].CGColor;
    leftTimeBtn.layer.cornerRadius=15;
    [self.view addSubview:leftTimeBtn];
    UIButton *leftTimeSecondBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.origin.x+30, leftTimeBtn.frame.origin.y+leftTimeBtn.frame.size.height+10, self.view.frame.size.width/2-60,30)];
    [leftTimeSecondBtn setTitle:@"12:33 PM" forState:UIControlStateNormal];
    [leftTimeSecondBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    leftTimeSecondBtn.layer.borderWidth=1;
    leftTimeSecondBtn.layer.borderColor=[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0 ].CGColor;
    leftTimeSecondBtn.layer.cornerRadius=15;
    [self.view addSubview:leftTimeSecondBtn];
    //right btn
    UIButton *rightTimeFirstBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2+30, messageLabel.frame.origin.y+messageLabel.frame.size.height+20, self.view.frame.size.width/2-60,30)];
    [rightTimeFirstBtn setTitle:@"1:33 PM" forState:UIControlStateNormal];
    [rightTimeFirstBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    rightTimeFirstBtn.layer.borderWidth=1;
    rightTimeFirstBtn.layer.borderColor=[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0 ].CGColor;
    rightTimeFirstBtn.layer.cornerRadius=15;
    [self.view addSubview:rightTimeFirstBtn];
    UIButton *rightTimeSecondBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2+30, rightTimeFirstBtn.frame.origin.y+rightTimeFirstBtn.frame.size.height+10, self.view.frame.size.width/2-60,30)];
    [rightTimeSecondBtn setTitle:@"3:33 PM" forState:UIControlStateNormal];
    [rightTimeSecondBtn setTitleColor:[UIColor colorWithRed:114.0f/255.0f green:110.0f/255.0f blue:107.0f/255.0f alpha:1.0 ] forState:UIControlStateNormal];
    
    rightTimeSecondBtn.layer.cornerRadius=15;
    rightTimeSecondBtn.backgroundColor=[UIColor colorWithRed:218.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1.0 ];
    [self.view addSubview:rightTimeSecondBtn];
    UIButton *rightTimeThirdBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2+30, rightTimeSecondBtn.frame.origin.y+rightTimeSecondBtn.frame.size.height+10, self.view.frame.size.width/2-60,30)];
    [rightTimeThirdBtn setTitle:@"others" forState:UIControlStateNormal];
    [rightTimeThirdBtn setTitleColor:[UIColor colorWithRed:114.0f/255.0f green:110.0f/255.0f blue:107.0f/255.0f alpha:1.0 ] forState:UIControlStateNormal];
    rightTimeThirdBtn.layer.cornerRadius=15;
    rightTimeThirdBtn.backgroundColor=[UIColor colorWithRed:247.0f/255.0f green:212.0f/255.0f blue:0.0f/255.0f alpha:1.0 ];
    [self.view addSubview:rightTimeThirdBtn];
    //total label
    UILabel *totalLabel=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.origin.x+30, rightTimeThirdBtn.frame.origin.y+rightTimeThirdBtn.frame.size.height+80, self.view.frame.size.width-60,currentTimeLabel.frame.size.height)];
    [totalLabel setText:@"Total"];
    [totalLabel setTextAlignment:NSTextAlignmentCenter];
    [totalLabel setTextColor:[UIColor whiteColor]];
    totalLabel.font=[UIFont systemFontOfSize:25];
    [totalLabel setTextColor:[UIColor colorWithRed:205.0f/255.0f green:205.0f/255.0f blue:203.0f/255.0f alpha:1.0 ]];
    [self.view addSubview:totalLabel];
    UILabel *dollarLabel=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.origin.x+30, totalLabel.frame.origin.y+totalLabel.frame.size.height+30, self.view.frame.size.width-60,currentTimeLabel.frame.size.height)];
    [dollarLabel setText:@"$10"];
    [dollarLabel setTextAlignment:NSTextAlignmentCenter];
    [dollarLabel setTextColor:[UIColor whiteColor]];
    dollarLabel.font=[UIFont systemFontOfSize:45];
    [self.view addSubview:dollarLabel];
    //find and secure pigeon buttton
    
    UIButton *findSecureBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.origin.x+30, dollarLabel.frame.origin.y+dollarLabel.frame.size.height+50, self.view.frame.size.width-60,50)];
    [findSecureBtn setTitle:@"Find & Secure Pigeon" forState:UIControlStateNormal];
    [findSecureBtn setTitleColor:[UIColor colorWithRed:114.0f/255.0f green:110.0f/255.0f blue:107.0f/255.0f alpha:1.0 ] forState:UIControlStateNormal];
    findSecureBtn.layer.cornerRadius=25;
    findSecureBtn.backgroundColor=[UIColor colorWithRed:247.0f/255.0f green:212.0f/255.0f blue:0.0f/255.0f alpha:1.0 ];
    
    [findSecureBtn addTarget:self
                        action:@selector(findSecureBtn:)
              forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:findSecureBtn];
    
    
}

-(void)findSecureBtn:(UIButton *)sender
{
    Make_A_Paid *objItem_Detail_ViewController=[[Make_A_Paid alloc]init];
    [self.navigationController pushViewController:objItem_Detail_ViewController animated:YES];
    
    
}


@end
