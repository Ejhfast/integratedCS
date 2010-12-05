//
//  TimeTableController.h
//  integratedCSapp
//
//  Created by Ethan Fast on 12/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Event.h"

@interface TimeTableController : UITableViewController {   
	
    NSManagedObjectContext *managedObjectContext;  
    NSMutableArray *eventArray;   
	
}   

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;  
@property (nonatomic, retain) NSMutableArray *eventArray;   

- (void) fetchRecords;  
- (void) addTime:(id)sender;   

@end  

@end
