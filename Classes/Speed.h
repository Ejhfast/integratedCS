//
//  Speed.h
//  integratedCSapp
//
//  Created by Ethan Fast on 12/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCLController.h"


@interface Speed : UIViewController <MyCLControllerDelegate> {
	UILabel *speedT;
	CLLocation *prevCord;
	float prevMilliTime;
	int counter;
	MyCLController *locationController;

}

- (void)locationUpdate:(CLLocation *)location;
- (void)locationError:(NSError *)error;

@property (nonatomic, retain) IBOutlet UILabel *speedT;
@property (nonatomic, retain) IBOutlet CLLocation *prevCord;



@end
