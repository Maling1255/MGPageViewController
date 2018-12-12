//
//  MGPageViewController.h
//  MGPageViewControllerExample
//
//  Created by maling on 2018/12/12.
//  Copyright © 2018 maling. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MGPageViewController : UIViewController


/**
 构造方法

 @param viewControllers 盛放子控制器的数组
 @param titles 盛放titles数组
 @param normalColor title 默认颜色
 @param selectColor title 选中颜色
 @param target 目标对象
 @return 构造对象
 */
+ (instancetype)viewControllers:(NSArray < UIViewController *> *)viewControllers
                         titles:(NSArray <NSString *> *)titles
                    normalColor:(UIColor *)normalColor
                    selectColor:(UIColor *)selectColor
                         target:(UIViewController *)target;

@end

