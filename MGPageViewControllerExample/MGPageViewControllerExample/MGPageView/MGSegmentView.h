//
//  MGSegmentView.h
//  MGPageViewControllerExample
//
//  Created by maling on 2018/12/12.
//  Copyright © 2018 maling. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MGSegmentView : UIView

/** 选中title的索引 */
@property (nonatomic, assign) NSInteger indexOfSelect;
/** 选中摸个title */
@property (nonatomic, copy) void(^currentItemView)(NSInteger index);
/** 标题数组 */
@property (nonatomic, strong) NSArray <NSString *> *titles;
/** 默认title颜色 */
@property (nonatomic, strong) UIColor *normalColor;
/** 选中title颜色 */
@property (nonatomic, strong) UIColor *selectColor;

- (void)showItemViews;

@end

@interface UIView (MGFrame)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

@end

