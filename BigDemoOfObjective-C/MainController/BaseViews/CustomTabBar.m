//
//  CustomTabBar.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/5/26.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import "CustomTabBar.h"
@interface CustomTabBar(){
    InnerButtonAction _action;
}
@property (nonatomic, strong) UIButton *innerButton;
@end

@implementation CustomTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    [self addSubview:self.innerButton];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    int index = 0;
    CGFloat width = kScreenWidth / 5;
    CGFloat height = 49;
    for (UIView *item in self.subviews) {
        if ([item isMemberOfClass:NSClassFromString(@"UITabBarButton")]) {
            index = index == 2 ? 3 : index;
            item.frame = CGRectMake(index * width, 0, width, height);
            index += 1;
        }
    }
    self.innerButton.frame = CGRectMake(width * 2, 0, width, height);
}

- (void)buttonClicked:(UIButton *)button {
    _action(button);
}

- (void)innerButtonClicked:(InnerButtonAction)action{
    _action = action;
}

#pragma mark - - - - -
#pragma mark prop
/**
 因为设置了tabBar的显示颜色,内部会把图片的显示颜色也改成一样的,
 所以如果要图片原样显示,就要设置图片的显示模式
 */
- (UIButton *)innerButton {
    if (!_innerButton) {
        _innerButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_innerButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [_innerButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [_innerButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [_innerButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        [_innerButton sizeToFit];
        [_innerButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _innerButton;
}
@end
