//
//  ZiXunViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZiXunViewModel.h"

@implementation ZiXunViewModel

- (NSInteger)rowNumber{
    return self.dataArr.count;
}

- (ZiXunT1348647853363Model *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [ZiXunNetManager getZiXunCompletionHanle:^(ZiXunModel *model, NSError *error) {
        [self.dataArr addObjectsFromArray:model.T1348647853363];
        completionHandle(error);
    }];
}

- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}

- (NSURL *)imgsrcURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].imgsrc];
}

- (NSString *)replyCountForRow:(NSInteger)row{
    NSInteger count = [self modelForRow:row].replyCount;
    if (count < 10000) {
        return @([self modelForRow:row].replyCount).stringValue;
    }else{
        return [NSString stringWithFormat:@"%.1f万",count/10000.0];
    }

}

- (NSString *)ptimeForRow:(NSInteger)row{
    return [self modelForRow:row].ptime;
}

- (NSURL *)url3wForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].url_3w];
}

- (ZiXunTAdsModel *)modelForArr:(NSArray *)arr row:(NSInteger)row{
    return arr[row];
}

- (NSURL *)iconURLForRowInIndexPic:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.indexPicArr row:row].imgsrc];
}

- (NSString *)titleForRowInIndexPic:(NSInteger)row{
    return [self modelForArr:self.indexPicArr row:row].title;
}

- (NSInteger)indexPicNumber{
    return self.indexPicArr.count;
}








@end
