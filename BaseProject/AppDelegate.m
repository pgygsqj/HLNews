//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "TuZiCommentNetManager.h"
#import "ZiXunNetManager.h"
#import "movieNetManager.h"
#import "ShiPinNetManager.h"
#import "TuZiTabBarViewController.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    [self initializeWithApplication:application];
    //评论
    [TuZiCommentNetManager getTuZiCommentCompletionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    [TuZiCommentNetManager getTuZiCommentWithPage:2 count:10 completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    [TuZiCommentNetManager getTuZiCommentWithPostId:934 completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    //资讯
    [ZiXunNetManager getZiXunCompletionHanle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    //电影
    [movieNetManager getMovieCompletionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    [movieNetManager getMovieDetailWithIntroId:@"41835103" completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    //视频
    [ShiPinNetManager getShiPinWithCompletionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
     
    TuZiTabBarViewController *vc = [TuZiTabBarViewController new];
    //TuZiMovieViewController *vc = [TuZiMovieViewController new];
  

    self.window.rootViewController = vc;
    [self configGlobalUIStyle]; //配置全局UI样式
    return YES;

}
/** 配置全局UI的样式 */
- (void)configGlobalUIStyle{
/** 导航栏不透明 */
    [[UINavigationBar appearance] setTranslucent:NO];
/** 设置导航栏背景图 */
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg_64"] forBarMetrics:UIBarMetricsDefault];
/** 配置导航栏题目的样式 */
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont flatFontOfSize:kNaviTitleFontSize],NSForegroundColorAttributeName: kNaviTitleColor}];
}


/** 代码重构:用代码把功能实现以后，考虑代码结构如何编写可以更加方便后期维护 */
- (UIWindow *)window{
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
}

@end









