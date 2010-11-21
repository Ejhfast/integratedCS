//
//  RouteAnnotation.h
//  integratedCSapp
//
//  Created by Ethan Fast on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface RouteAnnotation : NSObject <MKAnnotation> {
	CLLocationCoordinate2D coordinate;
	NSString *title;
	NSString *subtitle;
}

+ (id)annotationWithCoordinate:(CLLocationCoordinate2D)coordinate;
- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate;

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@end
