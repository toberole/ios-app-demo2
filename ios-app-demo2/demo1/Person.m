#import "Person.h"

@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        _name = nil;
        _age = 0;
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

@end
