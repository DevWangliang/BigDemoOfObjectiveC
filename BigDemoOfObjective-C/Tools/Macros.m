//
//  Macros.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/5/25.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kIs_iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define kIs_iPhoneX ((kScreenWidth >= 375.0f) && (kScreenHeight >= 812.0f) && kIs_iphone)

/*状态栏高度*/
#define kStatusBarHeight (CGFloat)(kIs_iPhoneX ? (44.0) : (20.0))
/*导航栏高度*/
#define kNavBarHeight (44.0)
/*状态栏和导航栏总高度*/
#define kNavBarAndStatusBarHeight (CGFloat)(kIs_iPhoneX ? (88.0) : (64.0))
/*TabBar高度*/
#define kTabBarHeight (CGFloat)(kIs_iPhoneX ? (49.0 + 34.0) : (49.0))
/*顶部安全区域远离高度*/
#define kTopBarSafeHeight (CGFloat)(kIs_iPhoneX ? (44.0) : (0))
/*底部安全区域远离高度*/
#define kBottomSafeHeight (CGFloat)(kIs_iPhoneX ? (34.0) : (0))
/*iPhoneX的状态栏高度差值*/
#define kTopBarDifHeight (CGFloat)(kIs_iPhoneX ? (24.0) : (0))
/*导航条和Tabbar总高度*/
#define kNavAndTabHeight (kNavBarAndStatusBarHeight + kTabBarHeight)
