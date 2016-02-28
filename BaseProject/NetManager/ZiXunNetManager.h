//
//  ZiXunNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "ZiXunModel.h"

@interface ZiXunNetManager : BaseNetManager
/** 获取资讯信息 */
+ getZiXunCompletionHanle:(void(^)(id model,NSError *error))completionHandle;

@end
