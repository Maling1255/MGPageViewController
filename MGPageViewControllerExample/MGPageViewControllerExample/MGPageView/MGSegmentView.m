//
//  MGSegmentView.m
//  MGPageViewControllerExample
//
//  Created by maling on 2018/12/12.
//  Copyright © 2018 maling. All rights reserved.
//

#import "MGSegmentView.h"
#define MGScreenWidth [UIScreen mainScreen].bounds.size.width

@interface MGSegmentView ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *currentLineView;

@property (nonatomic, strong) NSMutableArray <UIButton *> *items;

@end
@implementation MGSegmentView

- (instancetype)init
{
    if (self = [super init]) {
        
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    [self addSubview:self.scrollView];
    
    [self addSubview:self.currentLineView];
}

- (void)showItemViews
{
    self.scrollView.frame = self.bounds;
    
    self.currentLineView.frame = CGRectMake(0, self.height - 2, MGScreenWidth * 0.5, 2);
    
    for (int i = 0; i < self.titles.count; i++) {
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(MGScreenWidth * 0.5 * i, 0, MGScreenWidth * 0.5, self.height)];
        
        button.tag = i;
        
        [button setTitle:self.titles[i] forState:UIControlStateNormal];
        
        [button setTitleColor:self.normalColor forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        
        [self.items addObject:button];
    }
    
    
    // 默认第一条选中
    UIButton *button = self.items.firstObject;
    
    [button setTitleColor:self.selectColor forState:UIControlStateNormal];
}

- (void)clickBtn:(UIButton *)button
{
    [self setIndexOfSelect:button.tag];
    
    if (self.currentItemView) {
        self.currentItemView(button.tag);
    }
}

- (void)setIndexOfSelect:(NSInteger)indexOfSelect
{
    _indexOfSelect = indexOfSelect;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.currentLineView.x = MGScreenWidth * 0.5 * indexOfSelect;
    }];
    
    for (UIButton *button in self.items) {
        
        [UIView animateWithDuration:0.5 animations:^{
            
            [button setTitleColor:self.normalColor forState:UIControlStateNormal];
        }];
        
        if (button.tag == indexOfSelect) {
            
            [UIView animateWithDuration:0.5 animations:^{
                
                [button setTitleColor:self.selectColor forState:UIControlStateNormal];
            }];
        }
    }
}

- (void)setTitles:(NSArray <NSString *> *)titles
{
    _titles = titles;
}

- (void)setSelectColor:(UIColor *)selectColor
{
    _selectColor = selectColor;
    
    self.currentLineView.backgroundColor = selectColor;
    
}

- (void)setNormalColor:(UIColor *)normalColor
{
    _normalColor = normalColor;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        
        _scrollView.backgroundColor = [UIColor orangeColor];
    }
    return _scrollView;
}

- (UIView *)currentLineView
{
    if (!_currentLineView) {
        _currentLineView = [[UIView alloc] init];
    }
    return _currentLineView;
}

- (NSMutableArray<UIButton *> *)items
{
    if (!_items) {
        _items = [[NSMutableArray alloc] init];
    }
    return _items;
}

@end



@implementation UIView (MGFrame)

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX {
    
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
    
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    
    center.y = centerY;
    
    self.center = center;
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}
- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)left
{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}


- (CGFloat)bottom
{
    return self.frame.size.height + self.frame.origin.y;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)right
{
    return self.frame.size.width + self.frame.origin.x;
}

- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

@end
