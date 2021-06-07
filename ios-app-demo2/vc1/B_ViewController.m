#import "B_ViewController.h"

@interface B_ViewController ()

@end

@implementation B_ViewController
- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"B_ViewController#viewWillAppear ......");
}
- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"B_ViewController#viewDidAppear ......");
}

- (void)viewWillDisappear:(BOOL)animated{
    NSLog(@"B_ViewController#viewWillDisappear ......");
}

- (void)viewDidDisappear:(BOOL)animated{
    NSLog(@"B_ViewController#viewDidDisappear ......");
}

- (void)viewWillLayoutSubviews{
    NSLog(@"B_ViewController#viewWillLayoutSubviews ......");
}

- (void)viewDidLayoutSubviews{
    NSLog(@"B_ViewController#viewDidLayoutSubviews ......");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"B_ViewController";
    NSLog(@"B_ViewController#viewDidLoad ......");
    
    UIButton*btn = [self.view viewWithTag:1];
    [btn addTarget:self action:@selector(btn_click) forControlEvents:UIControlEventTouchUpInside];
}

-(void)btn_click{
    NSLog(@"B_ViewController btn_click ......");
    [self.navigationController popViewControllerAnimated:YES];
}

@end
