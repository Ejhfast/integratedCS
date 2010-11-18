//
//  MapView.h
//  integratedCSapp
//
//  Created by Ethan Fast on 11/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MapView : UIViewController {
	UIImageView *foot1;
	UIImageView *foot2;
	UIImageView *glass;
	//NSTimer *timer;

}

- (IBOutlet) done;
- (IBAction) shiftUp;
- (IBAction) shiftDown;
- (IBAction) glassAppear;
- (IBAction) glassGone;

@property (nonatomic, retain) UIImageView *foot1;
@property (nonatomic, retain) UIImageView *foot2;
@property (nonatomic, retain) UIImageView *glass;
//@property (nonatomic, retain) NSTimer *timer;


@end
