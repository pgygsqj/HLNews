//
//  TuZiCommentViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuZiCommentNetManager.h"

@interface TuZiCommentViewModel : BaseViewModel

- (id)initWithId:(NSInteger)Id;
@property (nonatomic) NSInteger Id;

@property (nonatomic) NSInteger pages;
@property (nonatomic) NSInteger count;

@property (nonatomic) NSInteger rowNumber;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)titlePlainForRow:(NSInteger)row;
- (NSInteger)commentCountForRow:(NSInteger)row;
- (NSString *)dateForRow:(NSInteger)row;
- (NSURL *)detailURLInListForRow:(NSInteger)row;

@end
