#import "MyView.h"

/**
 步骤一：新建一个类，继承UIView类。
 步骤二：重载drawRect方法，在这个方法中进行绘图。
 */

/**
 1、Core Graphics
    Core Graphic是一套基于C的框架，用于一切绘图操作，UIKit就是基于Core Graphic实现的，因此它可以实现比UIKit更底层的功能。
    
    Core Graphic使用Quartz2D作为绘图引擎，因此Quartz2D其实是Core Graphic的一部分，这两个名词密不可分。
 
 2、图形上下文
    画画需要画布，Core Graphics工作是的“画布”就是图形上下文，它决定图形绘制成什么样子，并绘制到哪里去。在“画布”中，每个连续的绘制操作都可以看成添加一个“图层”到画布上，在运行中我们可以通过额外的绘制操作来叠加更多“图层”来形成复杂的图形。
 　　推荐使用UIView自动为我们准备好的图形上下文，因为自定义上下文会降低内存的使用效率，导致性能下降。当需要我们调用UIGraphicsGetCurrentContext（）来获取图形上下文。

 3、路径
    相信很多人都临摹过书法，在一张薄薄的纸上照着书法家的笔迹来书写，这个“笔迹”就可以看成路径，通过确定的路径，可以确定绘图的形状、渲染的区域等等。
 　　通过创建路径并加入到上下文中渲染就能绘制出想要的图形。

 创建路径有以下三种方式：
 1.使用CGContextRef创建，如CGContextAddArc
 CGContextBeginPath //开始画路径
 CGContextMoveToPoint //移动到某一点
 CGContexAddLineToPoint //画直线
 CGContexAddCurveToPoint //画饼图
 CGContexAddEllipseInRect //画椭圆
 CGContexAddArc //画圆
 CGContexAddRect //画方框
 CGContexClosePath //封闭当前路径
 
 2.使用CGPathRef创建，如CGPathAddArc
 使用方法一绘制路径后将清空图形上下文，如果我们想保存路径来复用，可以使用Quartz提供的CGPath函数集合来创建可复用的路径对象。
 CGPathCreateMutable
 CGPathMoveToPoint
 CGPathAddLineToPoint
 CGPathAddCurveToPoint
 CGPathAddEllipseInRect
 CGPathAddArc
 CGPathAddRect
 CGPathCloseSubpath
 这些函数和上面方法一的一一对应，可代替之使用。
 CGContextAddPath：添加一个新的路径
 
 2.使用UIBezierPath创建，如bezierPathWithOvalInRect
 UIBezierPath存在于UIKit中，是对路径绘制的封装，和CGContextRef类似，优点是更面向对象，我们可以像操作普通对象一样对其进行操作。
 　　在自定义View的时候，一般使用UIBezierPath来创建路径就能基本满足我们的需求，推荐使用

 4、渲染
 绘画的最后一步，它之于绘图的意义如画画的最后上颜料一样。

 渲染分为两种方式：
 　　１）填充Fill：将路径内部填充渲染
 　　２）描边Stroke：不填充，只对路径进行渲染

 5、绘图状态栈
 图形上下文包含一个绘图状态栈，默认为空。
 　　１）保存图形状态时，将创建当前图形状态的一个副本并入栈。
 　　２）还原图形状态时，将栈顶的图形状态推出栈并替换当前图形状态。
 　　使用：调用CGContextSaveGState来保存，CGContextRestoreGState来还原。

 绘图的核心步骤
 在view上绘制一个图形的方式有很多种，表现形式可能不一样，但其实质步骤都是一样的：
 　　1）获取上下文
 　　2）绘制路径
 　　3）添加路径到上下文
 　　4）修改图形状态参数
 　　5）渲染上下文

 1）使用CGContextRef创建路径
 //获取上下文
 CGContextRef ctx = UIGraphicsGetCurrentContext();
 //绘制路径: 圆形(中心坐标200、200、半径100、起点弧度0、终点弧度2PI、画的方向0逆1正)
 CGContextAddArc(ctx, 200, 200, 100, 0, M_PI * 2, 0);
 //修改图形状态参数
 CGContextSetRGBStrokeColor(ctx, 0.5, 0.5, 0.9, 1.0);//笔颜色
 CGContextSetLineWidth(ctx, 10);//线条宽度
 //渲染上下文
 CGContextStrokePath(ctx);

 2）使用CGPathRef创建路径
 //获取上下文
 CGContextRef ctx = UIGraphicsGetCurrentContext();
 //创建可变路径
 CGMutablePathRef path = CGPathCreateMutable();
 //添加圆形到路径中(所在路径、不进行变换操作、中心坐标200、200、起点弧度0、终点弧度2PI、画的方向0逆1正)
 CGPathAddArc(path, NULL, 200, 200, 100, 0, M_PI * 2, 1);
 //将路径添加到上下文
 CGContextAddPath(ctx, path);
 //修改图形状态参数
 CGContextSetRGBStrokeColor(ctx, 0.5, 0.5, 0.9, 1.0);//笔颜色
 CGContextSetLineWidth(ctx, 10);//线条宽度
 //渲染上下文
 CGContextStrokePath(ctx);
 
 3）使用UIBezierPath创建路径
 //创建路径
 UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 200, 200)];
 //修改图形状态参数
 [[UIColor colorWithRed:0.5 green:0.5 blue:0.9 alpha:1.0] setStroke];//笔颜色
 [path setLineWidth:10];//线条宽度
 //渲染
 [path stroke];
 
 */
@interface MyView()

@end

@implementation MyView

- (void)drawRect:(CGRect)rect{
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 200, 200)];
    [[UIColor colorWithRed:0.5 green:0.5 blue:0.9 alpha:1.0] setStroke];
    [path setLineWidth:10];
    [path stroke];
}

@end
