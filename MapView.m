//
//  MapView.m
//  integratedCSapp
//
//  Created by Ethan Fast on 11/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MapView.h"


@implementation MapView

@synthesize foot1,foot2,glass;

- (void) initFoot {
	self.foot1 = [[UIImageView alloc] initWithFrame: CGRectMake(60, 150, 77, 94)];
	self.foot2 = [[UIImageView alloc] initWithFrame: CGRectMake(180, 150, 77, 94)];
	self.glass = [[UIImageView alloc] initWithFrame: CGRectMake(300, 60, 50, 50)];
	self.foot1.opaque = YES;
	self.foot2.opaque = YES;
	self.glass.opaque = YES;
	[self.view addSubview:self.foot1];
	[self.view addSubview:self.foot2];
	[self.view addSubview:self.glass];
	[self defaultFoot];
}

- (void) defaultFoot {
	[self.foot1 setImage:[UIImage imageNamed:@"foot.png"]];
	[self.foot2 setImage:[UIImage imageNamed:@"foot.png"]];
}

- (void) glassAppear {
	[self.glass setImage:[UIImage imageNamed:@"glass.png"]];
}

-(void) moveFoot: (UIImageView *)foot dist:(CGFloat)dist {
	//foot.transform = CGAffineTransformMakeTranslation(0, dist);
	CGRect old = foot.frame;
	if ((foot.frame.origin.y > 30 || dist > 0) && (foot.frame.origin.y < 220 || dist < 0)) {
		foot.frame = CGRectMake(old.origin.x, old.origin.y + dist, foot.frame.size.width, foot.frame.size.height);

	}
}

- (void) moveGlass: (CGFloat) dist {
	CGRect old = glass.frame;
	glass.frame = CGRectMake(old.origin.x + dist, old.origin.y, glass.frame.size.width, glass.frame.size.height);
}

- (void) moveGlassLeft: (NSTimer *)timer {
	if (glass.frame.origin.x < 30) {
		[timer invalidate];
	}
	[self moveGlass: -10];
}

-(void) shiftUp {
	[self moveFoot:foot1 dist:30];
	[self moveFoot:foot2 dist:-30];
}

-(void) shiftDown {
	[self moveFoot:foot1 dist:-30];
	[self moveFoot:foot2 dist:30];
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
	[self initFoot];
	
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

- (IBAction) done {
	[self.navigationController popViewControllerAnimated:YES];
	//[[self parentViewController] dismissModalViewControllerAnimated:YES];
}


@end
