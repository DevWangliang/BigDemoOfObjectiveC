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

/**
 
 哲学家分叉子问题:资源分配问题=>信号量
 
 信号量代码解读
    //创建了初始值为1的信号量,表示当前资源只能支持一个连接端口
     dispatch_semaphore_t signal = dispatch_semaphore_create(1);
    //等待时间
     dispatch_time_t overTime = dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC);
    //在并行队列里添加一个异步任务
     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //等待:signal > 0(代表资源有空闲可以访问) 或者 等待时间到了才会执行下一步
         dispatch_semaphore_wait(signal, overTime);
        //方法主体,执行到这步会消耗一个资源(信号量)(占用一个资源连接端口)
         sleep(1);
         Log(@"线程1");
        //发送一个信号量 signal + 1 此线程执行完成了 资源被释放(释放占用端口)
         dispatch_semaphore_signal(signal);
         Log(@"线程1 = %@",signal);
     });

    //在并行队列里添加另一个异步任务
     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
         dispatch_semaphore_wait(signal, overTime);
         sleep(1);
         Log(@"线程2");
         dispatch_semaphore_signal(signal);
         Log(@"线程2 = %@",signal);
     });
     Log(@"线程0");
     dispatch_semaphore_wait(signal, overTime);
     Log(@"线程0 = %@",signal);
     dispatch_semaphore_signal(signal);
     Log(@"after 线程0 = %@ ",signal);
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AboutGCD : NSObject

@end

NS_ASSUME_NONNULL_END
