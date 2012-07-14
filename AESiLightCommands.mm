#import "AESiLightCommands.h"
#import <AVFoundation/AVFoundation.h>

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
	//Commands to turn the flashlight on.
	if([tokenset containsObject:@"there's"] && [tokenset containsObject:@"a"] && [tokenset containsObject:@"blackout"])
	{
		[ctx sendAddViewsUtteranceView:@"Will this help?"];
		if(![self turnOn:YES])
		{
			[ctx sendAddViewsUtteranceView:@"I'm sorry, the device I'm trapped in doesn't count with a torch. I'm afraid I can't help you."];
		}
		return YES;
	}

	if([tokenset containsObject:@"turn"] && [tokenset containsObject:@"on"] && ([tokenset containsObject:@"light"] || [tokenset containsObject:@"flashlight"]))
	{
		[ctx sendAddViewsUtteranceView:@"Will this help?"];
		if(![self turnOn:YES])
		{
			[ctx sendAddViewsUtteranceView:@"I'm sorry, the device I'm trapped in doesn't count with a torch. I'm afraid I can't help you."];
		}
		return YES;
	}

	if([tokenset containsObject:@"it's"] && [tokenset containsObject:@"dark"] && [tokenset containsObject:@"here"])
	{
		[ctx sendAddViewsUtteranceView:@"Will this help?"];
		if(![self turnOn:YES])
		{
			[ctx sendAddViewsUtteranceView:@"I'm sorry, the device I'm trapped in doesn't count with a torch. I'm afraid I can't help you."];
		}
		return YES;
	}

	if([tokenset containsObject:@"it's"] && [tokenset containsObject:@"dark"] && [tokenset containsObject:@"here"])
	{
		[ctx sendAddViewsUtteranceView:@"Will this help?"];
		if(![self turnOn:YES])
		{
			[ctx sendAddViewsUtteranceView:@"I'm sorry, the device I'm trapped in doesn't count with a torch. I'm afraid I can't help you."];
		}
		return YES;
	}

	if([tokenset containsObject:@"need"] && ([tokenset containsObject:@"light"] || [tokenset containsObject:@"flashlight"]))
	{
		[ctx sendAddViewsUtteranceView:@"Will this help?"];
		if(![self turnOn:YES])
		{
			[ctx sendAddViewsUtteranceView:@"I'm sorry, the device I'm trapped doesn't count with a torch. I'm afraid I can't help you."];
		}
		return YES;
	}

	//Commands to turn off the flashlight.
	if([tokenset containsObject:@"thanks"] && ([tokenset containsObject:@"light"] || [tokenset containsObject:@"flashlight"]))
	{
		[ctx sendAddViewsUtteranceView:@"I hope that helped!"];
		[self turnOn:NO];
		return YES;
	}

	if([tokenset containsObject:@"turn"] && [tokenset containsObject:@"off"] && ([tokenset containsObject:@"light"] || [tokenset containsObject:@"flashlight"]))
	{
		[ctx sendAddViewsUtteranceView:@"I hope that helped!"];
		[self turnOn:NO];
		return YES;
	}

	return NO;
}

-(BOOL)turnOn:(BOOL)on
{
	AVCaptureTorchMode toggle; //This variable will choose to turn the torch on or off.
	if(on)
	{
		toggle = AVCaptureTorchModeOn;
	}else
	{
		toggle = AVCaptureTorchModeOff;
	}

	AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
	if([device hasTorch])
	{ //If the device has a torch it can turn on...
		[device lockForConfiguration:nil];
		[device setTorchMode:toggle];
		if([device respondsToSelector:@selector(unlockConfiguration)])
		{
			[device performSelector:@selector(unlockConfiguration)];
		}
		return YES; //There were no errors turning on the torch.
	}
	return NO; //There were errors turning on the torch (perhaps the device in question doesn't have one? i.e an iPad running Spire or anything similar).
}

@end
// vim:ft=objc
