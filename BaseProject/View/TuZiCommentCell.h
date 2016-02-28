//
//  TuZiCommentCell.h
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"

@interface TuZiCommentCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLb;
@property (nonatomic, strong) UILabel *titlePlainLb;
@property (nonatomic, strong) TRImageView *commentView;
@property (nonatomic, strong) UILabel *commentCountLb;
@property (nonatomic, strong) UILabel *dateLb;

@end
