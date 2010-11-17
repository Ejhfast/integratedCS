//
//  sizingViewController.m
//  sizing
//
//  Created by Ethan Fast on 11/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "sizingViewController.h"

@implementation sizingViewController

@synthesize sizes;
@synthesize tosend;
@synthesize response;
@synthesize mOrf;

- (void) pollServer {
	NSArray *split = [tosend componentsSeparatedByString:@"."];
	NSString *myurl = [[NSString alloc] 
					   initWithFormat:@"http://vibramconverter.heroku.com/convert/%@/%@/%@.xml",
					   [split objectAtIndex:0], [split objectAtIndex:1], mOrf];
	NSLog(myurl);
	NSString *reply = [Webservices callRestService:myurl];
	response.text = reply;

}

- (void) toggleGender {
	NSLog(@"toggle!");
	if ([mOrf isEqualToString:@"male"]) {
		mOrf = @"female";
	}
	else {
		mOrf = @"male";
	}
	[self pollServer] ;
}
/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
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



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	mOrf = @"male"; // misogyny
	float minsize = 8;
	sizeArray = [[NSMutableArray alloc] init];
	for (float i = minsize; i <= 12.5; i = i + 1) {
		for (float j = 0; j < 1; j = j + .25) {
			int frac = j * 100;
				[sizeArray addObject: [NSString stringWithFormat:@"%g.%d", i, frac]];
		}
	}
	tosend = [sizeArray objectAtIndex:0];
	[self pollServer] ;
					
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
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

- (IBAction) done {
	[self.navigationController popViewControllerAnimated:YES];
	//[[self parentViewController] dismissModalViewControllerAnimated:YES];
}

// Picker View Stuff

- (NSInteger) numberOfComponentsInPickerView: (UIPickerView *) pickerView {
	return 1;
}

- (void) pickerView: (UIPickerView *) pickerView didSelectRow: (NSInteger) row inComponent: (NSInteger) component {
	tosend = [sizeArray objectAtIndex:row];
	[self pollServer] ;
}

- (NSInteger) pickerView: (UIPickerView *) pickerView numberOfRowsInComponent: (NSInteger) component;
{
	return [sizeArray count];
	
}

- (NSString *) pickerView: (UIPickerView *) pickerView titleForRow: (NSInteger) row forComponent: (NSInteger) component;
{
	return [sizeArray objectAtIndex:row];
}

@end
