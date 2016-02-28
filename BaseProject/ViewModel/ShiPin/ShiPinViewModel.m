//
//  ShiPinViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShiPinViewModel.h"
#import "ShiPinNetManager.h"

@implementation ShiPinViewModel

- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _start = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _start += 11;
    [self getDataFromNetCompleteHandle:completionHandle];
}


- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [ShiPinNetManager getShiPinWithCompletionHandle:^(ShiPinModel *model, NSError *error) {
        if (_start == 0) {
            [self.dataArr removeAllObjects];
            self.indexPicArr = nil;
        }
        [self.dataArr addObjectsFromArray:model.data.list];
        self.indexPicArr = model.data.indexpic;
        completionHandle(error);
    }];
}

- (BOOL)isExistIndexPic{
    return self.indexPicArr != nil && self.indexPicArr.count != 0;
}

- (NSInteger)rowNumber{
    return self.dataArr.count;
}

- (ShiPinDataIndexpicModel *)modelForArr:(NSArray *)arr row:(NSInteger)row{
    return arr[row];
}

- (BOOL)containImages:(NSInteger)row{
    return [[self modelForArr:self.dataArr row:row].showtype isEqualToString:@"1"];
}

- (NSString *)titleForRowInList:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].title;
}

- (NSURL *)iconURLForRowInList:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].litpic];
}

- (NSString *)descForRowInList:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].longtitle;
}

- (NSString *)clicksForRowInList:(NSInteger)row{
    return [[self modelForArr:self.dataArr row:row].click stringByAppendingString:@"人浏览"];
}

- (NSURL *)iconURLForRowInIndexPic:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.indexPicArr row:row].litpic];
}

- (NSString *)titleForRowInIndexPic:(NSInteger)row{
    return [self modelForArr:self.indexPicArr row:row].title;
}

- (NSInteger)indexPicNumber{
    return self.indexPicArr.count;
}

- (NSURL *)detailURLForRowInList:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].html5];
}

- (NSURL *)detailURLForRowInIndexPic:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.indexPicArr row:row].html5];
}

- (BOOL)isHtmlInListForRow:(NSInteger)row{
    return [[self modelForArr:self.dataArr row:row].type isEqualToString:@"all"];
}

- (BOOL)isHtmlInIndexPicForRow:(NSInteger)row{
    return [[self modelForArr:self.indexPicArr row:row].type isEqualToString:@"all"];
}

/** 返回某行数据的Aid */
- (NSString *)aidInListForRow:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].aid;
}
- (NSString *)aidInIndexPicForRow:(NSInteger)row{
    return [self modelForArr:self.indexPicArr row:row].aid;
}







@end
