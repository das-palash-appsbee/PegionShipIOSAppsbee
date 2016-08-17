//
//  Make_A_Paid.m
//  PigeonShip
//
//  Created by Bhushan Bawa on 05/05/16.
//  Copyright © 2016 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Make_A_Paid.h"

@interface Make_A_Paid ()

@end

@implementation Make_A_Paid


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
    [sMTitle setFrame:CGRectMake(0,20,self.view.frame.size.width, 40)];
    sMTitle.backgroundColor=[UIColor clearColor];
    sMTitle.textColor=[UIColor whiteColor];
    sMTitle.userInteractionEnabled=NO;
    [sMTitle setFont:[UIFont fontWithName:@"bariol-regular" size:20.0]];
    sMTitle.text= @"Step 5-Make A Paid Takeout Order";
    sMTitle.textColor=[UIColor colorWithRed:203.0f/255.0f green:203.0f/255.0f blue:203.0f/255.0f alpha:1.0];
    sMTitle.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:sMTitle];
    
    
    
    UITextView *descriptionTextView = [[UITextView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x+20, sMTitle.frame.origin.y+sMTitle.frame.size.height+10,self.view.frame.size.width-40,150)];
    descriptionTextView.text=@"Step 1,2,3,4 & 5 are done!You'll be connected with a Pigeon shortly by text and email notification.Step 1,2,3,4 & 5 are done!You'll be connected with a Pigeon shortly by text and email notification.Step 1,2,3,4 & 5 are done!You'll be connected with a Pigeon shortly by text and email notification.\n Get ready to call Costa Vida and place your PAID take-out order.\n ";
    descriptionTextView.textColor=[UIColor colorWithRed:201.0f/255.0f green:202.0f/255.0f blue:197.0f/255.0f alpha:1.0 ];
    descriptionTextView.font=[UIFont systemFontOfSize:12];
    descriptionTextView.editable=NO;
    descriptionTextView.backgroundColor=[UIColor clearColor];
    //    descriptionTextView.attributedText=attributeString;
    [self.view addSubview:descriptionTextView];
    
    
    UILabel  *tollfreeLabel=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.origin.x+30, descriptionTextView.frame.origin.y+descriptionTextView.frame.size.height+10, self.view.frame.size.width-60,30)];
    tollfreeLabel.text=@"Costa Vida-801-323-3030";
    [tollfreeLabel setTextAlignment:NSTextAlignmentCenter];
    [tollfreeLabel setFont:[UIFont systemFontOfSize:20]];
    [tollfreeLabel setTextColor:[UIColor colorWithRed:201.0f/255.0f green:202.0f/255.0f blue:197.0f/255.0f alpha:1.0 ]];
    [self.view addSubview:tollfreeLabel];
    //adding image to the left of the tollfree label text
    UIImageView *tollImage=[[UIImageView alloc]initWithFrame:CGRectMake(tollfreeLabel.frame.origin.x+10, descriptionTextView.frame.origin.y+descriptionTextView.frame.size.height+15, 20, 20)];
    //phone icon image
    tollImage.image=[UIImage imageNamed:@"phoneIcon.png"];
    [self.view addSubview:tollImage];
    
    UIButton *viewMenuBtn=[[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width-320)/2, tollfreeLabel.frame.origin.y+tollfreeLabel.frame.size.height+280,320,50)];
    [viewMenuBtn setTitle:@"View Menu" forState:UIControlStateNormal];
    [viewMenuBtn setTitleColor:[UIColor colorWithRed:114.0f/255.0f green:110.0f/255.0f blue:107.0f/255.0f alpha:1.0 ] forState:UIControlStateNormal];
    viewMenuBtn.layer.cornerRadius=25;
    viewMenuBtn.backgroundColor=[UIColor colorWithRed:247.0f/255.0f green:212.0f/255.0f blue:0.0f/255.0f alpha:1.0 ];
    
    
    [viewMenuBtn addTarget:self
                      action:@selector(viewMenuBtn:)
            forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:viewMenuBtn];
    
    


}


-(void)viewMenuBtn:(UIButton *)sender
{
//    Make_A_Paid *objItem_Detail_ViewController=[[Make_A_Paid alloc]init];
//    [self.navigationController pushViewController:objItem_Detail_ViewController animated:YES];
    
    
}



-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:
(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
    }
    return YES;
}
-(void)textViewDidBeginEditing:(UITextView *)textView{
    NSLog(@"Did begin editing");
}
-(void)textViewDidChange:(UITextView *)textView{
    NSLog(@"Did Change");
    
}
-(void)textViewDidEndEditing:(UITextView *)textView{
    NSLog(@"Did End editing");
    
}
-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    [textView resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
