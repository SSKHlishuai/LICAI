//
//  CounterButton.m
//  XIBDemo
//
//  Created by analysys on 16/1/7.
//  Copyright © 2016年 analysys. All rights reserved.
//

#import "CounterButton.h"

@implementation CounterButton
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 1);
    CGContextSetStrokeColorWithColor(context, [[UIColor colorWithRed:((float)((0xdadbde&0xFF0000)>>16))/255.0 green:((float)((0xdadbde&0xFF00)>>8))/255.0 blue:((float)(0xdadbde&0xFF))/255.0 alpha:1.0] CGColor]);
    CGContextBeginPath(context);
    CGPoint startPoint = CGPointMake(0, self.frame.size.height-1);
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(context, self.frame.size.width, startPoint.y);
    CGContextAddLineToPoint(context, self.frame.size.width, 0);
    
    CGContextStrokePath(context);

}


@end
