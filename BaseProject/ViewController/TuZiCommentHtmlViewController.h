//
//  TuZiCommentHtmlViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuZiCommentHtmlViewController : UIViewController
- (id)initWithURL:(NSURL *)url;
@property (nonatomic, strong) NSURL *url;
@end
