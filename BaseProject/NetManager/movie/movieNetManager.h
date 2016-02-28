//
//  movieNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "MovieModel.h"
#import "MovieDetailModel.h"

@interface movieNetManager : BaseNetManager


+getMovieCompletionHandle:(void(^)(id model, NSError *error))completionHandle;

+ getMovieDetailWithIntroId:(NSString *)introId kCompletionHandle;

@end
