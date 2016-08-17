//
//  MapViewAnnotation.m
//  MapViewExample1
//
//  Created by Ravi Shankar on 04/01/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import "MapViewAnnotation.h"

@implementation MapViewAnnotation

@synthesize coordinate=_coordinate;
@synthesize title=_title;
@synthesize annotationID=_annotationID;

-(id) initWithTitle:(NSString *) title AndCoordinate:(CLLocationCoordinate2D)coordinate annID:(NSString *)idStr
{
    self =  [super init];
    _title = title;
    _coordinate = coordinate;
    _annotationID= idStr;
    return self;
}

@end
