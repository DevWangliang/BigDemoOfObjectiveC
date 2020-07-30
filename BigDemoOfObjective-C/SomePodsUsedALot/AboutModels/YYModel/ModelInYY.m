//
//  ModelTest.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/7/27.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import "ModelInYY.h"

@implementation ModelInYY

#pragma mark - YYModel

//声明属性对应关系
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"stockinfo" : @"data.stockinfo",
             @"addressinfo" : @"data.addressinfo",
             @"taskinfo" : @"data.taskinfo",
             @"taskstate" : @"data.taskstate",
             @"dept" : @"data.dept",
             @"user" : @"data.user"};
}

//声明泛型 [A class] A.class "A" 都行
+ (NSDictionary *)modelContainerPropertyGenericClass {
  return @{@"stockinfo" : [Stockinfo class],
           @"addressinfo" : Addressinfo.class,
           @"taskinfo" : @"Taskinfo",
           @"taskstate" : @"Taskstate",
           @"dept" : @"Dept",
           @"user" : @"User"
  };
}

//// 黑白名单不同时使用
//// 如果实现了该方法，则处理过程中会忽略该列表内的所有属性
//+ (NSArray *)modelPropertyBlacklist {
//  return @[@"stockinfo", @"addressinfo"];
//}
//// 如果实现了该方法，则处理过程中不会处理该列表外的属性。
//+ (NSArray *)modelPropertyWhitelist {
//  return @[@"dept"];
//}

// 当 JSON 转为 Model 完成后，该方法会被调用。
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
  // 可以在这里处理一些数据逻辑，如NSDate格式的转换
  return YES;
}

// 当 Model 转为 JSON 完成后，该方法会被调用。
- (BOOL)modelCustomTransformToDictionary:(NSMutableDictionary *)dic {
    return YES;
}

@end
