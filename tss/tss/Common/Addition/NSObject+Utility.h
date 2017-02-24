//
//  NSObject+Utility.h
//  Keruyun
//
//  Created by shanezhang on 14-7-23.
//  Copyright (c) 2014年 shishike.com. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *   本类是将字典或者数组转换成json的工具类
 */
@interface NSObject (Utility)
// 将字典或者数组转换成json
+ (NSData *)toJSONData:(id)theData;
@end
