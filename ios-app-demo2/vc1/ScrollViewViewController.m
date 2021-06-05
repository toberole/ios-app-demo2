#import "ScrollViewViewController.h"

@interface ScrollViewViewController ()
@property(nonatomic,strong)UIScrollView*scrollView;
@end

@implementation ScrollViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.scrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.scrollView];
    
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    CGFloat h = [UIScreen mainScreen].bounds.size.height;
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, w, h)];
    v.backgroundColor  = [UIColor yellowColor];
    [self.scrollView addSubview:v];
    
    v = [[UIView alloc]initWithFrame:CGRectMake(0, h, w, h)];
    v.backgroundColor  = [UIColor greenColor];
    [self.scrollView addSubview:v];
    
    CGFloat maxY = CGRectGetMaxY(v.frame);
    [self.scrollView setContentSize:CGSizeMake(0, maxY)];
}

@end
