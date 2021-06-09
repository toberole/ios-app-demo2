#import "YYWeakProxy.h"

@implementation YYWeakProxy
/**
 消息转发机制
    当我们向一个对象发消息的时候，会在该对象类中的方法表中查找，如果没有就会依次从父类方法表中查找，如果都没有查到，会依次调用如下方法。
 （1）
     +(BOOL)resolveInstanceMethod:(SEL)selector
     +(BOOL)resolveClassMethod:(SEL)selector
     这两个方法分别表示该类中是否可以处理该实例方法或者类方法，
     一般在此处利用runtime动态增加对应的方法实现。
 （2）
    如果上述方法没有能动态添加方法，表示未能处理该方法，则会调用
    -(id)forwardingTargetForSelector:(SEL)selector方法，
    实现该方法返回一个其他可以实现该方法的对象。
 
 （3）
    如果上述方法返回了nil，表示不能返回一个接收该方法的对象，此时会调用-        (NSMethodSignature*)methodSignatureForSelector: (SEL)aSelector，
    该方法需要返回一个方法签名，一般在该方法实现中，
    返回一个由其他对象和该方法创建的签名。方法签名的意义就是表示该对象是否有能力处理该方法。
 
 （4）
    只有实现了上述方法，并且返回了一个非nil的签名，才会真正地调用
    -(void)forwardInvocation: (NSInvocation*)invocation，
    该方法将其原本的target、selector、parameters封装在invocation中，
    开发者可以在该方法实现中，修改target、selector、parameters，然后调用。
 
 如果以上都没有实现的话，那么就会常见的unrecognized selector sent to instance ‘xxxx’错误。
 */
/**
 https://github.com/ibireme/YYKit
 
 重载了父类的方法，将输入的target保存为实例变量，然后返回self。即YYWeakProxy对象会弱引用target对象，通过消息转发处理target事件
 */
- (instancetype)initWithTarget:(id)target {
   _target = target;
   return self;
}

+ (instancetype)proxyWithTarget:(id)target {
   return [[YYWeakProxy alloc] initWithTarget:target];
}

- (id)forwardingTargetForSelector:(SEL)selector {
   return _target;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
   return [NSObject instanceMethodSignatureForSelector:@selector(init)];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
   void *null = NULL;
   [invocation setReturnValue:&null];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
   return [_target respondsToSelector:aSelector];
}

- (BOOL)isEqual:(id)object {
   return [_target isEqual:object];
}

- (NSUInteger)hash {
   return [_target hash];
}

- (Class)superclass {
   return [_target superclass];
}

- (Class)class {
   return [_target class];
}

- (BOOL)isKindOfClass:(Class)aClass {
   return [_target isKindOfClass:aClass];
}

- (BOOL)isMemberOfClass:(Class)aClass {
   return [_target isMemberOfClass:aClass];
}

- (BOOL)conformsToProtocol:(Protocol *)aProtocol {
   return [_target conformsToProtocol:aProtocol];
}

- (BOOL)isProxy {
   return YES;
}

- (NSString *)description {
   return [_target description];
}

- (NSString *)debugDescription {
   return [_target debugDescription];
}

@end
