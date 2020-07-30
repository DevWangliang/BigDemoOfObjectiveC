//
//  MantleTest.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/7/27.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import "MantleTest.h"
#import "ModelInMantle.h"
#import "Mantle.h"

@implementation MantleTest

+ (void)test {
    NSDictionary *dic = [MantleTest readLocalFileWithName:@"model"];
    
    __unused ModelInMantle *model = [MTLJSONAdapter modelOfClass:ModelInMantle.class fromJSONDictionary:dic error:nil];
    
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
