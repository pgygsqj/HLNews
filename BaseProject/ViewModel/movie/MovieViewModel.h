//
//  MovieViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "movieNetManager.h"

@interface MovieViewModel : BaseViewModel

- (id)initWithintroid:(NSString *)introid;
@property (nonatomic, strong) NSString *introid;

@property (nonatomic) NSInteger rowNumber;

- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)introForRow:(NSInteger)row;
- (NSString *)ptimeForRow:(NSInteger)row;
- (NSURL *)imageurlForRow:(NSInteger)row;



@end
