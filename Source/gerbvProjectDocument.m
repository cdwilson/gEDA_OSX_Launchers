//
//  gerbvProjectDocument.m
//  X11Wrapper
//
//  Created by Matthew Sarnoff on 5/31/10.
//	www.msarnoff.org
//	computers_are_l@me.com
//

#import "X11WrapperDocument.h"

@class gerbvDocument;

@interface gerbvProjectDocument : X11WrapperDocument
{
}
@end

@implementation gerbvProjectDocument

- (NSString *)defaultExecutableName
{
	return @"gerbv";
}

- (NSArray *)additionalArguments
{
	return [NSArray arrayWithObject:@"-p"];
}


@end
