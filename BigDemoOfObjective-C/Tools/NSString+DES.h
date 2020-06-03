//
//  DesUtil.h
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/6/3.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (DES)

//加密
+(NSString *) encryptUseDES:(NSString *)plainText key:(NSString *)key;

//解密
+(NSString *) decryptUseDES:(NSString *)plainText key:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
