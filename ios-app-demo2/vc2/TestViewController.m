#import "TestViewController.h"
#import "YYWeakProxy.h"

@interface TestViewController ()
@property(nonatomic,strong)NSTimer*timer;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // __strong 使用
    // __strong __typeof(self)strongSelf = self;
    
    UIButton*btn = [self.view viewWithTag:1];
    [btn addTarget:self action:@selector(btn_test1) forControlEvents:UIControlEventTouchUpInside];
    
    btn = [self.view viewWithTag:2];
    [btn addTarget:self action:@selector(btn_test2) forControlEvents:UIControlEventTouchUpInside];

}

-(void)btn_test2{
    NSLog(@"btn_test2 ......");
    [self.timer invalidate];
}

- (void)dealloc
{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}
/**
 直接将timer添加到了当前runloop default mode
 + (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti invocation:(NSInvocation *)invocation repeats:(BOOL)yesOrNo;

 + (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo;

 + (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;
 
 
 不会自动添加到runloop，还需调用addTimer: forMode 添加到runloop
 + (NSTimer *)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;

 + (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti invocation:(NSInvocation *)invocation repeats:(BOOL)yesOrNo;

 + (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo;

 - (instancetype)initWithFireDate:(NSDate *)date interval:(NSTimeInterval)ti target:(id)t selector:(SEL)s userInfo:(id)ui repeats:(BOOL)rep;

 - (instancetype)initWithFireDate:(NSDate *)date interval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;
 */
-(void)btn_test1{
    NSLog(@"btn_test1 ......");
    
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"timer btn_test1 ......");
//    }];
    
    // 错误方案 无法解决Timer 与 VC形成循环依赖
//    __weak typeof(self) weakSelf = self;
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:weakSelf selector:@selector(timerAction) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    

    // 解决Timer 与 VC形成循环依赖
    YYWeakProxy*weakProxy = [[YYWeakProxy alloc]initWithTarget:self];
       self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:weakProxy selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)timerAction{
    NSLog(@"timerAction ......");
}

@end
