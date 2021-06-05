#import "DemoBean1.h"

// 匿名分类 即“扩展”
@interface DemoBean1 ()

// 可以把类中私有的属性和方法 在此声明
@property(nonatomic,strong)NSString*testStr;

-(void)test2;

@end

@implementation DemoBean1

- (instancetype)init
{
    self = [super init];
    if (self) {
        _testStr = nil;
    }
    return self;
}

- (void)test1{
    NSLog(@"test1 ......");
}

-(void)test2{
    NSLog(@"test2 ......");
    
    [self test3];
}

-(void)test3{
    NSLog(@"test3 ......");
}
@end
