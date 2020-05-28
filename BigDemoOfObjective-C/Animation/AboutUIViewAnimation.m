//
//  AboutUIViewAnimation.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/5/28.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import "AboutUIViewAnimation.h"

@implementation AboutUIViewAnimation

+ (void)UIViewKeyframeAnimations {
    [UIView animateKeyframesWithDuration:2.0 delay:0.0 options:UIViewKeyframeAnimationOptionAutoreverse animations:^{

        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.5 animations:^{

//            self.animationImageView.frame = CGRectMake(200, 132, 56, 36);
        }];

        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.5 animations:^{

//            self.animationImageView.frame = CGRectMake(200, 232, 56, 36);
        }];

    } completion:^(BOOL finished) {
//        self.animationImageView.frame = CGRectMake(0, 132, 56, 36);
    }];

}

+ (void)transitionWithView {
//    //在 viewDidLoad 中:
//    self.someView = [[UIView alloc] initWithFrame:CGRectMake(20, 40, 100, 100)];    self.someView.backgroundColor = [UIColor greenColor];    [self.view addSubview:self.someView];    view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];    view1.backgroundColor = [UIColor redColor];    view1.alpha = 0;    [self.someView addSubview:view1];    view2 = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];    view2.backgroundColor = [UIColor blueColor];    [self.someView addSubview:view2];
//    // viewDidAppear 中
//    [UIView transitionWithView:self.someView duration:2.5 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{        view2.alpha = 0;        self.someView.center = CGPointMake(200, 400);        view1.alpha = 1;    } completion:^(BOOL finished) {     }];

}

@end
