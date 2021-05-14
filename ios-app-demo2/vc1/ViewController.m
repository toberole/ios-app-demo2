#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)UIButton*btn1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btn1 = [self.view viewWithTag:1];
    [self.btn1 addTarget:self action:@selector(btn1_clicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self test1];
}

-(void)test1{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"Hello NSUserDefaults" forKey:@"key"];
    
    NSString* v = [defaults stringForKey:@"key"];
    NSLog(@"value: %@",v);
}

-(void)test2{
    // xpc_connection_t listener;
    NSRunLoop*l = [NSRunLoop currentRunLoop];
}

-(void)btn1_clicked{
    NSLog(@"btn1_clicked ......");
}

@end
