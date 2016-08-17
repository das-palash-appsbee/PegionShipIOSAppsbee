//
//  Term_ condition_ViewController.h
//  Pigeonship
//
//  Created by Bhushan Bawa on 23/04/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Term__condition_ViewController : UIViewController<UIWebViewDelegate,NSURLConnectionDelegate>
{
    UIActivityIndicatorView *activityView;
    UIWebView *webView;
    BOOL isDone;
    NSURLConnection *con;
    NSURLRequest *req;
    UIButton *Back_BTN;
    
}
@property(nonatomic, strong)UIActivityIndicatorView *activityIndicator;

@end



