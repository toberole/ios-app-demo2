#import "Person.h"

@interface Person ()
@property(nonatomic,assign)BOOL contentDiscarded;
@end

@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        _name = nil;
        _age = 0;
        _contentDiscarded = NO;
    }
    return self;
}

-(void)printInfo{
    NSLog(@"name: %@,age: %d",self.name,self.age);
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", self.name];
}
/**
 使用某个缓存数据之前使用，会使访问计数加1，不会被缓存释放；
 
 beginContentAccess和endContentAccess配合使用 防止在缓存数据的访问中被释放
 */
- (BOOL)beginContentAccess{
    NSLog(@"Person#beginContentAccess ......");
    return TRUE;
}
/**
 当访问结束调用时会使访问计数减1；
 */
- (void)endContentAccess{
    NSLog(@"Person#endContentAccess ......");
}

/**
 在NSCache个数超出最大情况下清除某个缓存时，或者NSCache设置evictsObjectsWithDiscardedContent为YES时调用，可以在此时做一些资源情理的工作
 */
- (void)discardContentIfPossible{
    self.contentDiscarded = YES;
    NSLog(@"Person#discardContentIfPossible ......");
}

/**
 手动判断当前缓存是否应当被废弃
 */
- (BOOL)isContentDiscarded{
    NSLog(@"Person#isContentDiscarded ......");
    return NO;
}

@end
