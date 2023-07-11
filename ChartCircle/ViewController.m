//
//  ViewController.m
//  ChartCircle
//
//  Created by clt on 2023/7/11.
//

#import "ViewController.h"
#import "ChartCircleView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    ChartCircleView *view = [[ChartCircleView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    view.frame = CGRectMake(0,  (self.view.bounds.size.height - 400 ) / 2, self.view.bounds.size.width, 400);
    view.titles  = @[@"业务1",
                     @"业务2",
                     @"业务3",
                     @"业务4",
                     @"业务5",
                     @"业务6",
                     @"业务7",
                     @"业务8",
                     @"业务9",
                     @"业务10",
                     @"业务11",
    ];
    view.colors = @[[UIColor colorWithRed:0.584314 green:0.85098 blue:0.45098 alpha:1],
                    [UIColor colorWithRed:0.317647 green:0.415686 blue:0.996078 alpha:1],
                    [UIColor colorWithRed:0.882353 green:0.423529 blue:0.423529 alpha:1],
                    [UIColor colorWithRed:0.819608 green:0.882353 blue:0.423529 alpha:1],
                    [UIColor colorWithRed:0.121569 green:0.223529 blue:0.792157 alpha:1],
                    [UIColor colorWithRed:0.956863 green:0.678431 blue:0.278431 alpha:1],
                    [UIColor colorWithRed:0.380392 green:0.780392 blue:0.596078 alpha:1],
                    [UIColor colorWithRed:0.172549 green:0.694118 blue:0.917647 alpha:1],
                    [UIColor colorWithRed:0.317647 green:0.317647 blue:0.960784 alpha:1],
                    [UIColor colorWithRed:0.811765 green:0.423529 blue:0.882353 alpha:1],
                    [UIColor colorWithRed:0.592157 green:0.45098 blue:0.85098 alpha:1]];
    
    view.percentages = @[@(0.0212),
                         @(0.0302),
                         @(0.0601),
                         @(0.0902),
                         @(0.0823),
                         @(0.311),
                         @(0.311),
                         @(0.0609),
                         @(0.0012),
                         @(0.6543000000000001),
                         @(0.028)];
    
    
    [self.view addSubview:view];
    
    [view draw];
    [view animateChart];
    
}


@end
