//
//  MovieDetailModel.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MovieDetailModel.h"

@implementation MovieDetailModel


+ (NSDictionary *)objectClassInArray{
    return @{@"images" : [MovieDetailImagesModel class], @"attrs" : [MovieDetailAttrsModel class]};
}
@end
@implementation MovieDetailImagesModel

@end


@implementation MovieDetailAttrsModel

@end


