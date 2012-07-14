#import "AESiLightSnippet.h"

@implementation AESiLightSnippet

- (id)view
{
	return _view;
}

- (void)dealloc
{
	// DON'T FORGET TO RELEASE ALL ALLOCATED/RETAINED MEMORY/OBJECTS
	//NSLog(@">> AESiLightSnippet dealloc");

	[_view release];
	[super dealloc];
}

- (id)initWithProperties:(NSDictionary*)props;
{
	//NSLog(@">> AESiLightSnippet initWithProperties: %@", props);

	if ( (self = [super init]) )
	{
		// create a background view (the height matters)
		CGRect bgSize = CGRectMake(0,0, 310,40); // 310 is a standard snippet width
		_view = [[UIView alloc] initWithFrame:bgSize];

		_testLabel = [[UILabel alloc] initWithFrame:bgSize];
		_testLabel.backgroundColor = [UIColor clearColor];
		_testLabel.textColor = [UIColor whiteColor];
		_testLabel.textAlignment = UITextAlignmentCenter;
		[_testLabel setText:[props objectForKey:@"text"]]; // text supplied by AESiLightCommands

		[_view addSubview:_testLabel];
		[_testLabel release];
	}
	return self;
}

@end
// vim:ft=objc
