//
//  RevanShowViewController.m
//  RevanInke
//
//  Created by 紫荆秋雪 on 2017/3/3.
//  Copyright © 2017年 Revan. All rights reserved.
//

#import "RevanShowViewController.h"

@interface RevanShowViewController ()

@end

@implementation RevanShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景颜色
    self.navigationItem.title = @"show";
    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"RevanShowViewController----销毁");
}


@end
