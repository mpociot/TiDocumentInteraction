/**
 * TiUIDocumentInteractionController
 *
 * Created by Your Name
 * Copyright (c) 2014 Your Company. All rights reserved.
 */

#import "DeMarcelpociotDocumentinteractionModule.h"
#import <UIKit/UIKit.h>
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "TiApp.h"
#import "TiUIButtonProxy.h"
#import "TiViewProxy.h"


@implementation DeMarcelpociotDocumentinteractionModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"fd264c39-d7f4-417b-8a3c-dcfaaba35137";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"de.marcelpociot.documentinteraction";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];

	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably

	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup

-(id)showDialog:(id)args
{
    ENSURE_UI_THREAD(showDialog, args);
    ENSURE_SINGLE_ARG(args, NSDictionary);
    
    NSURL* url = [TiUtils toURL:[args objectForKey:@"url"] proxy:self];
    UIActivityViewController* activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[url] applicationActivities:nil];
    NSLog(@"[INFO] Loading file: %@", url);
    
    if( [TiUtils isIPad] )
    {
        UIPopoverController* popover = [[UIPopoverController alloc] initWithContentViewController:activityVC];
        if( [args objectForKey:@"view"] )
        {
            TiViewProxy* popoverViewProxy = [args objectForKey:@"view"];
            TiApp* tiApp = [TiApp app];
            UIView* poView = [tiApp controller].view;
            if (popoverViewProxy!=nil)
            {
                poView = [popoverViewProxy view];
            }
            [popover presentPopoverFromRect:poView.bounds inView:poView permittedArrowDirections:UIPopoverArrowDirectionAny animated:[TiUtils boolValue:[args objectForKey:@"animated"] def:YES]];
        } else {
            UIBarButtonItem* navBarButton = ((TiUIButtonProxy *)[args objectForKey:@"navBarButton"]).barButtonItem;
            [popover presentPopoverFromBarButtonItem:navBarButton permittedArrowDirections:UIPopoverArrowDirectionAny animated:[TiUtils boolValue:[args objectForKey:@"animated"] def:YES]];
        }
    } else {
        [[[TiApp app] controller] presentViewController:activityVC animated:[TiUtils boolValue:[args objectForKey:@"animated"] def:YES] completion:nil];
    }
    
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(id)example:(id)args
{
	// example method
	return @"hello world";
}

-(id)exampleProp
{
	// example property getter
	return @"hello world";
}

-(void)setExampleProp:(id)value
{
	// example property setter
}

@end
