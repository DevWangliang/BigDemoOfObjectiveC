/**
 1. dispatch_source_t 可用作定时器,需要把定义的timer作为属性并strong,否则会失效
 2. dispatch_apply 能设置block运行次数,结合group运行需要结合 dispatch_group_enter  dispatch_group_leave
 3. dispatch_group_wait(group, DISPATCH_TIME_FOREVER) 能和 dispatch_group_notify 达到相同的效果
 4. dispatch_once 定义singleTon时需要以下实现:
              + (instancetype)shareInstance{
                     static dispatch_once_t onceToken;
                     dispatch_once(&onceToken, ^{
                         _instance = [[SingleTon allocWithZone:NULL] init];
                     });
                     return _instance;
             }
             + (instancetype)allocWithZone:(struct _NSZone *)zone{
                     return [SingleTon shareInstance];
              }
 5. dispatch_barrier_async 一般用于自定义线程中,不建议使用
 6. 多线程个数和CPU核数相关
 7. dispatch_after 用于延迟执行
 8. dispatch_queue_global_t 可理解成继承于 dispatch_queue_t
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AboutGCD : NSObject

@end

NS_ASSUME_NONNULL_END
