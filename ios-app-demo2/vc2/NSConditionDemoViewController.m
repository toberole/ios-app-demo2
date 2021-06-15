#import "NSConditionDemoViewController.h"

@interface NSConditionDemoViewController ()

@end

@implementation NSConditionDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton*btn = [self.view viewWithTag:1];
    [btn addTarget:self action:@selector(btn_test1) forControlEvents:UIControlEventTouchUpInside];
}

-(void)btn_test1{
    NSLog(@"btn_test1 ......");
    NSCondition*cond = [[NSCondition alloc]init];
    
    dispatch_queue_t q = dispatch_queue_create("q", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(q, ^{
        
    });
}

@end
