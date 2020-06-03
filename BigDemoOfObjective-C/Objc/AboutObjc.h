/**
 objc.h
 /// An opaque type that represents an Objective-C class.
 typedef struct objc_class *Class;

 /// Represents an instance of a class.
 struct objc_object {
     Class _Nonnull isa  OBJC_ISA_AVAILABILITY;
 };

 /// A pointer to an instance of a class.
 typedef struct objc_object *id;
 
 类本身也是一个对象:Class
 Class是结构体指针,指向objc_class
 struct objc_class {
     Class _Nonnull isa  OBJC_ISA_AVAILABILITY;
     Class _Nullable super_class
     const char * _Nonnull name
     long version
     long info
     long instance_size 长度
     struct objc_ivar_list * _Nullable ivars 属性列表
     struct objc_method_list * _Nullable * _Nullable methodLists 方法列表
    //这个列表其实是一个字典，key是selector，value是IMP（imp是一个指针类型，指向方法的实现）//并且selector和IMP之间的关系是在运行时才决定的，而不是编译时。
     struct objc_cache * _Nonnull cache 缓存
     struct objc_protocol_list * _Nullable protocols 协议列表
 }
 类的meta_class的super_class最终指向NSObject的meta_class,NSObject的superClass是nil
 
 Method:
 一个方法 Method，其包含一个方法选标 SEL – 表示该方法的名称，一个 types – 表示该方法参数的类型， 一个 IMP - 指向该方法的具体实现的函数指针。

 struct objc_method {
     SEL _Nonnull method_name           //方法名称 也就是selector
     char * _Nullable method_types      //方法的参数类型
     IMP _Nonnull method_imp            //函数指针，指向方法的具体实现
 }
 //IMP和SEL是在运行时才配对的，一对一，通过selector去查找IMP，找到执行方法的地址，才能确定具体的执行代码
 SEL:
 typedef struct objc_selector *SEL;
 IMP:
 typedef id (*IMP)(id, SEL, ...)
 objc_msgSend:
 [person run]; --> objc_msgSend(person, @selector(run));
 
 
 + initialize 与 +load 方法:
    1.load方法的调用时机，main函数之前，先调用类中的，再调用类别中的（类别中如果有重写），
    依赖库类优先调用。
    应用场景：runtime交换方法实现

    2.initialize方法的调用时机，当向该类发送第一个消息（一般是类消息首先调用，常见的是alloc）
    的时候，先调用类中的，再调用类别中的（类别中如果有重写）；如果该类只是引用，没有调用，
    则不会执行initialize方法。
    应用场景：初始化常用静态变量
 
 动态判断、动态检查:
     isKindOfClass
     isMemberOfClass
     isSubclassOfClass
     instancesRespondToSelector
     respondsToSelector
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 */
