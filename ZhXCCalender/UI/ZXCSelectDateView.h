//
//  ZXCSelectDateView.h
//  ZhXCCalender
//
//  Created by 周希财 on 2017/6/15.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXCSelectDateView : UIView
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottmlabel;

@property (weak, nonatomic) IBOutlet UIButton *LastMonthBtn;

@property (weak, nonatomic) IBOutlet UIButton *nextMonthBtn;

@end
