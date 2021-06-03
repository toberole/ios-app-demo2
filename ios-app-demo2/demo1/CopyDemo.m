#import "CopyDemo.h"

@implementation CopyDemo

/**
 当对象调用copy方法时，会返回NSCopying协议中的copyWithZone:方法的返回结果
 */
- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    return nil;
}

/**
 当对象调用mutableCopy方法时，会返回NSMutableCopying协议中mutableCopyWithZone:方法的返回结果
 */
- (id)mutableCopyWithZone:(NSZone *)zone{
    return nil;
}

@end


