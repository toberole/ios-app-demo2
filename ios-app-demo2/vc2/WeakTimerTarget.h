#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeakTimerTarget : NSObject

@property(nonatomic,weak)id target;
@property(nonatomic,assign)SEL selector;
@property(nonatomic,strong)NSTimer*timer;

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

@end

NS_ASSUME_NONNULL_END
