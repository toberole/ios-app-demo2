#import <Foundation/Foundation.h>
#import "Test_Protocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject<NSDiscardableContent>

@property(nonatomic,assign)int age;
@property(nonatomic,strong)NSString*name;

@property(nonatomic,weak)id<Test_Protocol>test_p;

-(void)printInfo;

@end

NS_ASSUME_NONNULL_END
