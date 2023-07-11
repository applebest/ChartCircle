//
//  ChartCircleView.m
//  ChartCircle
//
//  Created by clt on 2023/7/11.
//

#import "ChartCircleView.h"

@implementation ChartCircleView


- (void)draw{
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect {
    
    if (self.titles.count != self.percentages.count || self.titles.count != self.colors.count ){
        
        return;
    }
    
    
    // 画圆环
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat lineWidth = 25.0;
//    CGFloat radius = MIN(rect.size.width, rect.size.height) / 2.0 - lineWidth / 2.0;
    CGFloat radius = 61;
    CGFloat center_x = rect.size.width / 2.0;
    CGFloat center_y = rect.size.height / 2.0;

    BOOL isEmptyCount = self.percentages.count == 0 ? YES : NO;
    
   
    
    
    CGFloat totalPercentage = isEmptyCount ?  1.0 : 0.0;
    for (NSNumber *percentage in self.percentages) {
        totalPercentage += percentage.floatValue;
    }

    CGFloat startAngle = -M_PI_2;
    CGFloat endAngle = startAngle;
    
    
    NSArray <NSNumber *>*percentages = isEmptyCount ?  @[@1.0] : self.percentages;

    
    // 方块变量
    CGFloat startX = 15.0;
    CGFloat startY = center_y - 45;
    CGFloat blockWidth = 12.0;
    CGFloat blockHeight = 8.0;
    CGFloat spacing = 14.0;
    
    CGFloat rightX = center_x + 30.5 + 42 + 15;
    CGFloat rightY = center_y - 65;

    
    for (int i = 0; i < percentages.count; i++) {
        CGFloat percentage = percentages[i].floatValue;
        CGFloat originalPercentage = percentages[i].floatValue;
        CGFloat angle = percentage / totalPercentage * 2 * M_PI;
        endAngle += angle;
        
        UIColor *color = isEmptyCount ? rgba(243, 245, 246, 1) : self.colors[i % self.colors.count];
        
        // 画圆环
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(center_x, center_y)
                                                            radius:radius
                                                        startAngle:startAngle
                                                          endAngle:endAngle
                                                         clockwise:YES];
        CGContextSetStrokeColorWithColor(context, color.CGColor);
        CGContextSetLineWidth(context, lineWidth);
        CGContextAddPath(context, path.CGPath);
        CGContextStrokePath(context);
        startAngle = endAngle;
        
        
      
       
        if (!isEmptyCount){
            
            // 画方块
            CGFloat x = 0;
            CGFloat y =  0;
            
            if (i >= 5){
                x = rightX;
                y = rightY + (blockHeight + spacing) *  (i - 5);
                
            }else{
                x = startX;
                y = startY + (blockHeight + spacing) * i;
            }
            
            
            // 绘制方块
             UIBezierPath *squarePath = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, blockWidth, blockHeight)];
             [color setFill];
             [squarePath fill];
            
            // 绘制文字
             NSString *currentTitle =  self.titles[i];
             NSString *percentageStr = [NSString stringWithFormat:@"%.2f%%",originalPercentage * 100];
             NSString *percentageText = [NSString stringWithFormat:@"%@ %@", percentageStr,currentTitle];
             
             NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString: percentageText];
             NSRange percentRange = [percentageText rangeOfString:percentageStr];
             NSRange textRange = [percentageText rangeOfString:currentTitle];
             
        
             [attributedStr addAttribute:NSFontAttributeName value:DINAlternate_BoldFont(12) range:percentRange];
             [attributedStr addAttribute:NSFontAttributeName value:PingFangSC_RegularFont(11) range:textRange];
             [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:percentRange];
             [attributedStr addAttribute:NSForegroundColorAttributeName value:rgba(109, 110, 111, 1) range:textRange];

                     
             CGSize textSize = [attributedStr size];
             CGFloat textX = x + blockWidth + 6.0;
             CGFloat textY = y + (blockHeight - textSize.height) / 2.0;
             CGRect textRect = CGRectMake(textX, textY, textSize.width, textSize.height);
             [attributedStr drawInRect:textRect];
            
            
        }
        
        
    
        
        
    }

}

- (void)drawCircles:(CGRect)rect{
    
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGFloat lineWidth = 25.0;
//    CGFloat radius = MIN(rect.size.width, rect.size.height) / 2.0 - lineWidth / 2.0;
    CGFloat radius = 61;
    CGFloat center_x = rect.size.width / 2.0;
    CGFloat center_y = rect.size.height / 2.0;

    BOOL isEmptyCount = self.percentages.count == 0 ? YES : NO;
    
    CGFloat totalPercentage = isEmptyCount ?  1.0 : 0.0;
    for (NSNumber *percentage in self.percentages) {
        totalPercentage += percentage.floatValue;
    }

    CGFloat startAngle = -M_PI_2;
    CGFloat endAngle = startAngle;
    
    
    NSArray <NSNumber *>*percentages = isEmptyCount ?  @[@1.0] : self.percentages;

    for (int i = 0; i < percentages.count; i++) {
        CGFloat percentage = percentages[i].floatValue;
        CGFloat originalPercentage = percentages[i].floatValue;
        CGFloat angle = percentage / totalPercentage * 2 * M_PI;
        endAngle += angle;

        UIColor *color = isEmptyCount ? rgba(243, 245, 246, 1) : self.colors[i % self.colors.count];

        // 画圆环
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(center_x, center_y)
                                                            radius:radius
                                                        startAngle:startAngle
                                                          endAngle:endAngle
                                                         clockwise:YES];
        CGContextSetStrokeColorWithColor(context, color.CGColor);
        CGContextSetLineWidth(context, lineWidth);
        CGContextAddPath(context, path.CGPath);
        CGContextStrokePath(context);

        // 画指示线
        CGFloat indicatorRadius = radius + 20.0;
        
        // 求扇形中心点
        CGFloat radianCenter = (startAngle + endAngle) * 0.5;

        // 计算指示线的起点
        CGPoint indicatorStartPoint = CGPointMake(center_x + cos(radianCenter) * radius ,
                                                  center_y + sin(radianCenter)* radius );
      
        // 计算指示线终点
        CGPoint indicatorEndPoint = CGPointMake(center_x + cos(radianCenter) * indicatorRadius ,
                                                center_y + sin(radianCenter) * indicatorRadius);
        
        
        // 画拐点
        CGFloat turningCenter = indicatorRadius + 20;

        CGPoint turningPoint = CGPointMake(center_x + cos(radianCenter) * turningCenter ,
                                           indicatorEndPoint.y);
        

        UIBezierPath *indicatorPath = [UIBezierPath bezierPath];
        [indicatorPath moveToPoint:indicatorStartPoint];
        [indicatorPath addLineToPoint:indicatorEndPoint];
        
        [indicatorPath addLineToPoint:turningPoint];

        CGContextSetStrokeColorWithColor(context, color.CGColor);
        CGContextSetLineWidth(context, 1.0);
        CGContextAddPath(context, indicatorPath.CGPath);
        CGContextStrokePath(context);

        
        
        NSString *currentTitle =  isEmptyCount ? @"暂无数据" : self.titles[i];
        NSString *percentageStr =  isEmptyCount ? @"" : [NSString stringWithFormat:@"%.2f%%",originalPercentage * 100];
        NSString *percentageText = [NSString stringWithFormat:@"%@ %@", percentageStr,currentTitle];
        
        NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString: percentageText];
        NSRange percentRange = [percentageText rangeOfString:percentageStr];
        NSRange textRange = [percentageText rangeOfString:currentTitle];
        
        [attributedStr addAttribute:NSFontAttributeName value:DINAlternate_BoldFont(15) range:percentRange];
        [attributedStr addAttribute:NSFontAttributeName value:PingFangSC_RegularFont(12) range:textRange];
        [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:percentRange];
        [attributedStr addAttribute:NSForegroundColorAttributeName value:rgba(109, 110, 111, 1) range:textRange];

        
        CGSize textSize = [attributedStr size];
        

        // 计算text起点
        CGFloat textX = turningPoint.x;
        // 在中心点左边
        if (textX < center_x){
            textX = (center_x + cos(radianCenter) * turningCenter) - textSize.width ;
        }else{
            textX = turningPoint.x;;
        }
        
        // 处理边界情况
        if (textX < 0){
           
            // 获取title长度
            CGSize titleSize =  [currentTitle sizeWithAttributes:@{NSFontAttributeName:PingFangSC_RegularFont(12)}];
            // 绘制起始点偏移
            textX  =   MAX(0, turningPoint.x - titleSize.width);
            // 因偏移产生，百分号较远 设置右对齐
            NSMutableParagraphStyle   *paragraphStyle = [[NSMutableParagraphStyle alloc] init];\
            paragraphStyle.alignment = NSTextAlignmentRight;
            // 以百分号为临界点插入换行
            [attributedStr insertAttributedString:[[NSAttributedString alloc] initWithString:@"\n"] atIndex:percentRange.location + percentRange.length];
            [attributedStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributedStr.string.length)];
            
        }
        
        NSLog(@"%f 当前业务 ==>%@",textX,currentTitle);
        
        
        CGPoint textPoint = CGPointMake(textX,turningPoint.y- textSize.height / 2.0);
        [attributedStr drawAtPoint:textPoint];

        startAngle = endAngle;
    }
    
}

- (void)animateChart {

    CGFloat animationDuration = 1.0;
    CGFloat delayInterval = 0.2;

    self.alpha = 0.0; // 初始化设置透明度为0

    [UIView animateWithDuration:animationDuration
                          delay:delayInterval
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.alpha = 1.0; // 设置透明度为1，实现渐渐显示效果
                     }
                     completion:nil];
    
}



@end
