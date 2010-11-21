//
//  PlotRun.h
//  integratedCSapp
//
//  Created by Ethan Fast on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "RouteAnnotation.h"
#import "MyCLController.h"
#import "Webservices.h"


@interface PlotRun : UIViewController <MyCLControllerDelegate> {
	MKMapView *mapView;
	RouteAnnotation *addAnnotation;
	MyCLController *locationController;
	CLLocationCoordinate2D currentLocation;
}
-(IBAction) showPoint;
- (void)locationUpdate:(CLLocation *)location;
- (void)locationError:(NSError *)error;
- (void) makeAnnotation: (double)lat longitude:(double)lon;

@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) IBOutlet RouteAnnotation *addAnnotation;



@end
