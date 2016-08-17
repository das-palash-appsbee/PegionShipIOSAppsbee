//
//  MORE_INFO_DETAIL_ViewController.h
//  PigeonShip
//
//  Created by Bhushan Bawa on 16/06/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface MORE_INFO_DETAIL_ViewController : UIViewController<UIWebViewDelegate,NSURLConnectionDelegate>
{
    UIActivityIndicatorView *activityView;
    UIWebView *webView;
    BOOL isDone;
    NSURLConnection *con;
    NSURLRequest *req;
    UIButton *Back_BTN;
    
}
@property(nonatomic, strong)UIActivityIndicatorView *activityIndicator;
@property(nonatomic, strong)NSString *URL_VALUE;


@end
