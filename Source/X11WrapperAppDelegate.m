//
//  X11WrapperAppDelegate.m
//  X11Wrapper
//
//  Created by Matthew Sarnoff on 5/31/10.
//	www.msarnoff.org
//	computers_are_l@me.com
//

#import "X11WrapperAppDelegate.h"
#import "X11WrapperDocument.h"

@implementation X11WrapperAppDelegate

// Only create an untitled document at startup, not every time the dock icon is clicked
- (BOOL)applicationShouldOpenUntitledFile:(NSApplication *)sender
{
	return ([[[NSDocumentController sharedDocumentController] documents] count] == 0);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
	// Kill all subtasks
	[[[NSDocumentController sharedDocumentController] documents]
	 makeObjectsPerformSelector:@selector(killTask)];	
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(documentDidClose:)
												 name:X11TaskDidTerminate
											   object:nil];
}

- (void)documentDidClose:(NSNotificationCenter *)aNotification
{
	// If the last instance has been killed, quit the application.
	NSUInteger numDocuments = [[[NSDocumentController sharedDocumentController] documents] count];
	if (numDocuments <= 1)
		[NSApp terminate:self];
}

// The launcher app should never be active since it's just a wrapper.
// If the user activates this app, switch to X11.
- (void)applicationDidBecomeActive:(NSNotification *)aNotification
{
	// Switch to X11.app. Only on 10.6 and higher.
	NSUInteger numDocuments = [[[NSDocumentController sharedDocumentController] documents] count];
	if (NSClassFromString(@"NSRunningApplication") != NULL && numDocuments >= 1)
	{
		NSArray *x11Apps = [NSRunningApplication runningApplicationsWithBundleIdentifier:@"org.x.X11"];
		if ([x11Apps count] >= 1)
			[[x11Apps objectAtIndex:0] activateWithOptions:NSApplicationActivateAllWindows];
	}
}

@end
