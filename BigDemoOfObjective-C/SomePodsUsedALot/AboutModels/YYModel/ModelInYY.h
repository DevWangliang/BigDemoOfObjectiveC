//
//  ModelTest.h
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/7/27.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stockinfo.h"
#import "Addressinfo.h"
#import "Taskinfo.h"
#import "Taskstate.h"
#import "Dept.h"
#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModelInYY: NSObject

@property (nonatomic, strong) NSArray *stockinfo;
@property (nonatomic, strong) NSArray *addressinfo;
@property (nonatomic, strong) NSArray *taskinfo;
@property (nonatomic, strong) NSArray *taskstate;
@property (nonatomic, strong) NSArray *dept;
@property (nonatomic, strong) NSArray *user;

@end

NS_ASSUME_NONNULL_END
