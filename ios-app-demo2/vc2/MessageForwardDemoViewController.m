#import "MessageForwardDemoViewController.h"
#import "TestMessage.h"
#import "TestMessagex.h"
#import "DemoBean2.h"
#import "DemoBean2+DemoBean2_C.h"

@interface MessageForwardDemoViewController ()

@property(nonatomic,strong)TestMessage*m;

@property(nonatomic,strong)TestMessagex*m1;

@end

@implementation MessageForwardDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.m = [[TestMessage alloc]init];
    self.m1 = [[TestMessagex alloc]init];
    
    [self test];
    
    UIButton*btn = [self.view viewWithTag:1];
    [btn addTarget:self action:@selector(btn_test1) forControlEvents:UIControlEventTouchUpInside];
    
    /**
     CGRect {
         CGPoint origin;
         CGSize size;
     };
     CGPoint {
         CGFloat x;
         CGFloat y;
     };
     struct CGSize {
         CGFloat width;
         CGFloat height;
     };
     */
    NSLog(@"frame: %@",NSStringFromCGRect(btn.frame));
    NSLog(@"bounds: %@",NSStringFromCGRect(btn.bounds));
    
    btn = [self.view viewWithTag:2];
    [btn addTarget:self action:@selector(btn_test2) forControlEvents:UIControlEventTouchUpInside];
}

-(void)test{
    DemoBean2*demo = [[DemoBean2 alloc]init];
    [demo testStr];
    demo.str = nil;
    NSLog(@"str: %@",demo.str);
    
    [demo demo2BeanTest];
}

-(void)btn_test1{
    NSLog(@"btn_test1 ......");
//    [self.m performSelector:@selector(xxx)];
    
    [self.m1 performSelector:@selector(xxx)];
}

-(void)btn_test2{
    NSArray<NSString *> *arr = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, NO);
    NSLog(@"arr count: %lu",(unsigned long)[arr count]);

    arr = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES/* 是否展开成完整路径 */);
    NSLog(@"arr count: %lu",(unsigned long)[arr count]);

    
    for (int i = 0; i < [arr count]; i++) {
        NSLog(@"arr[%d] = %@",i,arr[i]);
    }
}

@end
