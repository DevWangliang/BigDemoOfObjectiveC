//
//  LaunchCell.h
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/5/25.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LaunchModel.h"
NS_ASSUME_NONNULL_BEGIN
@class LaunchCell;
@protocol LaunchCellDelegate <NSObject>

- (void)didClickButton:(UIButton *)btn inCell:(LaunchCell *)cell;

@end

@interface LaunchCell : UICollectionViewCell
@property (nonatomic, strong) LaunchModel *model;
@property (nonatomic, weak) id<LaunchCellDelegate> delegate;

- (void)showBottmButton;

@end

NS_ASSUME_NONNULL_END
