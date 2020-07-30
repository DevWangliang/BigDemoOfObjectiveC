//
//  OCDemoMacros.h
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/7/30.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#ifndef OCDemoMacros_h
#define OCDemoMacros_h

#ifdef DEBUG
#define Log(...) NSLog(@"%s line number:%d \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define Log(...)
#endif

#endif /* OCDemoMacros_h */
