#import "A_ViewController.h"
#import "B_ViewController.h"
/**
  页面跳转传递值
     1、属性传值
     2、单例传值
     3、NSUserDefaults传值
     4、代理、Block回调传值
     5、通知传值
 */
@interface A_ViewController ()

@end

@implementation A_ViewController

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"A_ViewController#viewWillAppear ......");
}
- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"A_ViewController#viewDidAppear ......");
}

- (void)viewWillDisappear:(BOOL)animated{
    NSLog(@"A_ViewController#viewWillDisappear ......");
}

- (void)viewDidDisappear:(BOOL)animated{
    NSLog(@"A_ViewController#viewDidDisappear ......");
}

- (void)viewWillLayoutSubviews{
    NSLog(@"A_ViewController#viewWillLayoutSubviews ......");
}

- (void)viewDidLayoutSubviews{
    NSLog(@"A_ViewController#viewDidLayoutSubviews ......");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"A_ViewController#viewDidLoad ......");
    self.title = @"A_ViewController";
    
    UIButton*btn = [self.view viewWithTag:1];
    [btn addTarget:self action:@selector(btn_click) forControlEvents:UIControlEventTouchUpInside];
}

-(void)btn_click{
    NSLog(@"btn_click ......");
    B_ViewController*b = [[B_ViewController alloc]init];
    [self.navigationController pushViewController:b animated:YES];
}

@end
