//
//  ZiXunViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "ZiXunNetManager.h"

@interface ZiXunViewModel : BaseViewModel

@property (nonatomic) NSInteger rowNumber;

- (NSString *)titleForRow:(NSInteger)row;
- (NSURL *)imgsrcURLForRow:(NSInteger)row;
- (NSString *)replyCountForRow:(NSInteger)row;
- (NSString *)ptimeForRow:(NSInteger)row;
- (NSURL *)url3wForRow:(NSInteger)row;

/** 存放头部滚动栏 */
@property (nonatomic, strong) NSArray *indexPicArr;
/** 滚动展示栏的图片 */
- (NSURL *)iconURLForRowInIndexPic:(NSInteger)row;
/** 滚动展示栏的文字 */
- (NSString *)titleForRowInIndexPic:(NSInteger)row;
/** 滚动展示栏的图片数量 */
@property(nonatomic) NSInteger indexPicNumber;

@end
