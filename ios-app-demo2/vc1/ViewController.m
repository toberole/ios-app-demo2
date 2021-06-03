#import "ViewController.h"
#import "CPP_Demo.h"
#import "HtmlViewController.h"
#import "Person.h"
#import "Person+Student.h"
#import "ViewControllerDemo1.h"

@interface ViewController ()

@property(nonatomic,strong)UIButton*btn1;

// blcok 属性
@property(copy,nonatomic)void(^t_b)(int,int);
@property(copy,nonatomic)void(^t_b1)(void);

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"ViewController viewDidLoad ......");
    
    self.btn1 = [self.view viewWithTag:1];
    [self.btn1 addTarget:self action:@selector(btn1_clicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton*btn = [self.view viewWithTag:2];
    [btn addTarget:self action:@selector(btn_clicked1) forControlEvents:UIControlEventTouchUpInside];
    
    btn = [self.view  viewWithTag:3];
    [btn addTarget:self action:@selector(gcd_1) forControlEvents:UIControlEventTouchUpInside];
    
    btn = [self.view  viewWithTag:4];
    [btn addTarget:self action:@selector(gcd_2) forControlEvents:UIControlEventTouchUpInside];
    
    
//    [self test1];
//
//    CPP_Demo *demo = [[CPP_Demo alloc]init];
//    [demo test];
}

-(void)gcd_2{
    
    dispatch_queue_t q = dispatch_queue_create("test_q", DISPATCH_QUEUE_SERIAL);
    dispatch_async(q, ^{
        NSLog(@"dispatch_async 1 thread name %@......",[NSThread currentThread].name);
    });
    
    dispatch_async(q, ^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"dispatch_async 2 thread name %@......",[NSThread currentThread].name);
    });
    
    dispatch_async(q, ^{
        NSLog(@"dispatch_async 3 thread name %@......",[NSThread currentThread].name);
    });
    
    dispatch_async(q, ^{
        NSLog(@"dispatch_async 4 thread name %@......",[NSThread currentThread].name);
    });
}

-(void)gcd_1{
    dispatch_queue_t q = dispatch_queue_create("test_q", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(q, ^{
        NSLog(@"dispatch_async 1 ......");
    });
    
    dispatch_async(q, ^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"dispatch_async 2 ......");
    });
    
    dispatch_async(q, ^{
        NSLog(@"dispatch_async 3 ......");
    });
    
    dispatch_async(q, ^{
        NSLog(@"dispatch_async 4 ......");
    });
}

-(void)btn_clicked1{
     [self test6];
    
    
}

-(void)btn1_clicked{
    NSLog(@"btn1_clicked ......");
    
    NSLog(@"navigationController: %@",self.navigationController);
    
//    [self test3];
//    [self test4];
//    [self test5];
//    self.navigationController
    
    
    [self test7];
}

/**
 presentViewController 跳转
 */
-(void)test7{
    ViewControllerDemo1*vc = [[ViewControllerDemo1 alloc]init];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:NO completion:nil];
}

/**
 navigationController pushViewController 跳转
 可以复用navigationController的标题栏
 */
-(void)test6{
    HtmlViewController*vc = [[HtmlViewController alloc]init];
    [self.navigationController pushViewController:vc animated:NO];
}

-(void)test5{
    Person *p = [[Person alloc]init];
    [p printStudentInfo];
    
    // KVC 设置值
    [p setValue:@"hello name" forKey:@"name"];
    [p printStudentInfo];
    // KVC 取值
    NSString*name = [p valueForKey:@"name"];
    NSLog(@"name: %@",name);
}

-(void)test4{
    /**
     在Block定义时，会“捕捉”一次Block中使用的对象i，当i发生变化的时候，
     不会影响已经“捕捉”到的值。
     
     如果需要在Blcok中修改外部变量，那么外部变量需要使用__Block修饰
     
     */
    __block int i = 0;
    void(^test_b)(void) = ^(void){
        i = 1;
    };
    test_b();
    NSLog(@"i = %d",i);
}

-(void)test3{
    NSBundle*bundle = [NSBundle mainBundle];
    NSString*path = [bundle pathForResource:@"6" ofType:@"jpg"];
    NSLog(@"path: %@",path);
    
    path = [bundle pathForResource:@"test" ofType:@"txt"];
    NSString*txt = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"txt: %@",txt);
    
    void(^test_block)(int,int) = ^(int a,int b){
        NSLog(@"a = %d,b = %d",a,b);
    };
    test_block(1,2);
}

-(void)test2{
    // xpc_connection_t listener;
    NSRunLoop*l = [NSRunLoop currentRunLoop];
}

-(void)test1{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"Hello NSUserDefaults" forKey:@"key"];
    
    NSString* v = [defaults stringForKey:@"key"];
    NSLog(@"value: %@",v);
}





@end
