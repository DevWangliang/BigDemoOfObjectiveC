/**
 CAAnimation是所有动画对象的父类，实现CAMediaTiming协议，负责控制动画的时间、速度和时间曲线等等，是一个抽象类，不能直接使用。
 CAPropertyAnimation 是CAAnimation的子类，它支持动画地显示图层的keyPath，不直接使用。
 CATransition 转场动画
 1. CABasicAnimation  基础动画

 2. CAKeyframeAnimation  关键帧动画

 3. CATransition 转场动画

 4. CAAnimationGroup 组动画

 5. CASpringAnimation 弹性动画 （iOS9.0之后，它实现弹簧效果的动画，是CABasicAnimation的子类。）
 
 CAMediaTimingFillMode 决定layer在动画开始前后的表现形式
 
 CAPropertyAnimation常用属性
 transform.scale 比例转化 @(0.8)
 transform.scale.x 宽的比例 @(0.8)
 transform.scale.y 高的比例 @(0.8)
 transform.rotation.x 围绕x轴旋转 @(M_PI)
 transform.rotation.y 围绕y轴旋转 @(M_PI)
 transform.rotation.z 围绕z轴旋转 @(M_PI)
 cornerRadius 圆角的设置 @(50)
 backgroundColor 背景颜色的变化 (id)[UIColor purpleColor].CGColor
 bounds 大小，中心不变 [NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];
 position 位置(中心点的改变) [NSValue valueWithCGPoint:CGPointMake(300, 300)];
 contents 内容，比如UIImageView的图片 imageAnima.toValue = (id)[UIImage imageNamed:@"to"].CGImage;
 opacity 透明度 @(0.7)
 contentsRect.size.width 横向拉伸缩放 @(0.4)最好是0~1之间的
    
 */
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AboutAmimation : NSObject
+ (void)CABasicAnimation;
+ (void)CAKeyframeAnimation;
+ (void)CAAnimationGroup;
+ (void)CATransition;
@end

NS_ASSUME_NONNULL_END
