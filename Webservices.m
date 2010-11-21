//
//  Webservice.m
//  sizing
//
//  Created by Ethan Fast on 11/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Webservices.h"
#import "XMLParser.h"


@implementation Webservices

+(id)callRestService: (NSString *) methodName
{
	NSURL *url=[NSURL URLWithString:methodName];
	XmlParser *xmlParser = [[XmlParser alloc] init];
	
	NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
	[parser setDelegate:xmlParser];
	//[parser setShouldProcessNamespaces:NO];
	//[parser setShouldReportNamespacePrefixes:NO];
	//[parser setShouldResolveExternalEntities:NO];
	[xmlParser initialize];
	[parser parse];
	[parser release];
	NSLog(@"%@",[xmlParser.res objectAtIndex:0]);
	return [xmlParser.res objectAtIndex:0];
}

+(id)getLatitudeList: (NSString *) methodName
{
	NSURL *url=[NSURL URLWithString:methodName];
	XmlParser *xmlParser = [[XmlParser alloc] init];
	
	NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
	[parser setDelegate:xmlParser];
	//[parser setShouldProcessNamespaces:NO];
	//[parser setShouldReportNamespacePrefixes:NO];
	//[parser setShouldResolveExternalEntities:NO];
	[xmlParser initialize];
	[parser parse];
	[parser release];
	return xmlParser.res ;
}

@end
