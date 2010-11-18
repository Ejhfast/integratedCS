//
//  MyCLController.h
//  integratedCSapp
//
//  Created by Ethan Fast on 11/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol MyCLControllerDelegate 
@required
- (void)locationUpdate:(CLLocation *)location;
- (void)locationError:(NSError *)error;
@end


@interface MyCLController : NSObject {
	CLLocationManager *locationManager;
	id delegate;
}
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation;

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error;

@property (nonatomic, retain) CLLocationManager *locationManager;  
@property (nonatomic, assign) id  delegate;



@end
