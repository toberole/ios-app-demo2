#import "TestMessagex.h"

@implementation TestMessagex
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    NSLog(@"resolveInstanceMethod ......");
    return FALSE;
}

+ (BOOL)resolveClassMethod:(SEL)sel{
    NSLog(@"resolveClassMethod ......");
    return FALSE;
}

- (id)forwardingTargetForSelector:(SEL)aSelector{
    NSLog(@"forwardingTargetForSelector ......");
    return [[NSObject alloc]init];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSLog(@"methodSignatureForSelector ......");
    return [NSObject instanceMethodSignatureForSelector:@selector(xxx)];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    NSLog(@"xxxxxx");
}
@end
