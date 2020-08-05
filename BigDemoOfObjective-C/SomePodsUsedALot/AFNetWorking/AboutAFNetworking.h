/**
 一.以前常用的网络组件需要封装的地方:
    1.全局单例及其队列
    2.统一的全局配置:BaseURL/timeout/通用的参数等
    3.代理回调变Block回调
    4.通用的post/get方法
    5.批量上传/下载的队列管理
    6.批量上传/下载中单个任务的状态管理
    7.统一的内存缓存/磁盘缓存
    8.下载任务的文件管理
    9.加密
 
 二.在4.0+的AFNetworking中对上述的解决方案:
    1.贴合业务可做单一或者多个configuration
    2.AFHTTPSessionManager中有BaseURL
        AFURLRequestSerialization中有timeoutInterval和cachePolicy
    3&4.AFHTTPSessionManager都做好了,有现成的
    5&6.得益于NSURLSessionTask基本上都能满足
        af更是在AFURLSessionManager中有对各种不同的task的数组管理
    7.数据用NSKeyedArchiver来管理
    8.以及7产生的文件都可以用filemanager来管理
    9.需要自己做
 
 三.现在需要做的:
    1.熟悉业务,分析业务需求
    2.设计业务层级
    3.技术选型并设计对应接口:
        包括但不限于:
            内存缓存/磁盘缓存/定期清理文件/加密传输
 
 四.结论:
    1.网络层基本上不用再次对af进行封装了.
    2.贴合业务做全局的基础配置
    3.设计不同的configuration来匹配不同的业务场景.如:
        a.不需要内存缓存的
        b.需要内存缓存的单不需要磁盘缓存的
        c.需要做磁盘缓存的
        d.加密传输&加密存贮的
 
 五.其他:
    1.https协议部分还没弄过不熟
 */
