#import "TestMessage.h"
#import "BackupTestMessage.h"

/**
 https://www.jianshu.com/p/fdd8f5225f0c
 
 消息转发机制共分为3大步骤：
 1.Method resolution 方法解析处理阶段
 2.Fast forwarding 快速转发阶段
 3.Normal forwarding 常规转发阶段
 
 第一步：Method resolution 方法解析处理阶段
    如果调用了对象方法
    首先会进行+(BOOL)resolveInstanceMethod:(SEL)sel判断
    如果调用了类方法
    首先会进行 +(BOOL)resolveClassMethod:(SEL)sel判断
    两个方法都为类方法，如果YES则能接受消息 NO不能接受消息 进入第二步

第二步:Fast forwarding         快速转发阶段（后面阶段都针对对象来处理，不考虑类方法）
    如果在上一步的2个方法内返回的为YES则能接受消息 NO不能接受消息 进入第二步
 
 
第三步：Normal forwarding 常规转发阶段
    如果第2步返回self或者nil,则说明没有可以响应的目标 则进入第三步。
    第三步的消息转发机制本质上跟第二步是一样的都是切换接受消息的对象，但是第三步切换响应目标更复杂一些，第二步里面只需返回一个可以响应的对象就可以了，第三步还需要手动将响应方法切换给备用响应对象。

 */
@implementation TestMessage

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    NSLog(@"resolveInstanceMethod %@......",NSStringFromSelector(sel));
    return NO;
}

+ (BOOL)resolveClassMethod:(SEL)sel{
    NSLog(@"resolveClassMethod ......");
    return YES;
}

// 返回备用对象
- (id)forwardingTargetForSelector:(SEL)aSelector{
    BackupTestMessage*m = [[BackupTestMessage alloc]init];
    return m;
}

// methodSignatureForSelector && forwardInvocation
-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    /*
     1.手动创建签名 但是尽量少使用 因为容易创建错误 可以按照这个规则来创建
     https://blog.csdn.net/ssirreplaceable/article/details/53376915
     根据OBJC的编码类别进行编写后面的char （但是容易写错误，所以建议使用下面的方法）
     NSMethodSignature *sign = [NSMethodSignature signatureWithObjCTypes:"v@:"];
     //写法例子
     //例子"v@:@"
     //v@:@ v:返回值类型void;@ id类型,执行sel的对象;：SEL;@参数
     //例子"@@:"
     //@:返回值类型id;@id类型,执行sel的对象;：SEL

     2.自动创建签名
     BackupTestMessage * backUp = [BackupTestMessage new];
     NSMethodSignature * sign = [backUp methodSignatureForSelector:aSelector];
     */
    
    //如果返回为nil则进行手动创建签名
   if ([super methodSignatureForSelector:aSelector]==nil) {
        NSMethodSignature * sign = [NSMethodSignature signatureWithObjCTypes:"v@:"];
        return sign;
    }
    return [super methodSignatureForSelector:aSelector];
}

-(void)forwardInvocation:(NSInvocation *)anInvocation{
    //创建备用对象
    BackupTestMessage * backUp = [BackupTestMessage new];
    SEL sel = anInvocation.selector;
    //判断备用对象是否可以响应传递进来等待响应的SEL
    if ([backUp respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:backUp];
    }else{
       // 如果备用对象不能响应 则抛出异常
        [self doesNotRecognizeSelector:sel];
    }
}
@end
