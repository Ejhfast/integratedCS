    //
//  DemoTableViewController.m
//  integratedCSapp
//
//  Created by Muzzammil Zaveri on 12/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DemoTableViewController.h"
#include <stdlib.h>


@implementation DemoTableViewController

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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.

- (void)viewDidLoad {
    [super viewDidLoad];
	
    self.title = @"Pull to Refresh";
    items = [[NSMutableArray alloc] initWithObjects:@"How many miles to run?", nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	
    cell.textLabel.text = [items objectAtIndex:indexPath.row];
	cell.textLabel.textAlignment = UITextAlignmentCenter;
	cell.textLabel.font = [UIFont systemFontOfSize:25];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
	
    return cell;
}

- (void)refresh {
	
	if ([items count] == 2) {
		[items removeObjectAtIndex:0];
		[self performSelector:@selector(addItem) withObject:nil afterDelay:2.0];
	}
	else {
		[self performSelector:@selector(addItem) withObject:nil afterDelay:2.0];
	}
}

- (void)addItem {
    // Add a new time
	NSInteger r = arc4random() % 21;
    //NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    //[dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    //NSString *now = [dateFormatter stringFromDate:[NSDate date]];
    [items insertObject:[NSString stringWithFormat:@"%d mile(s)", r] atIndex:0];
    [self.tableView reloadData];
	
    [self stopLoading];
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
	[items release];
    [super dealloc];
}


@end
