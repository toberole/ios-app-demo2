#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SingleTonDemo : NSObject<NSCopying>

+(instancetype)sharedInstance;

-(void)test;

@end

NS_ASSUME_NONNULL_END
