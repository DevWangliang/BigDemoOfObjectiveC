//
//  YYModelTest.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/7/27.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import "YYModelTest.h"
#import "ModelInYY.h"
#import "YYModel.h"
@implementation YYModelTest
/**
 typedef NS_OPTIONS(NSUInteger, NSJSONReadingOptions) {
     NSJSONReadingMutableContainers = (1UL << 0),可变容器 NSMutableArray
     NSJSONReadingMutableLeaves = (1UL << 1),可变节点 NSMutableString
     NSJSONReadingFragmentsAllowed = (1UL << 2),不可变 但必须是有效的json fragment
     NSJSONReadingAllowFragments 在一定情况下同上
 }
 */

+ (void)test {
    NSDictionary *dic = [YYModelTest readLocalFileWithName:@"model"];
    
    __unused ModelInYY *model = [ModelInYY yy_modelWithJSON:dic];
    
    Log(@"");
}

// 读取本地JSON文件
+ (NSDictionary *)readLocalFileWithName:(NSString *)name {
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

@end
