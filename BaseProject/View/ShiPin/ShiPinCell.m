//
//  ShiPinCell.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShiPinCell.h"

@implementation ShiPinCell

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont boldSystemFontOfSize:16];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(10);
            make.right.mas_equalTo(self.clicksNumLb.mas_left).mas_equalTo(-10);
        }];
    }
    return _titleLb;
}

- (UILabel *)clicksNumLb {
    if(_clicksNumLb == nil) {
        _clicksNumLb = [[UILabel alloc] init];
        _clicksNumLb.font = [UIFont systemFontOfSize:14];
        _clicksNumLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_clicksNumLb];
        [_clicksNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
    }
    return _clicksNumLb;
}

- (TRImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[TRImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(180);
        }];
    }
    return _iconIV;
}

- (UILabel *)longTitleLb {
    if(_longTitleLb == nil) {
        _longTitleLb = [[UILabel alloc] init];
        _longTitleLb.font = [UIFont systemFontOfSize:14];
        _longTitleLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_longTitleLb];
        [_longTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(self.iconIV.mas_bottom).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(-10);
        }];
    }
    return _longTitleLb;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
