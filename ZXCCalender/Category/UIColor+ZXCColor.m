//
//  UIColor+ZXCColor.m
//  ZhXCCalender
//
//  Created by 周希财 on 2017/6/19.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//

#import "UIColor+ZXCColor.h"

@implementation UIColor (ZXCColor)
+ (UIColor *)colorWithString:(NSString *)str{
    
    if ([str hasPrefix:@"初"] || [str hasPrefix:@"十"] || [str hasPrefix:@"二"] || [str hasPrefix:@"三"] || [str hasPrefix:@"廿"]) {
        return nil;
    }
    
    return [UIColor blueColor];
}

@end
