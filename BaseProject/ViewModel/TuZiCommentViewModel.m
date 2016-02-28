//
//  TuZiCommentViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuZiCommentViewModel.h"


@implementation TuZiCommentViewModel

- (id)initWithId:(NSInteger)Id{
    if (self = [super init]) {
        self.Id = Id;
    }
    return self;
}

- (NSInteger)rowNumber{
    return self.dataArr.count;
}


- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _pages = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _pages +=1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

//- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
//    self.dataTask = [TuZiCommentNetManager getTuZiCommentCompletionHandle:^(TuZiCommentModel *model, NSError *error) {
//        [self.dataArr addObjectsFromArray:model.posts];
//        completionHandle(error);
//    }];
//}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [TuZiCommentNetManager getTuZiCommentWithPage:_pages count:_count completionHandle:^(TuZiCommentModel *model, NSError *error) {
        if (!error) {
            if (_pages == 1) {
                [self.dataArr removeAllObjects];
            }
        [self.dataArr addObjectsFromArray:model.posts];
        completionHandle(error);
        }
    }];
}

- (TuZiCommentPostsModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}

- (NSString *)titlePlainForRow:(NSInteger)row{
    return [self modelForRow:row].title_plain;
}

- (NSInteger)commentCountForRow:(NSInteger)row{
    return [self modelForRow:row].comment_count;
}

- (NSString *)dateForRow:(NSInteger)row{
    return [self modelForRow:row].date;
}

- (NSURL *)detailURLInListForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].url];
}











@end
