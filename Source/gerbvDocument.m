//
//  gerbvDocument.m
//  X11Wrapper
//
//  Created by Matthew Sarnoff on 5/31/10.
//	www.msarnoff.org
//	computers_are_l@me.com
//

#import "X11WrapperDocument.h"

@interface gerbvDocument : X11WrapperDocument
{
}
@end

@implementation gerbvDocument

- (NSString *)defaultExecutableName
{
	return @"gerbv";
}

@end
