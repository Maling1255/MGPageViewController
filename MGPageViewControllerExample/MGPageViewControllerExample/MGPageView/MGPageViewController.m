//
//  MGPageViewController.m
//  MGPageViewControllerExample
//
//  Created by maling on 2018/12/12.
//  Copyright © 2018 maling. All rights reserved.
//

#import "MGPageViewController.h"
#import "MGSegmentView.h"

#define MGScreenWidth [UIScreen mainScreen].bounds.size.width

@interface MGPageViewController ()<UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic, assign) NSInteger indexOfSelect;
@property (nonatomic, strong) MGSegmentView *segmentView;

@property (nonatomic, strong) UIPageViewController *pageViewController;

@property (nonatomic, strong) NSArray <UIViewController *>*pageContentArray;

@end

@implementation MGPageViewController

+ (instancetype)viewControllers:(NSArray < UIViewController *> *)viewControllers
                         titles:(NSArray <NSString *> *)titles
                    normalColor:(UIColor *)normalColor
                    selectColor:(UIColor *)selectColor
                         target:(UIViewController *)target
{
    MGPageViewController *segmentViewController = [[MGPageViewController alloc] init];
    
    segmentViewController.view.frame = target.view.bounds;
    
    segmentViewController.view.backgroundColor = [UIColor whiteColor];
    
    segmentViewController.pageContentArray = viewControllers;
    
//    segmentViewController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [target addChildViewController:segmentViewController];
    
    [target.view addSubview:segmentViewController.view];
    
    
    MGSegmentView *segmentView = [[MGSegmentView alloc] init];
    
    segmentView.backgroundColor = [UIColor purpleColor];
    
    segmentViewController.segmentView = segmentView;
    
    segmentView.titles = titles;
    
    segmentView.selectColor = selectColor;
    
    segmentView.normalColor = normalColor;
    
    [segmentView showItemViews];
    
    target.edgesForExtendedLayout = UIRectEdgeNone;
    
    return segmentViewController;
    
}

- (void)setPageContentArray:(NSArray<UIViewController *> *)pageContentArray
{
    _pageContentArray = pageContentArray;
    
    [self addChildViewController:self.pageViewController];
    
    [self.view addSubview:self.pageViewController.view];
}

- (void)setSegmentView:(MGSegmentView *)segmentView
{
    _segmentView = segmentView;
    
    [self.view addSubview:segmentView];
    
    
    
    segmentView.frame = CGRectMake(0, 0, MGScreenWidth, 50);
    
    self.pageViewController.view.frame = CGRectMake(0,
                                                    CGRectGetMaxY(segmentView.frame),
                                                    MGScreenWidth,
                                                    self.view.height - CGRectGetHeight(segmentView.frame));
    
    __weak typeof(self)weakSelf = self;
    [segmentView setCurrentItemView:^(NSInteger index) {
        
        UIViewController *vc = [self.pageContentArray objectAtIndex:index];
        
        if (index > 0)
        {
            [weakSelf.pageViewController setViewControllers:@[vc] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
            
        } else
        {
            [weakSelf.pageViewController setViewControllers:@[vc] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
        }
    }];
}

- (UIPageViewController *)pageViewController
{
    if (!_pageViewController) {
        
        NSDictionary *options = @{UIPageViewControllerOptionInterPageSpacingKey : @(0)};
        
        _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                              navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                            options:options];
        
        _pageViewController.delegate = self;
        
        _pageViewController.dataSource = self;
        
        // 设置第一页的内容
        
        UIViewController *initialViewController = [self.pageContentArray objectAtIndex:0];
        
        NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
        
        [_pageViewController setViewControllers:viewControllers
                                      direction:UIPageViewControllerNavigationDirectionReverse
                                       animated:NO
                                     completion:nil];
        
        
        
        _pageViewController.view.backgroundColor = [UIColor whiteColor];
    }
    return _pageViewController;
}



- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [self.pageContentArray indexOfObject:viewController];
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    index--;
    
    return [self.pageContentArray objectAtIndex:index];
}

#pragma mark 返回下一个ViewController对象

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [self.pageContentArray indexOfObject:viewController];
    
    if (index == NSNotFound || index == self.pageContentArray.count - 1) {
        return nil;
    }
    
    index++;
    
    return [self.pageContentArray objectAtIndex:index];
}

// 滑动结束
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    
    if (completed) {
        
        self.segmentView.indexOfSelect = _indexOfSelect;
    }
}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
    
    UIViewController *nextVC = [pendingViewControllers firstObject];
    
    NSInteger index = [self.pageContentArray indexOfObject:nextVC];
    
    _indexOfSelect = index;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
