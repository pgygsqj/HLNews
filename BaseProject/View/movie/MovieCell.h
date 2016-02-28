//
//  MovieCell.h
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"

@interface MovieCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLb;
@property (nonatomic, strong) UILabel *introLb;
@property (nonatomic, strong) UILabel *ptimeLb;
@property (nonatomic, strong) TRImageView *imageurlView;

@end
