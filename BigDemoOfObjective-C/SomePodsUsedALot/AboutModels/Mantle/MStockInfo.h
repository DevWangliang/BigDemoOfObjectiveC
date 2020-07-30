//
//  MStockInfo.h
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/7/27.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

NS_ASSUME_NONNULL_BEGIN

@interface MStockInfo : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *assetsCode;
@property (nonatomic, copy) NSString *taskId;
@property (nonatomic, copy) NSString *assetsName;
@property (nonatomic, copy) NSString *assetsModel;
@property (nonatomic, copy) NSString *assetsBrand;
@property (nonatomic, copy) NSString *SN;
@property (nonatomic, copy) NSString *count;
@property (nonatomic, copy) NSString *cCode;
@property (nonatomic, copy) NSString *cName;
@property (nonatomic, copy) NSString *orgCode;
@property (nonatomic, copy) NSString *orgName;
@property (nonatomic, copy) NSString *userCode;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *usePersonName;
@property (nonatomic, copy) NSString *addCode;
@property (nonatomic, copy) NSString *addName;
@property (nonatomic, copy) NSString *stateCode;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *cabinetNumber;
@property (nonatomic, copy) NSString *uWei;
@property (nonatomic, copy) NSString *rootName;
@property (nonatomic, copy) NSString *invState;


@end

NS_ASSUME_NONNULL_END
