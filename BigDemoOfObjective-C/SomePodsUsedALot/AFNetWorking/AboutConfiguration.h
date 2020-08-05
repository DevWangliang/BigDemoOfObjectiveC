/**
 一、NSURLSessionConfiguration的描述

     NSURLSessionConfiguration为NSURLSession配置一些请求所需要的策略。如：超时、缓存策略、链接需求的。

     NSURLSession会拷贝configuration。所以session一旦初始化结束就不会再更改configuration。除非初始化一个session。

     重要：如果NSURLRequest中也做了一些指定。session也会遵循NSURLRequest的限定，但是如果configuration有更加严格的限定，仍以configuration为主。

 二、defaultSessionConfiguration

     默认配置使用的是持久化的硬盘缓存，存储证书到用户钥匙链。存储cookie到shareCookie。

     标注：如果想要移植原来基于NSURLConnect的代码到NSURLSession，可使用该默认配置，然后再根据需要定制该默认配置。

 三、ephemeralSessionConfiguration

     返回一个不适用永久持存cookie、证书、缓存的配置，最佳优化数据传输。

     标注：当程序作废session时，所有的ephemeral session 数据会立即清除。此外，如果你的程序处于暂停状态，内存数据可能不会立即清除，但是会在程序终止或者收到内存警告或者内存压力时立即清除。

 四、backgroundSessionConfigurationWithIdentifier

     生成一个可以上传下载HTTP和HTTPS的后台任务(程序在后台运行)。

     在后台时，将网络传输交给系统的单独的一个进程。

     重要：identifier 是configuration的唯一标示，不能为空或nil.

     工作状态：

     如果程序是被系统正常终止的和重新启动，可以使用同一个identifier创建configuration和session，并且能恢复终止时的传输状态。

     如果程序是被用户在手动退出的，session会取消所有的后台任务，届时不能再唤醒application，如果想要再次开始传输，必须用户手动开启application。

 属性介绍：

 @property(readonly, copy) NSString *identifier

 如果在后台任务正在传输时程序退出，可以使用这个identifier在程序重新启动是创建一个新的configuration和session关联之前传输。

 @property(copy) NSDictionary *HTTPAdditionalHeaders

 默认为空，NSURLRequest附件的请求头。这个属性会给所有使用该configuration的session生成的tasks中的NSURLRequest添加额外的请求头。

 重要：不要修改以下请求头

 Authorization

 Connection

 Host

 WWW-Authenticate

 如果这里边添加的请求头跟NSURLRequest中重复了，侧优先使用NSURLRequest中的头。

 例如

 configuration.HTTPAdditionalHeaders = @{

 @"Accept": @"application/json",

 @"Accept-Language": @"en",

 @"User-Agent": @"iPhone"  //告诉服务器是手机客户端

 };

 @property NSURLRequestNetworkServiceType networkServiceType

 指定网络传输类型。精切指出传输类型，可以让系统快速响应，提高传输质量，延长电池寿命等。

 enum{

 NSURLNetworkServiceTypeDefault = 0, //普通网络传输，默认使用这个

 NSURLNetworkServiceTypeVoIP = 1, //网络语音通信传输，只能在VoIP使用

 NSURLNetworkServiceTypeVideo = 2, //影像传输

 NSURLNetworkServiceTypeBackground = 3, //网络后台传输，优先级不高时可使用。对用户不需要的网络操作可使用

 NSURLNetworkServiceTypeVoice = 4 //语音传输

 };
 typedef NSUInteger NSURLRequestNetworkServiceType;

 @property BOOL allowsCellularAccess

 是否使用蜂窝网络，默认是yes.

 @property NSTimeInterval timeoutIntervalForRequest

 给request指定每次接收数据超时间隔，如果下一次接受新数据用时超过该值，则发送一个请求超时给该request。默认为60s

 @property NSTimeInterval timeoutIntervalForResource

 给指定resource设定一个超时时间，resource需要在时间到达之前完成。默认是7天。

 @property(copy) NSString *sharedContainerIdentifier

 如果要为app的插件提供session，需要给这个值赋值

 @property NSHTTPCookieAcceptPolicy HTTPCookieAcceptPolicy

 默认值是NSHTTPCookieAcceptPolicyOnlyFromMainDocumentDomain，如果想更多的cookie控制，可以使用NSHTTPCookieAcceptPolicyNever，配合allHeaderFields 跟NSHTTPCookie中方法cookiesWithResponseHeaderFields:forURL:提取cookie。

 typedef

 enum

 {

 NSHTTPCookieAcceptPolicyAlways,

 NSHTTPCookieAcceptPolicyNever,

 NSHTTPCookieAcceptPolicyOnlyFromMainDocumentDomain}

 NSHTTPCookieAcceptPolicy;

 @property(retain) NSHTTPCookieStorage *HTTPCookieStorage

 存储cookie，清除存储，直接set为nil即可。

 对于默认和后台的session，使用sharedHTTPCookieStorage。

 对于短暂的session，cookie仅仅储存到内存，session失效时会自动清除。

 @property BOOL HTTPShouldSetCookies

 默认为yes,是否提供来自shareCookieStorge的cookie，如果想要自己提供cookie，可以使用HTTPAdditionalHeaders来提供。

 @property(retain) NSURLCredentialStorage *URLCredentialStorage

 证书存储，如果不使用，可set为nil.

 默认和后台session，默认使用的sharedCredentialStorage.

 短暂的session使用一个私有存储在内存中。session失效会自动清除。

 @property(retain) NSURLCache *URLCache

 缓存NSURLRequest的response。

 默认的configuration，默认值的是sharedURLCache。

 后台的configuration，默认值是nil

 短暂的configuration，默认一个私有的cache于内存，session失效，cache自动清除。

 @property NSURLRequestCachePolicy requestCachePolicy

 缓存策略，默认值是NSURLRequestUseProtocolCachePolicy

 enum{

 NSURLRequestUseProtocolCachePolicy

 =

 0,

 NSURLRequestReloadIgnoringLocalCacheData

 =

 1,不理会cache

 NSURLRequestReloadIgnoringLocalAndRemoteCacheData

 =

 4,

 //

 Unimplemented NSURLRequestReloadIgnoringCacheData

 =

 NSURLRequestReloadIgnoringLocalCacheData,

 不理会cache

 NSURLRequestReturnCacheDataElseLoad

 =

 2,返回cache，未命中则拉去远程数据

 NSURLRequestReturnCacheDataDontLoad

 =

 3,拉去数据，未命中，不做操作

 NSURLRequestReloadRevalidatingCacheData

 =

 5

 //

 Unimplemented };typedef

 NSUInteger

 NSURLRequestCachePolicy;

 */
