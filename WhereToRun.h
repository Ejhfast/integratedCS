//
//  WhereToRun.h
//  integratedCSapp
//
//  Created by Ethan Fast on 11/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Webservices.h"
#import "MyCLController.h"


@interface WhereToRun : UIViewController <MyCLControllerDelegate> {
	IBOutlet UILabel *response;
	IBOutlet UILabel *lat;
	IBOutlet UILabel *lon;
	NSString *food;
	MyCLController *locationController;
}
-(IBAction) ask;
-(IBAction) toggle;
- (void)locationUpdate:(CLLocation *)location;
- (void)locationError:(NSError *)error;
@property (nonatomic, retain) IBOutlet UILabel *response;
@property (nonatomic, retain) IBOutlet UILabel *lat;
@property (nonatomic, retain) IBOutlet UILabel *lon;




@end
