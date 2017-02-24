//
//  NSMutableDictionary+Utility.h
//  SelfService
//
//  Created by Mac on 14-2-20.
//  Copyright (c) 2014年 Beijing ShiShiKe Technologies Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * NSMutableDictionary扩展类
 */
@interface NSMutableDictionary (Utility)
// 安全设置数据
- (void)setSaveValue:(id)value forKey:(NSString *)key;
@end
