//
//  ViewController.m
//  MGPageViewControllerExample
//
//  Created by maling on 2018/12/12.
//  Copyright © 2018 maling. All rights reserved.
//

#import "ViewController.h"
#import "MGPageViewController.h"


@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    NSMutableArray *titles = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 2; i++) {
        
        UIViewController *vc = [[UIViewController alloc] init];
        
        [titles addObject:[NSString stringWithFormat:@"标题 %d", i]];
        
        UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 30)];
        
        titleLbl.textAlignment = NSTextAlignmentCenter;
        
        titleLbl.text = titles[i];
        
        titleLbl.textColor = [UIColor purpleColor];
        
        [vc.view addSubview:titleLbl];
        
        [viewControllers addObject:vc];
    }
    
    
    
    [MGPageViewController viewControllers:viewControllers
                                   titles:titles
                              normalColor:[UIColor whiteColor]
                              selectColor:[UIColor redColor]
                                   target:self];
    
}

@end
