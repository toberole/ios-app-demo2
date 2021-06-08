#import "CacheViewController.h"
#import "Person.h"

/**
 NSCache是线程安全的，使用NSMutableDictionary自定义实现缓存的时候需要考虑加锁和释放锁。
 
 内存不足时NSCache会自动释放存储的对象，不需要手动干预，如果是自定义实现需要监听内存状态然后做进一步删除对象的操作。
 
 NSCache的键key不会被复制，所以key不需要实现NSCopying协议。
 
 NSCache删除缓存中的对象会在以下情形中发生：
 1、NSCache缓存对象自身被释放
 2、手动调用removeObjectForKey:方法
 3、手动调用removeAllObjects
 4、缓存中对象的个数大于countLimit，或缓存中对象的总cost值大于totalCostLimit
 程序进入后台后
 5、收到系统的内存警告
 */
@interface CacheViewController ()

@property(nonatomic,strong)NSCache*cache;

@property(nonatomic,assign)int count;

@end

@implementation CacheViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"init ......");
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    NSLog(@"initWithNibName ......");
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton*btn = [self.view viewWithTag:1];
    [btn addTarget:self action:@selector(btn_clciked1) forControlEvents:UIControlEventTouchUpInside];
    
    btn = [self.view viewWithTag:2];
    [btn addTarget:self action:@selector(btn_clciked2) forControlEvents:UIControlEventTouchUpInside];
    
    btn = [self.view viewWithTag:3];
    [btn addTarget:self action:@selector(btn_clciked3) forControlEvents:UIControlEventTouchUpInside];
    
    btn = [self.view viewWithTag:4];
    [btn addTarget:self action:@selector(btn_clciked4) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.count = 0;
    
    [self initCache];
}

-(void)initCache{
    self.cache = [[NSCache alloc]init];
    // 删除元素 以TotalCostLimit和CountLimit中小值为准
    // [self.cache setTotalCostLimit:4/* 单位字节 */];
    [self.cache setCountLimit:5];
    
    [self.cache setDelegate:self];
    
    /*
        这个值与NSDiscardableContent协议有关，默认为YES
        当一个类实现了该协议，并且这个类的对象不再被使用时意味着可以被释放
    */
    self.cache.evictsObjectsWithDiscardedContent = YES;
}

-(void)btn_clciked1{
    NSLog(@"btn_clciked1 ......");
    self.count++;
    NSString*str = [NSString stringWithFormat:@"test-%d",self.count];
    // [self.cache setObject:str forKey:str];
    [self.cache setObject:str forKey:str cost:1];
}

-(void)btn_clciked2{
    NSLog(@"btn_clciked2 ......");
    NSString*str = [NSString stringWithFormat:@"test-%d",self.count];
    NSObject*obj = [self.cache objectForKey:str];
    NSLog(@"obj: %@",obj);
//    obj = [self.cache objectForKey:@"a"];
//    if (!obj) {
//        NSLog(@"obj is not exit!");
//    }
}

-(void)btn_clciked3{
    NSLog(@"btn_clciked3 ......");
    Person*p = [[Person alloc]init];
    self.count++;
    NSString*str = [NSString stringWithFormat:@"test-%d",self.count];
    [p beginContentAccess];
    [self.cache setObject:p forKey:str];
    [p endContentAccess];
}

-(void)btn_clciked4{
    NSLog(@"btn_clciked4 ......");
    NSString*str = [NSString stringWithFormat:@"test-%d",self.count];
    NSObject*obj = [self.cache objectForKey:str];
    NSLog(@"obj: %@",obj);
}

- (void)cache:(NSCache *)cache willEvictObject:(id)obj{
    NSLog(@"cache: %@,obj: %@",cache,obj);
}

@end
