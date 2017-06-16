//
//  NSString+ZXCStr.h
//  ZhXCCalender
//
//  Created by 周希财 on 2017/6/16.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, ZXCStrWithChineseCalendarType) {
    ZXCStrWithChineseCalendarTypeYMD = 0,
    ZXCStrWithChineseCalendarTypeYM = 1,
    ZXCStrWithChineseCalendarTypeY = 2,
    ZXCStrWithChineseCalendarTypeM = 3,
    ZXCStrWithChineseCalendarTypeD = 4,
};
@interface NSString (ZXCStr)
 //将日期转化成str
+ (NSString *)stringWithDate:(NSDate *)date;
//获取中国农历
+ (NSString *)stringChineseCalendarWithDate:(NSDate *)date withType:(ZXCStrWithChineseCalendarType)type;
@end
