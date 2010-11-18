//
//  DistanceCalc.m
//  integratedCSapp
//
//  Created by Ethan Fast on 11/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DistanceCalc.h"


@implementation DistanceCalc

@synthesize dist, coordTrack;

- (void) locationUpdate: (CLLocation *) location {
	if (track == 1) {
		[coordTrack addObject:location];
		NSLog(@"added object");
	}
	NSLog(@"in here");
}

- (void)locationError:(NSError *)error {
    NSLog([error description]);
}

- (void) reset {
	[coordTrack removeAllObjects];
	track = 0;
	dist.text = @"N/A";
}

- (void) start {
	track = 1;
}

- (void) ping {
	NSMutableString *coordString = [[NSMutableString alloc] initWithFormat:@""];
	int limit = [coordTrack count];
	for (int i = 0; i < limit; i = i + 1) {
		CLLocation *loc = [coordTrack objectAtIndex:i];
		float tlat = loc.coordinate.latitude;
		float tlon = loc.coordinate.longitude;
		[coordString appendString: [[NSString alloc] initWithFormat:@"[%.2f,%.2f]",tlat,tlon]];
		if (i != limit-1) {
			[coordString appendString:@","];
		}
		NSLog(coordString);

	}
	NSString *myurl = [[NSString alloc] 
					   initWithFormat:@"http://vibramconverter.heroku.com/coordinate_distance.xml?coords=[%@]", coordString];
	NSLog(@"%@",myurl);
	NSString *reply = [Webservices callRestService:myurl];
	dist.text = reply;
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
	coordTrack = [[NSMutableArray alloc] init];
	track = 0;
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
