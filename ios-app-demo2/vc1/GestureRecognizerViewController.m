#import "GestureRecognizerViewController.h"

/**
 手势UIGestureRecognizer
 UIKit框架中一共提供了6种类型的手势操作，分别为：点击、捏合、旋转、滑动、拖动、长按。手势需要添加到UIView类以及其子类之上，同时每个UIView可以添加多个手势。
 UIGestureRecognizer类是一个抽象类，不能直接使用，具体使用过程中需要使用其子类。UIGestureRecognizer一共包括6个子类，分别对应6种手势。
 UITapGestureRecognizer：点击。
 UIPinchGestureRecognizer：捏合。
 UIRotationGestureRecognizer：旋转。
 UISwipeGestureRecognizer：滑动。
 UIPanGestureRecognizer：拖动，
 其又包含另外一个子类UIScreenEdgePanGestureRecognizer。
 UILongPressGestureRecognizer：长按。
 */

@interface GestureRecognizerViewController ()

@property(nonatomic,strong)UIView*testView;

@property(nonatomic,strong)UITapGestureRecognizer*r;

@end

@implementation GestureRecognizerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.testView = [self.view viewWithTag:1];
    
    // 添加手势处理器
    self.r = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(test_r:)];
    // 单击
    self.r.numberOfTapsRequired = 1;
    // 单手指
    self.r.numberOfTouchesRequired = 1;
    // testView添加手势识别
    [self.testView addGestureRecognizer:self.r];
}


-(void)test_r:(UITapGestureRecognizer*)tap{
    NSLog(@"test_r ......");
}

@end
