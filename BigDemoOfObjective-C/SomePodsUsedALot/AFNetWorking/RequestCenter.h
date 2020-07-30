//
//  RequestCenter.h
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/7/28.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

/**
 贴合具体业务 如果封装的不好不如不封装 直接用现成的
 1.单例
 2.全局配置
 3.网络监听:
 4.全局单例下载队列,后台下载
 5.上传:后台日志上传,文件上传,批量上传
 6.post请求
 7.get请求
 8.超时设置
 9.公共请求参数
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RequestCenter : NSObject

#pragma mark - Singleton
+ (instancetype)shareCenter;

#pragma mark - request

- (nullable NSURLSessionDataTask *)postWithUrl:(NSString *)urlString
                                    parameters:(nullable NSDictionary *)parameters
                                       success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;

#pragma mark - monitor
+ (void)startMonitoring;

@end

NS_ASSUME_NONNULL_END
