# ChartCircle


## 属性
```
percentages
设置百分比展示

colors
设置颜色数组，色块的颜色与文字颜色，业务颜色为默认黑色，如需更改修改源码

titles
设置展示的业务文字


```

## 调用

```

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

[view draw];
[view animateChart];

```

## 注意

`percentages`  `colors`  `titles` 个数需保持一致



## 展示效果

![Simulator Screen Shot - iPhone 14 Pro - 2023-07-11 at 17 15 20](https://github.com/applebest/ChartCircle/assets/16376401/e939debc-a762-4cba-888c-4187d7352d00)
