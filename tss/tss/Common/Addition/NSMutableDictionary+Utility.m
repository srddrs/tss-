//
//  NSMutableDictionary+Utility.m
//  SelfService
//
//  Created by Mac on 14-2-20.
//  Copyright (c) 2014年 Beijing ShiShiKe Technologies Co., Ltd. All rights reserved.
//

#import "NSMutableDictionary+Utility.h"

@implementation NSMutableDictionary (Utility)

// 安全设置数据
- (void)setSaveValue:(id)value forKey:(NSString *)key
{
    if (value != nil) {
        [self setObject:value forKey:key];
    }
    else if (key != nil) {
        [self removeObjectForKey:key];
    }
}

@end
