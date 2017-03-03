//
//  RevanTabbarView.h
//  RevanInke
//
//  Created by 紫荆秋雪 on 2017/3/3.
//  Copyright © 2017年 Revan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RevanTabbarView;

typedef NS_ENUM(NSUInteger, RevanItemType) {
    RevanItemTypeLiveShow = 10,//直播入口
    RevanItemTypeShow = 100,//展示直播
    RevanItemTypeProfile
};

@protocol RevanTabbarViewDelegate <NSObject>

@optional
- (void)revan_tabbarView:(RevanTabbarView *) tabbarView withRevanItemType:(RevanItemType) itemType;

@end

@interface RevanTabbarView : UIView
/** RevanTabbarView代理 */
@property (nonatomic,weak) id<RevanTabbarViewDelegate> delegate;
@end
