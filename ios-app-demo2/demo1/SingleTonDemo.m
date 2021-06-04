#import "SingleTonDemo.h"

/**
 创建一个单例类。提供了一个类方法sharedInstance，
 通过该方法就能够获取到该单例类的对象。
 提供了copy方法，调用copy方法时，也是返回已经存在的单例类对象。
 */
@implementation SingleTonDemo

static id _instance;

- (void)test {
    NSLog(@"SingleTonDemo test ......");
}

+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc]init];
    });
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    return _instance;
}

@end
