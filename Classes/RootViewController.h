//
//  RootViewController.h
//  integratedCSapp
//
//  Created by Ethan Fast on 11/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sizingViewController.h"
#import "MapView.h"

@interface RootViewController : UITableViewController {
	sizingViewController *sizeView;
	MapView *mapView;
	NSMutableArray *navArray;
}

@property (nonatomic, retain) IBOutlet sizingViewController *sizeView;
@property (nonatomic, retain) IBOutlet MapView *mapView;


@end
