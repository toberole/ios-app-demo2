#import "ViewControllerDemo1.h"

@interface ViewControllerDemo1 ()

@end

@implementation ViewControllerDemo1

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton*btn = [self.view viewWithTag:1];
    [btn addTarget:self action:@selector(btn_clicked) forControlEvents:UIControlEventTouchUpInside];
    
    CALayer*layer = [CALayer layer];
    layer.frame = CGRectMake(140, 100, 100, 100);
    layer.backgroundColor = [UIColor yellowColor].CGColor;
    layer.borderColor = [UIColor redColor].CGColor;
    layer.borderWidth = 4.0;
    layer.cornerRadius = 2.0;
 
    [self.view.layer addSublayer:layer];
}

-(void)btn_clicked{
    [self dismissViewControllerAnimated:NO completion:nil];
}

-(void)test2{
    // xpc_connection_t listener;
    NSRunLoop*l = [NSRunLoop currentRunLoop];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
