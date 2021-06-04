#import "KeyboardViewController.h"

/**
    关闭键盘的方法
    1、让TextFiled放弃成为第一响应者(resignFirstResponder)
    2、让View或者子View强制结束编辑状态（endEditing）
 */


@interface KeyboardViewController ()

@property(nonatomic,strong)UITextField*textField;

@end

@implementation KeyboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textField = [self.view viewWithTag:1];
    
    /**
     方法一：输入完以后用户点击return后收起键盘

     可以点击return收起键盘并不意味着弹出来的键盘一定都有return这个按键，比如数字键盘类型就没有，UIKeyboardTypeWebSearch类型的键盘return键就变成了Go键，需要注意的是这时候的Go键相当于return键。

     要想实现点击return让键盘收起，首先需要设置textField代理，当然还要遵循UITextFieldDelegate协议
     
     然后实现协议方法- (BOOL)textFieldShouldReturn:(UITextField *)textField;
     */
    self.textField.delegate = self;
    
    /**
     还有一些比较笨的方法也可以实现达到点击背景后收起键盘的效果，比如：在背景view上面加手势，添加UIButton或者view，然后在对应的点击事件的监听方法中实现resignFirstResponder或者endEditing。
     */
//    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
//    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
//    tapGestureRecognizer.cancelsTouchesInView = NO;
//    //将触摸事件添加到view上view可以换成任意一个控件的
//    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    /**
     方法三：不用view实现endEditing的方法
     如果说在比较难获取viewController的view时，可以使用下面的方法:
        1、[[[UIApplication sharedApplication] keyWindow] endEditing:YES];

        2、[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];

     */
}


//-(void)keyboardHide:(UITapGestureRecognizer*)tap{
//    [self.textField resignFirstResponder];
//}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    /**
     isFirstResponder:判断该View是否为第一响应者。

     canBecomeFirstResponder:判断该View是否可以成为第一响应者。

     becomeFirstResponder:使该View成为第一响应者。

     resignFirstResponder:取消View的第一响应者。
     */
    return [textField resignFirstResponder];
}

/**
 方法二：点击背景后收起键盘

 点击背景收起键盘可以实现view的- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent *)event方法，然后执行view的- (BOOL)endEditing:(BOOL)force;方法。
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
