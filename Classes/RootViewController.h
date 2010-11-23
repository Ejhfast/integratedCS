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
#import "WhereToRun.h"
#import "DistanceCalc.h"
#import "PlotRun.h"
#import "CalcMiles.h"

@interface RootViewController : UITableViewController {
	sizingViewController *sizeView;
	MapView *mapView;
	WhereToRun *runView;
	DistanceCalc *distCalc;
	PlotRun *plotView;
	CalcMiles *totalMiles;
	NSMutableArray *navArray;
}

@property (nonatomic, retain) IBOutlet sizingViewController *sizeView;
@property (nonatomic, retain) IBOutlet MapView *mapView;
@property (nonatomic, retain) IBOutlet WhereToRun *runView;
@property (nonatomic, retain) IBOutlet DistanceCalc *distCalc;
@property (nonatomic, retain) IBOutlet PlotRun *plotView;
@property (nonatomic, retain) IBOutlet CalcMiles *totalMiles;



@end
