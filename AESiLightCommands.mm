#import "AESiLightCommands.h"

@implementation AESiLightCommands

-(id)init
{
	if ( (self = [super init]) )
	{
		// additional initialization
	}
	return self;
}

-(void)dealloc
{
	// additional cleaning
	[super dealloc];
}

-(BOOL)handleSpeech:(NSString*)text tokens:(NSArray*)tokens tokenSet:(NSSet*)tokenset context:(id<SEContext>)ctx
{
	// logging useful during development
	// NSLog(@">> AESiLightCommands handleSpeech: %@", text);

	// react to recognized tokens (what happen or what happened)
	if ([tokens count] == 1 && [tokenset containsObject:@"snippet"])
	{
		// properties for the snippet (optional)
		NSDictionary* snipProps = [NSDictionary dictionaryWithObject:@"It's working!" forKey:@"text"];

		// create an array of views
		NSMutableArray* views = [NSMutableArray arrayWithCapacity:1];
		[views addObject:[ctx createAssistantUtteranceView:@"This is a custom snippet:"]];
		[views addObject:[ctx createSnippet:@"AESiLightSnippet" properties:snipProps]];

		// send views to the assistant
		[ctx sendAddViews:views];

		// alternatively, for utterance response, you can use this call only:
		//[ctx sendAddViewsUtteranceView:@"Hello Snippet!!"];
		// alternatively, for snippet response you can use this call only:
		//[ctx sendAddViewsSnippet:@"K3AHelloSnippet" properties:snipProps];

		// Inform the assistant that this is end of the request
		// For more complex extensions, you can spawn an additional thread and process request asynchronly,
		// ending with sending "request completed"
		[ctx sendRequestCompleted];

		return YES; // the command has been handled by our extension (ignore the original one from the server)
	}

	return NO;
}

@end
// vim:ft=objc
