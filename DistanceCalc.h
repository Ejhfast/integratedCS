//
//  DistanceCalc.h
//  integratedCSapp
//
//  Created by Ethan Fast on 11/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCLController.h"
#import "Webservices.h"


@interface DistanceCalc : UIViewController <MyCLControllerDelegate> {
	IBOutlet UILabel *dist;
	int track;
	NSMutableArray *coordTrack;
	MyCLController *locationController;
}

- (IBAction) start;
- (IBAction) reset;
- (IBAction) ping;

- (void)locationUpdate:(CLLocation *)location;
- (void)locationError:(NSError *)error;

@property (nonatomic, retain) IBOutlet UILabel *dist;
@property (nonatomic, retain) IBOutlet NSMutableArray *coordTrack;

@end
