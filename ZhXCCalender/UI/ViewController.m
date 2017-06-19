//
//  ViewController.m
//  ZhXCCalender
//
//  Created by 周希财 on 2017/6/15.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//

#import "ViewController.h"
#import "ZXCCalenderView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZXCCalenderView *calender = [[ZXCCalenderView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 400)];
    [self.view addSubview:calender];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
