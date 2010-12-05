//
//  TimeTableController.m
//  integratedCSapp
//
//  Created by Ethan Fast on 12/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TimeTableController.h"


@implementation TimeTableController  
@synthesize managedObjectContext, eventArray;   

// ...  
// ... default commented code from the file template  
// ...   

- (void)viewDidLoad {   
	
    [super viewDidLoad];  
    self.title = @"Lap Times";  
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTime:)];  
    self.navigationItem.rightBarButtonItem = addButton;  
    [addButton release];  
    [self fetchRecords];   
	
}   

- (void)addTime:(id)sender {   
	
    Event *event = (Event *)[NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:managedObjectContext];  
    [event setTimeStamp: [NSDate date]];   
	
    NSError *error;  
	
    if(![managedObjectContext save:&error]){  
		
        //This is a serious error saying the record  
        //could not be saved. Advise the user to  
        //try again or restart the application.   
		
    }  
	
    [eventArray insertObject:event atIndex:0];  
	
    [self.tableView reloadData];  
	
}  

- (void)fetchRecords {   
	
    // Define our table/entity to use  
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:managedObjectContext];   
	
    // Setup the fetch request  
    NSFetchRequest *request = [[NSFetchRequest alloc] init];  
    [request setEntity:entity];   
	
    // Define how we will sort the records  
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeStamp" ascending:NO];  
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];  
    [request setSortDescriptors:sortDescriptors];  
    [sortDescriptor release];   
	
    // Fetch the records and handle an error  
    NSError *error;  
    NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];   
	
    if (!mutableFetchResults) {  
        // Handle the error.  
        // This is a serious error and should advise the user to restart the application  
    }   
	
    // Save our fetched data to an array  
    [self setEventArray: mutableFetchResults];  
    [mutableFetchResults release];  
    [request release];  
}   

// ...  
// ... more template comments and default method definitions  
// ...   

- (void)dealloc {  
    [managedObjectContext release];  
    [eventArray release];  
    [super dealloc];  
}   

@end   