//
//  How_many.m
//  PigeonShip
//
//  Created by Bhushan Bawa on 05/05/16.
//  Copyright © 2016 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "How_many.h"
#import "Secure_A_Pigeon.h"
@interface How_many ()

@end

@implementation How_many


-(void)Back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
    sMTitle.text= @"Step 3-How Many Meals";
    sMTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    sMTitle.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:sMTitle];
    
    

    
    
    UILabel *labelForCircle=[[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-300)/2-15, sMTitle.frame.origin.y+sMTitle.frame.size.height+20, 300,sMTitle.frame.size.height+200)];
    [labelForCircle setFont:[UIFont systemFontOfSize:30]];
    [self.view addSubview:labelForCircle];
    UIButton    *oneBtn=[[UIButton alloc]initWithFrame:CGRectMake(labelForCircle.frame.origin.x+13, labelForCircle.frame.origin.y+20,40,40)];
    [oneBtn setTitle:@"1" forState:UIControlStateNormal];
    [oneBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    oneBtn.backgroundColor=[UIColor colorWithRed:67.0f/255.0f green:62.0f/255.0f blue:58.0f/255.0f alpha:1.0 ];
    oneBtn.layer.cornerRadius=20;
    [self.view addSubview:oneBtn];
    UIButton  *twoBtn=[[UIButton alloc]initWithFrame:CGRectMake(oneBtn.frame.origin.x+oneBtn.frame.size.width+5, labelForCircle.frame.origin.y+20,40,40)];
    [twoBtn setTitle:@"2" forState:UIControlStateNormal];
    [twoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    twoBtn.backgroundColor=[UIColor colorWithRed:67.0f/255.0f green:62.0f/255.0f blue:58.0f/255.0f alpha:1.0 ];
    twoBtn.layer.cornerRadius=20;
    [self.view addSubview:twoBtn];
    UIButton  *threeBtn=[[UIButton alloc]initWithFrame:CGRectMake(twoBtn.frame.origin.x+twoBtn.frame.size.width+5, labelForCircle.frame.origin.y+20,40,40)];
    [threeBtn setTitle:@"3" forState:UIControlStateNormal];
    [threeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    threeBtn.backgroundColor=[UIColor colorWithRed:67.0f/255.0f green:62.0f/255.0f blue:58.0f/255.0f alpha:1.0 ];
    threeBtn.layer.cornerRadius=20;
    [self.view addSubview:threeBtn];
    UIButton  *fourBtn=[[UIButton alloc]initWithFrame:CGRectMake(threeBtn.frame.origin.x+threeBtn.frame.size.width+5, labelForCircle.frame.origin.y+20,40,40)];
    [fourBtn setTitle:@"4" forState:UIControlStateNormal];
    [fourBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    fourBtn.backgroundColor=[UIColor colorWithRed:67.0f/255.0f green:62.0f/255.0f blue:58.0f/255.0f alpha:1.0 ];
    fourBtn.layer.cornerRadius=20;
    [self.view addSubview:fourBtn];
    
    UIButton  *fiveBtn=[[UIButton alloc]initWithFrame:CGRectMake(fourBtn.frame.origin.x+fourBtn.frame.size.width+5, labelForCircle.frame.origin.y+20,40,40)];
    [fiveBtn setTitle:@"5" forState:UIControlStateNormal];
    [fiveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    fiveBtn.backgroundColor=[UIColor colorWithRed:67.0f/255.0f green:62.0f/255.0f blue:58.0f/255.0f alpha:1.0 ];
    fiveBtn.layer.cornerRadius=20;
    [self.view addSubview:fiveBtn];
    
    UIButton  *sixBtn=[[UIButton alloc]initWithFrame:CGRectMake(fiveBtn.frame.origin.x+fiveBtn.frame.size.width+5, labelForCircle.frame.origin.y+20,40,40)];
    [sixBtn setTitle:@"6" forState:UIControlStateNormal];
    [sixBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sixBtn.backgroundColor=[UIColor colorWithRed:67.0f/255.0f green:62.0f/255.0f blue:58.0f/255.0f alpha:1.0 ];
    sixBtn.layer.cornerRadius=20;
    [self.view addSubview:sixBtn];
    UIButton  *sevenBtn=[[UIButton alloc]initWithFrame:CGRectMake(sixBtn.frame.origin.x+sixBtn.frame.size.width+5, labelForCircle.frame.origin.y+20,40,40)];
    [sevenBtn setTitle:@"7" forState:UIControlStateNormal];
    [sevenBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sevenBtn.backgroundColor=[UIColor colorWithRed:67.0f/255.0f green:62.0f/255.0f blue:58.0f/255.0f alpha:1.0 ];
    sevenBtn.layer.cornerRadius=20;
    [self.view addSubview:sevenBtn];
    
    UIButton  *eightBtn=[[UIButton alloc]initWithFrame:CGRectMake(oneBtn.frame.origin.x,oneBtn.frame.origin.y+sixBtn.frame.size.height+10, oneBtn.frame.size.width,oneBtn.frame.size.height)];
    [eightBtn setTitle:@"8" forState:UIControlStateNormal];
    [eightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    eightBtn.backgroundColor=[UIColor colorWithRed:67.0f/255.0f green:62.0f/255.0f blue:58.0f/255.0f alpha:1.0 ];
    eightBtn.layer.cornerRadius=20;
    [self.view addSubview:eightBtn];
    
    UIButton  *nineBtn=[[UIButton alloc]initWithFrame:CGRectMake(eightBtn.frame.origin.x+eightBtn.frame.size.width+5, oneBtn.frame.origin.y+oneBtn.frame.size.height+10, oneBtn.frame.size.width,oneBtn.frame.size.height)];
    [nineBtn setTitle:@"9" forState:UIControlStateNormal];
    [nineBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nineBtn.backgroundColor=[UIColor colorWithRed:67.0f/255.0f green:62.0f/255.0f blue:58.0f/255.0f alpha:1.0 ];
    nineBtn.layer.cornerRadius=20;
    [self.view addSubview:nineBtn];
    
    UIButton  *tenBtn=[[UIButton alloc]initWithFrame:CGRectMake(nineBtn.frame.origin.x+nineBtn.frame.size.width+5,oneBtn.frame.origin.y+sixBtn.frame.size.height+10, oneBtn.frame.size.width,oneBtn.frame.size.height)];
    [tenBtn setTitle:@"10" forState:UIControlStateNormal];
    [tenBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    tenBtn.backgroundColor=[UIColor colorWithRed:67.0f/255.0f green:62.0f/255.0f blue:58.0f/255.0f alpha:1.0 ];
    tenBtn.layer.cornerRadius=20;
    [self.view addSubview:tenBtn];
    
    UIButton  *elevenBtn=[[UIButton alloc]initWithFrame:CGRectMake(tenBtn.frame.origin.x+tenBtn.frame.size.width+5,oneBtn.frame.origin.y+sixBtn.frame.size.height+10, oneBtn.frame.size.width,oneBtn.frame.size.height)];
    [elevenBtn setTitle:@"11" forState:UIControlStateNormal];
    [elevenBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    elevenBtn.backgroundColor=[UIColor colorWithRed:67.0f/255.0f green:62.0f/255.0f blue:58.0f/255.0f alpha:1.0 ];
    elevenBtn.layer.cornerRadius=20;
    [self.view addSubview:elevenBtn];
    
    UIButton  *tweleveBtn=[[UIButton alloc]initWithFrame:CGRectMake(elevenBtn.frame.origin.x+elevenBtn.frame.size.width+5,oneBtn.frame.origin.y+oneBtn.frame.size.height+10, oneBtn.frame.size.width,oneBtn.frame.size.height)];
    [tweleveBtn setTitle:@"12" forState:UIControlStateNormal];
    [tweleveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    tweleveBtn.backgroundColor=[UIColor colorWithRed:67.0f/255.0f green:62.0f/255.0f blue:58.0f/255.0f alpha:1.0 ];
    tweleveBtn.layer.cornerRadius=20;
    [self.view addSubview:tweleveBtn];
    
    UIButton  *thirteebBtn=[[UIButton alloc]initWithFrame:CGRectMake(tweleveBtn.frame.origin.x+tweleveBtn.frame.size.width+5,oneBtn.frame.origin.y+oneBtn.frame.size.height+10, oneBtn.frame.size.width,oneBtn.frame.size.height)];
    [thirteebBtn setTitle:@"13" forState:UIControlStateNormal];
    [thirteebBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    thirteebBtn.backgroundColor=[UIColor colorWithRed:67.0f/255.0f green:62.0f/255.0f blue:58.0f/255.0f alpha:1.0 ];   thirteebBtn.layer.cornerRadius=20;
    [self.view addSubview:thirteebBtn];
    
    UIButton  *fourteenBtn=[[UIButton alloc]initWithFrame:CGRectMake(thirteebBtn.frame.origin.x+thirteebBtn.frame.size.width+5,oneBtn.frame.origin.y+sixBtn.frame.size.height+10, oneBtn.frame.size.width,oneBtn.frame.size.height)];
    [fourteenBtn setTitle:@"14" forState:UIControlStateNormal];
    [fourteenBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    fourteenBtn.backgroundColor=[UIColor colorWithRed:67.0f/255.0f green:62.0f/255.0f blue:58.0f/255.0f alpha:1.0 ];
    fourteenBtn.layer.cornerRadius=20;
    [self.view addSubview:fourteenBtn];
    
    
    UIButton  *fifteenBtn=[[UIButton alloc]initWithFrame:CGRectMake(oneBtn.frame.origin.x,eightBtn.frame.origin.y+eightBtn.frame.size.height+10, oneBtn.frame.size.width,oneBtn.frame.size.height)];
    [fifteenBtn setTitle:@"15" forState:UIControlStateNormal];
    [fifteenBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    fifteenBtn.backgroundColor=[UIColor colorWithRed:67.0f/255.0f green:62.0f/255.0f blue:58.0f/255.0f alpha:1.0 ];    fifteenBtn.layer.cornerRadius=20;
    [self.view addSubview:fifteenBtn];
    
    UIButton  *sixteenBtn=[[UIButton alloc]initWithFrame:CGRectMake(fifteenBtn.frame.origin.x+fifteenBtn.frame.size.width+5,eightBtn.frame.origin.y+eightBtn.frame.size.height+10, oneBtn.frame.size.width,oneBtn.frame.size.height)];
    [sixteenBtn setTitle:@"16" forState:UIControlStateNormal];
    [sixteenBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sixteenBtn.backgroundColor=[UIColor colorWithRed:67.0f/255.0f green:62.0f/255.0f blue:58.0f/255.0f alpha:1.0 ];
    sixteenBtn.layer.cornerRadius=20;
    [self.view addSubview:sixteenBtn];
    UIButton  *seventeenBtn=[[UIButton alloc]initWithFrame:CGRectMake(sixteenBtn.frame.origin.x+sixteenBtn.frame.size.width+5,eightBtn.frame.origin.y+eightBtn.frame.size.height+10, oneBtn.frame.size.width,oneBtn.frame.size.height)];
    [seventeenBtn setTitle:@"17" forState:UIControlStateNormal];
    [seventeenBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    seventeenBtn.backgroundColor=[UIColor colorWithRed:67.0f/255.0f green:62.0f/255.0f blue:58.0f/255.0f alpha:1.0 ];
    seventeenBtn.layer.cornerRadius=20;
    [self.view addSubview:seventeenBtn];
    UIButton  *eighteenBtn=[[UIButton alloc]initWithFrame:CGRectMake(seventeenBtn.frame.origin.x+seventeenBtn.frame.size.width+5,eightBtn.frame.origin.y+eightBtn.frame.size.height+10, oneBtn.frame.size.width,oneBtn.frame.size.height)];
    [eighteenBtn setTitle:@"18" forState:UIControlStateNormal];
    [eighteenBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    eighteenBtn.backgroundColor=[UIColor colorWithRed:67.0f/255.0f green:62.0f/255.0f blue:58.0f/255.0f alpha:1.0 ];
    eighteenBtn.layer.cornerRadius=20;
    [self.view addSubview:eighteenBtn];
    UIButton  *nineteenBtn=[[UIButton alloc]initWithFrame:CGRectMake(eighteenBtn.frame.origin.x+eighteenBtn.frame.size.width+5,eightBtn.frame.origin.y+eightBtn.frame.size.height+10, oneBtn.frame.size.width,oneBtn.frame.size.height)];
    [nineteenBtn setTitle:@"19" forState:UIControlStateNormal];
    [nineteenBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nineteenBtn.backgroundColor=[UIColor colorWithRed:67.0f/255.0f green:62.0f/255.0f blue:58.0f/255.0f alpha:1.0 ];
    nineteenBtn.layer.cornerRadius=20;
    [self.view addSubview:nineteenBtn];
    
    UIButton  *twentyBtn=[[UIButton alloc]initWithFrame:CGRectMake(nineteenBtn.frame.origin.x+nineteenBtn.frame.size.width+5,eightBtn.frame.origin.y+eightBtn.frame.size.height+10, oneBtn.frame.size.width,oneBtn.frame.size.height)];
    [twentyBtn setTitle:@"20+" forState:UIControlStateNormal];
    [twentyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    twentyBtn.backgroundColor=[UIColor colorWithRed:67.0f/255.0f green:62.0f/255.0f blue:58.0f/255.0f alpha:1.0 ];
    twentyBtn.layer.cornerRadius=20;
    [self.view addSubview:twentyBtn];
    
    
    
    
    UIButton  *howManyMealsBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.origin.x+30,labelForCircle.frame.origin.y+labelForCircle.frame.size.height+100, self.view.frame.size.width-60,60)];
    [howManyMealsBtn setTitle:@"How Many Meals" forState:UIControlStateNormal];
    [howManyMealsBtn setTitleColor:[UIColor colorWithRed:119.0f/255.0f green:102.0f/255.0f blue:94.0f/255.0f alpha:1.0 ] forState:UIControlStateNormal ];
    howManyMealsBtn.backgroundColor=[UIColor colorWithRed:247.0f/255.0f green:212.0f/255.0f blue:0.0f/255.0f alpha:1.0 ];
    howManyMealsBtn.layer.cornerRadius=30;
    [howManyMealsBtn addTarget:self
                         action:@selector(howManyMealsBtn:)
               forControlEvents:UIControlEventTouchUpInside];

    
    [self.view addSubview:howManyMealsBtn];
    
    
    
}

-(void)howManyMealsBtn:(UIButton *)sender
{
    Secure_A_Pigeon *objItem_Detail_ViewController=[[Secure_A_Pigeon alloc]init];
    [self.navigationController pushViewController:objItem_Detail_ViewController animated:YES];
    
    
}

@end
