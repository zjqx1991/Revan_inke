//
//  RevanTabBarViewController.m
//  RevanInke
//
//  Created by 紫荆秋雪 on 2017/3/3.
//  Copyright © 2017年 Revan. All rights reserved.
//

#import "RevanTabBarViewController.h"
#import "RevanNavViewController.h"
#import "RevanTabbarView.h"

@interface RevanTabBarViewController ()<RevanTabbarViewDelegate>

/** tabBarView */
@property (nonatomic,strong) RevanTabbarView *tabbarView;

@end

@implementation RevanTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载子控制器
    [self addChildVC];
    //加载自定义tabbar
    [self.tabBar addSubview:self.tabbarView];
}

/** 加载子控制器 */
- (void)addChildVC {
    NSMutableArray *arryM = [NSMutableArray arrayWithArray:@[@"RevanShowViewController", @"RevanProfileViewController"]];
    for (NSInteger i = 0; i < arryM.count; i++) {
        NSString *vcName = arryM[i];
        //字符串转换成控制器
        UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
        //包含导航控制器
        RevanNavViewController *nav = [[RevanNavViewController alloc] initWithRootViewController:vc];
        //添加子控制器
        [self addChildViewController:nav];
    }
}


#pragma mark - RevanTabbarViewDelegate 代理方法
- (void)revan_tabbarView:(RevanTabbarView *)tabbarView withRevanItemType:(RevanItemType)itemType {
    
    if (itemType == RevanItemTypeLiveShow) {
        //直播入口
        
    } else {
    
    }

}

#pragma mark - 控件懒加载
- (RevanTabbarView *)tabbarView {
    if (!_tabbarView) {
        _tabbarView = [[RevanTabbarView alloc] initWithFrame:CGRectMake(0, 0,                RevanScreenWidth,49)];
        _tabbarView.delegate = self;
    }
    return _tabbarView;
}

@end
