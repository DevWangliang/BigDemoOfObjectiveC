//
//  UploadTest.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/7/29.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import "UploadTest.h"
#import "AFNetworking.h"

@interface UploadTest (){
    BOOL executing;  // 系统的 finished 是只读的，不能修改，所以只能重写一个。
    BOOL finished;
}

@property (nonatomic, strong) NSURLSessionTask* task;

@property (nonatomic, assign) BOOL isObserving;

@end

@implementation UploadTest

#pragma mark - Observe Task

+ (instancetype)operationWithURLSessionTask:(NSURLSessionTask*)task {
    UploadTest* operation = [UploadTest new];
    operation.task = task;
    return operation;
}

- (void)dealloc {
    [self stopObservingTask];
}

- (void)startObservingTask {
    @synchronized (self) {
        if (_isObserving) {
            return;
        }
        
        [_task addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionNew context:nil];
        _isObserving = YES;
    }
}

- (void)stopObservingTask { // 因为要在 dealloc 调，所以用下划线不用点语法
    @synchronized (self) {
        if (!_isObserving) {
            return;
        }
        
        _isObserving = NO;
        [_task removeObserver:self forKeyPath:@"state"];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if (self.task.state == NSURLSessionTaskStateCanceling || self.task.state == NSURLSessionTaskStateCompleted) {
        [self stopObservingTask];
        [self completeOperation];
    }
}

#pragma mark - NSOperation methods

- (void)start {
    // Always check for cancellation before launching the task.
    if ([self isCancelled])
    {
        // Must move the operation to the finished state if it is canceled.
        [self willChangeValueForKey:@"isFinished"];
        finished = YES;
        [self didChangeValueForKey:@"isFinished"];
        return;
    }
    
    // If the operation is not canceled, begin executing the task.
    [self willChangeValueForKey:@"isExecuting"];
    [NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
    executing = YES;
    [self didChangeValueForKey:@"isExecuting"];
}

- (void)main {
    @try {
        [self startObservingTask];
        [self.task resume];
    }
    @catch (NSException * e) {
        Log(@"Exception %@", e);
    }
}

- (void)completeOperation {
    [self willChangeValueForKey:@"isFinished"];
    [self willChangeValueForKey:@"isExecuting"];
    
    executing = NO;
    finished = YES;
    
    [self didChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isFinished"];
}

- (BOOL)isAsynchronous {
    return YES;
}

- (BOOL)isExecuting {
    return executing;
}

- (BOOL)isFinished {
    return finished;
}

//信号量
- (void)s {
    dispatch_queue_t queue = dispatch_queue_create("com.download.task", DISPATCH_QUEUE_SERIAL);
       NSString *str = @"https://www.****.com/***.jpg";
       //设置信号总量为1，保证只有一个进程执行
       dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
       for (int i = 0; i<10; i++) {
           dispatch_async(queue, ^(){
               //等待信号量
               dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
               NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
               AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
               NSURL *URL = [NSURL URLWithString:str];
               NSURLRequest *request = [NSURLRequest requestWithURL:URL];
               NSString *downLocalPath = @"downLoad.zip";// [self unzipDestinationPathForKey:@"downLoad.zip"];//下载到本地的zip地址
               NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
                   Log(@"%f",(1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount));
                   dispatch_async(dispatch_get_main_queue(), ^{
                       //执行进度条的页面刷新
                   });
               } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
                   return [NSURL fileURLWithPath:downLocalPath isDirectory:NO];
               } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
                   Log(@"%d---%d",i,i);
                   if(i == 9){
                       //所有方法执行完
                   }
                   dispatch_semaphore_signal(semaphore);  //发送一个信号
               }];
               [downloadTask resume];
           });
       }


}

@end
