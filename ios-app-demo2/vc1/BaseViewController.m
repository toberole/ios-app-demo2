#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 先设置测滑代理
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    // 将系统自带的滑动手势打开
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    // 控制器默认背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    // 状态栏背景色
    [self setStatusBarBackgroundColor:[UIColor whiteColor]];
    // 禁止自动适配 否则从导航栏返回可能会下移动
    // self.automaticallyAdjustsScrollViewInsets = NO;
    // 设置返回按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(returnAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}
 
/**
 返回按钮响应
 */
- (void)returnAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
 
#pragma mark 状态栏
/**
 设置状态栏背景颜色
 */
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}
 
/**
 设置状态栏样式
 需要改变状态栏颜色的控制器只需要重写此方法return 0||1
 若控制器被添加到导航，那么导航栏未隐藏时无法在控制器中编辑状态栏样式。
 */
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}
 
/**
 设置状态栏是否隐藏
 需要隐藏状态栏的控制器只需要重写此方法return YES || NO
 若控制器被添加到导航，那么导航栏未隐藏时无法在控制器中编辑状态栏样式。
 */
- (BOOL)prefersStatusBarHidden {
    return NO;
}
 
/**
 设置状态栏隐藏动画
 */
- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationNone;
}

@end
