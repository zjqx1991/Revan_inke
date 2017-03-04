//
//  RevanTabBarViewController.m
//  RevanInke
//
//  Created by 紫荆秋雪 on 2017/3/3.
//  Copyright © 2017年 Revan. All rights reserved.
//

#import "RevanTabBarViewController.h"
#import "RevanNavViewController.h"
#import "RevanLiveShowViewController.h"
#import "RevanTabbarView.h"

@interface RevanTabBarViewController ()<RevanTabbarViewDelegate>

/** tabBarView */
@property (nonatomic,strong) RevanTabbarView *tabbarView;
/** 记录点击的Item */
@property (nonatomic,assign) NSInteger keepIdx;

@end

@implementation RevanTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载子控制器
    [self addChildVC];
    //移除系统自带的tabbar
    [self.tabBar removeFromSuperview];
    //FIXME: 加入tabBar后，超出tabBar的按钮无法响应事件
    //[self.tabBar addSubview:self.tabbarView];
    //加载自定义tabbar
    [self.view addSubview:self.tabbarView];
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
        RevanLiveShowViewController *liveshowVC = [[RevanLiveShowViewController alloc] init];
        [self presentViewController:liveshowVC animated:YES completion:nil];
    } else {
        
        NSInteger idx = itemType - RevanItemTypeShow;
        if (self.keepIdx == idx) {
            return;
        }
        //首先移除上一个nav
        [self.childViewControllers[self.keepIdx].view removeFromSuperview];
        //记录选中下标
        self.keepIdx = idx;
        //获取控制器
        NSLog(@"%zd", idx);
        RevanBaseViewController *vc = self.childViewControllers[idx];
        NSLog(@"%@", [vc class]);
//        vc.view.backgroundColor = RevanRGB;
        [self.view insertSubview:vc.view belowSubview:self.tabbarView];
    }

}

#pragma mark - 控件懒加载
- (RevanTabbarView *)tabbarView {
    if (!_tabbarView) {
        _tabbarView = [[RevanTabbarView alloc] initWithFrame:CGRectMake(0, RevanScreenHeight - 49, RevanScreenWidth,49)];
        _tabbarView.delegate = self;
    }
    return _tabbarView;
}

@end
