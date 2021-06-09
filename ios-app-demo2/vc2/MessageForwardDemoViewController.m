#import "MessageForwardDemoViewController.h"
#import "TestMessage.h"

@interface MessageForwardDemoViewController ()
@property(nonatomic,strong)TestMessage*m;
@end

@implementation MessageForwardDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.m = [[TestMessage alloc]init];
    
    UIButton*btn = [self.view viewWithTag:1];
    [btn addTarget:self action:@selector(btn_test1) forControlEvents:UIControlEventTouchUpInside];
}

-(void)btn_test1{
    NSLog(@"btn_test1 ......");
    [self.m performSelector:@selector(xxx)];
}

@end
