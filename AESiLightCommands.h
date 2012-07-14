#import "SiriObjects.h"

@interface AESiLightCommands : NSObject<SECommand>

-(BOOL)handleSpeech:(NSString*)text tokens:(NSArray*)tokens tokenSet:(NSSet*)tokenset context:(id<SEContext>)ctx;
-(BOOL)turnOn:(BOOL)on;

@end
// vim:ft=objc
