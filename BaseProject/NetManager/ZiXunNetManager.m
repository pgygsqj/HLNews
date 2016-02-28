//
//  ZiXunNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZiXunNetManager.h"
#define kZiXunPath @"http://c.m.163.com/nc/article/headline/T1348647853363/0-20.html"
@implementation ZiXunNetManager

+ (id)getZiXunCompletionHanle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kZiXunPath parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ZiXunModel objectWithKeyValues:responseObj],error);
    }];
}

@end
