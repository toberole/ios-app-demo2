#import "WeakTimerTarget.h"

@implementation WeakTimerTarget

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo{
    WeakTimerTarget*timerTarget = [[WeakTimerTarget alloc]init];
    timerTarget.target = aTarget;
    timerTarget.selector = aSelector;
    
    timerTarget.timer = [NSTimer scheduledTimerWithTimeInterval:interval target:aTarget selector:@selector(fire:) userInfo:userInfo repeats:yesOrNo];
    return timerTarget.timer;
}

-(void)fire:(NSTimer*)timer{
    if (self.target) {
        [self.target performSelector:self.selector withObject:timer.userInfo];
    }else{
        [self.timer invalidate];
    }
}

@end
