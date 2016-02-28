//
//  ShiPinNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "ShiPinModel.h"

@interface ShiPinNetManager : BaseNetManager

+ (id)getShiPinWithCompletionHandle:(void (^)(id model, NSError *error))completionHandle;
@end
