/**
 1.请求实现数据缓存的基本步骤:
    读取内存中的缓存
    读取磁盘中的缓存
    去服务器请求
 注:当不设置NSURLRequest中的NSURLRequestCachePolicy缓存策略时,NSURLRequestUseProtocolCachePolicy为默认策略,它代表的意思是使用请求的scheme中自带的缓存策略,如:http的请求头中包含Cache-Control字段,代表了服务器设置的缓存策略,如果有一些不知原因的请求问题,请检查它.
 
 2.SDWebImage用的也是1的缓存策略.
 
 3.替换默认Cache对象并设10M大小
    NSURLCache *defaultCache = [[NSURLCache alloc] initWithMemoryCapacity:1024*1024*10 diskCapacity:1024*1024*10 diskPath:nil];
    [NSURLCache setSharedURLCache:defaultCache];
 
 4.指定单个Session缓存对象
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    // 指定URLCache对象完成自定义缓存对象
    configuration.URLCache = [[NSURLCache alloc]initWithMemoryCapacity:1024*1204*5 diskCapacity:1024*1204*50 diskPath:nil];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
 
 注:如果多个session对象使用了同一个configuration那么他们共享缓存对象
 
 5.子类化URLCache对象 截获请求
    // 1 先把系统默认缓存对象替换掉
    CustomCache *cache = [[CustomCache alloc] initWithMemoryCapacity:1024*1024*10 diskCapacity:1024*1024*60 diskPath:nil];
    [NSURLCache setSharedURLCache:cache];
 
    // 2 实现CustomCache的cachedResponseForRequest方法
    @interface CustomCache : NSURLCache
    @end
    @implementation CustomCache
    - (nullable NSCachedURLResponse *)cachedResponseForRequest:(NSURLRequest *)request {
        // 如果条件满足则不发请求
        if([request.URL.absoluteString containsString:@"xxx"]) {
            NSURLResponse *respone = [[NSURLResponse alloc] initWithURL:[request URL] MIMEType:@"image/jpeg" expectedContentLength:0 textEncodingName:nil];
            NSCachedURLResponse *cachedRespone= [[NSCachedURLResponse alloc] initWithResponse:respone data:[NSData data]];
            return cachedRespone;
        } else {
            return [super cachedResponseForRequest:request];
        }
    }
    @end
 
 注:还有一种截获请求方法,WebView的代理,请注意对比其不同点?
 
 6.其他NSURLCache对象方法
    // 添加缓存
    - (void)storeCachedResponse:(NSCachedURLResponse *)cachedResponse forRequest:(NSURLRequest *)request;
    // 移除缓存
    - (void)removeCachedResponseForRequest:(NSURLRequest *)request;
    - (void)removeAllCachedResponses;
 
 7.NSURLRequest中的缓存策略优先级高于NSURLSession
 
 8.因为AFN已经默认实现了willCacheResponse代理,所以只需要设置缓存策略即可实现缓存
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.cachePolicy = NSURLRequestReturnCacheDataElseLoad;
 
 9.在网络状态改变的同时改变缓存策略
     //使用AFN框架来检测网络状态的改变
     -(void)AFNReachability{
          AFNetworkReachabilityStatusUnknown     = 未知
          AFNetworkReachabilityStatusNotReachable   = 没有网络
          AFNetworkReachabilityStatusReachableViaWWAN = 3G
          AFNetworkReachabilityStatusReachableViaWiFi = WIFI
         [[AFNetworkReachabilityManager sharedManager]
        setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
             switch (status) {
                 case AFNetworkReachabilityStatusUnknown:
                     self.manager.requestSerializer.cachePolicy = NSURLRequestReturnCacheDataDontLoad;
                     break;
                 case AFNetworkReachabilityStatusNotReachable:
                     self.manager.requestSerializer.cachePolicy = NSURLRequestReturnCacheDataDontLoad;
                     break;
                 case AFNetworkReachabilityStatusReachableViaWWAN:
                     self.manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringCacheData;
                     break;
                 case AFNetworkReachabilityStatusReachableViaWiFi:
                     self.manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringCacheData;
                     break;
                 default:
                     self.manager.requestSerializer.cachePolicy = NSURLRequestReturnCacheDataDontLoad;
                     break;
             }
         }];
         //开始监听
         [manager startMonitoring];
     }
 
 */
