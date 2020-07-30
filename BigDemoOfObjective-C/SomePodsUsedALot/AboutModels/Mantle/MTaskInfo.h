//
//  MTaskInfo.h
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/7/27.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

NS_ASSUME_NONNULL_BEGIN

@interface MTaskInfo : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *taskId;
@property (nonatomic, copy) NSString *taskName;
@property (nonatomic, copy) NSString *startTime;
@property (nonatomic, copy) NSString *endTime;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *user;
@property (nonatomic, copy) NSString *remark;

@end

NS_ASSUME_NONNULL_END
