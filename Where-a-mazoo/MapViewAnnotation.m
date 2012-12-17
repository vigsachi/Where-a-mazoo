//
//  MapViewAnnotation.m
//  Where-a-mazoo
//
//  Created by Vig Sachidananda on 9/16/12.
//  Copyright (c) 2012 Vig Sachidananda. All rights reserved.
//

#import "MapViewAnnotation.h"

@implementation MapViewAnnotation
@synthesize title;
@synthesize coordinate;

- (id)initWithTitle:(NSString *)ttl andCoordinate:(CLLocationCoordinate2D)c2d {
	self = [super init];
	title = ttl;
	coordinate = c2d;
	return self;
}





@end
