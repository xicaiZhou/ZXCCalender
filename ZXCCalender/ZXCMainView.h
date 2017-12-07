//
//  ZXCMainView.h
//  ZhXCCalender
//
//  Created by 周希财 on 2017/6/15.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ZXCMainViewDelegate <NSObject>
- (void)ZXCMainViewDelegateClickBtnReturn:(NSString *)str;
@end
@interface ZXCMainView : UIView
+ (instancetype)shardZxcMainView;
- (void)nextMonthDate:(NSDate *)date;
- (void)lastMonthDate:(NSDate *)date;
@property (nonatomic, weak) id<ZXCMainViewDelegate> delegate;
@end
