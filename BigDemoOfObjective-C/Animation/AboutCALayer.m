//
//  AboutCALayer.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/5/27.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import "AboutCALayer.h"

@implementation AboutCALayer

+ (void)draw {
//    画实线
//    CGContextMoveToPoint(ctx, 120, 50);    //起点
//    CGContextAddLineToPoint(ctx, 270, 50); //画线
//
//    画虚线
//    ctx方式：
//
//    CGFloat dash[2] = {3, 1};
//    CGContextSetLineWidth(ctx, 0.5);
//    CGContextSetLineCap(ctx, kCGLineCapRound);
//    CGContextSetLineDash(ctx, 0.0, dash, 2);
//    CGContextMoveToPoint(ctx, 120, 100);
//    CGContextAddLineToPoint(ctx, 270, 100);
//    CGContextStrokePath(ctx);
//
//    CAShapeLayer方式：
//
//    UIBezierPath *pathFour = [UIBezierPath bezierPath];
//    pathFour.lineWidth = 3;
//    [pathFour moveToPoint:CGPointMake(120, 50)];
//    [pathFour addLineToPoint:CGPointMake(270, 50)];
//    [pathFour stroke];
//
//    CAShapeLayer *layer4 = [CAShapeLayer layer];
//    layer4.path = pathFour.CGPath;
//    [layer addSublayer:layer4];
//    layer4.strokeColor = [[UIColor greenColor] CGColor];
//    layer4.fillColor = [[UIColor clearColor] CGColor];
//    //线型模板 这是一个NSNumber的数组，索引从1开始记，奇数位数值表示实线长度，偶数位数值表示空白长度
//    [layer4 setLineDashPattern:@[ @3, @1, @10, @5 ]];
//
//    画矩形
//    CGContextAddRect(ctx, CGRectMake(150, 50, 50, 50));
//
//    画圆、圆弧
//    CGContextAddArc(ctx, 60, 50, 45, 0, M_PI, 0);
//
//    画圆、画椭圆
//    CGContextAddEllipseInRect(ctx, CGRectMake(150, 40, 90, 50));
//
//    部分绘制
//    CAShapeLayer  的 strokeStart 和 strokeEnd 属性

}

+ (void)drawBezierPath {
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    CAShapeLayer *layer = [CAShapeLayer layer];
//    [path moveToPoint:CGPointMake(50, 100)];
//    [path addLineToPoint:CGPointMake(200, 100)];
//    [path addLineToPoint:CGPointMake(200, 250)];
//    [path addLineToPoint:CGPointMake(50, 250)];
//
//    layer.frame = self.contentViewOne.bounds;
//    layer.strokeColor = [[UIColor redColor] CGColor];
//    layer.fillColor = [[UIColor clearColor] CGColor];
//    layer.lineCap = kCALineCapRound;
//    layer.lineJoin = kCALineJoinRound;
//    layer.path = [path CGPath];
//    layer.lineWidth = 6.0;
//
//    [self.contentViewOne.layer addSublayer:layer];
//
//    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    pathAnimation.duration = 3;
//    pathAnimation.fromValue = @(0.0);
//    pathAnimation.toValue = @(1.0);
//    pathAnimation.autoreverses = YES;
//    pathAnimation.repeatCount = HUGE;
//    [layer addAnimation:pathAnimation forKey:nil];

}


@end
