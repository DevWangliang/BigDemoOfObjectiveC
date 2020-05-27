//
//  LaunchModel.h
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/5/25.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, LaunchModelType) {
    LaunchModelA = 1,
    LaunchModelB,
    LaunchModelC
};

@interface LaunchModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *num;
@property (nonatomic, assign) LaunchModelType type;

+ (instancetype)modelWithDictionary:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
