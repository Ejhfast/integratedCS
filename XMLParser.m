//
//  XMLParser.m
//  sizing
//
//  Created by Ethan Fast on 11/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "XmlParser.h"


@implementation XmlParser

@synthesize currentValue,res;

- (void) initialize {
	res = [[NSMutableArray alloc] init];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{                    
	//NSLog(@"found this element: %@", elementName);
	currentElement = [elementName copy];
	if ([elementName isEqualToString:@"inches"] || [elementName isEqualToString:@"name"] || [elementName isEqualToString:@"distance"]) {
        // clear out our caches...
        currentValue = [ [NSMutableString alloc] init];
	}
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{     
	//NSLog(@"ended element: %@", elementName);
	if ([elementName isEqualToString:@"inches"] || [elementName isEqualToString:@"name"] || [elementName isEqualToString:@"distance"]) {
        // save values to an item, then store that item into the array...
        NSLog(@"adding result: %@", currentValue);
		NSString *news = [[NSString alloc] init];
		news = [NSString stringWithFormat:@"%@", currentValue];
		[res addObject:currentValue];
	}
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	//NSLog(@"found characters: %@", string);
	// save the characters for the current item...
	if ([currentElement isEqualToString:@"inches"] || [currentElement isEqualToString:@"name"] || [currentElement isEqualToString:@"distance"]) {
        [currentValue appendString:string];
	}
}


@end
