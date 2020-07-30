//
//  MUser.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/7/27.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import "MUser.h"

@implementation MUser
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"orgCode" : @"orgCode",
            @"passWord" : @"passWord",
            @"userCode" : @"userCode",
            @"name" : @"name",
            @"userName" : @"userName"};
}

+ (NSValueTransformer *)passWordJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return @"121212";
    }];
}
@end
