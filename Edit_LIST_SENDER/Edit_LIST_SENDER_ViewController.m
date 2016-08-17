//
//  Edit_LIST_SENDER_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 20/05/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Edit_LIST_SENDER_ViewController.h"
#import "MFSideMenu.h"

#import "Edit_Account_Info_ViewController.h"
#import "Edit_License_ViewController.h"
#import "Edit_Profile_Pic_ViewController.h"
#import "Credit_Card_ ViewController.h"
#import "Change_Password_ViewController.h"
@interface Edit_LIST_SENDER_ViewController ()

@end

@implementation Edit_LIST_SENDER_ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [self setupMenuBarButtonItems];
    
    List_item=[[NSMutableArray alloc]initWithObjects:@"Profile Pic",@"License",@"Account Info",@"Billing Information",@"Change Password",nil];
    
    UIImageView *backGround=[[UIImageView alloc]init];
    backGround.image=[UIImage imageNamed:@"main_slider_bg.jpg"];
    backGround.frame=CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height);
    backGround.userInteractionEnabled=YES;
    [self.view addSubview:backGround];
    
    
    ///////////////////////////// Title\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    MTitle = [[UILabel alloc] init];
    MTitle.textColor = [UIColor blackColor];
    [MTitle setFrame:CGRectMake(0,0,self.view.frame.size.width, 64)];
    MTitle.backgroundColor=[UIColor clearColor];
    MTitle.textColor=[UIColor whiteColor];
    MTitle.userInteractionEnabled=NO;
    [MTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    MTitle.text= @"Edit User Detail";
    MTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    MTitle.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:MTitle];
    
    
    
    ///////////////////////////// Back Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Slider_Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [Slider_Button addTarget:self
                      action:@selector(Slider_Back:)
            forControlEvents:UIControlEventTouchUpInside];
    [Slider_Button setImage:[UIImage imageNamed:@"nav_button.png"] forState:UIControlStateNormal];
  Slider_Button.frame = CGRectMake(10,15,35,35);
    [self.view addSubview:Slider_Button];
    
    
    
    ////////////////////////////    UitableView Show \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    mtableview = [[UITableView alloc] initWithFrame:CGRectMake(0,64, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height-64) style:UITableViewStylePlain];
    
    mtableview.delegate = self;
    mtableview.dataSource = self;
    mtableview.allowsSelection = YES;
    mtableview.hidden=NO;
    mtableview.separatorColor=[UIColor colorWithRed:88.0f/255.0f green:90.0f/255.0f blue:91.0f/255.0f alpha:1.0];
    mtableview.backgroundColor = [UIColor clearColor];
    mtableview.tableFooterView = [UIView new];
    [self.view addSubview:mtableview];
    
    ///[mtableview selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:0];
    
}

-(void)Slider_Back:(UIButton *)sender
{
    [self leftSideMenuButtonPressed];
    
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



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return [List_item count];
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
    EDIT_VIEW_Name=[[UILabel alloc]init];
    EDIT_VIEW_Name.frame=CGRectMake(60,19, mtableview.frame.size.width-100, 30);
    EDIT_VIEW_Name.backgroundColor=[UIColor clearColor];
    EDIT_VIEW_Name.textColor=[UIColor colorWithRed:88.0f/255.0f green:90.0f/255.0f blue:91.0f/255.0f alpha:1.0];
    cell.backgroundColor=[UIColor whiteColor];
    
    [EDIT_VIEW_Name setFont:[UIFont fontWithName:@"bariol-regular" size:18.0]];
    ///   }
    
    EDIT_VIEW_Name.text=[List_item objectAtIndex:indexPath.row];
    [cell.contentView addSubview:EDIT_VIEW_Name];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.row==0) {
        
        
        Edit_Profile_Pic_ViewController *demoController = [[Edit_Profile_Pic_ViewController alloc] init];
        [self.navigationController  pushViewController:demoController animated:YES];
        
        
    }
    
    else if (indexPath.row==1) {
        
        
        Edit_License_ViewController *demoController = [[Edit_License_ViewController alloc] init];
        [self.navigationController  pushViewController:demoController animated:YES];
        
        
        
    }
    
    else if (indexPath.row==2) {
        
        
        Edit_Account_Info_ViewController *demoController = [[Edit_Account_Info_ViewController alloc] init];
        [self.navigationController  pushViewController:demoController animated:YES];
        
        
        
        
        
    }
    
    else if (indexPath.row==3) {
        
        
         Credit_Card__ViewController *demoController = [[ Credit_Card__ViewController alloc] init];
        [self.navigationController  pushViewController:demoController animated:YES];
        
        
        
        
        
    }
    
    else if (indexPath.row==4) {
        
        
        Change_Password_ViewController *demoController = [[ Change_Password_ViewController alloc] init];
        [self.navigationController  pushViewController:demoController animated:YES];
        
        
        
        
        
    }

    
    
}

#pragma mark -
#pragma mark - UIBarButtonItems

- (void)setupMenuBarButtonItems {
    self.navigationItem.rightBarButtonItem = [self rightMenuBarButtonItem];
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


@end
