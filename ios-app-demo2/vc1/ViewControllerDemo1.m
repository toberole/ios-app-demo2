#import "ViewControllerDemo1.h"

@interface ViewControllerDemo1 ()

@end

@implementation ViewControllerDemo1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton*btn = [self.view viewWithTag:1];
    [btn addTarget:self action:@selector(btn_clicked) forControlEvents:UIControlEventTouchUpInside];
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
