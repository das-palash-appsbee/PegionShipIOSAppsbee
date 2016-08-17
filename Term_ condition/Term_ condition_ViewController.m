//
//  Term_ condition_ViewController.m
//  Pigeonship
//
//  Created by Bhushan Bawa on 23/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Term_ condition_ViewController.h"

@interface Term__condition_ViewController ()

@end

@implementation Term__condition_ViewController

@synthesize activityIndicator;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    ///////////////////////////// Back Button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    UIImageView *backGround=[[UIImageView alloc]init];
    backGround.backgroundColor=[UIColor colorWithRed:52.0f/255.0f green:52.0f/255.0f blue:52.0f/255.0f alpha:1.0];
    backGround.frame=CGRectMake(0, 0, self.view.frame.size.width,50);
    backGround.userInteractionEnabled=YES;
    [self.view addSubview:backGround];

    
    Back_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [Back_BTN addTarget:self
                 action:@selector(back:)
       forControlEvents:UIControlEventTouchUpInside];
    [Back_BTN setImage:[UIImage imageNamed:@"back_.png"] forState:UIControlStateNormal];
    
    
    Back_BTN.frame = CGRectMake(10,10,49,26);
    [self.view addSubview:Back_BTN];
    
    
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(10, 50, [[UIScreen mainScreen]bounds].size.width-20, [[UIScreen mainScreen]bounds].size.height-50)];
    webView.delegate = self;
    webView.scalesPageToFit = YES;
    webView.delegate=self;
    [webView.scrollView setShowsVerticalScrollIndicator:NO];
    
    webView.backgroundColor = [UIColor whiteColor];
    for (UIView* subView in [webView subviews])
    {
        if ([subView isKindOfClass:[UIScrollView class]]) {
            for (UIView* shadowView in [subView subviews])
            {
                if ([shadowView isKindOfClass:[UIImageView class]]) {
                    [shadowView setHidden:YES];
                }
            }
        }
    }
    
    NSURL *url = [NSURL URLWithString:@"https://www.pigeonship.com/TermsConditions"];
    req = [NSURLRequest requestWithURL:url];
    [webView loadRequest:req];
    [self.view addSubview:webView];
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    activityView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityView.color=[UIColor blackColor];
    [activityView setCenter:self.view.center];
    [webView addSubview:activityView];
}

-(void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (!isDone) {
        
        isDone=NO;
        con=[[NSURLConnection alloc]initWithRequest:req delegate:self startImmediately:YES];
        [con start];
        return NO;
    }
    
    
    return YES;
}


- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [activityView startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activityView stopAnimating];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [activityView stopAnimating];
}

-(void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    if ([challenge previousFailureCount]==0) {
        isDone=YES;
        NSURLCredential *credential=[NSURLCredential credentialForTrust:(__bridge SecTrustRef)(challenge.proposedCredential)];
        
        [challenge.sender useCredential:credential forAuthenticationChallenge:challenge];
    }
    else
    {
        [[challenge sender]cancelAuthenticationChallenge:challenge];
        
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    isDone=YES;
    [webView loadRequest:req];
    [con cancel];
}




- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
{
    return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
}

@end
