#import "SiriObjects.h"

@interface AESiLightSnippet : NSObject<SESnippet> {
	UIView* _view;
	UILabel* _testLabel;
}

- (id)initWithProperties:(NSDictionary*)props;
- (id)view;

@end
// vim:ft=objc
