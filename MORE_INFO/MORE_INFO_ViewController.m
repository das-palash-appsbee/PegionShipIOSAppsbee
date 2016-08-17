//
//  MORE_INFO_ViewController.m
//  PigeonShip
//
//  Created by Bhushan Bawa on 16/06/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "MORE_INFO_ViewController.h"
#import "MFSideMenu.h"
#import "MORE_INFO_DETAIL_ViewController.h"
#import "Utility.h"

#define kBaseURL @"https://www.pigeonship.com/apppages/"

#define kBaseURL_dyn @"https://www.pigeonship.com/apppages/index/"


@interface MORE_INFO_ViewController ()

@end

@implementation MORE_INFO_ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
     [self setupMenuBarButtonItems];
    
   
    
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
    MTitle.text= @"More Information";
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


-(void)viewWillAppear:(BOOL)animated
{
    [self performSelector:@selector(CalltheServer) withObject:nil afterDelay:0.2];
    [self mActivityIndicater];
}


#pragma mark - -*********************
#pragma mark Activity Indicater
#pragma mark - -*********************

-(void)mActivityIndicater
{
    loader = [[UIView alloc] initWithFrame:CGRectMake(([[UIScreen mainScreen]bounds].size.width-64)/2,[[UIScreen mainScreen]bounds].size.height/2,64,64)];
    
    loader.backgroundColor=[UIColor colorWithRed:61.0f/255.0f green:61.0f/255.0f blue:61.0f/255.0f alpha:1.0];
    loader.layer.cornerRadius=5;
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    CGRect frame = spinner.frame;
    frame.origin.x = loader.frame.size.width / 2 - frame.size.width / 2;
    frame.origin.y = loader.frame.size.height / 2 - frame.size.height / 2;
    spinner.frame = frame;
    [loader addSubview:spinner];
    [spinner startAnimating];
    [self.view addSubview:loader];
}


#pragma mark - -*********************
#pragma mark  CalltheServer
#pragma mark - -*********************


-(void)CalltheServer
{
    
    
    
    
    
    if ([API connectedToInternet]==YES) {
        
        //------------ Call API for signup With Post Method --------------//
        
        NSString *responseString = [API makeCallPost:[NSString stringWithFormat:@"%@activepages",[Utility API_link_url]]];
        
        NSLog(@"%@",responseString);
        
        NSDictionary *responseDict = [responseString JSONValue];
        dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
        
        
        
//        if ([[dict valueForKey:@"status"] isEqualToString:@"true"]) {
//            
//            alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
//            [alert show];
//        }
//        
//        else
//        {
//
//            
//                      alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:[dict valueForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
//                       [alert show];
//            
//            
//
//            
//        }
//        
        
        [mtableview reloadData];
    }
    
    else
    {
        
        
        
        alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Not connected to the internet" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
    
    [loader removeFromSuperview];
    
    
    
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
    
    
    UILabel  * label = [[UILabel alloc] initWithFrame:CGRectMake(70, 20, self.view.frame.size.width-75, 9999)];
    label.numberOfLines=0;
    label.font = [UIFont fontWithName:@"OpenSans" size:18];
    
    
    if (indexPath.row==0) {
        
        
        return 50;

        
    }
    else if (indexPath.row==1)
    {
         return 50;

    }
    else if (indexPath.row==2)
    {
       return 50;

    }
    else if (indexPath.row==3)
    {
         return 50;

    }
    else
    {
        
        
        NSMutableParagraphStyle *style  = [[NSMutableParagraphStyle alloc] init];
        style.minimumLineHeight = 20.f;
        style.maximumLineHeight = 20.f;
        NSDictionary *attributtes = @{NSParagraphStyleAttributeName : style,};

        
        label.attributedText = [[NSAttributedString alloc] initWithString:[[[[dict valueForKey:@"data"]objectAtIndex:indexPath.row-4]valueForKey:@"title"]uppercaseString]
                                                                        attributes:attributtes];

        
        CGSize maximumLabelSize = CGSizeMake(self.view.frame.size.width-75, 9999);
        CGSize expectedSize = [label sizeThatFits:maximumLabelSize];
        return expectedSize.height+26;
    }
 
    
}


// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return [[dict valueForKey:@"data"]count]+4;
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
    EDIT_VIEW_Name.numberOfLines = 0;

    EDIT_VIEW_Name.backgroundColor=[UIColor clearColor];
    EDIT_VIEW_Name.textColor=[UIColor colorWithRed:88.0f/255.0f green:90.0f/255.0f blue:91.0f/255.0f alpha:1.0];
    cell.backgroundColor=[UIColor whiteColor];
    
    [EDIT_VIEW_Name setFont:[UIFont fontWithName:@"bariol-regular" size:17.0]];
    
    
    if (indexPath.row==0) {
        
        
         EDIT_VIEW_Name.text=[@"FAQ" uppercaseString];
        
    }
    else if (indexPath.row==1)
    {
          EDIT_VIEW_Name.text=[@"HELP" uppercaseString];
    }
    else if (indexPath.row==2)
    {
          EDIT_VIEW_Name.text=[@"CONTACT" uppercaseString];
    }
    else if (indexPath.row==3)
    {
          EDIT_VIEW_Name.text=[@"Terms and Conditions" uppercaseString];
    }
    else
    {
        
        NSMutableParagraphStyle *style  = [[NSMutableParagraphStyle alloc] init];
        style.minimumLineHeight = 20.f;
        style.maximumLineHeight = 20.f;
        NSDictionary *attributtes = @{NSParagraphStyleAttributeName : style,};
        
        EDIT_VIEW_Name.attributedText = [[NSAttributedString alloc] initWithString:[[[[dict valueForKey:@"data"]objectAtIndex:indexPath.row-4]valueForKey:@"title"]uppercaseString]
                                                               attributes:attributtes];

    }
     [EDIT_VIEW_Name sizeToFit];
    
    [cell.contentView addSubview:EDIT_VIEW_Name];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    MORE_INFO_DETAIL_ViewController *OBJ_MORE_INFO_DETAIL_ViewController=[[MORE_INFO_DETAIL_ViewController alloc]init];
    
    
    if (indexPath.row==0) {
        
        
        
        OBJ_MORE_INFO_DETAIL_ViewController.URL_VALUE=[NSString stringWithFormat:@"%@%@",kBaseURL,@"faq"];
        
        [self.navigationController pushViewController:OBJ_MORE_INFO_DETAIL_ViewController animated:YES];

        
    }
    
    else if (indexPath.row==1) {
        
        
        OBJ_MORE_INFO_DETAIL_ViewController.URL_VALUE=[NSString stringWithFormat:@"%@%@",kBaseURL,@"help"];
        
        [self.navigationController pushViewController:OBJ_MORE_INFO_DETAIL_ViewController animated:YES];

        
    }
    
    else if (indexPath.row==2) {
        
        
        MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
        if ([MFMailComposeViewController canSendMail]) {
            controller.mailComposeDelegate = self;
            [controller setToRecipients:[NSArray arrayWithObjects:@"Support@pigeonship.com", nil]];
            [controller setMessageBody:@"" isHTML:NO];
            if (controller) {
                [self presentViewController:controller animated:YES completion:nil];
            }
        
        }
   }
    
    else if (indexPath.row==3) {
        
        
        OBJ_MORE_INFO_DETAIL_ViewController.URL_VALUE=@"https://www.pigeonship.com/TermsConditions";
        
        [self.navigationController pushViewController:OBJ_MORE_INFO_DETAIL_ViewController animated:YES];

        
    }
    else
    {
        
        
        OBJ_MORE_INFO_DETAIL_ViewController.URL_VALUE=[NSString stringWithFormat:@"%@%@",kBaseURL_dyn,[[[dict valueForKey:@"data"]objectAtIndex:indexPath.row-4]valueForKey:@"slug"]];
        [self.navigationController pushViewController:OBJ_MORE_INFO_DETAIL_ViewController animated:YES];

    }
    
    
}


- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultSent:
            
            
            alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Email successfully sent" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
           
            [alert show];

            
            //NSLog(@"You sent the email.");
            break;
        case MFMailComposeResultSaved:
            
            alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"You saved a draft of this email" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            
            [alert show];
            

            
            NSLog(@"You saved a draft of this email");
            break;
        case MFMailComposeResultCancelled:
            
            
            alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:@"You cancelled sending this email." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            
            [alert show];
            

            
            NSLog(@"You cancelled sending this email.");
            break;
        case MFMailComposeResultFailed:
            
            alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:@"Mail failed:  An error occurred when trying to compose this email" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            
            [alert show];
            

            
            NSLog(@"Mail failed:  An error occurred when trying to compose this email");
            break;
        default:
            
            
            alert = [[UIAlertView alloc] initWithTitle:@"An error has occurred" message:@"An error occurred when trying to compose this email" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            
            [alert show];
            

            
            NSLog(@"An error occurred when trying to compose this email");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
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
