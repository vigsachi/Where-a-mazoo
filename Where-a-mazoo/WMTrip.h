//
//  WMTrip.h
//  Where-a-mazoo
//
//  Created by Vig Sachidananda on 9/15/12.
//  Copyright (c) 2012 Vig Sachidananda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WMBlogPost.h"
#import <MapKit/MapKit.h>

@interface WMTrip : NSObject

@property (strong, nonatomic) NSString *tripLocation;
@property (strong, nonatomic) NSString *tripStartDate;
@property (strong, nonatomic) NSString *tripEndDate;
@property (strong, nonatomic) NSString *tripComments;
@property (strong, nonatomic) WMBlogPost *tripBlogPost;
@property (nonatomic) CLLocationCoordinate2D tripCoordinates;
@property (nonatomic) double tripLatitude;
@property (nonatomic) double tripLongitude;


@end
