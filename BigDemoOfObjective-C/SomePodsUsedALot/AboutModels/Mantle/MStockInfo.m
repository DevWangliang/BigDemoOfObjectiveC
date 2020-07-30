//
//  MStockInfo.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/7/27.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import "MStockInfo.h"

@implementation MStockInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"assetsCode" : @"assetsCode",
            @"taskId" : @"taskId",
            @"assetsName" : @"assetsName",
            @"assetsModel" : @"assetsModel",
            @"assetsBrand" : @"assetsBrand",
            @"SN" : @"SN",
            @"count" : @"count",
            @"cCode" : @"cCode",
            @"cName" : @"cName",
            @"orgCode" : @"orgCode",
            @"orgName" : @"orgName",
            @"userCode" : @"userCode",
            @"name" : @"name",
            @"usePersonName" : @"usePersonName",
            @"addCode" : @"addCode",
            @"addName" : @"addName",
            @"stateCode" : @"stateCode",
            @"state" : @"state",
            @"cabinetNumber" : @"cabinetNumber",
            @"uWei" : @"uWei",
            @"rootName" : @"rootName",
            @"invState" : @"invState"};
}

@end
