//
//  WebViewController.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/7/24.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>
#import "CocoaLumberjack.h"
#import "Masonry.h"

@interface WebViewController ()<WKScriptMessageHandler,WKUIDelegate>

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"WKWebView<->JS";
    // 设置偏好设置
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    // 默认为0
    config.preferences.minimumFontSize = 10;
    //是否支持JavaScript
    config.preferences.javaScriptEnabled = YES;
    //不通过用户交互，是否可以打开窗口
    config.preferences.javaScriptCanOpenWindowsAutomatically = NO;
    
    self.webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:config];
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view).with.offset(0);
        make.width.mas_equalTo(self.view);
        make.height.mas_equalTo(self.view).with.multipliedBy(0.6);
    }];
    self.webView.UIDelegate = self;
    NSStringFromSelector(@selector(NOParameter:));
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURL *baseURL = [[NSBundle mainBundle] bundleURL];
    [self.webView loadHTMLString:[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil] baseURL:baseURL];
    
    WKUserContentController *userCC = config.userContentController;
    //JS调用OC 添加处理脚本
    [userCC addScriptMessageHandler:self name:@"showMobile"];
    [userCC addScriptMessageHandler:self name:@"showName"];
    [userCC addScriptMessageHandler:self name:@"showSendMsg"];
    
    NSArray *methods = @[NSStringFromSelector(@selector(noParameters:)),
                        NSStringFromSelector(@selector(oneParameter:)),
                        NSStringFromSelector(@selector(twoParameters:))];
    for (int i = 0; i < 3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundColor:[UIColor redColor]];
        [btn setTitle:methods[i] forState:UIControlStateNormal];
        [btn addTarget:self action:NSSelectorFromString(methods[i]) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.webView.mas_bottom).offset(20 + 60 * i);
            make.width.equalTo(self.view.mas_width).with.multipliedBy(0.8);
            make.centerX.equalTo(self.view);
            make.height.mas_equalTo(40);
        }];
    }
}

#pragma mark - WKScriptMessageHandler

    /// 注册的监听必须是一开始就添加的,不能动态添加,
    /// 如果想实时交互就要拦截alert,confirm等弹窗
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    Log(@"%@",NSStringFromSelector(_cmd));
    Log(@"%@",message.body);
    
    if ([message.name isEqualToString:@"showMobile"]) {
        [self showMsg:@"没有参数"];
    }
    
    if ([message.name isEqualToString:@"showName"]) {
        NSString *info = [NSString stringWithFormat:@"%@",message.body];
        [self showMsg:info];
    }
    
    if ([message.name isEqualToString:@"showSendMsg"]) {
        NSArray *array = message.body;
        NSString *info = [NSString stringWithFormat:@"有两个参数: %@, %@ !!",array.firstObject,array.lastObject];
        [self showMsg:info];
    }
}

- (void)showMsg:(NSString *)msg {
    [[[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil] show];
}


//网页加载完成之后调用JS代码才会执行，因为这个时候html页面已经注入到webView中并且可以响应到对应方法

//不带参数
- (void)noParameters:(id)sender {
    [self.webView evaluateJavaScript:@"alertMobile()" completionHandler:^(id _Nullable response, NSError * _Nullable error) {
        //JS 返回结果
        Log(@"%@ %@",response,error);
    }];

    
}
//一个参数
- (void)oneParameter:(id)sender {
    /*
     *alertName('奥特们打小怪兽')
     *alertName JS方法名
     *奥特们打小怪兽 带的参数
     */
    [self.webView evaluateJavaScript:@"alertName('奥特们打小怪兽')" completionHandler:nil];
}
//两个参数
- (void)twoParameters:(id)sender {
    /*
     *alertSendMsg('我是参数1','我是参数2')
     *alertSendMsg JS方法名
     *我是参数1 带的参数
     *我是参数2
     */
    [self.webView evaluateJavaScript:@"alertSendMsg('我是参数1','我是参数2')" completionHandler:nil];
}

- (void)dealloc
{
    [self removeAllScriptMsgHandle];
}
//添加和移除成对出现,有时在viewWillAppear中添加在disappear中移除
-(void)removeAllScriptMsgHandle{
    WKUserContentController *controller = self.webView.configuration.userContentController;
    [controller removeScriptMessageHandlerForName:@"showMobile"];
    [controller removeScriptMessageHandlerForName:@"showName"];
    [controller removeScriptMessageHandlerForName:@"showSendMsg"];
}

#pragma mark - UIDelegate

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
//    DDLogMessage(@"");
    Log(@"");
    completionHandler();
}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler {
    Log(@"");
    completionHandler(false);
}

- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler {
    Log(@"");
    completionHandler(@"result!!!");
}

@end
