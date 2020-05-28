//
//  MainViewController.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/5/25.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import "MainViewController.h"
#import "CustomTabBar.h"
@interface MainViewController ()
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self resetTabBar];
}

- (void)resetTabBar{
    CustomTabBar *customTabBar = [[CustomTabBar alloc] initWithFrame:self.tabBar.bounds];
    [customTabBar innerButtonClicked:^(UIButton * _Nonnull button) {
        
    }];
    [self setValue:customTabBar forKey:@"tabBar"];
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
