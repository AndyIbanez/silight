#import "AESiLight.h"
#import "AESiLightCommands.h"
#import "AESiLightSnippet.h"

@implementation AESiLight

// required initialization
-(id)initWithSystem:(id<SESystem>)system
{
	if ( (self = [super init]) )
	{
		// register all extension classes provided
		[system registerCommand:[AESiLightCommands class]];
		[system registerSnippet:[AESiLightSnippet class]];
	}
	return self;
}

// optional info about extension
-(NSString*)author
{
	return @"Leonnears";
}
-(NSString*)name
{
	return @"SiLight";
}
-(NSString*)description
{
	return @"Need a quick light? Ask Siri to give you a flash light! This small tweak will enable you to turn your phone's flash on and off to use it as a flashlight. Just issue commands like \"Siri, there's a blackout\" or \"Siri, I need a flashlight\". To turn off the flash, just say \"Turn off the flashlight\" or something like \"Thanks for the light\".";
}
-(NSString*)website
{
	return @"www.leonnears.com";
}
-(NSString*)versionRequirement
{
	return @"1.0.1";
}

@end
// vim:ft=objc
