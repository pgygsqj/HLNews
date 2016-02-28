//
//  MovieViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MovieViewModel.h"

@implementation MovieViewModel

- (id)initWithintroid:(NSString *)introid{
    if (self = [super init]) {
        self.introid = introid;
    }
    return self;
}

- (NSInteger)rowNumber{
    return self.dataArr.count;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [movieNetManager getMovieCompletionHandle:^(MovieModel *model, NSError *error) {
        [self.dataArr addObjectsFromArray:model.products];
        completionHandle(error);
    }];
}

- (MovieProductsModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}

- (NSString *)introForRow:(NSInteger)row{
    return [self modelForRow:row].intro;
}

- (NSString *)ptimeForRow:(NSInteger)row{
    return [self modelForRow:row].ptime;
}

- (NSURL *)imageurlForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].imageurl];
}








    
@end
