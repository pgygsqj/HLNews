//
//  TuZiCommentModel.m
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuZiCommentModel.h"

@implementation TuZiCommentModel


+ (NSDictionary *)objectClassInArray{
    return @{@"posts" : [TuZiCommentPostsModel class]};
}

+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    //驼峰转下划线
    return [propertyName underlineFromCamel];
}

@end
@implementation TuZiCommentQueryModel
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    //驼峰转下划线
    return [propertyName underlineFromCamel];
}
@end


@implementation TuZiCommentPostsModel

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID": @"id"};
}

+ (NSDictionary *)objectClassInArray{
    return @{@"tags" : [TuZiCommentPostsTagsModel class], @"categories" : [TuZiCommentPostsCategoriesModel class]};
}

//+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
//    //驼峰转下划线
//    return [propertyName underlineFromCamel];
//}

@end


@implementation TuZiCommentPostsCustomFieldsModel

@end


@implementation TuZiCommentPostsAuthorModel
//+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
//    //驼峰转下划线
//    return [propertyName underlineFromCamel];
//}
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID": @"id", @"desc": @"description"};
}
@end


@implementation TuZiCommentPostsTagsModel
//+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
//    //驼峰转下划线
//    return [propertyName underlineFromCamel];
//}
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID": @"id", @"desc": @"description"};
}
@end


@implementation TuZiCommentPostsCategoriesModel
//+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
//    //驼峰转下划线
//    return [propertyName underlineFromCamel];
//}
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID": @"id", @"desc": @"description"};
}
@end


