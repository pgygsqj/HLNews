//
//  TuZiCommentDetailModel.m
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuZiCommentDetailModel.h"

@implementation TuZiCommentDetailModel
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    //驼峰转下划线
    return [propertyName underlineFromCamel];
}
@end
@implementation TuZiCommentDetailPostModel

+ (NSDictionary *)objectClassInArray{
    return @{@"tags" : [TuZiCommentDetailPostTagsModel class], @"categories" : [TuZiCommentDetailPostCategoriesModel class]};
}

//+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
//    //驼峰转下划线
//    return [propertyName underlineFromCamel];
//}
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID": @"id"};
}
@end


@implementation TuZiCommentDetailPostCustomFieldsModel

@end


@implementation TuZiCommentDetailPostAuthorModel
//+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
//    //驼峰转下划线
//    return [propertyName underlineFromCamel];
//}

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID": @"id", @"desc": @"description"};
}

@end


@implementation TuZiCommentDetailPostTagsModel
//+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
//    //驼峰转下划线
//    return [propertyName underlineFromCamel];
//}

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID": @"id", @"desc": @"description"};
}
@end


@implementation TuZiCommentDetailPostCategoriesModel
//+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
//    //驼峰转下划线
//    return [propertyName underlineFromCamel];
//}
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID": @"id", @"desc": @"description"};
}
@end


