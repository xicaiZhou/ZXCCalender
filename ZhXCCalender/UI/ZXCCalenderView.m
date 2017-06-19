//
//  ZXCCalenderView.m
//  ZXCCalender
//
//  Created by 周希财 on 2017/6/14.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//

#import "ZXCCalenderView.h"
#import "ZXCSelectDateView.h"
#import "ZXCMainView.h"
#import "ZXCWeekView.h"
@interface ZXCCalenderView()

@property (nonatomic, strong) UIView *weekBg;
@property (nonatomic, strong) ZXCSelectDateView *selectDateView;
@property (nonatomic, assign) NSInteger current;
@end

@implementation ZXCCalenderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createSelectDateView];
        [self createWeekView];
        self.current = 0;
        [self createContentViewWithFirstWeekday];
    }
    return self;
}
#pragma mark -- UI
//创建头选择月份
- (void)createSelectDateView{

    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"ZXCSelectDateView" owner:nil options:nil];
    _selectDateView = views.firstObject;
    _selectDateView.frame = CGRectMake(0, 0, Screen_Width, selectViewHeight);
    [_selectDateView.LastMonthBtn addTarget:self action:@selector(lastmonth) forControlEvents:UIControlEventTouchUpInside];
    [_selectDateView.nextMonthBtn addTarget:self action:@selector(nextMonth) forControlEvents:UIControlEventTouchUpInside];
    _selectDateView.topLabel.text = [NSString stringWithDate:[NSDate date]];
    _selectDateView.bottmlabel.text = [NSString stringChineseCalendarWithDate:[NSDate date] withType:ZXCStrWithChineseCalendarTypeYM];
    [self addSubview:_selectDateView];
}

- (void)createWeekView{
    
    ZXCWeekView *weekView = [[ZXCWeekView alloc] initWithFrame:CGRectMake(0, selectViewHeight, Screen_Width, itemH)];
    [self addSubview:weekView];
}

- (void)createContentViewWithFirstWeekday{

    [self addSubview:[ZXCMainView shardZxcMainView]];
}
#pragma mark -- action
- (void)lastmonth{
    
    _current -= 1;
    NSDate *lastDate = [NSDate lastMonth:[NSDate date] withNum:self.current];
    [[ZXCMainView shardZxcMainView] nextMonthDate:lastDate];
    _selectDateView.topLabel.text = [NSString stringWithDate:lastDate];
    _selectDateView.bottmlabel.text = [NSString stringChineseCalendarWithDate:lastDate withType:ZXCStrWithChineseCalendarTypeYM];
}
- (void)nextMonth{
    
    _current += 1;
    NSDate *nextDate = [NSDate lastMonth:[NSDate date] withNum:self.current];
    [[ZXCMainView shardZxcMainView] nextMonthDate:nextDate];
    _selectDateView.topLabel.text = [NSString stringWithDate:nextDate];
    _selectDateView.bottmlabel.text = [NSString stringChineseCalendarWithDate:nextDate withType:ZXCStrWithChineseCalendarTypeYM];
}
@end
