//
//  movieNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "movieNetManager.h"
#define kMoviePath @"http://www.zhongsou.net/np/mobile"

@implementation movieNetManager


+ (id)getMovieCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kMoviePath parameters:@{@"app":@"s",@"t":@"list",@"super":@1,@"fmt":@"json",@"ig":@"dyinw",@"key":@"%E7%94%B5%E5%BD%B1%E7%BD%91_cpsy",@"pnum":@1,@"psize":@12,@"cid":@""} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([MovieModel objectWithKeyValues:responseObj],error);
        }];
}

+ (id)getMovieDetailWithIntroId:(NSString *)introId completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kMoviePath parameters:@{@"app":@"s",@"t":@"detail",@"id":introId} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([MovieDetailModel objectWithKeyValues:responseObj],error);
    }];
}

@end
