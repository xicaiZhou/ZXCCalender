//
//  NSDate+ZXCDate.h
//  ZhXCCalender
//
//  Created by 周希财 on 2017/6/15.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, DataCalendarMonth) {
    DataCalendarMonthPrevious = 0,
    DataCalendarMonthCurrent = 1,
    DataCalendarMonthNext = 2,
};

@interface NSDate (ZXCDate)
//获取date月的第一天
+ (NSInteger)firstWeekdayInThisMotnth:(NSDate *)date;
//date月有多少天
+ (NSInteger)totaldaysInMonth:(NSDate *)date;
// date的上num个月
+ (NSDate *)lastMonth:(NSDate *)date withNum:(NSInteger)num;
// date的下num个月
+ (NSDate *)nextMonth:(NSDate *)date withNum:(NSInteger)num;
// 获取date的年份
+ (NSInteger)year:(NSDate *)date;
// 获取date的月份
+ (NSInteger)month:(NSDate *)date;
// 获取日历的为第几天
+ (NSInteger)day:(NSDate *)date;
// 将日期字符串转换成NSDate
+ (NSDate *)dateWithDateString:(NSString *)dateStr;
// 日历的上num天
+ (NSDate *)lastDay:(NSDate *)date withNum:(NSInteger)num;
// 日历的上num天
+ (NSDate *)nextDay:(NSDate *)date withNum:(NSInteger)num;
// 获取某月day的日期
+ (NSDate *)dateOfMonth:(NSDate *)date WithDay:(NSInteger)day;
@end
