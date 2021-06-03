#import "Person+Student.h"

@implementation Person (Student)

-(void)printStudentInfo{
    [self printInfo];
    // 注意分类不能添加属性
    // NSLog(@"score: %d",self.score);
}

- (int)score{
    return self.score;
}

- (void)setScore:(int)score{
    self.score = score;
}

@end
