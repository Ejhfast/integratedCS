//
//  XMLParser.h
//  sizing
//
//  Created by Ethan Fast on 11/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
#import <Foundation/Foundation.h>


@interface XmlParser : NSObject {
	NSString *currentValue;
	NSString *currentElement;

}

@property (nonatomic, retain) NSString *currentValue;
@property (nonatomic, retain) NSString *currentElement;


@end
