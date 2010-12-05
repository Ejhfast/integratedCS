//
//  Speed.m
//  integratedCSapp
//
//  Created by Ethan Fast on 12/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Speed.h"


@implementation Speed

@synthesize speedT, prevCord;

- (void) locationUpdate: (CLLocation *) location {
	counter++;
	NSLog(@"in here");

	if (prevCord != nil){
		NSLog(@"in here");
	if (counter % 100) {
		double now = [[NSDate date] timeIntervalSince1970];
		double diff_time = now - prevMilliTime;
		double fdiffx = location.coordinate.latitude - prevCord.coordinate.latitude;
		double fdiffy = location.coordinate.longitude - prevCord.coordinate.longitude;
		double diff_dist = sqrt( pow(fdiffx,2.0) + pow(fdiffy, 2.0));
		speedT = [[NSString alloc] initWithFormat:"%g", diff_dist];
		prevMilliTime = now;
	}
	else {
		prevCord = location;
	}

	}
}

- (void)locationError:(NSError *)error {
    NSLog([error description]);
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	prevMilliTime = [[NSDate date] timeIntervalSince1970];
	counter = 0;
	locationController = [[MyCLController alloc] init];
	locationController.delegate = self;
	[locationController.locationManager startUpdatingLocation];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
