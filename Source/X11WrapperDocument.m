//
//  X11WrapperDocument.m
//  X11Wrapper
//
//  Created by Matthew Sarnoff on 5/31/10.
//	www.msarnoff.org
//	computers_are_l@me.com
//

#import "X11WrapperDocument.h"

NSString *X11TaskDidTerminate = @"X11TaskDidTerminate";

@implementation X11WrapperDocument

- (NSString *)defaultPath
{
	return @"/usr/local/bin/";
}

- (NSString *)defaultExecutableName
{
	return @"";
}

- (NSArray *)additionalArguments
{
	return [NSArray array];
}

// Don't create any window controllers or load any nibs
- (void)makeWindowControllers
{
}

- (BOOL)_launchTaskWithFileURL:(NSURL *)fileURL
{
	// Get executable path
	NSString *exePath = [[NSUserDefaults standardUserDefaults] stringForKey:@"path"];
	if (!exePath)
	{
		exePath = [[self defaultPath] stringByAppendingPathComponent:[self defaultExecutableName]];
		[[NSUserDefaults standardUserDefaults] setObject:exePath forKey:@"path"];
		[[NSUserDefaults standardUserDefaults] synchronize];
	}
	
	// Launch gschem
	@try {
		_task = [[NSTask alloc] init];
		
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(taskDidTerminate:)
													 name:NSTaskDidTerminateNotification
												   object:_task];
		
		NSMutableArray *args = [[self additionalArguments] mutableCopy];
		if (fileURL)
			[args addObject:[fileURL path]];

		[_task setArguments:args];
		[_task setLaunchPath:exePath];
		[_task launch];
		[args release];
	}
	@catch (NSException *e) {
		NSRunAlertPanel(@"Could not start application",
						@"Failed to launch %@.\n"
						@"Please set the path to the executable with the following terminal command:\n\n"
						@"defaults write %@ path <path>\n\n"
						@"where <path> is the path to the executable.",
						nil,
						nil,
						nil,
						exePath,
						[[NSBundle mainBundle] bundleIdentifier]);
		exit(EXIT_FAILURE);
	}
	return YES;
}

- (void)killTask
{
	if (_task && [_task isRunning])
	{
		[_task terminate];
		[_task release];
		_task = nil;
	}	
}


- (id)initWithType:(NSString *)typeName error:(NSError **)outError
{
	if ((self = [super init]))
	{
		if (![self _launchTaskWithFileURL:nil])
			return nil;
	}
	return self;
}

- (id)initWithContentsOfURL:(NSURL *)absoluteURL ofType:(NSString *)typeName error:(NSError **)outError
{
	if ((self = [super init]))
	{
		if (![self _launchTaskWithFileURL:absoluteURL])
			return nil;
	}
	return self;
}

- (void)dealloc
{
	[self killTask];
	[super dealloc];
}

- (void)taskDidTerminate:(NSNotification *)aNotification
{
	[[NSNotificationCenter defaultCenter] postNotificationName:X11TaskDidTerminate
														object:self];
	[self close];
}

@end

