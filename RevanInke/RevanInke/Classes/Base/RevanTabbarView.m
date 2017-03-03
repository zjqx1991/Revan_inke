//
//  RevanTabbarView.m
//  RevanInke
//
//  Created by 紫荆秋雪 on 2017/3/3.
//  Copyright © 2017年 Revan. All rights reserved.
//

#import "RevanTabbarView.h"

@interface RevanTabbarView ()
/** 存储控制器按钮名字数组 */
@property (nonatomic,strong) NSArray *btnNames;
@end

@implementation RevanTabbarView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (NSArray *)btnNames {
    if (!_btnNames) {
        _btnNames = @[@"", @""];
    }
    return _btnNames;
}

@end
