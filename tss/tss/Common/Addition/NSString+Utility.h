//
//  NSString+Utility.h
//  Keruyun
//
//  Created by gang.xu on 13-11-27.
//  Copyright (c) 2013年 shishike.com. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 * NSString扩展类
 */
@interface NSString (Utility)
- (NSString *)URLEncodedString; 
// 检测是否为合法字符串
+ (BOOL)isLegal:(NSString *)str;

// 去除前后空格，空行
+ (NSString *)trim:(NSString *)str;

// 转换字符串，过滤nil为@""
+ (NSString *)transString:(NSString *)str;

// 转换性别 none male female
+ (NSString *)translateSex:(NSString *)sex;

// 转换排队号
+ (NSString *)translateQueueNumber:(NSInteger)queueNumber;

// 本地日期和时间
- (NSDate *)localDateTime;

// 本地日期
- (NSDate *)localDate;

// 本地日期
- (NSDate *)localDate2;

// 判断是否为IP地址
- (BOOL)isIpAddress;

// 判断是否为手机号码
- (BOOL)checkMobile;

// 判断是否为座机号码
- (BOOL)checkTel;

// 子字符串的起始下标,不含子字符串则返回-1
- (NSInteger)indexOfSubString:(NSString *)aString;

// 秒转日期
- (NSDate *)dateFromMilliseconds;

// 字符串宽度
- (NSInteger)widthWithFont:(UIFont *)font;

// 根据姓名和性别生成顾客姓名
+ (NSString *)createName:(NSString *)name withSex:(NSString *)sex placeholder:(NSString *)placeholder;

// MD5加密
- (NSString *)md5FromString;

// 字符串首字母（包括汉字）
+ (NSString *)firstLetterWithTitle:(NSString *)title;

// 字符串拼音首字母（包括汉字）
+ (NSString *)firstLettersWithTitle:(NSString *)title;
/**
 *  编写预订短信模板规定常量的替换
 */
+ (NSString *)stringWithSMSReplaceByConstString:(NSString *)source WithOrderTime:(NSString *)orderTime WithOrderPersonCount:(NSString *)personCount withShopName:(NSString *)shopName withCustomerName:(NSString *)customerName withSex:(NSString *)sex withShopAddress:(NSString *)shopAddress withShopMobile:(NSString *)shopMobile withDeskNumber:(NSString *)deskNumber withDeskType:(NSString *)deskType;
/**
 *  编写排队短信模板规定常量的替换
 */
+ (NSString *)stringWithSMSReplaceByConstString:(NSString *)source withShopName:(NSString *)shopName withCustomerName:(NSString *)customerName withSex:(NSString *)sex withShopAddress:(NSString *)shopAddress withShopMobile:(NSString *)shopMobile withQueueNumber:(NSString *)queueNumber;

+ (NSString *)string2Date2String:(NSString *)data;
@end

#define SetObjectMemberValue(obj, mem, value) \
if ([NSString isLegal:value]) {\
obj.mem = value;\
}


