#import "HtmlViewController.h"

@interface HtmlViewController ()

@property(nonatomic,strong)UIWebView*webView;

@end

@implementation HtmlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // self.navigationController.navigationBar.hidden = TRUE;
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"go back" style:UIBarButtonItemStyleDone target:self action:@selector(go_back)];
     
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    self.webView = [self.view viewWithTag:1];
    
    NSString*path = [[NSBundle mainBundle]pathForResource:@"html1" ofType:@"html"];
    NSURL*url = [NSURL fileURLWithPath:path];
    NSURLRequest*request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

-(void)go_back{
    NSLog(@"go back ......");
}

@end
