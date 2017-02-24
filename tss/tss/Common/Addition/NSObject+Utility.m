//
//  NSObject+Utility.m
//  Keruyun
//
//  Created by shanezhang on 14-7-23.
//  Copyright (c) 2014年 shishike.com. All rights reserved.
//

#import "NSObject+Utility.h"

@implementation NSObject (Utility)

// 将字典或者数组转换成json
+ (NSData *)toJSONData:(id)theData
{
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:theData
                                                       options:0
                                                         error:&error];
    
    if ([jsonData length] != 0 && error == nil)
    {
        return jsonData;
    }
    else
    {
        return nil;
    }
}
@end
