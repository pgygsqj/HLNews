//
//  TuZiCommentCell.m
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuZiCommentCell.h"

@implementation TuZiCommentCell

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont boldSystemFontOfSize:18];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
    }
    return _titleLb;
}

- (UILabel *)titlePlainLb {
    if(_titlePlainLb == nil) {
        _titlePlainLb = [[UILabel alloc] init];
        _titlePlainLb.font = [UIFont systemFontOfSize:16];
        _titlePlainLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_titlePlainLb];
        [_titlePlainLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(5);
            make.right.mas_equalTo(-10);
        }];
    }
    return _titlePlainLb;
}

- (TRImageView *)commentView {
    if(_commentView == nil) {
        _commentView = [[TRImageView alloc] init];
        [self.contentView addSubview:_commentView];
        [_commentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(self.titlePlainLb.mas_bottom).mas_equalTo(5);
            make.size.mas_equalTo(CGSizeMake(15, 15));
            make.bottom.mas_equalTo(-10);
        }];
    }
    return _commentView;
}

- (UILabel *)commentCountLb {
    if(_commentCountLb == nil) {
        _commentCountLb = [[UILabel alloc] init];
        _commentCountLb.font = [UIFont systemFontOfSize:14];
        _commentCountLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_commentCountLb];
        [_commentCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.commentView.mas_right).mas_equalTo(5);
            make.centerY.mas_equalTo(self.commentView);
        }];
    }
    return _commentCountLb;
}

- (UILabel *)dateLb {
    if(_dateLb == nil) {
        _dateLb = [[UILabel alloc] init];
        _dateLb.font = [UIFont systemFontOfSize:14];
        _dateLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_dateLb];
        [_dateLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(-10);
        }];
    }
    return _dateLb;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
