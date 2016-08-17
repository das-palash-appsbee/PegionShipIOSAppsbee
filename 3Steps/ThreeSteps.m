//
//  3Steps.m
//  PigeonShip
//
//  Created by Bhushan Bawa on 21/03/16.
//  Copyright © 2016 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "ThreeSteps.h"
#import "UIImageView+WebCache.h"
#import "Pigeon_Posting_Map_view_ViewController.h"
#import "MFSideMenu.h"
#import "Utility.h"

#import "Choose_Restaurant.h"
@interface ThreeSteps ()

@end

@implementation ThreeSteps


-(void)Back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(UITableView *)makeTableView
{
    CGFloat x = 0;
    CGFloat y = 45;
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height - 100;
    CGRect tableFrame = CGRectMake(x, y, width, height);
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:tableFrame style:UITableViewStylePlain];
    
    tableView.rowHeight = 45;
    tableView.sectionFooterHeight = 22;
    tableView.sectionHeaderHeight = 22;
    tableView.scrollEnabled = NO;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.userInteractionEnabled = NO;
    tableView.bounces = YES;
    
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor=[UIColor clearColor];
    return tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    Images_array=[[NSMutableArray alloc]initWithObjects:@"pign_app.png",@"pign_app2.png",@"pign_app3.png", nil];
    
    
    name_array=[[NSMutableArray alloc]initWithObjects:@"Choose Restaurants",@"Secure A Pigeon",@"Make A Paid Takeout Order", nil];
    
    
    
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
    
    
    ///////////////////////////// Tableview Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    mtableview = [self makeTableView];
    [mtableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [scrollview addSubview:mtableview];

    
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
    sMTitle.text= @"3 Steps";
    sMTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    sMTitle.textAlignment=NSTextAlignmentCenter;
    [scrollview addSubview:sMTitle];
    
    Lets_Go = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Lets_Go addTarget:self
                   action:@selector(Lets_Go_action:)
         forControlEvents:UIControlEventTouchUpInside];
    Lets_Go.backgroundColor=[UIColor colorWithRed:228.0f/255.0f green:183.0f/255.0f blue:44.0f/255.0f alpha:1.0];
    [Lets_Go setTitle:@"Let's Do It" forState:UIControlStateNormal];
    [Lets_Go setFont:[UIFont fontWithName:@"bariol-regular" size:16.0]];
    [Lets_Go setTitleColor:[UIColor colorWithRed:107.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    Lets_Go.layer.cornerRadius=20;
    Lets_Go.clipsToBounds = YES;
    Lets_Go.frame = CGRectMake((scrollview.frame.size.width-250)/2, scrollview.frame.size.height-60,250, 38.0);
    [scrollview addSubview:Lets_Go];

      }

-(void)Lets_Go_action:(UIButton *)sender
{
    Choose_Restaurant *objItem_Detail_ViewController=[[Choose_Restaurant alloc]init];
    [self.navigationController pushViewController:objItem_Detail_ViewController animated:YES];
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    
    mimages=[[UIImageView alloc]init];
    mimages.image=[UIImage imageNamed:[Images_array objectAtIndex:indexPath.row]];
     [mimages setFrame:CGRectMake(((cell.frame.size.width-90)/2)-20,20,cell.frame.size.width-90, 120)];
    mimages.layer.cornerRadius=5;
    mimages.clipsToBounds=YES;
    mimages.layer.borderWidth=1;
    mimages.layer.borderColor=[UIColor whiteColor].CGColor;
    [cell.contentView addSubview:mimages];

    
    
    
    mCount_LB = [[UILabel alloc] init];
    mCount_LB.textColor = [UIColor blackColor];
    [mCount_LB setFrame:CGRectMake(10,(cell.frame.size.height+70)/2,45, 45)];
    mCount_LB.backgroundColor=[UIColor clearColor];
    mCount_LB.textColor=[UIColor whiteColor];
    [mCount_LB setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    mCount_LB.text=[NSString stringWithFormat:@"%ld",indexPath.row+1];
    mCount_LB.backgroundColor=[UIColor colorWithRed:60.0f/255.0f green:60.0f/255.0f blue:55.0f/255.0f alpha:1.0];
    mCount_LB.layer.cornerRadius=0.5*45;
    mCount_LB.clipsToBounds=YES;
    mCount_LB.textAlignment=NSTextAlignmentCenter;
    [cell.contentView addSubview:mCount_LB];
    
    
    mBlack_LB = [[UILabel alloc] init];
    mBlack_LB.textColor = [UIColor blackColor];
    [mBlack_LB setFrame:CGRectMake(0,mimages.frame.size.height-30,mimages.frame.size.width, 30)];
    mBlack_LB.backgroundColor=[UIColor clearColor];
    mBlack_LB.textColor=[UIColor whiteColor];
    mBlack_LB.userInteractionEnabled=NO;
    [mBlack_LB setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    mBlack_LB.text=[name_array objectAtIndex:indexPath.row];
    mBlack_LB.backgroundColor=[UIColor colorWithRed:00.0f/255.0f green:00.0f/255.0f blue:00.0f/255.0f alpha:0.5];
    mBlack_LB.textAlignment=NSTextAlignmentCenter;
    [mimages addSubview:mBlack_LB];
    
    cell.backgroundColor=[UIColor clearColor];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
