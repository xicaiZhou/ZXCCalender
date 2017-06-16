//
//  ZXCWeekView.m
//  ZhXCCalender
//
//  Created by 周希财 on 2017/6/16.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//

#import "ZXCWeekView.h"

@implementation ZXCWeekView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createWeekViewWithFrame:frame];
    }
    return self;
}
- (void)createWeekViewWithFrame:(CGRect)frame{
    
   NSArray *array = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
   UIView *weekBg = [[UIView alloc]init];
    weekBg.frame = CGRectMake(0, 0, Screen_Width, itemH);
    [self addSubview:weekBg];
    
    for (int i = 0; i < array.count; i ++) {
        UILabel *label = [[UILabel alloc]init];
        label.text = array[i];
        label.font = [UIFont systemFontOfSize:17];
        label.textColor = [UIColor redColor];
        label.frame = CGRectMake((itemW + ca * 2) * i, 0, itemW, itemH );
        label.textAlignment = NSTextAlignmentCenter;
        [weekBg addSubview:label];
    }
    UILabel *top = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 1)];
    top.backgroundColor = [UIColor grayColor];
    [self addSubview:top];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, itemH - 1, Screen_Width, 1)];
    label.backgroundColor = [UIColor grayColor];
    [self addSubview:label];
}

@end
