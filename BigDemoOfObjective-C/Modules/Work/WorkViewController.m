//
//  WorkViewController.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/5/25.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import "WorkViewController.h"
#import "YYModelTest.h"
#import "MantleTest.h"
#import "RefreshTableViewController.h"
#import "Masonry.h"
@interface WorkViewController ()

@end

@implementation WorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [MantleTest test];
}

- (IBAction)goMJRefresh:(UIButton *)sender {
    RefreshTableViewController *mjVC = [[RefreshTableViewController alloc] init];
    [self.navigationController pushViewController:mjVC animated:YES];
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
