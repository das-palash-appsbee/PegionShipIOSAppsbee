//
//  Utility.m
//  PigeonShip
//
//  Created by Bhushan Bawa on 22/06/15.
//  Copyright (c) 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+(NSString *)API_link_url
{
   // NSString *app_main_url=@"https://www.pigeonship.com/api3/";
    
  //  NSString *app_main_url=@"https://www.pigeonship.com/api3/";

NSString *app_main_url=@"http://demo.digiopia.in/pigeonwebapp/api3/";

    return app_main_url;
}


+(NSString *)Pigeon_post_link_url
{
   // NSString *app_main_url=@"https://www.pigeonship.com/Pigeonposting/";
    NSString *app_main_url=@"https://www.pigeonship.com/Pigeonposting/";
    
    return app_main_url;
}

+(NSString *)Pigeon_security_token
{
  return @"PigeonShip@8";

}

@end
