//
//  Speed.m
//  integratedCSapp
//
//  Created by Ethan Fast on 12/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Speed.h"


@implementation Speed

@synthesize speedT, prevCord, prevDate;

- (void) locationUpdate: (CLLocation *) location {
	counter++;
	NSLog(@"in function");
	if (prevCord != nil && prevDate != nil){
		NSLog(@"prevcord not nil");
		if (counter % 1 == 0) {
			NSLog(@"updating");
			double now = [prevDate timeIntervalSinceNow] * -1000;
			NSLog(@"did date");
			NSLog(@"did diff time %g",now);
			float fdiffx = location.coordinate.latitude - prevCord.coordinate.latitude;
			NSLog(@"calc lat diff");
			float fdiffy = location.coordinate.longitude - prevCord.coordinate.longitude;
			NSLog(@"calc ong diff");
			double diff_dist = sqrt( pow(fdiffx,2.0) + pow(fdiffy, 2.0));
			speedT.text = [[NSString alloc] initWithFormat:@"%.5f", (diff_dist / now)];
			NSLog(@"updated");
		}
	}
	else {
		NSLog(@"else block");
		prevCord = [[CLLocation alloc] initWithLatitude:location.coordinate.latitude longitude:location.coordinate.longitude];
		prevDate = [[NSDate alloc] init];
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
