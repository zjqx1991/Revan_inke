//
//  RevanLiveShowViewController.m
//  RevanInke
//
//  Created by 紫荆秋雪 on 2017/3/3.
//  Copyright © 2017年 Revan. All rights reserved.
//

#import "RevanLiveShowViewController.h"

@interface RevanLiveShowViewController ()

@end

@implementation RevanLiveShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置UI界面
    [self setupUI];
}

#pragma mark - 设置UI界面
- (void)setupUI {
    //1、背景图片
    UIImageView *bgImageView = [[UIImageView alloc] init];
    bgImageView.image = [UIImage imageNamed:@"bg_zbfx"];
    bgImageView.frame = self.view.bounds;
    [self.view addSubview:bgImageView];
    //2、退下的按钮
    UIButton *backButton = [[UIButton alloc] init];
    [backButton setImage:[UIImage imageNamed:@"launch_close"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bgImageView.mas_top);
        make.right.mas_equalTo(bgImageView.mas_right);
    }];
}

- (void)backButtonClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
