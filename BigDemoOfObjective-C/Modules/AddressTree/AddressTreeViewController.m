//
//  AddressTreeViewController.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/5/25.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import "AddressTreeViewController.h"
#import "WebViewController.h"
@interface AddressTreeViewController ()

@end

@implementation AddressTreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"测试" style:UIBarButtonItemStylePlain target:self action:@selector(leftButtonInNavPressed:)];
}

- (void)leftButtonInNavPressed:(UIBarButtonItem *)item {
    WebViewController *webVC = [[WebViewController alloc] init];
    [self.navigationController pushViewController:webVC animated:YES];
}
@end
