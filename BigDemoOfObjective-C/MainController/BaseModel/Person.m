//
//  Person.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/5/27.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import "Person.h"

/**
 归档:NSSecureCoding 替代NSCoding协议
 
 
 */

@interface Person ()<NSSecureCoding>

@end

@implementation Person

- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.age forKey:@"age"];
    [coder encodeObject:self.city forKey:@"city"];
    [coder encodeInteger:self.country forKey:@"country"];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.name = [coder decodeObjectForKey:@"name"];
        self.age = [coder decodeObjectForKey:@"age"];
        self.city = [coder decodeObjectForKey:@"city"];
        self.country = [coder decodeIntegerForKey:@"country"];
    }
    return self;
}

+ (BOOL)supportsSecureCoding{
    return YES;
}

+ (void)archive:(NSArray *)personArray {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"archive"];
//    [NSKeyedArchiver archiveRootObject:self toFile:path];
    NSError *error;
    NSData *archivedData = [NSKeyedArchiver archivedDataWithRootObject:personArray requiringSecureCoding:YES error:&error];
    [archivedData writeToFile:path atomically:YES];
    if (error) {
        NSLog(@"error = %@",error);
    }
    NSLog(@"archive path = %@",path);
}

+ (NSArray *)unarchive{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"archive"];
    NSError *error;
#warning unarchivedObjectOfClass适用于只有单个类的场景 当前场景下有Array和Person两个类
    NSArray *personArray = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[self class], nil] fromData:[NSData dataWithContentsOfFile:path] error:&error];//[NSKeyedUnarchiver unarchivedObjectOfClass:[Person class] fromData:[NSData dataWithContentsOfFile:path] error:&error];
    if (error) {
        NSLog(@"unarchive error = %@",error);
        return nil;
    }
    return personArray;
}

@end
