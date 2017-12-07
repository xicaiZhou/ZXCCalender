//
//  ZXCCalender.h
//  ZhXCCalender
//
//  Created by 周希财 on 2017/6/19.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//


//屏幕尺寸
#define Screen_Bounds [[UIScreen mainScreen] bounds]

#define Screen_Width CGRectGetWidth(Screen_Bounds)

#define Screen_Height CGRectGetHeight(Screen_Bounds)

#define itemH 50
#define itemW 50
#define selectViewHeight 60
#define ca (Screen_Width / 7 - itemH) / 2
#define selectedColor [UIColor cyanColor]
#import "NSDate+ZXCDate.h"
#import "NSString+ZXCStr.h"
#import "UIColor+ZXCColor.h"
