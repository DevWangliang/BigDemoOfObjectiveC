//
//  SettingsViewController.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/5/25.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *backScrollView;
@property (nonatomic, strong) UIImageView *topImageView;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (void)setupUI {
    [self.view addSubview:self.backScrollView];
    self.backScrollView.frame = self.view.bounds;
    [self.backScrollView addSubview:self.topImageView];
    self.backScrollView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
    self.topImageView.frame = CGRectMake(0, -200, kScreenWidth, 200);
    self.backScrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight - 200);
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
}

#pragma mark - - - - -
#pragma mark props

- (UIScrollView *)backScrollView {
    if (!_backScrollView) {
        _backScrollView = [[UIScrollView alloc] init];
        _backScrollView.backgroundColor = UIColor.whiteColor;
        _backScrollView.showsVerticalScrollIndicator = false;
        _backScrollView.showsHorizontalScrollIndicator = false;
        _backScrollView.bounces = YES;
        _backScrollView.delegate = self;
    }
    return _backScrollView;
}

- (UIImageView *)topImageView {
    if (!_topImageView) {
        _topImageView = [[UIImageView alloc] init];
        _topImageView.image = [UIImage imageNamed:@"page_cover_default_background"];
    }
    return _topImageView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 1.获取scrollView拖拽的偏移位
    CGFloat offsetY = scrollView.contentOffset.y;
    // 2.判断偏移位是否大于图片的高度
    if (offsetY < -200) {
        CGRect tempFrame = self.topImageView.frame;
        tempFrame.origin.y = offsetY;
        tempFrame.size.height = -offsetY;
        self.topImageView.frame = tempFrame;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
