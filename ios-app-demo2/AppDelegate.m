#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    UIStoryboard*storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController*vc = [storyBoard instantiateViewControllerWithIdentifier:@"view_controller"];
    
    UINavigationController *nv = [[UINavigationController alloc]initWithRootViewController:vc];
    // nv.interactivePopGestureRecognizer.enabled = YES;
    // 导航栏背景颜色
    // nv.navigationBar.barTintColor = [UIColor whiteColor];
    // 导航栏文字颜色
    // nv.navigationBar.tintColor = [UIColor yellowColor];
    [self.window setRootViewController:nv];
    [self.window makeKeyAndVisible];
    
    [self setApplicationIconBadgeNumber:10];
    
    // 联网状态
    NSLog(@"联网状态: %d",[UIApplication sharedApplication].networkActivityIndicatorVisible);

    return YES;
}

-(void)setApplicationIconBadgeNumber:(int)applicationIconBadgeNumber{
    
    //创建UIUserNotificationSettings对象
    UIUserNotificationSettings *set = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    //In iOS 8.0 and later, your application must register for user notifications using -[UIApplication registerUserNotificationSettings:] before being able to set the icon badge.
    //在iOS8及以后,你的应用必须通过[UIApplication registerUserNotificationSettings:]方法来注册用户通知之后,才能设置applicationIconBadge属性
    [[UIApplication sharedApplication] registerUserNotificationSettings:set];
    //设置消息数量
    [UIApplication sharedApplication].applicationIconBadgeNumber = applicationIconBadgeNumber;
    

}

//#pragma mark - UISceneSession lifecycle
//
//
//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
