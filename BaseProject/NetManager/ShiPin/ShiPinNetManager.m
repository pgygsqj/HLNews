//
//  ShiPinNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShiPinNetManager.h"


#define kShiPinPath      @"http://cache.tuwan.com/app/"
#define kAppId          @"appid": @1
#define kAppVer         @"appver": @2.1
#define kClassMore      @"classmore": @"indexpic"

@implementation ShiPinNetManager

//http://cache.tuwan.com/app/?appid=1&dtid=0&class=heronews&mod=趣闻&classmore=indexpic&appid=1&appver=2.1
+ (id)getShiPinWithCompletionHandle:(void (^)(id, NSError *error))completionHandle{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kAppVer, kAppId,kClassMore,@"appid":@1,@"dtid":@0,@"class":@"heronews",@"mod":@"趣闻"}];
    return [self GET:kShiPinPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ShiPinModel objectWithKeyValues:responseObj],error);
    }];
}

@end
