//
//  NSDate+Utility.h
//  Keruyun
//
//  Created by gang.xu on 13-11-27.
//  Copyright (c) 2013年 shishike.com. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kSecondsInOneDay    (24*60*60.0)
#define kSecondsInOneHour   (60*60.0)

/*
 * NSDate扩展类
 */
@interface NSDate (Utility)

// 自1970年以来的秒数
- (NSString *)secondsFrom1970;

// 自1970年以来的毫秒数
- (NSString *)millisecondsFrom1970;

// 本地日期
- (NSString *)localDate;
- (NSString *)localDate2;   

// 本地日期
- (NSString *)localDateTime;

// 本地日期
- (NSString *)localDateMMdd;

// 本地日期
- (NSString *)localDate_MM_dd;

// 本地日期
- (NSString *)localDate_d;

// 本地日期
- (NSString *)localDateTimeHHmm;

// 本地日期
- (NSString *)localDateTimeYYYYMMddHHmm;
// 本地日期
- (NSString *)localDateTimeYYYYMMddHHmm2;
// 本地日期
- (NSString *)localDateTimeMMddHHmm;

// 本地日期
- (NSString *)localDateTimeYYYYMMddEEE;

// 本地日期
- (NSString *)localDateTimeYYYY_MM_dd;

// 本地日期
- (NSString *)localDateTimeMM_dd;

// 本地日期
- (NSString *)localDateTimeYYYY_MM_dd_HH_mm;

// 本地日期
- (NSString *)localDateTimeYYYY_MM_dd_HH_mm_ss;

// 本地日期
- (NSString *)localDateTimeYYYY_MM_dd_HH_mm_ss_SSS;

// 本地日期
- (NSString *)localDateTimeM_d_HH_mm;

// 本地日期
- (NSString *)localDateM_YYYY;

// 今天
+ (NSDate *)today;

// 判断是否为今天
- (BOOL)isToday;

// 判断日期是否在某个时间段内[preDate,sufDate)
- (BOOL)isBetween:(NSDate *)preDate andDate:(NSDate *)sufDate;

// 判断日期是否在某个时间段内[preDate,sufDate]
- (BOOL)isBetween:(NSDate *)preDate andDate2:(NSDate *)sufDate;

// 第二天
- (NSDate *)nextDay;

// 前一天
- (NSDate *)lastDay;

// 当天日期的最早时间，如：2014-01-01 00:00:00
- (NSDate *)earlierDate;

// 当天日期的最晚时间，如：2014-01-01 23:59:59
- (NSDate *)laterDate;

// 周几
- (NSString *)weekOfDay;

// 1：周日，2：周一，...
- (NSInteger)weekday;

// 用指定日期获取包含该日期的一周的日期
- (NSArray *)daysOfWeekWithFirstWeekday:(NSInteger)firstWeekday;

// 本月日期
- (NSArray *)daysOfMonth;

// 上月日期
- (NSArray *)daysOfLastMonth;

// 下月日期
- (NSArray *)daysOfNextMonth;

// 上个月的当天，如果没有则是上个月的1号的日期
- (NSDate *)theDayOfLastMonth;

// 下个月的当天，如果没有则是下个月的1号的日期
- (NSDate *)theDayOfNextMonth;

// 是否为当月
- (BOOL)isThisMonth;

// 是否为当年
- (BOOL)isThisYear;

// 获取年
- (NSInteger)year;

// 获取月
- (NSInteger)month;

// 获取日
- (NSInteger)day;

// 获取小时
- (NSInteger)hour;

// 获取分钟
- (NSInteger)minute;

// 根据小时和分钟生成日期
- (NSDate *)dateWithHour:(NSInteger)hour minute:(NSInteger)minute;

// 相对于当天的日期
- (NSDate *)dateOfDays:(NSInteger)days;

// 是否同一天
- (BOOL) isSameDay:(NSDate*)otherDate;

@end
