//
//  ModelInMantle.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/7/27.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import "ModelInMantle.h"

@implementation ModelInMantle

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"stockinfo" : @"data.stockinfo",
            @"addressinfo" : @"data.addressinfo",
            @"taskinfo" : @"data.taskinfo",
            @"taskstate" : @"data.taskstate",
            @"dept" : @"data.dept",
            @"user" : @"data.user"};
}

//因为Mantle的内部实现使用kvc的,所以这映射的方法固定写法"属性名+JSONTransformer"
+ (NSValueTransformer *)stockinfoJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[MStockInfo class]];
}

+ (NSValueTransformer *)addressinfoJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:MAddressInfo.class];
}

+ (NSValueTransformer *)taskinfoJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:MTaskInfo.class];
}

+ (NSValueTransformer *)taskstateJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:MTaskState.class];
}

+ (NSValueTransformer *)deptJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:MDept.class];
}

//+ (NSValueTransformer *)userJSONTransformer {
//    return [MTLJSONAdapter arrayTransformerWithModelClass:MUser.class];
//}

//这个方法和上边的可以互相转化,但是优先级没有上边的高
+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key {
    Log(@"key = %@",key);
    if ([key isEqualToString:@"user"]) {
        return [MTLJSONAdapter arrayTransformerWithModelClass:MUser.class];
    }
    return nil;
}

/** 这个方法可以进行属性替换
 + (NSValueTransformer *)passWordJSONTransformer {
     return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
         return @"121212";
     }];
 }
 
 其他类型的转化
 String转URL
 + (NSValueTransformer *)URLJSONTransformer {
     return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
 }
 
 枚举映射
 + (NSValueTransformer *)stateJSONTransformer {
     return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:@{
         @"open": @(GHIssueStateOpen),       //左边是JSON key,右侧是枚举中的实际值
         @"closed": @(GHIssueStateClosed)
     }];
 }
 
 数组
 + (NSValueTransformer *)arrayJSONTransformer {
     return [MTLJSONAdapter arrayTransformerWithModelClass:[ActivityTag class]];
 }
 
 自定义类
 + (NSValueTransformer *)assigneeJSONTransformer {
     return [MTLJSONAdapter dictionaryTransformerWithModelClass:GHUser.class];
 }
 
 日期
 + (NSDateFormatter *)dateFormatter {
     NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
     dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
     dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
     return dateFormatter;
 }

 + (NSValueTransformer *)updatedAtJSONTransformer {
     return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
         return [self.dateFormatter dateFromString:dateString];
     } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
         return [self.dateFormatter stringFromDate:date];
     }];
 }
 
 */

@end
