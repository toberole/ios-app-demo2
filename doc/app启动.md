程序启动的完整过程

1. main函数

2.UIApplicationMain
根据第三个参数创建对应的UIApplication对象
根据第四个参数AppDelegate创建并指定此对象为UIApplication的代理.
开启主运行循环 main events loop处理事件，UIApplication会开启一个消息循环不断监听应用程序的各个活动，当应用程序生命周期发生改变UIApplication就会调用代理对应的方法。

3.程序启动完毕的时候, 创建window，加载info.plist。
(假如有storyboard)根据Info.plist中 Main storyboard file base name 字段获得最主要storyboard的文件名,加载对应的storyboard。
系统在加载storyboard的时候会做以下三件事情
1. 创建窗口 UIWindow。
2. 加载mian.storyboard 并实例化view controller
3. 分配新视图控制器到窗口root viewcontroller,然后使窗口显在示屏幕上。

(假如没有storyboard)就不会加载storyboard，也就不会帮我们创建UIWindow，那么我们需要自己在程序启动完成的时候也就是在didFinishLaunchingWithOptions方法中创建。
1.创建窗口 UIWindow。
2. 创建并实例化view controller
3. 分配新视图控制器到窗口root viewcontroller,然后使窗口显在示屏幕上。



作者：進无尽
链接：https://www.jianshu.com/p/038a684c2068
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
