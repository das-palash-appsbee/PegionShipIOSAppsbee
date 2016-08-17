//
//  See_Bundle_Packages_action.m
//  PigeonShip
//
//  Created by Bhushan Bawa on 07/03/16.
//  Copyright © 2016 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "See_Bundle_Packages_action.h"

@interface See_Bundle_Packages_action ()

@end

@implementation See_Bundle_Packages_action
@synthesize Bundle_package;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",Bundle_package);
    
    UIImageView *backGround=[[UIImageView alloc]init];
    backGround.image=[UIImage imageNamed:@"main_slider_bg.jpg"];
    backGround.frame=CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height);
    backGround.userInteractionEnabled=YES;
    [self.view addSubview:backGround];

    self.navigationController.navigationBarHidden=YES;
    
    ///////////////////////////// Back Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    Back_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [Back_BTN addTarget:self
                 action:@selector(Back:)
       forControlEvents:UIControlEventTouchUpInside];
    [Back_BTN setImage:[UIImage imageNamed:@"back_.png"] forState:UIControlStateNormal];
    
    
    Back_BTN.frame = CGRectMake(10,10,49,26);
    [self.view addSubview:Back_BTN];
    

    
    ////////////////////////////    UitableView Show \\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    mtableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height-50) style:UITableViewStylePlain];
    mtableview.delegate = self;
    mtableview.dataSource = self;
    mtableview.allowsSelection = NO;
    mtableview.hidden=NO;
    mtableview.separatorColor=[UIColor clearColor];
    mtableview.backgroundColor = [UIColor clearColor];
    
    // mtableview.separatorColor=[UIColor colorWithRed:218.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1.0];
    mtableview.separatorInset = UIEdgeInsetsZero;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7){
        mtableview.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    }
    
    
    [self.view addSubview:mtableview];
    
    
    }
-(void)Back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return [Bundle_package count];
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
    
    
    
    if (indexPath.row%2==0) {
        cell.backgroundColor=[UIColor colorWithRed:120.0f/255.0f green:117.0f/255.0f blue:114.0f/255.0f alpha:0.4];
        
    }
    else
    {
        cell.backgroundColor=[UIColor colorWithRed:104.0f/255.0f green:101.0f/255.0f blue:98.0f/255.0f alpha:0.4];
        
    }
    

    
    address = [[UILabel alloc] init];
    address.textColor = [UIColor blackColor];
    [address setFrame:CGRectMake(20,30,100, 22)];
    address.backgroundColor=[UIColor clearColor];
    address.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    address.userInteractionEnabled=NO;
    [address setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
    
    address.textAlignment=NSTextAlignmentLeft;
    address.text=@"Address";
    [cell.contentView addSubview:address];
    
    address_TX = [[UILabel alloc] init];
    address_TX.textColor = [UIColor blackColor];
    [address_TX setFrame:CGRectMake(address.frame.origin.x+address.frame.size.width+5,30,cell.frame.size.width-(address.frame.origin.x+address.frame.size.width+20), 22)];
    address_TX.backgroundColor=[UIColor clearColor];
    address_TX.textColor=[UIColor whiteColor];
    address_TX.userInteractionEnabled=NO;
    [address_TX setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
    
    address_TX.textAlignment=NSTextAlignmentRight;
    address_TX.text=[[Bundle_package valueForKey:@"address"]objectAtIndex:indexPath.row];
   
    
    [cell.contentView addSubview:address_TX];
    

    
    
    ///////////////////////////////////////////////////
    
    
    city = [[UILabel alloc] init];
    city.textColor = [UIColor blackColor];
    [city setFrame:CGRectMake(20,address.frame.origin.y+address.frame.size.height,100, 22)];
    city.backgroundColor=[UIColor clearColor];
    city.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    city.userInteractionEnabled=NO;
    [city setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
    
    city.textAlignment=NSTextAlignmentLeft;
    city.text=@"City";

    [cell.contentView addSubview:city];
    
    
    city_TX = [[UILabel alloc] init];
    city_TX.textColor = [UIColor blackColor];
    [city_TX setFrame:CGRectMake(city.frame.origin.x+city.frame.size.width+5,address.frame.origin.y+address.frame.size.height,cell.frame.size.width-(city.frame.origin.x+city.frame.size.width+20), 22)];
    
    city_TX.backgroundColor=[UIColor clearColor];
    city_TX.textColor=[UIColor whiteColor];

    city_TX.userInteractionEnabled=NO;
    [city_TX setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
    city_TX.text=[[Bundle_package valueForKey:@"city"]objectAtIndex:indexPath.row];
    city_TX.textAlignment=NSTextAlignmentRight;
    [cell.contentView addSubview:city_TX];
    
    
    
    ///////////////////////////////////////////////////
    

    state = [[UILabel alloc] init];
    state.textColor = [UIColor blackColor];
    [state setFrame:CGRectMake(20,city.frame.origin.y+city.frame.size.height,100, 22)];
    state.backgroundColor=[UIColor clearColor];
    state.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    state.userInteractionEnabled=NO;
    [state setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
    
    state.textAlignment=NSTextAlignmentLeft;
    state.text=@"State";
    [cell.contentView addSubview:state];
    
    
    
    
    
    state_TX = [[UILabel alloc] init];
    state_TX.textColor = [UIColor blackColor];
    [state_TX setFrame:CGRectMake(state.frame.origin.x+state.frame.size.width+5,city.frame.origin.y+city.frame.size.height,cell.frame.size.width-(state.frame.origin.x+state.frame.size.width+20), 22)];
    state_TX.backgroundColor=[UIColor clearColor];
    state_TX.textColor=[UIColor whiteColor];

    state_TX.userInteractionEnabled=NO;
    [state_TX setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
    
    state_TX.textAlignment=NSTextAlignmentRight;
      state_TX.text=[[Bundle_package valueForKey:@"state"]objectAtIndex:indexPath.row];
    [cell.contentView addSubview:state_TX];

    
    
    
    ///////////////////////////////////////////////////
    
    
    zip = [[UILabel alloc] init];
    zip.textColor = [UIColor blackColor];
    [zip setFrame:CGRectMake(20,state.frame.origin.y+state.frame.size.height,200, 22)];
    zip.backgroundColor=[UIColor clearColor];
    zip.textColor=[UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:179.0f/255.0f alpha:1.0];
    zip.userInteractionEnabled=NO;
    [zip setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
    
    zip.textAlignment=NSTextAlignmentLeft;
     zip.text=@"Zip";
    [cell.contentView addSubview:zip];
    
    
    
    zip_TX = [[UILabel alloc] init];
    zip_TX.textColor = [UIColor blackColor];
    [zip_TX setFrame:CGRectMake(zip.frame.origin.x+zip.frame.size.width+5,state.frame.origin.y+state.frame.size.height,cell.frame.size.width-(zip.frame.origin.x+zip.frame.size.width+20), 22)];
    zip_TX.backgroundColor=[UIColor clearColor];
   zip_TX.textColor=[UIColor whiteColor];
    zip_TX.userInteractionEnabled=NO;
    [zip_TX setFont:[UIFont fontWithName:@"bariol-regular" size:13.0]];
    
    zip_TX.textAlignment=NSTextAlignmentRight;
    zip_TX.text=[[Bundle_package valueForKey:@"zip"]objectAtIndex:indexPath.row];
    
    [cell.contentView addSubview:zip_TX];

    
        return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   }



@end
