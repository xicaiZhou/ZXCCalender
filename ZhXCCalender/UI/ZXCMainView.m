//
//  ZXCMainView.m
//  ZhXCCalender
//
//  Created by 周希财 on 2017/6/15.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//

#import "ZXCMainView.h"
#import "ZXCBtnItem.h"

#import "ZXCCalender.h"
@interface  ZXCMainView()
@property (nonatomic, strong) NSMutableArray *dateArray;
@property (nonatomic, assign) NSDate* currentSelectedDate;
@property (nonatomic, assign) NSDate* oldSelectedDate;
@end

@implementation ZXCMainView

+ (instancetype)shardZxcMainView{

    static ZXCMainView *view;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        view = [[ZXCMainView alloc] initWithFrame:CGRectMake(0, selectViewHeight + itemH, Screen_Width, itemH * 6) withDate:[NSDate date]];
    });
    return view;
}
- (instancetype)initWithFrame:(CGRect)frame withDate:(NSDate *)date
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
        [self nextMonthDate:date];
    }
    return self;
}
- (void)createView{

    for (int i = 0; i < 42; i ++) {
        ZXCBtnItem *button = nil;
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"ZXCBtnItem" owner:nil options:nil];
        button = views.firstObject;
        [self addSubview:button];
        button.layer.cornerRadius = 20;
        
        int x = (i % 7) * (itemW + ca * 2);
        int y = (i / 7) * itemH;
        button.frame = CGRectMake(x + 5, y + 5, itemW - 10, itemH - 10);
        [button.layer setMasksToBounds:YES];
        button.tag = 1000000 + i;
        [button addTarget:self action:@selector(currentSelectedDate:) forControlEvents:UIControlEventTouchUpInside];
    }
}
- (void)nextMonthDate:(NSDate *)date{
    
    _dateArray = [NSMutableArray array];
    // 1.分析这个月的第一天是第一周的星期几
    NSInteger firstWeekday = [NSDate firstWeekdayInThisMotnth:date];
    // 2.分析这个月有多少天
    NSInteger dayInThisMonth = [NSDate totaldaysInMonth:date];
    //上个月的
    NSInteger lastMonthNum = [NSDate totaldaysInMonth:[NSDate lastMonth:date withNum: -1]];
   
    for (int i = 0; i < 42; i ++) {
        ZXCBtnItem *button = [self viewWithTag:1000000 + i];
        NSInteger day = 0;
        if (i < firstWeekday) {
            day = lastMonthNum - firstWeekday + i + 1;
            button.gregorianLabel.textColor = [UIColor colorWithWhite:0.5 alpha:0.5];
            button.lunarLabel.textColor = [UIColor colorWithWhite:0.5 alpha:0.5];
            NSDate *last = [NSDate dateOfMonth:[NSDate lastMonth:date withNum:-1] WithDay:day];
            button.lunarLabel.text = [NSString stringChineseCalendarWithDate:last withType:ZXCStrWithChineseCalendarTypeD];
            if ([button.lunarLabel.text isEqualToString:@"初一"]) {
                button.lunarLabel.text = [NSString stringChineseCalendarWithDate:last withType:ZXCStrWithChineseCalendarTypeM];
            }
            [_dateArray addObject:last];
        }else if (i > firstWeekday + dayInThisMonth - 1){
            day = i + 1 - firstWeekday - dayInThisMonth;
            button.gregorianLabel.textColor = [UIColor colorWithWhite:0.5 alpha:0.5];
            button.lunarLabel.textColor = [UIColor colorWithWhite:0.5 alpha:0.5];
            NSDate *next = [NSDate dateOfMonth:[NSDate nextMonth:date withNum:1] WithDay:day];
            button.lunarLabel.text = [NSString stringChineseCalendarWithDate:next withType:ZXCStrWithChineseCalendarTypeD];
            if ([button.lunarLabel.text isEqualToString:@"初一"]) {
                button.lunarLabel.text = [NSString stringChineseCalendarWithDate:next withType:ZXCStrWithChineseCalendarTypeM];
            }
            [_dateArray addObject:next];
        }else{
            day = i - firstWeekday + 1;
            button.gregorianLabel.textColor = [UIColor blackColor];
            button.lunarLabel.textColor = [UIColor blackColor];

            if (( i % 7 ==0) || i % 7 == 6) {
                
                button.gregorianLabel.textColor = [UIColor redColor];
                button.lunarLabel.textColor = [UIColor redColor];
            }
            NSDate *now = [NSDate dateOfMonth:date WithDay:day];
            button.lunarLabel.text = [NSString stringChineseCalendarWithDate:now withType:ZXCStrWithChineseCalendarTypeD];
            
            if ([button.lunarLabel.text isEqualToString:@"初一"]) {
                
                button.lunarLabel.text = [NSString stringChineseCalendarWithDate:now withType:ZXCStrWithChineseCalendarTypeM];
            }
            [_dateArray addObject:now];
        }
        if (_oldSelectedDate) {
            if (([NSDate month:date] == [NSDate month:_oldSelectedDate]) && ([NSDate year:date] == [NSDate year:_oldSelectedDate]) &&((i == firstWeekday + [NSDate day:_oldSelectedDate] - 1))) {
                NSLog(@"%ld",[NSDate day:_oldSelectedDate]);
                [button setBackgroundColor:selectedColor];
                
            }else{
                
                [button setBackgroundColor:[UIColor clearColor]];
            }
            
        }
        //今天要用红色表示
        if (([NSDate month:[NSDate date]] == [NSDate month:date]) && ([NSDate year:[NSDate date]] == [NSDate year:date]) &&((i == firstWeekday + [NSDate day:[NSDate date]] - 1))) {
            
            [button setBackgroundColor:[UIColor redColor]];

        }else{
        
            if (button.backgroundColor != selectedColor) {
                
                [button setBackgroundColor:[UIColor clearColor]];
            }
        }
        
       button.gregorianLabel.text = [NSString stringWithFormat:@"%d",(int)day];
    }
}
- (void)lastMonthDate:(NSDate *)date{

    [self nextMonthDate:date];
}

#pragma mark -- action
- (void)currentSelectedDate:(ZXCBtnItem *)sender{
    
    sender.backgroundColor = selectedColor;
    
    if (_oldSelectedDate) {
        ZXCBtnItem *oldSelected = [self viewWithTag:[self.dateArray indexOfObject:_oldSelectedDate] + 1000000];
        oldSelected.backgroundColor = [UIColor clearColor];
    }
    
    _oldSelectedDate = self.dateArray[sender.tag - 1000000];
    if ([self.delegate respondsToSelector:@selector(ZXCMainViewDelegateClickBtnReturn:)]) {
        NSTimeZone *zone = [NSTimeZone systemTimeZone]; // 获得系统的时区
        NSTimeInterval time = [zone secondsFromGMTForDate:self.dateArray[sender.tag - 1000000]];// 以秒为单位返回当前时间与系统格林尼治时间的差
        NSDate *nowDate = [self.dateArray[sender.tag - 1000000] dateByAddingTimeInterval:time];// 然后把差的时间加上,就是当前系统准确的时间
        [self.delegate ZXCMainViewDelegateClickBtnReturn:[NSString stringWithDate:nowDate withFormat:@"YYYY-MM-dd"]];
    }

}
@end
