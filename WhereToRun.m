//
//  WhereToRun.m
//  integratedCSapp
//
//  Created by Ethan Fast on 11/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WhereToRun.h"


@implementation WhereToRun

@synthesize response;

-(void) ask {
	NSLog(@"asking?");
	NSString *myurl = [[NSString alloc] 
					   initWithFormat:@"http://plato.cs.virginia.edu/~cs4501g10/buildingListService.php?lat=%@&lng=%@", lat.text, lon.text];
	NSLog(@"%@",myurl);
	NSString *reply = [Webservices callRestService:myurl];
	response.text = reply;
}

- (void)locationUpdate:(CLLocation *)location {
    lat.text = [[NSString alloc] initWithFormat:@"%.02f", location.coordinate.latitude];
    lon.text = [[NSString alloc] initWithFormat:@"%.02f", location.coordinate.longitude];
}

- (void)locationError:(NSError *)error {
    response.text = [error description];
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
