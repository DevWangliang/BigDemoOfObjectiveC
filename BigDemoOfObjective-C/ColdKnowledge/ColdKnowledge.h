/**
 1.以下几种情况会阻止事件的传递
     1).隐藏(hidden=YES)的视图
     2).禁止用户操作(userInteractionEnabled=NO)的视图
     3).alpha<0.01的视图
     4).视图超出父视图的区域
 2.UIImageView因为天生userInteractionEnabled为否 所以不能响应事件
 3.weakself => __weak typeof(*&self) weakSelf = self;
 4.OC的反射:
    Class class = NSClassFromString(@"student");
    NSString *className = NSStringFromClass(class);
    SEL selector = NSSelectorFromString(@"setName");
    NSStringFromSelector(@selector*(setName:));
 5.typedef struct objc_object *id; id在定义的时候带了*号
  它和instancetype的区别是:instancetype只能作为返回类型,因为instancetype是被推断出来的
 6.self & super其实是一个消息接收者(相同的调用者,对象自己),但super是去父类(isa)查找方法
 7.category为什么不能添加属性?
    category 它是在运行期决议的，因为在运行期，对象的内存布局已经确定，如果添加实例变量就会破坏类的内部布局，这对编译型语言来说是灾难性的。
    extension看起来很像一个匿名的category，但是extension和有名字的category几乎完全是两个东西。 extension在编译期决议，它就是类的一部分，在编译期和头文件里的@interface以及实现文件里的@implement一起形成一个完整的类，它伴随类的产生而产生，亦随之一起消亡。extension一般用来隐藏类的私有信息，你必须有一个类的源码才能为一个类添加extension，所以你无法为系统的类比如NSString添加extension。
    但是category则完全不一样，它是在运行期决议的。
    就category和extension的区别来看，我们可以推导出一个明显的事实，extension可以添加实例变量，而category是无法添加实例变量的。
    那为什么 使用Runtime技术中的关联对象可以为类别添加属性。
    其原因是：关联对象都由AssociationsManager管理，AssociationsManager里面是由一个静态AssociationsHashMap来存储所有的关联对象的。这相当于把所有对象的关联对象都存在一个全局map里面。而map的的key是这个对象的指针地址（任意两个不同对象的指针地址一定是不同的），而这个map的value又是另外一个AssociationsHashMap，里面保存了关联对象的kv对。
    如合清理关联对象？
    runtime的销毁对象函数objc_destructInstance里面会判断这个对象有没有关联对象，如果有，会调用_object_remove_assocations做关联对象的清理工作。（详见Runtime的源码）
 8.runloop:每个线程都包含一个runloop,主线程的默认开启,其他线程默认不开启,
    runloop其实匹配的是模式
 9.nil是0x0的指针,所以给nil发消息不会崩溃,null就是空值0
 10.AFHTTPSessionManager中的+manager方法返回的不是单例
 11.App Transport Security:
    <key>NSAppTransportSecurity</key>
    <dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
    </dict>
 
 
 
 */
