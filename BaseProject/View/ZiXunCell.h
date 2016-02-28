//
//  ZiXunCell.h
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface ZiXunCell : UITableViewCell

@property (nonatomic, strong) TRImageView *imgView;
@property (nonatomic, strong) UILabel *titleLb;
@property (nonatomic, strong) TRImageView *replyView;
@property (nonatomic, strong) UILabel *replyCountLb;
@property (nonatomic, strong) UILabel *ptimeLb;

@end
