//
//  ZiXunCell.m
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZiXunCell.h"

@implementation ZiXunCell

- (TRImageView *)imgView {
    if(_imgView == nil) {
        _imgView = [[TRImageView alloc] init];
        [self.contentView addSubview:_imgView];
        [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(60,60));
            //make.bottom.mas_equalTo(-10);
        }];
    }
    return _imgView;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:16];
        _titleLb.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.leftMargin.mas_equalTo(self.imageView.mas_rightMargin).mas_equalTo(10);
            make.right.mas_equalTo(-30);
        }];
    }
    return _titleLb;
}

- (TRImageView *)replyView {
    if(_replyView == nil) {
        _replyView = [[TRImageView alloc] init];
        [self.contentView addSubview:_replyView];
        [_replyView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.imageView.mas_bottom).mas_equalTo(5);
            make.left.mas_equalTo(30);
            make.bottom.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(20, 20));
            
        }];
    }
    return _replyView;
}

- (UILabel *)replyCountLb {
    if(_replyCountLb == nil) {
        _replyCountLb = [[UILabel alloc] init];
        _replyCountLb.font = [UIFont systemFontOfSize:14];
        _replyCountLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_replyCountLb];
        [_replyCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.replyView.mas_right).mas_equalTo(5);
            make.centerY.mas_equalTo(self.replyView);
            //make.right.mas_equalTo(self.ptimeLb.mas_left).mas_equalTo(-10);
        }];
        
    }
    return _replyCountLb;
}

- (UILabel *)ptimeLb {
    if(_ptimeLb == nil) {
        _ptimeLb = [[UILabel alloc] init];
        _ptimeLb.font = [UIFont systemFontOfSize:14];
        _ptimeLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_ptimeLb];
        [_ptimeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(-10);
            //make.width.mas_equalTo(150);
        }];
    }
    return _ptimeLb;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
