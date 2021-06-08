#import "XIBViewController.h"

//判断适配iPhoneX
#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

@interface XIBViewController ()

//创建属性
@property (nonatomic,assign) CGFloat headerHeigth;

@end

@implementation XIBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (kDevice_Is_iPhoneX == 1) {
        _headerHeigth = 88;
    }else{
        _headerHeigth = 64;
    }
    
    NSLog(@"headerHeigth: %f",_headerHeigth);
    
    NSArray *views = [[NSBundle mainBundle]loadNibNamed:@"test1" owner:nil options:nil];
    UIView *v = views[0];
    v.frame = CGRectMake(0, _headerHeigth, v.frame.size.width, v.frame.size.height);
    [self.view addSubview:v];
}



@end
