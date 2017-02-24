//
//  NSDate+Utility.m
//  Keruyun
//
//  Created by gang.xu on 13-11-27.
//  Copyright (c) 2013年 shishike.com. All rights reserved.
//

#import "NSDate+Utility.h"

@implementation NSDate (Utility)

// 自1970年以来的秒数
- (NSString *)secondsFrom1970
{
    return [NSString stringWithFormat:@"%.0lf", [self timeIntervalSince1970]];
}

// 自1970年以来的毫秒数
- (NSString *)millisecondsFrom1970
{
    return [NSString stringWithFormat:@"%.0f", [self timeIntervalSince1970]*1000];
}

// 本地日期
- (NSString *)localDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *result = [dateFormatter stringFromDate:self];
    [dateFormatter release];
    return result;
}

// 本地日期
- (NSString *)localDate2
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    NSString *result = [dateFormatter stringFromDate:self];
    [dateFormatter release];
    return result;
}

// 本地日期
- (NSString *)localDateTime
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *result = [dateFormatter stringFromDate:self];
    [dateFormatter release];
    return result;
}

// 本地日期
- (NSString *)localDateMMdd
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"MM-dd"];
    NSString *result = [dateFormatter stringFromDate:self];
    [dateFormatter release];
    return result;
}

// 本地日期
- (NSString *)localDate_MM_dd
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"M月dd日"];
    NSString *result = [dateFormatter stringFromDate:self];
    [dateFormatter release];
    return result;
}

// 本地日期
- (NSString *)localDate_d
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"d"];
    NSString *result = [dateFormatter stringFromDate:self];
    [dateFormatter release];
    return result;
}

// 本地日期
- (NSString *)localDateTimeHHmm
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *result = [dateFormatter stringFromDate:self];
    [dateFormatter release];
    return result;
}

// 本地日期
- (NSString *)localDateTimeYYYYMMddHHmm
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *result = [dateFormatter stringFromDate:self];
    [dateFormatter release];
    return result;
}
// 本地日期
- (NSString *)localDateTimeYYYYMMddHHmm2
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSString *result = [dateFormatter stringFromDate:self];
    [dateFormatter release];
    return result;
}
// 本地日期
- (NSString *)localDateTimeMMddHHmm
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"MM-dd HH:mm"];
    NSString *result = [dateFormatter stringFromDate:self];
    [dateFormatter release];
    return result;
}

// 本地日期
- (NSString *)localDateTimeYYYYMMddEEE
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd EEE"];
    NSString *result = [dateFormatter stringFromDate:self];
    [dateFormatter release];
    return result;
}

// 本地日期
- (NSString *)localDateTimeYYYY_MM_dd
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    NSString *result = [dateFormatter stringFromDate:self];
    [dateFormatter release];
    return result;
}

// 本地日期
- (NSString *)localDateTimeMM_dd
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"MM月dd日"];
    NSString *result = [dateFormatter stringFromDate:self];
    [dateFormatter release];
    return result;
}

// 本地日期
- (NSString *)localDateTimeYYYY_MM_dd_HH_mm
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    NSString *result = [dateFormatter stringFromDate:self];
    [dateFormatter release];
    return result;
}

// 本地日期
- (NSString *)localDateTimeYYYY_MM_dd_HH_mm_ss
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
    NSString *result = [dateFormatter stringFromDate:self];
    [dateFormatter release];
    return result;
}

// 本地日期
- (NSString *)localDateTimeYYYY_MM_dd_HH_mm_ss_SSS
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd_HH-mm-ss_SSS"];
    NSString *result = [dateFormatter stringFromDate:self];
    [dateFormatter release];
    return result;
}

// 本地日期
- (NSString *)localDateTimeM_d_HH_mm
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"M月d日 HH:mm"];
    NSString *result = [dateFormatter stringFromDate:self];
    [dateFormatter release];
    return result;
}

// 本地日期
- (NSString *)localDateM_YYYY
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"M月yyyy"];
    NSString *result = [dateFormatter stringFromDate:self];
    [dateFormatter release];
    return result;
}

// 今天
+ (NSDate *)today
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *str = [dateFormatter stringFromDate:[NSDate date]];
    NSDate *date = [dateFormatter dateFromString:str];
    [dateFormatter release];
    return date;
}

// 判断日期是否为今天
- (BOOL)isToday
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *sdate = [dateFormatter stringFromDate:self];
    NSString *stoday = [dateFormatter stringFromDate:[NSDate date]];
    [dateFormatter release];
    if ([sdate isEqualToString:stoday]) {
        return YES;
    }
    return NO;
}

// 判断日期是否在某个时间段内
- (BOOL)isBetween:(NSDate *)preDate andDate:(NSDate *)sufDate
{
    if ([self isEqualToDate:preDate]) {
        return YES;
    }
    if ([self earlierDate:preDate] == self) {
        return NO;
    }
    if ([self laterDate:sufDate] == self) {
        return NO;
    }
    return YES;
}

// 判断日期是否在某个时间段内[preDate,sufDate]
- (BOOL)isBetween:(NSDate *)preDate andDate2:(NSDate *)sufDate
{
    if ([self isEqualToDate:preDate]) {
        return YES;
    }
    if ([self isEqualToDate:sufDate]) {
        return YES;
    }
    if ([self earlierDate:preDate] == self) {
        return NO;
    }
    if ([self laterDate:sufDate] == self) {
        return NO;
    }
    return YES;
}

// 第二天
- (NSDate *)nextDay
{
    return [self dateByAddingTimeInterval:kSecondsInOneDay];
}

// 前一天
- (NSDate *)lastDay
{
    return [self dateByAddingTimeInterval:-kSecondsInOneDay];
}

// 当天日期的最早时间，如：2014-01-01 00:00:00
- (NSDate *)earlierDate
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *str = [dateFormatter stringFromDate:self];
    NSDate *date = [dateFormatter dateFromString:str];
    [dateFormatter release];
    return date;
}

// 当天日期的最晚时间，如：2014-01-01 23:59:59
- (NSDate *)laterDate
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd 23:59:59"];
    NSString *str = [dateFormatter stringFromDate:self];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:str];
    [dateFormatter release];
    return date;
    
}

// 周几
- (NSString *)weekOfDay
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setCalendar:calendar];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateFormat:@"EEE"];
    NSString *result = [dateFormatter stringFromDate:self];
    [dateFormatter release];
    [calendar release];
    return result;
}

// 1：周日，2：周一，...
- (NSInteger)weekday
{
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    NSDateComponents *weekDayComponents = [gregorian components:NSWeekdayCalendarUnit fromDate:self];
    return [weekDayComponents weekday];
}

// 用指定日期获取包含该日期的一周的日期
- (NSArray *)daysOfWeekWithFirstWeekday:(NSInteger)firstWeekday
{
    NSInteger weekday = [self weekday];
    // firstWeekday：1:周日,2:周一
    NSDate *firstDate = nil;
    // 一周从周日开始
    if (firstWeekday == 1 || firstWeekday < 1 || firstWeekday > 7) {
        firstDate = [NSDate dateWithTimeInterval:((1 - weekday) * kSecondsInOneDay) sinceDate:self];
    }
    // 一周从周一开始
    else {
        NSInteger offset = 0;
        if (firstWeekday <= weekday) {
            offset = (firstWeekday - weekday);
        }
        else {
            offset = (firstWeekday - weekday) - 7;
        }
        firstDate = [NSDate dateWithTimeInterval:(offset * kSecondsInOneDay) sinceDate:self];
    }
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array addObject:firstDate];
    NSDate *dateTmp = nil;
    for (NSInteger index = 1; index < 7; index++) {
        dateTmp = [NSDate dateWithTimeInterval:(index * kSecondsInOneDay) sinceDate:firstDate];
        [array addObject:dateTmp];
    }
    return [array autorelease];
}

// 本月日期
- (NSArray *)daysOfMonth
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSRange daysRange = [currentCalendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self];
    NSDateComponents *components = [currentCalendar components:NSYearCalendarUnit|NSMonthCalendarUnit fromDate:self];
    for (NSInteger index = daysRange.location; index <= daysRange.length; index++) {
        components.day = index;
        [array addObject:[currentCalendar dateFromComponents:components]];
    }
    return [array autorelease];
}

// 上月日期
- (NSArray *)daysOfLastMonth
{
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [currentCalendar components:NSYearCalendarUnit|NSMonthCalendarUnit fromDate:self];
    components.day = -1;
    NSDate *dateInLastMonth = [currentCalendar dateFromComponents:components];
    return [dateInLastMonth daysOfMonth];
}

// 下月日期
- (NSArray *)daysOfNextMonth
{
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [currentCalendar components:NSYearCalendarUnit|NSMonthCalendarUnit fromDate:self];
    NSRange daysRange = [currentCalendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self];
    components.day = daysRange.length + 1;
    NSDate *dateInLastMonth = [currentCalendar dateFromComponents:components];
    return [dateInLastMonth daysOfMonth];
}

// 上个月的当天，如果没有则是上个月的1号的日期
- (NSDate *)theDayOfLastMonth
{
    NSInteger day = [self day];
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *components = [currentCalendar components:unitFlags fromDate:self];
    components.day = -1;
    NSDate *dateInLastMonth = [currentCalendar dateFromComponents:components];
    NSRange daysRange = [currentCalendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:dateInLastMonth];
    if (day <= daysRange.length) {
        components = [currentCalendar components:unitFlags fromDate:dateInLastMonth];
        components.day = day;
    }
    else {
        components = [currentCalendar components:unitFlags fromDate:dateInLastMonth];
        components.day = 1;
    }
    return [currentCalendar dateFromComponents:components];
}

// 下个月的当天，如果没有则是下个月的1号的日期
- (NSDate *)theDayOfNextMonth
{
    NSInteger day = [self day];
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *components = [currentCalendar components:unitFlags fromDate:self];
    NSRange daysRange = [currentCalendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self];
    components.day = daysRange.length + 1;
    NSDate *dateInNextMonth = [currentCalendar dateFromComponents:components];
    daysRange = [currentCalendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:dateInNextMonth];
    if (day <= daysRange.length) {
        components = [currentCalendar components:unitFlags fromDate:dateInNextMonth];
        components.day = day;
    }
    else {
        components = [currentCalendar components:unitFlags fromDate:dateInNextMonth];
        components.day = 1;
    }
    return [currentCalendar dateFromComponents:components];
}

// 是否为当月
- (BOOL)isThisMonth
{
    return ([self year] == [[NSDate date] year] && [self month] == [[NSDate date] month]);
}

// 是否为当年
- (BOOL)isThisYear
{
    return ([self year] == [[NSDate date] year]);
}

// 获取年
- (NSInteger)year
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:self];
    return [dateComponent year];
}

// 获取月
- (NSInteger)month
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:self];
    return [dateComponent month];
}

// 获取日
- (NSInteger)day
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:self];
    return [dateComponent day];
}

// 获取小时
- (NSInteger)hour
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = kCFCalendarUnitHour | kCFCalendarUnitMinute;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:self];
    return [dateComponent hour];
}

// 获取分钟
- (NSInteger)minute
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = kCFCalendarUnitHour | kCFCalendarUnitMinute;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:self];
    return [dateComponent minute];
}

// 根据小时和分钟生成日期
- (NSDate *)dateWithHour:(NSInteger)hour minute:(NSInteger)minute
{
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | kCFCalendarUnitHour | kCFCalendarUnitMinute;
    NSDateComponents *components = [currentCalendar components:unitFlags fromDate:self];
    components.minute = minute;
    components.hour = hour;
    return [currentCalendar dateFromComponents:components];
}

// 相对于当天的日期
- (NSDate *)dateOfDays:(NSInteger)days
{
    return [NSDate dateWithTimeInterval:(days * 86400) sinceDate:self];
}

// 是否同一天
- (BOOL) isSameDay:(NSDate*)otherDate {
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:self];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:otherDate];
    
    return [comp1 day]   == [comp2 day] &&
    [comp1 month] == [comp2 month] &&
    [comp1 year]  == [comp2 year];
}

@end
