//
//  AboutAmimation.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/5/27.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import "AboutAmimation.h"

@implementation AboutAmimation

+ (void)CABasicAnimation {
    CABasicAnimation *a1 = [CABasicAnimation animation];
    a1.keyPath = @"position";
    a1.toValue = [NSValue valueWithCGPoint:CGPointMake(150 + 28, 180 + 28)];
    a1.duration = 0.5;
    a1.fillMode = kCAFillModeForwards;
    a1.removedOnCompletion = NO;
    //[self.view.layer addAnimation:a1 forKey:@"position"];
}

+ (void)CAKeyframeAnimation {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 2;
    //animation.repeatCount = HUGE_VAL;
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:[NSValue valueWithCGPoint:CGPointMake(30, 150)]];
    [array addObject:[NSValue valueWithCGPoint:CGPointMake(kScreenWidth / 2.0, 70)]];
    [array addObject:[NSValue valueWithCGPoint:CGPointMake(kScreenWidth - 30, 150)]];
    [array addObject:[NSValue valueWithCGPoint:CGPointMake(kScreenWidth / 2.0, 300 - 50)]];
    [array addObject:[NSValue valueWithCGPoint:CGPointMake(30, 150)]];
    animation.values = array;
    //每一个动画的时间节点位置  百分比制 0-1之间
    NSMutableArray *time_array = [NSMutableArray array];
    [time_array addObject:[NSNumber numberWithFloat:0.0]];
    [time_array addObject:[NSNumber numberWithFloat:0.25]];
    [time_array addObject:[NSNumber numberWithFloat:0.5]];
    [time_array addObject:[NSNumber numberWithFloat:0.75]];
    [time_array addObject:[NSNumber numberWithFloat:1.0]];
    animation.keyTimes = time_array; //设置关键帧对应的时间点，范围：0-1。如果没有设置该属性，则每一帧的时间平分。

//    [self.imageView.layer addAnimation:animation forKey:@"CAKeyframeAnimation"];
}

+ (void)CAAnimationGroup {
    // 2.1 旋转
    CABasicAnimation *anim1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    // anim1.toValue = @(M_PI * 2 * 500);
    anim1.byValue = @(M_PI * 2 * 1000);

    // 2.2 缩放
    CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anim2.toValue = @(0.1);

    // 2.3 改变位置, 修改position
    CAKeyframeAnimation *anim3 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    anim3.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 100, 250, 100)].CGPath;

    // 把子动画添加到组动画中
    CAAnimationGroup *groupAnima = [CAAnimationGroup animation];

    groupAnima.animations = @[ anim1, anim2, anim3];

    groupAnima.duration = 2.0;
//    [self.imageView.layer addAnimation:groupAnima forKey:@"animationGroup"];
}

+ (void)CATransition {
    CATransition *ani = [CATransition animation];
    ani.type = @"rippleEffect"; //水滴入水振动的效果
    ani.subtype = kCATransitionFromLeft;
    ani.duration = 1.5;
//    [self.imageView.layer addAnimation:ani forKey:nil];
}

@end
