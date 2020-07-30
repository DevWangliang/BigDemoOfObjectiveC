//
//  MAddressInfo.h
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/7/27.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

NS_ASSUME_NONNULL_BEGIN

@interface MAddressInfo : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *addCode;
@property (nonatomic, copy) NSString *addName;

@end

NS_ASSUME_NONNULL_END
