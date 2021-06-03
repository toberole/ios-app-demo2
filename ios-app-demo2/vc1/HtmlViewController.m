#import "HtmlViewController.h"

@interface HtmlViewController ()

@property(nonatomic,strong)UIWebView*webView;

@end

@implementation HtmlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [self.view viewWithTag:1];
    
    NSString*path = [[NSBundle mainBundle]pathForResource:@"html1" ofType:@"html"];
    NSURL*url = [NSURL fileURLWithPath:path];
    NSURLRequest*request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}



@end
