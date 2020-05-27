//
//  Person.h
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/5/27.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, Country) {
    China = 1,
    USA,
    UK,
    Japanese
};

NS_ASSUME_NONNULL_BEGIN
/// 数据持久化

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *age;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, assign) Country country;

+ (void)archive:(NSArray *)personArray;
+ (NSArray *)unarchive;

@end

NS_ASSUME_NONNULL_END
