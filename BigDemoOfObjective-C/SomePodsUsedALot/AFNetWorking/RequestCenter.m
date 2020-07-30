//
//  RequestCenter.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/7/28.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import "RequestCenter.h"
#import "AFNetworking.h"
#import "RequestConfig.h"

@interface RequestCenter ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;
@end

@implementation RequestCenter

+ (instancetype)shareCenter {
    static RequestCenter *center;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        center = [[RequestCenter alloc] init];
    });
    return center;
}

#pragma mark - POST

- (nullable NSURLSessionDataTask *)postWithUrl:(NSString *)urlString
                                    parameters:(nullable NSDictionary *)parameters
                                       success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure {
    RequestConfig *config = [RequestConfig defaultConfig];
    NSMutableDictionary *requestParameters = [parameters mutableCopy];
    if (config.fixedParameters) {
        [requestParameters addEntriesFromDictionary:config.fixedParameters];
    }
    NSURLSessionDataTask *task = [self.sessionManager POST:urlString parameters:requestParameters headers:config.headers progress:nil success:success failure:failure];
    task.taskDescription = [urlString copy];
    return task;
}

#pragma mark - GET

- (nullable NSURLSessionDataTask *)getWithUrl:(NSString *)urlString
                                   parameters:(nullable NSDictionary *)parameters
                                success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure {
    RequestConfig *config = [RequestConfig defaultConfig];
    NSMutableDictionary *requestParameters = [parameters mutableCopy];
    if (config.fixedParameters) {
        [requestParameters addEntriesFromDictionary:config.fixedParameters];
    }
    NSURLSessionDataTask *task = [self.sessionManager GET:urlString parameters:requestParameters headers:config.headers progress:nil success:success failure:failure];
    task.taskDescription = [urlString copy];
    return task;
}

#pragma mark - monitor

+ (void)startMonitoring {
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        Log(@"网络状态: %@", stringFromNetworkReachabilityStatus(status));
    }];

    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

NSString * stringFromNetworkReachabilityStatus(AFNetworkReachabilityStatus status) {
    switch (status) {
        case AFNetworkReachabilityStatusNotReachable:
            return NSLocalizedStringFromTable(@"无网络连接", @"RequestCenter", nil);
        case AFNetworkReachabilityStatusReachableViaWWAN:
            return NSLocalizedStringFromTable(@"无线广域网", @"RequestCenter", nil);
        case AFNetworkReachabilityStatusReachableViaWiFi:
            return NSLocalizedStringFromTable(@"WiFi", @"RequestCenter", nil);
        case AFNetworkReachabilityStatusUnknown:
        default:
            return NSLocalizedStringFromTable(@"未知网络", @"RequestCenter", nil);
    }
}

#pragma mark - dealloc

- (void)dealloc
{
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
}

#pragma mark - getter

- (AFHTTPSessionManager *)sessionManager {
    if (!_sessionManager) {
        RequestConfig *config = [RequestConfig defaultConfig];
        NSURLSessionConfiguration *configuration = NSURLSessionConfiguration.defaultSessionConfiguration;
        if (config.timeout != 0) {
            configuration.timeoutIntervalForRequest = config.timeout;
        }
        NSURL *url = nil;
        if (config.baseUrl) {
            url = [NSURL URLWithString:config.baseUrl];
        }
        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:url sessionConfiguration:configuration];
    }
    return _sessionManager;
}

#pragma mark - GCD upload

- (NSURLSessionUploadTask*)uploadTaskWithImage:(UIImage*)image completion:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionBlock {
    // 构造 NSURLRequest
    NSError *error;
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:[self uploadUrl] parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        NSData* imageData = UIImageJPEGRepresentation(image, 1.0);
        [formData appendPartWithFileData:imageData name:@"file" fileName:@"someFileName" mimeType:@"multipart/form-data"];
    } error:&error];
    
    // 可在此处配置验证信息

    // 将 NSURLRequest 与 completionBlock 包装为 NSURLSessionUploadTask
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithStreamedRequest:request progress:^(NSProgress * _Nonnull uploadProgress) {
    } completionHandler:completionBlock];
    
    return uploadTask;
}

- (NSString *)uploadUrl {
    return @"";
}

#warning GCD upload test

- (IBAction)runDispatchTest:(id)sender {
    // 需要上传的数据
    NSArray* images = nil;//[self images];
    
    // 准备保存结果的数组，元素个数与上传的图片个数相同，先用 NSNull 占位
    NSMutableArray* result = [NSMutableArray array];
    for (UIImage* image in images) {
        [result addObject:[NSNull null]];
    }
    
    dispatch_group_t group = dispatch_group_create();
    
    for (NSInteger i = 0; i < images.count; i++) {
        
        dispatch_group_enter(group);

        NSURLSessionUploadTask* uploadTask = [self uploadTaskWithImage:images[i] completion:^(NSURLResponse *response, NSDictionary* responseObject, NSError *error) {
            if (error) {
                Log(@"第 %d 张图片上传失败: %@", (int)i + 1, error);
                dispatch_group_leave(group);
            } else {
                Log(@"第 %d 张图片上传成功: %@", (int)i + 1, responseObject);
                @synchronized (result) { // NSMutableArray 是线程不安全的，所以加个同步锁
                    result[i] = responseObject;
                }
                dispatch_group_leave(group);
            }
        }];
        [uploadTask resume];
    }

    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        Log(@"上传完成!");
        for (id response in result) {
            Log(@"%@", response);
        }
    });
}

@end
