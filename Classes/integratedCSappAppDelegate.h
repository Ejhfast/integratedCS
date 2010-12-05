//
//  integratedCSappAppDelegate.h
//  integratedCSapp
//
//  Created by Ethan Fast on 11/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface integratedCSappAppDelegate : NSObject <UIApplicationDelegate> {
 
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;




@end

