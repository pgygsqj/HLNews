//
//  TuZiCommentNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuZiCommentNetManager.h"
//评论路径
#define kTuZiCommentPath @"http://yp.idwoo.net/"


@implementation TuZiCommentNetManager

+ (id)getTuZiCommentCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kTuZiCommentPath parameters:@{@"json":@"get_posts"} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([TuZiCommentModel objectWithKeyValues:responseObj],error);
    }];
}

+ (id)getTuZiCommentWithPage:(NSInteger)page count:(NSInteger)count kCompletionHandle{
    return [self GET:kTuZiCommentPath parameters:@{@"json":@"get_posts",@"page":@(page),@"count":@(count)} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([TuZiCommentModel objectWithKeyValues:responseObj],error);
    }];
}

+ (id)getTuZiCommentWithPostId:(NSInteger)postId completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kTuZiCommentPath parameters:@{@"json":@"get_post",@"post_id":@(postId)} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([TuZiCommentDetailModel objectWithKeyValues:responseObj],error);
    }];
}

@end
