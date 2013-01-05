//
//  X11WrapperDocument.h
//  X11Wrapper
//
//  Created by Matthew Sarnoff on 5/31/10.
//	www.msarnoff.org
//	computers_are_l@me.com
//

#import <Cocoa/Cocoa.h>

extern NSString *X11TaskDidTerminate;

@interface X11WrapperDocument : NSDocument
{
	NSTask *_task;
}

- (void)killTask;

// Subclasses only need to override these methods to return the default name/path of the executable
- (NSString *)defaultPath;
- (NSString *)defaultExecutableName;

// Subclasses can also specify additional arguments to be added before the filename
- (NSArray *)additionalArguments;

@end
