//
//  LaunchCell.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/5/25.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import "LaunchCell.h"
@interface LaunchCell()
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end
@implementation LaunchCell

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setupUI];
}

- (void)setupUI {
    [self.button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setModel:(LaunchModel *)model {
    _model = model;
    self.numLabel.text = _model.num;
    self.contentLabel.text = _model.title;
    self.backgroundColor = [Tools randomColor];
}

- (void)showBottmButton {
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.button.hidden = false;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)buttonClicked:(UIButton *)button {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickButton:inCell:)]) {
        [self.delegate didClickButton:button inCell:self];
    }
}

@end
