#import "ViewController.h"
#import "CPP_Demo.h"
#import "HtmlViewController.h"
#import "Person.h"
#import "Person+Student.h"
#import "ViewControllerDemo1.h"
#import <sqlite3.h>
#import "SingleTonDemo.h"
#import "ViewControllerDemo2.h"
#import "KeyboardViewController.h"
#import "GestureRecognizerViewController.h"
#import "ScrollViewViewController.h"
#import "DemoBean1.h"

@interface ViewController ()

@property(nonatomic,strong)UIButton*btn1;

@property(nonatomic,assign)sqlite3*db;

// blcok 属性
@property(copy,nonatomic)void(^t_b)(int,int);
@property(copy,nonatomic)void(^t_b1)(void);

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"ViewController viewDidLoad ......");
    
    /**
     注意：
         ViewController title属性可以设置标题栏文字
         ViewController#navigationItem#title 也可以设置标题栏文字
         但是ViewController#navigationItem#title优先级高于ViewController#title
     */
    self.title = @"Hello ViewController";
    self.navigationItem.title = @"Hello navigationItem";
    
    [[SingleTonDemo sharedInstance] test];
    
    self.btn1 = [self.view viewWithTag:1];
    [self.btn1 addTarget:self action:@selector(btn1_clicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton*btn = [self.view viewWithTag:2];
    [btn addTarget:self action:@selector(btn_clicked1) forControlEvents:UIControlEventTouchUpInside];
    
    btn = [self.view  viewWithTag:3];
    [btn addTarget:self action:@selector(gcd_1) forControlEvents:UIControlEventTouchUpInside];
    
    btn = [self.view  viewWithTag:4];
    [btn addTarget:self action:@selector(gcd_2) forControlEvents:UIControlEventTouchUpInside];
    
    btn = [self.view viewWithTag:5];
    [btn addTarget:self action:@selector(gcd_3) forControlEvents:UIControlEventTouchUpInside];
    
    btn = [self.view viewWithTag:6];
    [btn addTarget:self action:@selector(btn_sandbox) forControlEvents:UIControlEventTouchUpInside];
    
    btn = [self.view viewWithTag:7];
    [btn addTarget:self action:@selector(btn_sqlite) forControlEvents:UIControlEventTouchUpInside];
    
    btn = [self.view viewWithTag:8];
    [btn addTarget:self action:@selector(btn_device) forControlEvents:UIControlEventTouchUpInside];
    
    btn = [self.view viewWithTag:9];
    [btn addTarget:self action:@selector(btn_PushViewController) forControlEvents:UIControlEventTouchUpInside];
    
    
//    [self test1];
//
//    CPP_Demo *demo = [[CPP_Demo alloc]init];
//    [demo test];
}

-(void)btn_PushViewController{
    UIViewController *vc = [[ViewControllerDemo2 alloc]init];
    //[self.navigationController pushViewController:vc animated:YES];
    
//    vc = [[KeyboardViewController alloc]init];
//    [self.navigationController pushViewController:vc animated:YES];
    
    
//    vc = [[GestureRecognizerViewController alloc]init];
//    [self.navigationController pushViewController:vc animated:YES];
    
    vc = [[ScrollViewViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)btn_device{
    NSLog(@"device ......");
    
    UIDevice*device = [UIDevice currentDevice];
    NSLog(@"name: %@",device.name);
    NSLog(@"model: %@",device.model);
    NSLog(@"localizedModel: %@",device.localizedModel);
    NSLog(@"systemVersion: %@",device.systemVersion);
    NSLog(@"systemName: %@",device.systemName);
    NSLog(@"UUIDString: %@",device.identifierForVendor.UUIDString);
}

/**
 sqlite
 fmdb
 core data[对象—关系映射（ORM）]
 */
-(void)btn_sqlite{
    
}

-(void)btn_sandbox{
    // 获取沙盒路径
    NSString*path = NSHomeDirectory();
    NSLog(@"HomeDirectory: %@",path);
    
    // 获取Documents文件夹
    NSArray*documentsArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString*documentsPath = [documentsArr objectAtIndex:0];
    NSLog(@"documentsPath: %@",documentsPath);
    
    // 获取Library文件夹
    NSArray*librarysArr = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES);
    NSString*libraryPath = [librarysArr objectAtIndex:0];
    NSLog(@"libraryPath: %@",libraryPath);
    
}

/**
 队列与任务组合
 1、异步任务+并行队列
    把异步任务放到并列队列进行执行，异步任务会在不同拍的线程中执行。
 
 2、异步任务+串行队列
    异步任务放在串行队列中执行，任务只会在一个新开的线程中，按照顺序执行。
 
 3、异步任务+主队列
    把异步任务放在主队列中执行，由于主队列是一个特殊的串行队列，因此任务是串行执行的，但由于主队列对应的序号为1的线程，因此，即便是异步任务，也不会再创建新的线程。
 
 4、同步任务+并行队列
    同步任务的执行是在当前线程中完成的，因此，即便是把同步任务放在并行队列中执行，由于只有1个线程，任务也是一个一个按顺序执行（串行执行）的。
 
 5、同步任务+串行队列
    同步任务放在串行队列中执行，任务会在当前线程依次执行
 
 6、同步任务+主队列【错误组合】
    这种情况下，主线程会被阻塞，程序会挂死，不能使用。
 */

-(void)gcd_3{
    dispatch_queue_main_t q = dispatch_get_main_queue();
    dispatch_async(q, ^{
        NSLog(@"1 thread: %@",[NSThread currentThread]);
    });
    
    dispatch_async(q, ^{
        NSLog(@"2 thread: %@",[NSThread currentThread]);
    });
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
    
    [p setScore:1];
    
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


-(void)test0{
    DemoBean1 *demoBean1 = [[DemoBean1 alloc]init];
    demoBean1.n = 1;
    [demoBean1 test1];
    
    [demoBean1 performSelector:@selector(test)];
    [demoBean1 performSelector:@selector(test) withObject:nil];
    [demoBean1 performSelector:@selector(test) withObject:nil afterDelay:0];
    [[demoBean1 performSelector:@selector(test) onThread:NSThread mainThread] withObject:nil waitUntilDone:YES];
}

@end
