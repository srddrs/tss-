//
//  NSString+Validate.h
//  AreaCodeRegex
//
//  Created by EasonWang on 15/11/30.
//  Copyright © 2015年 EasonWang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validate)

/**
 *	@brief	固定电话区号格式化（将形如 01085792889 格式化为 010-85792889）
 *
 *	@return	返回格式化后的号码（形如 010-85792889）
 */
- (NSString*)areaCodeFormat;

/**
 *	@brief	验证固定电话区号是否正确（e.g. 010正确，040错误）
 *
 *	@return	返回固定电话区号是否正确
 */
- (BOOL)isAreaCode;

@end
