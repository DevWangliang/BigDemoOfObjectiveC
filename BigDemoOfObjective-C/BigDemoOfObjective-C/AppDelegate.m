//
//  AppDelegate.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/5/25.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import "AppDelegate.h"
#import "LaunchViewController.h"
#import "MainViewController.h"
#import "Person.h"//归档
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    BOOL isFirst = [[NSUserDefaults standardUserDefaults] boolForKey:@"IsFirst1"];
    if (!isFirst) {
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.window.backgroundColor = [UIColor whiteColor];
        LaunchViewController *root = [[UIStoryboard storyboardWithName:@"LaunchViewController" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
        self.window.rootViewController = root;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(switchRootController) name:@"SwitchRootController" object:nil];
        
        [self.window makeKeyAndVisible];
    }
    [self setTheme];
    
//    [self testArchive];
    
    
    
    return YES;
}

- (void)testArchive{
    Person *p = [[Person alloc] init];
    p.name = @"ZhangSan";
    p.age = @(22);
    p.city = @"shanghai";
    p.country = China;
    
    Person *p1 = [[Person alloc] init];
    p1.name = @"John";
    p1.age = @(27);
    p1.city = @"NewYork";
    p1.country = USA;
    
    Person *p2 = [[Person alloc] init];
    p2.name = @"zhaoliu";
    p2.age = @(26);
    p2.city = @"tokyo";
    p2.country = Japanese;
    
    NSArray *personArr = @[p, p1, p2];
    [Person archive:personArr];
    
    NSArray *person = [Person unarchive];
    NSLog(@"person unarchive = %@",person);
}

- (void)switchRootController{
    MainViewController *root = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
//    self.window.rootViewController = root;
//    typedef void (^Animation)(void);
#pragma mark - - - - -
#pragma mark 替换转场动画
    UIWindow* window = self.window;
    root.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [UIView transitionWithView:window
                    duration:1
                     options:UIViewAnimationOptionTransitionCrossDissolve
                  animations:^{
                      BOOL oldState = [UIView areAnimationsEnabled];
                      [UIView setAnimationsEnabled:NO];
                      window.rootViewController = root;
                      [UIView setAnimationsEnabled:oldState];
                  } completion:nil];
}

- (void)dealloc
{
    //啥用没有 代码规范
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - - - - -
#pragma mark set theme

- (void)setTheme{
    [UITabBar appearance].tintColor = kThemeOrange;
    [UINavigationBar appearance].tintColor = kThemeOrange;
}

#pragma mark - UISceneSession lifecycle


//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)){
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions  API_AVAILABLE(ios(13.0)){
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
