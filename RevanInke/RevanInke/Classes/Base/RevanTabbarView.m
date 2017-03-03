//
//  RevanTabbarView.m
//  RevanInke
//
//  Created by 紫荆秋雪 on 2017/3/3.
//  Copyright © 2017年 Revan. All rights reserved.
//

#import "RevanTabbarView.h"
#import "RevanItemButton.h"

@interface RevanTabbarView ()
/** 记录选中按钮 */
@property (nonatomic,strong) RevanItemButton *selectedButton;
/** tabbar背景图片 */
@property (nonatomic,strong) UIImageView *tabbarBgImageView;
/** 存储控制器按钮名字数组 */
@property (nonatomic,strong) NSArray *btnNames;
/** 直播按钮 */
@property (nonatomic,strong) UIButton *liveShowButton;

@end

@implementation RevanTabbarView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //1、设置tabbarView的背景图片
        [self addSubview:self.tabbarBgImageView];
        //2、创建按钮
        for (NSInteger i = 0; i < self.btnNames.count; i++) {
            RevanItemButton *btn = [[RevanItemButton alloc] init];
            
            //设置图片
            [btn setImage:[UIImage imageNamed:self.btnNames[i]] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:[self.btnNames[i] stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            //设置默认选中按钮
            if (i == 0) {
                btn.selected = YES;
                self.selectedButton = btn;
            }

            // 设置tag
            btn.tag = RevanItemTypeShow + i;
            //绑定点击事件
            [btn addTarget:self action:@selector(tabbarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
        }
        //3、添加‘直播按钮’
        [self addSubview:self.liveShowButton];
    }
    return self;
}

#pragma mark - 布局
- (void)layoutSubviews {
    NSInteger count = self.subviews.count;
    CGFloat width = RevanScreenWidth * 0.5;
    
    for (NSInteger i = 0; i < count; i++) {
        //获取子控件
        UIView *v = self.subviews[i];
        // 判断是否是按钮
        if ([v isKindOfClass:[RevanItemButton class]]) {
            v.frame = CGRectMake((v.tag - RevanItemTypeShow) * width, 0, width, self.bounds.size.height);
        } else if ([v isKindOfClass:[UIImageView class]]) {
            v.frame = self.bounds;
        }
        
    }
    
    //直播按钮布局
    self.liveShowButton.center = CGPointMake(RevanScreenWidth * 0.5, self.bounds.size.height * 0.1);
}

#pragma mark - tabbarButtonClick点击事件
- (void)tabbarButtonClick:(RevanItemButton *) btn {
    
    // 0、代理
    if ([self.delegate respondsToSelector:@selector(revan_tabbarView:withRevanItemType:)]) {
        [self.delegate revan_tabbarView:self withRevanItemType:btn.tag];
    }
    
    // 1、判断进入的按钮类型
    if (btn.tag == RevanItemTypeLiveShow) {
        //如果是直播入口，就不需要执行下面的代码
        return;
    }
    
    // 2、切换选中按钮
    self.selectedButton.selected = NO;
    btn.selected = YES;
    self.selectedButton = btn;
    
    // 3、点击动画
    [UIView animateWithDuration:0.2 animations:^{
        //放大
        btn.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        //缩小
        [UIView animateWithDuration:0.2 animations:^{
            btn.transform = CGAffineTransformIdentity;
        }];
    }];
    
    
   
}

#pragma mark - 懒加载
- (NSArray *)btnNames {
    if (!_btnNames) {
        _btnNames = @[@"tab_show", @"tab_profile"];
    }
    return _btnNames;
}

- (UIImageView *)tabbarBgImageView {
    if (!_tabbarBgImageView) {
        _tabbarBgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
    }
    return _tabbarBgImageView;
}
- (UIButton *)liveShowButton {
    if (!_liveShowButton) {
        _liveShowButton = [[UIButton alloc] init];
        [_liveShowButton setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        [_liveShowButton addTarget:self action:@selector(tabbarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _liveShowButton.tag = RevanItemTypeLiveShow;
        [_liveShowButton sizeToFit];
    }
    return _liveShowButton;
}

@end
