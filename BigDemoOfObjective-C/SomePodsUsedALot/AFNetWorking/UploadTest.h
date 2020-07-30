//
//  UploadTest.h
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/7/29.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UploadTest : NSOperation

+ (instancetype)operationWithURLSessionTask:(NSURLSessionTask*)task;

@end

NS_ASSUME_NONNULL_END

/**
 
 - (IBAction)runNSOperationTest:(id)sender {
     // 需要上传的数据
     NSArray* images = [self images];
     
     // 准备保存结果的数组，元素个数与上传的图片个数相同，先用 NSNull 占位
     NSMutableArray* result = [NSMutableArray array];
     for (UIImage* image in images) {
         [result addObject:[NSNull null]];
     }
     
     NSOperationQueue *queue = [[NSOperationQueue alloc] init];
     queue.maxConcurrentOperationCount = 5;
     
     NSBlockOperation *completionOperation = [NSBlockOperation blockOperationWithBlock:^{
         [[NSOperationQueue mainQueue] addOperationWithBlock:^{ // 回到主线程执行，方便更新 UI 等
             Log(@"上传完成!");
             for (id response in result) {
                 Log(@"%@", response);
             }
         }];
     }];
     
     for (NSInteger i = 0; i < images.count; i++) {
         
         NSURLSessionUploadTask* uploadTask = [self uploadTaskWithImage:images[i] completion:^(NSURLResponse *response, NSDictionary* responseObject, NSError *error) {
             if (error) {
                 Log(@"第 %d 张图片上传失败: %@", (int)i + 1, error);
             } else {
                 Log(@"第 %d 张图片上传成功: %@", (int)i + 1, responseObject);
                 @synchronized (result) { // NSMutableArray 是线程不安全的，所以加个同步锁
                     result[i] = responseObject;
                 }
             }
         }];
         
         UploadTest *uploadOperation = [UploadTest operationWithURLSessionTask:uploadTask];
         
         [completionOperation addDependency:uploadOperation];
         [queue addOperation:uploadOperation];
     }

     [queue addOperation:completionOperation];
 }
 
 */
