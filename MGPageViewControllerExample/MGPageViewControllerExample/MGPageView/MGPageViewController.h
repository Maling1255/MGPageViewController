//
//  MGPageViewController.h
//  MGPageViewControllerExample
//
//  Created by maling on 2018/12/12.
//  Copyright © 2018 maling. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MGPageViewController : UIViewController

+ (instancetype)viewControllers:(NSArray < UIViewController *> *)viewControllers
                         titles:(NSArray <NSString *> *)titles
                    normalColor:(UIColor *)normalColor
                    selectColor:(UIColor *)selectColor
                         target:(UIViewController *)target;

@end

