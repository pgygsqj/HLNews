//
//  TuZiTabBarViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuZiTabBarViewController.h"
#import "TuZiCommentViewController.h"
#import "ZiXunViewController.h"
#import "MovieViewController.h"
#import "ShiPinViewController.h"

@interface TuZiTabBarViewController ()

@end

@implementation TuZiTabBarViewController

+ (TuZiTabBarViewController *)standardIntance{
    static TuZiTabBarViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        vc = [TuZiTabBarViewController new];
    });
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ShiPinViewController *movieVC = [ShiPinViewController new];
    movieVC.tabBarItem.image = [UIImage imageNamed:@"me_setting_usercenter"];
    TuZiCommentViewController *commentVC = [TuZiCommentViewController new];
    commentVC.tabBarItem.image = [UIImage imageNamed:@"find_culture"];
    ZiXunViewController *zixunVC = [ZiXunViewController new];
    zixunVC.tabBarItem.image = [UIImage imageNamed:@"find_news"];
    MovieViewController *moreVC = [MovieViewController new];
    moreVC.tabBarItem.image = [UIImage imageNamed:@"find_gotocate"];
    UINavigationController *movieNavi = [[UINavigationController alloc] initWithRootViewController:movieVC];
    UINavigationController *commentNavi = [[UINavigationController alloc] initWithRootViewController:commentVC];
    UINavigationController *zixunNavi = [[UINavigationController alloc] initWithRootViewController:zixunVC];
    UINavigationController *moreNavi = [[UINavigationController alloc] initWithRootViewController:moreVC];
    self.viewControllers = @[movieNavi,commentNavi,zixunNavi,moreNavi];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
