//
//  MapViewAnnotation.h
//  Where-a-mazoo
//
//  Created by Vig Sachidananda on 9/16/12.
//  Copyright (c) 2012 Vig Sachidananda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapViewAnnotation : NSObject <MKAnnotation>
{
    NSString *title;
	CLLocationCoordinate2D coordinate;
}

@property (strong, nonatomic) NSString *title;
@property (nonatomic) CLLocationCoordinate2D coordinate;


- (id)initWithTitle:(NSString *)ttl andCoordinate:(CLLocationCoordinate2D)c2d;



@end
