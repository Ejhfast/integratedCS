//
//  PlotRun.m
//  integratedCSapp
//
//  Created by Ethan Fast on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PlotRun.h"


@implementation PlotRun

@synthesize mapView, addAnnotation;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void) makeAnnotation: (double)lat longitude:(double)lon {
	
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	span.latitudeDelta=0.2;
	span.longitudeDelta=0.2;
	NSLog(@"lat:%d, lon:%d",currentLocation.latitude, currentLocation.longitude);
	
	region.span=span;
	CLLocationCoordinate2D newloc;
	newloc.latitude = lat;
	newloc.longitude = lon;
	region.center=newloc;

	RouteAnnotation *newAnnotation;
	newAnnotation = [[RouteAnnotation alloc] initWithCoordinate:newloc];
	[mapView addAnnotation:newAnnotation];
	[mapView setRegion:region animated:TRUE];
	[mapView regionThatFits:region];
	
	NSLog(@"Adding location");

}

- (void)viewDidLoad {
	[super viewDidLoad];
	NSString *myurl = [[NSString alloc] 
					   initWithFormat:@"http://vibramconverter.heroku.com/obstacles"];
	NSArray *reply = [Webservices getLatitudeList:myurl];
	for (int i = 0; i < [reply count] - 1; i=i+2) {
		double lat = [[reply objectAtIndex:i] doubleValue];
		double lon = [[reply objectAtIndex:i+1] doubleValue];
		[self makeAnnotation:lat longitude:lon];
	}
	
}


- (void)locationUpdate:(CLLocation *)location {
    currentLocation.latitude = location.coordinate.latitude;
	currentLocation.longitude = location.coordinate.longitude;
	//NSLog(@"lat:%d, lon:%d",currentLocation.latitude, currentLocation.longitude);
}

- (void)locationError:(NSError *)error {
}

- (IBAction) showPoint {
	NSMutableURLRequest *request =
	[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://vibramconverter.heroku.com/obstacles/create"]];
	[request setHTTPMethod:@"POST"];
	
	NSString *postString = [[NSString alloc] initWithFormat:@"latitude=%.04f&longitude=%.04f",currentLocation.latitude, currentLocation.longitude];
	[request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
	
	[[NSURLConnection alloc] initWithRequest:request delegate:self];	
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	span.latitudeDelta=0.2;
	span.longitudeDelta=0.2;
	NSLog(@"lat:%d, lon:%d",currentLocation.latitude, currentLocation.longitude);

	region.span=span;
	region.center=currentLocation;
	/*
	if(addAnnotation != nil) {
		[mapView removeAnnotation:addAnnotation];
		[addAnnotation release];
		addAnnotation = nil;
	}*/
	RouteAnnotation *newAnnotation;
	newAnnotation = [[RouteAnnotation alloc] initWithCoordinate:currentLocation];
	[mapView addAnnotation:newAnnotation];
	[mapView setRegion:region animated:TRUE];
	[mapView regionThatFits:region];
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation{
    MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"currentloc"];
    annView.pinColor = MKPinAnnotationColorGreen;
    annView.animatesDrop=TRUE;
    annView.canShowCallout = YES;
    annView.calloutOffset = CGPointMake(-5, 5);
    return annView;
}

- (void) recenterMap {
	NSArray *coordinates = [self.mapView valueForKeyPath:@"annotations.coordinate" ];
	CLLocationCoordinate2D maxCoord = {-90.0f, -180.0f};
	CLLocationCoordinate2D minCoord = {90.0f, 180.0f};
	for(NSValue *value in coordinates) {
		CLLocationCoordinate2D coord = {0.0f, 0.0f};
		[value getValue:&coord];
		if(coord.longitude > maxCoord.longitude) {
			maxCoord.longitude = coord.longitude;
		}
		if(coord.latitude > maxCoord.latitude) {
			maxCoord.latitude = coord.latitude;
		}
		if(coord.longitude < minCoord.longitude) {
			minCoord.longitude = coord.longitude;
		}
		if(coord.latitude < minCoord.latitude) {
			minCoord.latitude = coord.latitude;
		}
	}
	MKCoordinateRegion region = {{0.0f, 0.0f}, {0.0f, 0.0f}};
	region.center.longitude = (minCoord.longitude + maxCoord.longitude) / 2.0;
	region.center.latitude = (minCoord.latitude + maxCoord.latitude) / 2.0;
	region.span.longitudeDelta = maxCoord.longitude - minCoord.longitude;
	region.span.latitudeDelta = maxCoord.latitude - minCoord.latitude;
	[self.mapView setRegion:region animated:YES];
}

- (void) viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	locationController = [[MyCLController alloc] init];
	locationController.delegate = self;
	[locationController.locationManager startUpdatingLocation];
	
}
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
