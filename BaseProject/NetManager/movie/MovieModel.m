//
//  MovieModel.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MovieModel.h"

@implementation MovieModel


+ (NSDictionary *)objectClassInArray{
    return @{@"products" : [MovieProductsModel class]};
}
@end
@implementation MovieProductsModel

@end


