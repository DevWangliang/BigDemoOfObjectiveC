//
//  RequestConfig.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/7/29.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import "RequestConfig.h"

@implementation RequestConfig

+ (instancetype)defaultConfig {
    static RequestConfig *defaultConfig;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultConfig = [[RequestConfig alloc] init];
    });
    return defaultConfig;;
}

+ (void)setupWithBlock:(void(^)(RequestConfig * _Nonnull ))block {
    SAFE_BLOCK(block,[RequestConfig defaultConfig]);
}

@end
