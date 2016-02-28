//
//  ZiXunModel.m
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZiXunModel.h"

@implementation ZiXunModel


+ (NSDictionary *)objectClassInArray{
    return @{@"T1348647853363" : [ZiXunT1348647853363Model class]};
}
@end
@implementation ZiXunT1348647853363Model

+ (NSDictionary *)objectClassInArray{
    return @{@"ads" : [ZiXunTAdsModel class], @"imgextra" : [ZiXunTImgextraModel class]};
}

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"atemplate": @"template"};
}

@end


@implementation ZiXunTAdsModel

@end


@implementation ZiXunTImgextraModel

@end


