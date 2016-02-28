//
//  ShiPinModel.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShiPinModel.h"

@implementation ShiPinModel

@end
@implementation ShiPinDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"indexpic" : [ShiPinDataIndexpicModel class], @"list" : [ShiPinDataIndexpicModel class]};
}

@end


@implementation ShiPinDataIndexpicModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"typeName": @"typename", @"desc": @"description"};
}
@end





