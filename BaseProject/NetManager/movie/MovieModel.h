//
//  MovieModel.h
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class MovieProductsModel;
@interface MovieModel : BaseModel

@property (nonatomic, copy) NSString *totalnum;

@property (nonatomic, strong) NSArray<MovieProductsModel *> *products;

@end
@interface MovieProductsModel : NSObject

@property (nonatomic, copy) NSString *imageurl;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *infoid;

@property (nonatomic, copy) NSString *infotype;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *ptime;

@end

