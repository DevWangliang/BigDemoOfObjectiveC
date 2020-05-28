/**
 一 可设置属性:
    1. frame            //大小变化：改变视图框架（frame）和边界。
    2. bounds           //拉伸变化：改变视图内容的延展区域。
    3. center           //居中显示
    4. transform        //旋转：即任何应用到视图上的仿射变换（transform）
    5. alpha            //改变透明度：改变视图的alpha值。
    6. backgroundColor  //改变背景颜色
    7. contentStretch   //拉伸内容
二 参数:
    1. duration   //为动画持续的时间。
    2. animations //为动画效果的代码块。
    3. completion //为动画执行完毕以后执行的代码块
    4. options    //为动画执行的选项
    5. delay      //为动画开始执行前等待的时间

三 UIView(UIViewAnimationWithBlocks)
     可选动画执行效果，如进出效果等
     + (void)animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion NS_AVAILABLE_IOS(4_0);

     带回调block动画，动画执行完成后进入block
     + (void)animateWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion NS_AVAILABLE_IOS(4_0); // delay = 0.0, options = 0

     不带回调动画
     + (void)animateWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations NS_AVAILABLE_IOS(4_0); // delay = 0.0, options = 0, completion = NULL

     弹簧动画
     + (void)animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay usingSpringWithDamping:(CGFloat)dampingRatio initialSpringVelocity:(CGFloat)velocity options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion NS_AVAILABLE_IOS(7_0);

     view的转场动画
     + (void)transitionWithView:(UIView *)view duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options animations:(void (^ __nullable)(void))animations completion:(void (^ __nullable)(BOOL finished))completion NS_AVAILABLE_IOS(4_0);

     view到另一个view的转场动画
     + (void)transitionFromView:(UIView *)fromView toView:(UIView *)toView duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options completion:(void (^ __nullable)(BOOL finished))completion NS_AVAILABLE_IOS(4_0); // toView added to fromView.superview, fromView removed from its superview

     + (void)performSystemAnimation:(UISystemAnimation)animation onViews:(NSArray<__kindof UIView *> *)views options:(UIViewAnimationOptions)options animations:(void (^ __nullable)(void))parallelAnimations completion:(void (^ __nullable)(BOOL finished))completion NS_AVAILABLE_IOS(7_0);
 四 转场动画相关:
    UIViewControllerAnimatedTransitioning
    //定义转场动画时间
    - (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext
    //定义转场动画效果
    - (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext

 
    UINavigationControllerDelegate 中
    //这里返回的就是navigationController push 要使用的动画效果
    - (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
    {
      //在这里把 TransitionOneManager 实现的动画效果返回回去
    }

 */

/**
关键帧动画
+ (void)animateKeyframesWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewKeyframeAnimationOptions)options animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion NS_AVAILABLE_IOS(7_0);

在上面的block中添加关键帧
+ (void)addKeyframeWithRelativeStartTime:(double)frameStartTime relativeDuration:(double)frameDuration animations:(void (^)(void))animations NS_AVAILABLE_IOS(7_0); // start time and duration are values between 0.0 and 1.0 specifying time and duration relative to the overall time of the keyframe animation

*/
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AboutUIViewAnimation : NSObject

+ (void)UIViewKeyframeAnimations;

+ (void)transitionWithView;

@end

NS_ASSUME_NONNULL_END
