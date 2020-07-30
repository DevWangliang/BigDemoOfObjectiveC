//
//  MDept.h
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/7/27.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

NS_ASSUME_NONNULL_BEGIN

@interface MDept : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *orgCode;
@property (nonatomic, copy) NSString *orgName;
@property (nonatomic, copy) NSString *pCode;

@end

NS_ASSUME_NONNULL_END
