//
//  CalcMiles.h
//  integratedCSapp
//
//  Created by Muzzammil Zaveri on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCLController.h"
#import "Webservices.h"


@interface CalcMiles : UIViewController <MyCLControllerDelegate> {
	
	IBOutlet UILabel *totalDist;
	NSMutableArray *coord;
	int onOff;
	MyCLController *locationController;
	
}

- (IBAction) start;
- (IBAction) stop;
- (void) serverPing;

- (void)locationUpdate:(CLLocation *)location;
- (void)locationError:(NSError *)error;

@property (nonatomic, retain) IBOutlet UILabel *totalDist;
@property (nonatomic, retain) IBOutlet NSMutableArray *coord;

@end