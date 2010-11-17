//
//  sizingViewController.h
//  sizing
//
//  Created by Ethan Fast on 11/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Webservices.h"

@interface sizingViewController : UIViewController <NSXMLParserDelegate> {
	IBOutlet UILabel *response;
	IBOutlet UIPickerView *sizes;
	NSMutableArray *sizeArray;
	NSString *tosend;
	NSString *mOrf;
}

- (IBAction) pollServer ;
- (IBAction) toggleGender ;
- (IBAction) done ;

@property (nonatomic, retain) IBOutlet UILabel *response;
@property (nonatomic, retain) IBOutlet UIPickerView *sizes;
@property (nonatomic, retain) NSMutableArray *sizeArray;
@property (nonatomic, retain) NSString *tosend;
@property (nonatomic, retain) NSString *mOrf;



@end

