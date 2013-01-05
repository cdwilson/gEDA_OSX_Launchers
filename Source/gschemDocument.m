//
//  gschemDocument.m
//  X11Wrapper
//
//  Created by Matthew Sarnoff on 5/31/10.
//	www.msarnoff.org
//	computers_are_l@me.com
//

#import "X11WrapperDocument.h"

@interface gschemDocument : X11WrapperDocument
{
}
@end

@implementation gschemDocument

- (NSString *)defaultExecutableName
{
	return @"gschem";
}

@end
