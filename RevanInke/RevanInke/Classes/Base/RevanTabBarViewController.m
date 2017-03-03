//
//  RevanTabBarViewController.m
//  RevanInke
//
//  Created by 紫荆秋雪 on 2017/3/3.
//  Copyright © 2017年 Revan. All rights reserved.
//

#import "RevanTabBarViewController.h"
#import "RevanTabbarView.h"

@interface RevanTabBarViewController ()

/** tabBarView */
@property (nonatomic,strong) RevanTabbarView *tabbarView;

@end

@implementation RevanTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //加载自定义tabbar
    [self.tabBar addSubview:self.tabbarView];
}


#pragma mark - 控件懒加载
- (RevanTabbarView *)tabbarView {
    if (!_tabbarView) {
        _tabbarView = [[RevanTabbarView alloc] initWithFrame:CGRectMake(0, 0,                RevanScreenWidth,49)];
        
    }
    return _tabbarView;
}

@end
