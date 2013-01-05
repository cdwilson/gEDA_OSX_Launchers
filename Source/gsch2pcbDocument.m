//
//  gsch2pcbDocument.m
//  X11Wrapper
//
//  Created by Matthew Sarnoff on 5/31/10.
//	www.msarnoff.org
//	computers_are_l@me.com
//

#import "X11WrapperDocument.h"

@interface gsch2pcbDocument : X11WrapperDocument
{
}
@end

@implementation gsch2pcbDocument

- (NSString *)defaultExecutableName
{
	return @"xgsch2pcb";
}

@end
