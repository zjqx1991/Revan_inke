//
//  RevanProfileViewController.m
//  RevanInke
//
//  Created by 紫荆秋雪 on 2017/3/3.
//  Copyright © 2017年 Revan. All rights reserved.
//

#import "RevanProfileViewController.h"

@interface RevanProfileViewController ()

@end

@implementation RevanProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"profile";
    self.view.backgroundColor = [UIColor blueColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"RevanProfileViewController----销毁");
}

@end
