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
		//NSLog(@"There's a blackout.");
		if([self turnOn:YES])
		{
			[ctx sendAddViewsUtteranceView:@"Will this help?"];
		}else
		{
			[ctx sendAddViewsUtteranceView:@"I'm sorry, the device I'm trapped in doesn't count with a torch. I'm afraid I can't help you."];
		}
		[ctx sendRequestCompleted];
		return YES;
	}

	if([tokenset containsObject:@"turn"] && [tokenset containsObject:@"on"] && ([tokenset containsObject:@"light"] || [tokenset containsObject:@"flashlight"]))
	{
		//NSLog(@"Turn on the light/flashlight");
		if([self turnOn:YES])
		{
			[ctx sendAddViewsUtteranceView:@"Will this help?"];
		}else
		{
			[ctx sendAddViewsUtteranceView:@"I'm sorry, the device I'm trapped in doesn't count with a torch. I'm afraid I can't help you."];
		}
		[ctx sendRequestCompleted];
		return YES;
	}

	if([tokenset containsObject:@"it's"] && [tokenset containsObject:@"dark"] && [tokenset containsObject:@"here"])
	{
		//NSLog(@"It's dark in here.");
		if([self turnOn:YES])
		{
			[ctx sendAddViewsUtteranceView:@"Will this help?"];
		}else
		{
			[ctx sendAddViewsUtteranceView:@"I'm sorry, the device I'm trapped in doesn't count with a torch. I'm afraid I can't help you."];
		}
		[ctx sendRequestCompleted];
		return YES;
	}

	if([tokenset containsObject:@"need"] && ([tokenset containsObject:@"light"] || [tokenset containsObject:@"flashlight"]))
	{
		//NSLog(@"I need a light/flashlight.");
		if([self turnOn:YES])
		{
			[ctx sendAddViewsUtteranceView:@"Will this help?"];
		}else
		{
			[ctx sendAddViewsUtteranceView:@"I'm sorry, the device I'm trapped in doesn't count with a torch. I'm afraid I can't help you."];
		}
		[ctx sendRequestCompleted];
		return YES;
	}

	if([tokenset containsObject:@"let"] && [tokenset containsObject:@"there"] && [tokenset containsObject:@"be"] && [tokenset containsObject:@"light"])
	{
		//NSLog(@"Let there be light.");
		if([self turnOn:YES])
		{
			[ctx sendAddViewsUtteranceView:@"And thus, light was created!"];
		}else
		{
			[ctx sendAddViewsUtteranceView:@"I'm sorry, the device I'm trapped in doesn't count with a torch. I'm afraid I can't help you."];
		}
		[ctx sendRequestCompleted];
		return YES;
	}

	if([tokenset containsObject:@"switch"] && [tokenset containsObject:@"on"] && ([tokenset containsObject:@"light"] || [tokenset containsObject:@"flashlight"]))
	{
		//NSLog(@"Switch on the light.");
		if([self turnOn:YES])
		{
			[ctx sendAddViewsUtteranceView:@"And thus, light was created!"];
		}else
		{
			[ctx sendAddViewsUtteranceView:@"I'm sorry, the device I'm trapped in doesn't count with a torch. I'm afraid I can't help you."];
		}
		[ctx sendRequestCompleted];
		return YES;
	}

	//Commands to turn off the flashlight.
	if([tokenset containsObject:@"thanks"] && ([tokenset containsObject:@"light"] || [tokenset containsObject:@"flashlight"]))
	{
		//NSLog(@"Thanks for the flashlight/light");
		[ctx sendAddViewsUtteranceView:@"I hope that helped!"];
		[self turnOn:NO];
		[ctx sendRequestCompleted];
		return YES;
	}

	if([tokenset containsObject:@"turn"] && [tokenset containsObject:@"off"] && ([tokenset containsObject:@"light"] || [tokenset containsObject:@"flashlight"]))
	{
		//NSLog(@"Turn off the light/flashlight.");
		[ctx sendAddViewsUtteranceView:@"I hope that helped!"];
		[self turnOn:NO];
		[ctx sendRequestCompleted];
		return YES;
	}

	if([tokenset containsObject:@"thank"] && [tokenset containsObject:@"you"] && [tokenset containsObject:@"for"] && ([tokenset containsObject:@"light"] || [tokenset containsObject:@"flashlight"]))
	{
		//NSLog(@"Thank you for the flashlight/light.");
		[ctx sendAddViewsUtteranceView:@"I hope that helped!"];
		[self turnOn:NO];
		[ctx sendRequestCompleted];
		return YES;
	}

	if([tokenset containsObject:@"switch"] && [tokenset containsObject:@"off"] && ([tokenset containsObject:@"light"] || [tokenset containsObject:@"flashlight"]))
	{
		//NSLog(@"Switch off the light/flashlight.");
		[ctx sendAddViewsUtteranceView:@"I hope that helped!"];
		[self turnOn:NO];
		[ctx sendRequestCompleted];
		return YES;
	}

	if([tokenset containsObject:@"shut"] && [tokenset containsObject:@"off"] && ([tokenset containsObject:@"light"] || [tokenset containsObject:@"flashlight"]))
	{
		//NSLog(@"Shut off the light/flashligt");
		[ctx sendAddViewsUtteranceView:@"I hope that helped!"];
		[self turnOn:NO];
		[ctx sendRequestCompleted];
		return YES;
	}

	if([tokenset containsObject:@"shut"] && [tokenset containsObject:@"down"] && ([tokenset containsObject:@"light"] || [tokenset containsObject:@"flashlight"]))
	{
		//NSLog(@"Shut down the light/flashlight.");
		[ctx sendAddViewsUtteranceView:@"I hope that helped!"];
		[self turnOn:NO];
		[ctx sendRequestCompleted];
		return YES;
	}

	if([tokenset containsObject:@"shall"] && [tokenset containsObject:@"light"] && [tokenset containsObject:@"be"] && [tokenset containsObject:@"gone"])
	{
		//NSLog(@"Shall the light be gone.");
		[ctx sendAddViewsUtteranceView:@"And the light was gone."];
		[self turnOn:NO];
		[ctx sendRequestCompleted];
		return YES;
	}

	if(([tokenset containsObject:@"light"] || [tokenset containsObject:@"flashlight"] || [tokenset containsObject:@"lights"]) && [tokenset containsObject:@"off"])
	{
		//NSLog(@"Light/Lights/Flashlight off.");
		[ctx sendAddViewsUtteranceView:@"I hope that helped!"];
		[self turnOn:NO];
		[ctx sendRequestCompleted];
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
