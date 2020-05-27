//
//  LaunchModel.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/5/25.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import "LaunchModel.h"

@implementation LaunchModel

- (instancetype)initWithTitle:(NSString *)title number:(NSString *)num type:(LaunchModelType)type {
    self = [super init];
    if (self) {
        self.title = title;
        self.num = num;
        self.type = type;
    }
    return self;
}

- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)modelWithDictionary:(NSDictionary *)dic {
    return [[self alloc] initWithDic:dic];;
}

@end
