//
//  TuZiCommentNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "TuZiCommentModel.h"
#import "TuZiCommentDetailModel.h"

@interface TuZiCommentNetManager : BaseNetManager

/** 获取电影评论 */
+ getTuZiCommentCompletionHandle:(void(^)(id model,NSError *error))completionHandle;

+ (id)getTuZiCommentWithPage:(NSInteger)page count:(NSInteger)count kCompletionHandle;

/**
 *  获取电影评论详情
 *
 *  @param postId 对应id
 */
+ getTuZiCommentWithPostId:(NSInteger)postId kCompletionHandle;

@end
