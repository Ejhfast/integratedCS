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

- (void) pollServer: (id) sender {
	NSString *myurl = [[NSString alloc] 
					   initWithFormat:@"http://vibramconverter.heroku.com/vibram/convert/%@.male.xml", tosend];
	NSLog(myurl);
	NSString *reply = [Webservices callRestService:myurl];
	response.text = reply;

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
	float minsize = 10.0;
	sizeArray = [[NSMutableArray alloc] init];
	for (float i = minsize; i <= 12.5; i = i + 0.5) {
		if( round(i) > i ){
			[sizeArray addObject: [NSString stringWithFormat:@"%g", i]];
		}
		else {
			[sizeArray addObject: [NSString stringWithFormat:@"%g.0", i]];
		}
	}
	tosend = [sizeArray objectAtIndex:0];
					
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
