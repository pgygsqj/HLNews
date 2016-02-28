//
//  MovieDetailModel.h
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class MovieDetailImagesModel,MovieDetailAttrsModel;
@interface MovieDetailModel : BaseModel

@property (nonatomic, copy) NSString *infoid;

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *infotype;

@property (nonatomic, strong) NSArray<MovieDetailImagesModel *> *images;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *keyword;

@property (nonatomic, copy) NSString *igid;

@property (nonatomic, strong) NSArray<MovieDetailAttrsModel *> *attrs;

@property (nonatomic, copy) NSString *corpname;

@property (nonatomic, copy) NSString *errorCode;

@end
@interface MovieDetailImagesModel : NSObject

@property (nonatomic, copy) NSString *sourceimg;

@property (nonatomic, copy) NSString *smallimg;

@end

@interface MovieDetailAttrsModel : NSObject

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *value;

@end

