#import "MessageForwardDemoViewController.h"
#import "TestMessage.h"
#import "TestMessagex.h"
#import "DemoBean2.h"

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
}

-(void)test{
    DemoBean2*demo = [[DemoBean2 alloc]init];
    [demo testStr];
    demo.str = nil;
    NSLog(@"str: %@",demo.str);
}

-(void)btn_test1{
    NSLog(@"btn_test1 ......");
//    [self.m performSelector:@selector(xxx)];
    
    [self.m1 performSelector:@selector(xxx)];
}

@end
