//
//  ViewController.m
//  ZhXCCalender
//
//  Created by 周希财 on 2017/6/15.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//

#import "ViewController.h"
#import "ZXCCalenderView.h"
#import "ZXCCalender.h"
@interface ViewController ()<ZXCCalenderDelegate>
@property (nonatomic, strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZXCCalenderView *calender = [[ZXCCalenderView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 400)];
    calender.delegate = self;
    [self.view addSubview:calender];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,250, 30)];
    _label.center = CGPointMake(self.view.center.x, 550) ;
    _label.backgroundColor = [UIColor purpleColor];
    _label.text = [NSString stringWithDate:[NSDate date] withFormat:@"YYYY-MM-dd"];
    _label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_label];
}
- (void)ZXCCalenderDelegateClickBtnReturn:(NSString *)str{

    _label.text = str;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
