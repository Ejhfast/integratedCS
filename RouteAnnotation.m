//
//  RouteAnnotation.m
//  integratedCSapp
//
//  Created by Ethan Fast on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RouteAnnotation.h"

@implementation RouteAnnotation

@synthesize coordinate, title, subtitle;

+ (id)annotationWithCoordinate:(CLLocationCoordinate2D)coordinate {
	return [[[[self class] alloc] initWithCoordinate:coordinate] autorelease];
}

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate {
	self = [super init];
	if(nil != self) {
		self.coordinate = coordinate;
	}
	return self;
}

@end
