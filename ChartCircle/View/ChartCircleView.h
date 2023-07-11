//
//  ChartCircleView.h
//  ChartCircle
//
//  Created by clt on 2023/7/11.
//

#import <UIKit/UIKit.h>

#define rgba(r,g,b,a)                       [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define DINAlternate_BoldFont(aSize)        [UIFont fontWithName:@"DINAlternate-Bold" size:aSize]
#define PingFangSC_RegularFont(aSize)       [UIFont fontWithName:@"PingFangSC-Regular" size:aSize]




@interface ChartCircleView : UIView

@property (nonatomic, strong) NSArray<NSNumber *> *percentages;

@property (nonatomic, strong) NSArray<UIColor *> *colors;
@property (nonatomic, strong) NSArray<NSString *> *titles;


- (void)draw;

- (void)animateChart;



@end


