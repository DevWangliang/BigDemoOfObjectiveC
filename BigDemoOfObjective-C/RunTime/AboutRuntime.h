/**
 Method Swizzling:
 OC中的 + load方法，用来做Method Swizzling最合适。

 + (void)load {
     static dispatch_once_t onceToken;
     dispatch_once(&onceToken, ^{
         SEL originSEL = @selector(doSth);
         SEL newSEL = @selector(doOther);
         
         Method originMethod = class_getInstanceMethod(self, originSEL);
         Method newMethod = class_getInstanceMethod(self, newSEL);
         BOOL result = class_addMethod(self, originSEL,                                       class_getMethodImplementation(self, newSEL),                           method_getTypeEncoding(newMethod));
         if (result) {
             class_replaceMethod(self, newSEL,                          class_getMethodImplementation(self, originSEL), method_getTypeEncoding(originMethod));
         } else {
             method_exchangeImplementations(originMethod, newMethod);
         }
         
     });
 }


 - (void)doSth {
     Log(@"doSth");
 //    [self doSth];
 }

 - (void)doOther {
     Log(@"doOther");
     [self doOther];
 }


 注意点：当方法实现交换后，再次想调用原始方法 需要调用新的方法名。
 
 
 
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AboutRuntime : NSObject

@end

NS_ASSUME_NONNULL_END
