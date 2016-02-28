//
//  MovieCell.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MovieCell.h"

@implementation MovieCell

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont boldSystemFontOfSize:18];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(10);
            make.right.mas_equalTo(self.imageurlView.mas_left).mas_equalTo(-10);
        }];
    }
    return _titleLb;
}

- (UILabel *)introLb {
    if(_introLb == nil) {
        _introLb = [[UILabel alloc] init];
        _introLb.font = [UIFont systemFontOfSize:16];
        _introLb.textColor = [UIColor lightGrayColor];
        _introLb.numberOfLines = 2;
        [self.contentView addSubview:_introLb];
        [_introLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(10);
            make.right.mas_equalTo(self.imageurlView.mas_left).mas_equalTo(-10);
            make.bottom.mas_equalTo(self.ptimeLb.mas_top).mas_equalTo(-10);
        }];
    }
    return _introLb;
}

- (UILabel *)ptimeLb {
    if(_ptimeLb == nil) {
        _ptimeLb = [[UILabel alloc] init];
        _ptimeLb.font = [UIFont systemFontOfSize:14];
        _ptimeLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_ptimeLb];
        [_ptimeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
        }];
    }
    return _ptimeLb;
}

- (TRImageView *)imageurlView {
    if(_imageurlView == nil) {
        _imageurlView = [[TRImageView alloc] init];
        [self.contentView addSubview:_imageurlView];
        [_imageurlView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(60, 60));
        }];
    }
    return _imageurlView;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
