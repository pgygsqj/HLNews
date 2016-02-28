//
//  TuZiCommentModel.h
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class TuZiCommentQueryModel,TuZiCommentPostsModel,TuZiCommentPostsCustomFieldsModel,TuZiCommentPostsAuthorModel,TuZiCommentPostsTagsModel,TuZiCommentPostsCategoriesModel;
@interface TuZiCommentModel : BaseModel

@property (nonatomic, copy) NSString *status;

@property (nonatomic, assign) NSInteger pages;

@property (nonatomic, assign) NSInteger countTotal;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSArray<TuZiCommentPostsModel *> *posts;

@property (nonatomic, strong) TuZiCommentQueryModel *query;

@end
@interface TuZiCommentQueryModel : BaseModel

@property (nonatomic, assign) BOOL ignoreStickyPosts;

@end

@interface TuZiCommentPostsModel : BaseModel

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, strong) NSArray<TuZiCommentPostsCategoriesModel *> *categories;

@property (nonatomic, copy) NSString *modified;

@property (nonatomic, strong) NSArray *comments;

@property (nonatomic, copy) NSString *excerpt;

@property (nonatomic, strong) TuZiCommentPostsAuthorModel *author;

@property (nonatomic, assign) NSInteger comment_count;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *title_plain;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<TuZiCommentPostsTagsModel *> *tags;

@property (nonatomic, copy) NSString *date;

@property (nonatomic, copy) NSString *comment_status;

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, strong) NSArray *attachments;

@property (nonatomic, strong) TuZiCommentPostsCustomFieldsModel *custom_fields;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *content;

@end

@interface TuZiCommentPostsCustomFieldsModel : BaseModel

@end

@interface TuZiCommentPostsAuthorModel : BaseModel

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *last_name;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *first_name;

@end

@interface TuZiCommentPostsTagsModel : BaseModel

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, assign) NSInteger post_count;

@end

@interface TuZiCommentPostsCategoriesModel : BaseModel

@property (nonatomic, assign) NSInteger post_count;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, assign) NSInteger parent;

@end

