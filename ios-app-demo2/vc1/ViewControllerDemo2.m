#import "ViewControllerDemo2.h"

@interface ViewControllerDemo2 ()

@end

@implementation ViewControllerDemo2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 设置标题栏相关
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back.png"] style:UIBarButtonItemStylePlain target:self action:@selector(backViewcontroller)];
    
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"add.png"] style:UIBarButtonItemStylePlain target:self action:@selector(backViewcontroller)];

    // 相当于占位 把leftItem往右边挤一点
    UIBarButtonItem *fixedItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    // 设置边框距离，个人习惯设为-16，可以根据需要调节
    fixedItem.width = -16;
    self.navigationItem.leftBarButtonItems = @[fixedItem, leftItem,addItem];
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 230, [UIScreen mainScreen].bounds.size.width, 200)];
    textField.text = @"hello";
    textField.textColor = [UIColor redColor];
    [self.view addSubview:textField];
}

-(void)backViewcontroller{
    NSLog(@"backViewcontroller ......");
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
