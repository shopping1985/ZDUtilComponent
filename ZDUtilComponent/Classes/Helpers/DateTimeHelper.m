//
//  DateTimeHelper.m
//  BeautifulDay
//
//  Created by linxiaoping on 2020/3/4.
//  Copyright © 2020 yagu. All rights reserved.
//

#import "DateTimeHelper.h"

@implementation DateTimeHelper

//从含时分秒的字符串中返回日期（不含时分秒）
+(NSString*)dateFromTimeString:(NSString*)str{
    if (str == nil || ![str isKindOfClass:NSString.class]) {
        return @"";
    }
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date = [fmt dateFromString:str];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
    return [NSString stringWithFormat:@"%.4ld.%.2ld.%.2ld", (long)components.year, (long)components.month, (long)components.day];
}

//从含时分秒的字符串中返回自定义时间
//时间规则：小于1分钟显示：刚刚
//        大于1分钟：今天 17：19
//        昨天：    昨天 17：19
//        非当天：01.16
//        非今年：2019.12.16

+(NSString*)customDateFromTimeString:(NSString*)str{
    if (str == nil || ![str isKindOfClass:NSString.class]) {
        return @"";
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *dateCompare = [formatter dateFromString:str];
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentCompare = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond fromDate:dateCompare];
    NSDateComponents *componentNow = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:now];
    
    if (componentNow.year != componentCompare.year) {//非今年：2019.12.16
        return [NSString stringWithFormat:@"%.4ld.%.2ld.%.2ld", (long)componentCompare.year, (long)componentCompare.month, (long)componentCompare.day];
    }
    
    NSDateComponents *compDay = [calendar components:NSCalendarUnitDay
                                                fromDate:dateCompare
                                                  toDate:now
                                                 options:NSCalendarWrapComponents];
    if (compDay.day == 1) {//昨天 17：19
        return [NSString stringWithFormat:@"昨天 %.2ld:%.2ld", (long)componentCompare.hour, (long)componentCompare.minute];
    }
    
    if (componentNow.month != componentCompare.month || componentNow.day != componentCompare.day) {//非当天：01.16
        return [NSString stringWithFormat:@"%.2ld.%.2ld", (long)componentCompare.month, (long)componentCompare.day];
    }
    
    NSDateComponents    *compSecond = [calendar components:NSCalendarUnitSecond
                                             fromDate:dateCompare
                                               toDate:now
                                              options:NSCalendarWrapComponents];
    if (compSecond.second > 60) {//大于1分钟：今天 17：19
        return [NSString stringWithFormat:@"今天 %.2ld:%.2ld", (long)componentCompare.hour, (long)componentCompare.minute];
    }
    
    return @"刚刚";
}

+ (BOOL)isToday:(NSString*)str
{
    if (str == nil || ![str isKindOfClass:NSString.class]) {
        return NO;
    }
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *dateCompare = [fmt dateFromString:str];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear;

    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    // 2.获得要判断的年月日
    NSDateComponents *dateCmps = [calendar components:unit fromDate:dateCompare];
    return (dateCmps.year == nowCmps.year) && (dateCmps.month == nowCmps.month) && (dateCmps.day == nowCmps.day);
}

+ (BOOL)isYesterday:(NSString*)str
{
    if (str == nil || ![str isKindOfClass:NSString.class]) {
        return NO;
    }
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *dateCompare = [fmt dateFromString:str];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 获得日期的差距
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:dateCompare toDate:[NSDate date] options:0];
    return cmps.day == 1;
}

+ (BOOL)isThisYear:(NSString*)str
{
    if (str == nil || ![str isKindOfClass:NSString.class]) {
        return NO;
    }
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *dateCompare = [fmt dateFromString:str];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear;
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    // 2.获得要对比的年月日
    NSDateComponents *dateCmps = [calendar components:unit fromDate:dateCompare];

    return nowCmps.year == dateCmps.year;
}

@end
