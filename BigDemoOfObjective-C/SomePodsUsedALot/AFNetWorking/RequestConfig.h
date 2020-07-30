//
//  RequestConfig.h
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/7/29.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SAFE_BLOCK(BlockName, ...) ({ !BlockName ? nil : BlockName(__VA_ARGS__); })

NS_ASSUME_NONNULL_BEGIN

@interface RequestConfig : NSObject

@property (nonatomic, copy, readwrite) NSString *baseUrl;
@property (nonatomic, strong, readwrite) NSDictionary *fixedParameters;
@property (nonatomic, assign, readwrite) NSTimeInterval timeout;
@property (nonatomic, strong, readwrite) NSDictionary <NSString *, NSString *>*headers;

+ (instancetype)defaultConfig;
+ (void)setupWithBlock:(void(^)(RequestConfig * _Nonnull config))block;

@end

NS_ASSUME_NONNULL_END
