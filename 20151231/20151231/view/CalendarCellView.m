//
//  CalendarCellView.m
//  20151231
//
//  Created by analysys on 16/1/4.
//  Copyright © 2016年 analysys. All rights reserved.
//

#import "CalendarCellView.h"
#import "EventModel.h"

#define EventLabelHeight  15.f

@implementation CalendarCellView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)addEvent:(NSArray*)eventArray
{
    for(UIView *view in self.subviews)
    {
        [view removeFromSuperview];
    }
    
    for(int i=0;i<eventArray.count;i++)
    {
        EventModel *model = [eventArray objectAtIndex:i];
        
        UIColor *_color;
        
        if([model.eventType integerValue] == PayType)
        {
            _color = PayColor;
        }
        else
        {
            _color = IncomeColor;
        }
        UILabel *label = [UILabel labelWithFrame:FRAME(0, 0+i*(EventLabelHeight+1), self.frame.size.width, EventLabelHeight) withTitle:[NSString stringWithFormat:@"%@¥%@",model.eventName,model.payCounts] withBackground:_color withtextColor:HexRGB(0xffffff) withFont:SYSTEM_FONT(11.f) withAlignment:NSTextAlignmentCenter];
        [self addSubview:label];

    }
}

@end
