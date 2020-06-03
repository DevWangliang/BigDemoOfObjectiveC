//
//  NSString+Base64.h
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/6/3.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface NSString (Base64)
/**
 *  转换为Base64编码
 */
 - (NSString *)base64EncodedString;
 /**
 *  将Base64编码还原
 */
 - (NSString *)base64DecodedString;
 @end
NS_ASSUME_NONNULL_END
