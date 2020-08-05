//
//  ModelInMantle.h
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/7/27.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"
#import "MStockInfo.h"
#import "MAddressInfo.h"
#import "MTaskState.h"
#import "MTaskInfo.h"
#import "MDept.h"
#import "MUser.h"
NS_ASSUME_NONNULL_BEGIN

@interface ModelInMantle : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) NSArray *stockinfo;
@property (nonatomic, strong) NSArray *addressinfo;
@property (nonatomic, strong) NSArray *taskinfo;
@property (nonatomic, strong) NSArray *taskstate;
@property (nonatomic, strong) NSArray *dept;
@property (nonatomic, strong) NSArray *user;

@end

NS_ASSUME_NONNULL_END
