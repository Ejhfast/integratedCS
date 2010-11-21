//
//  Webservice.h
//  sizing
//
//  Created by Ethan Fast on 11/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Webservices : NSObject {

}

+(id)callRestService: (NSString *) methodName : (NSDictionary *) params;
+(id)getLatitudeList: (NSString *) methodName : (NSDictionary *) params;


@end
