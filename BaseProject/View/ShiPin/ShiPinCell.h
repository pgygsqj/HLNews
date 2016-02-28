//
//  ShiPinCell.h
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"

@interface ShiPinCell : UITableViewCell

@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)UILabel *clicksNumLb;
@property(nonatomic,strong)TRImageView *iconIV;
@property(nonatomic,strong)UILabel *longTitleLb;

@end
