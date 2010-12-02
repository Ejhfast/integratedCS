//
//  CalcMiles.m
//  integratedCSapp
//
//  Created by Muzzammil Zaveri on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CalcMiles.h"


@implementation CalcMiles

@synthesize totalDist, coord;



- (void) locationUpdate: (CLLocation *) location {
	if (onOff == 1) {
		[coord addObject:location];
		NSLog(@"added object");
	}
	NSLog(@"in here");
}

- (void)locationError:(NSError *)error {
    NSLog([error description]);
}

- (IBAction) start {
	onOff = 1;
	[coord removeAllObjects];
	totalDist.text = @"0.0";
	//
	
	
}

-(void) serverPing{
	NSMutableString *coordString = [[NSMutableString alloc] initWithFormat:@""];
	int limit = [coord count];
	for (int i = 0; i < limit; i = i + 1) {
		CLLocation *loc = [coord objectAtIndex:i];
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
	totalDist.text = reply;
	
}

- (IBAction) stop {
	onOff = 0;
	[self serverPing];
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

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 */


- (void)viewDidLoad {
    [super viewDidLoad];
	coord = [[NSMutableArray alloc] init];
	onOff = 0;
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
