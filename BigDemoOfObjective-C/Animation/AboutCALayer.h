/**
 1.position和anchorPoint
 anchorPoint(锚点)是一个x和y值取值范围内在0~1之间CGPoint类型，它决定了当图层发生几何仿射变换时基于的坐标原点。默认情况下为0.5, 0.5，由anchorPoint和frame经过计算获得图层的position这个值。
 2.mask和maskToBounds
 maskToBounds值为true时表示超出图层范围外的所有子图层都不会进行渲染，当我们设置UIView的clipsToBounds时实际上就是在修改maskToBounds这个属性。mask这个属性表示一个遮罩图层，在这个遮罩之外的内容不予渲染显示。
 3.cornerRadius、borderWidth和borderColor
 borderWidth和borderColor设置了图层的边缘线条的颜色以及宽度，正常情况下这两个属性在layer的层次上不怎么使用。后者cornerRadius设置圆角半径，这个半径会影响边缘线条的形状。
 4.shadowColor、shadowOpacity、shadowOffset和shadowRadius
 这四个属性结合起来可以制作阴影效果。shadowOpacity默认情况下值为0，这意味着即便你设置了其他三个属性，只要不修改这个值，你的阴影效果就是透明的。
 */

/**
图形绘制
CGContextRef  ctx 图形上下文,可以将其理解为一块画布
//ctx 的备份
CGContextSaveGState(ctx);
//线的粗细
CGContextSetLineWidth(ctx, 5);

CGContextSetLineCap(ctx, kCGLineCapRound);//线条两端的样式
CGContextSetLineJoin(ctx, kCGLineJoinRound);//两线条转折相接端的样式

//ctx 的出栈  把  ctx 恢复成默认
CGContextRestoreGState(ctx);
//画笔颜色
CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);
//两点成线
CGContextMoveToPoint(ctx, 120, 50);    //起点
CGContextAddLineToPoint(ctx, 270, 50); //画线

CGContextStrokePath(ctx); //根据ctx 线条方式绘制
CGContextFillPath(ctx); //根据ctx 填充方式绘制

*/
/**
 1、每个 UIView 内部都有一个 CALayer 在背后提供内容的绘制和显示，并且 UIView 的尺寸样式都由内部的 Layer 所提供。

 2、两者都有树状层级结构，layer 内部有 SubLayers，View 内部有 SubViews。但是 Layer 比 View 多了个anchorPoint

 3、UIView的frame、bounds、center基础属性都获取于view.layer的基础属性，setter方法也会调用view.layer的setter方法

 4、CALayer 和 UIView中都可以根据上下文进行绘制，UIView的drawRect依赖CALayer传递过来的上下文才能执行、CALayer绘制并不依赖UIView，只依赖UIView进行展示

 5、在做 iOS 动画的时候，修改非 RootLayer的属性，会默认产生隐式动画，而修改UIView则不会。

 */
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AboutCALayer : NSObject

+ (void)draw;
+ (void)drawBezierPath;

@end

NS_ASSUME_NONNULL_END


