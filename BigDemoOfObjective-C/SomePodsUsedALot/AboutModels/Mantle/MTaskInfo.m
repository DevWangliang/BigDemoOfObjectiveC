//
//  MTaskInfo.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/7/27.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import "MTaskInfo.h"

@implementation MTaskInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"taskId" : @"taskId",
            @"taskName" : @"taskName",
            @"startTime" : @"startTime",
            @"endTime" : @"endTime",
            @"state" : @"state",
            @"user" : @"user",
            @"remark" : @"remark"};
}

@end
