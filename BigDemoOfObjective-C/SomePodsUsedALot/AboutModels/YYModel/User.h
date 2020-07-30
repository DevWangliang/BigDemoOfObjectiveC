//
//  User.h
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/7/27.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

@property (nonatomic, copy) NSString *userCode;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *orgCode;
@property (nonatomic, copy) NSString *passWord;

@end

NS_ASSUME_NONNULL_END
