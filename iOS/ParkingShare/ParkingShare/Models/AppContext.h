//
//  AppContext.h
//  ParkingShare
//
//  Created by Qing Sun on 4/19/15.
//  Copyright (c) 2015 Qing Sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoModel.h"

@interface AppContext : NSObject

@property (strong, nonatomic) UserInfoModel *userInfo;

+ (AppContext *)instance;

@end
