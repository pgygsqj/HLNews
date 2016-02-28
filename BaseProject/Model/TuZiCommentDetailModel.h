//
//  TuZiCommentDetailModel.h
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class TuZiCommentDetailPostModel,TuZiCommentDetailPostCustomFieldsModel,TuZiCommentDetailPostAuthorModel,TuZiCommentDetailPostTagsModel,TuZiCommentDetailPostCategoriesModel;
@interface TuZiCommentDetailModel : BaseModel

@property (nonatomic, copy) NSString *status;

@property (nonatomic, strong) TuZiCommentDetailPostModel *post;

@property (nonatomic, copy) NSString *previousUrl;

@end
@interface TuZiCommentDetailPostModel : BaseModel

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, strong) NSArray<TuZiCommentDetailPostCategoriesModel *> *categories;

@property (nonatomic, copy) NSString *modified;

@property (nonatomic, strong) NSArray *comments;

@property (nonatomic, copy) NSString *excerpt;

@property (nonatomic, strong) TuZiCommentDetailPostAuthorModel *author;

@property (nonatomic, assign) NSInteger comment_count;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *title_plain;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<TuZiCommentDetailPostTagsModel *> *tags;

@property (nonatomic, copy) NSString *date;

@property (nonatomic, copy) NSString *comment_status;

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, strong) NSArray *attachments;

@property (nonatomic, strong) TuZiCommentDetailPostCustomFieldsModel *custom_fields;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *content;

@end

@interface TuZiCommentDetailPostCustomFieldsModel : BaseModel

@end

@interface TuZiCommentDetailPostAuthorModel : BaseModel

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *last_name;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *first_name;

@end

@interface TuZiCommentDetailPostTagsModel : BaseModel

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, assign) NSInteger post_count;

@end

@interface TuZiCommentDetailPostCategoriesModel : BaseModel

@property (nonatomic, assign) NSInteger post_count;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, assign) NSInteger parent;

@end

