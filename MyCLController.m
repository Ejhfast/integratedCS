//
//  MyCLController.m
//  integratedCSapp
//
//  Created by Ethan Fast on 11/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MyCLController.h"


@implementation MyCLController

@synthesize locationManager, delegate;

- (id) init {
    self = [super init];
    if (self != nil) {
        self.locationManager = [[[CLLocationManager alloc] init] autorelease];
        self.locationManager.delegate = self; // send loc updates to myself
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    [self.delegate locationUpdate:newLocation];
}

- (void)locationManager:(CLLocationManager *)manager
	   didFailWithError:(NSError *)error
{
    [self.delegate locationError:error];
}

@end
