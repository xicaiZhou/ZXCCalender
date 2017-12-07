//
//  ZXCCalenderView.h
//  ZXCCalender
//
//  Created by 周希财 on 2017/6/14.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZXCCalenderDelegate <NSObject>
- (void)ZXCCalenderDelegateClickBtnReturn:(NSString *)str;
@end
@interface ZXCCalenderView : UIView
- (instancetype)initWithFrame:(CGRect)frame;
@property (nonatomic, weak) id<ZXCCalenderDelegate> delegate;
@end
