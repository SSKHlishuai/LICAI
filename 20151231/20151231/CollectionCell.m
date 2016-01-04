//
//  CollectionCell.m
//  20151231
//
//  Created by analysys on 15/12/31.
//  Copyright © 2015年 analysys. All rights reserved.
//

#import "CollectionCell.h"
#import "CalendarCellView.h"

#define LabelHeight     20.f
#define EventLabelHeight  15.f

@interface CollectionCell ()
{
    UILabel     *dateLabel;
    CalendarCellView *calendarCellView;
    NSInteger   maxShowCalendarViewCount;
}

@end

@implementation CollectionCell


-(instancetype)initWithFrame:(CGRect)frame
{
    if(self= [super initWithFrame:frame])
    {
        self.contentView.backgroundColor = HexRGB(0xffffff);
        [self InitUI];
        self.contentView.clipsToBounds=YES;
    }
    return self;
}

-(void)InitUI
{
    dateLabel = [[UILabel alloc]init];
    dateLabel.frame = CGRectMake(0, 0, self.frame.size.width-10, LabelHeight);
    dateLabel.textColor = HexRGB(0x777777);
    dateLabel.textAlignment = NSTextAlignmentRight;
    dateLabel.font = [UIFont boldSystemFontOfSize:16.f];
    [self.contentView addSubview:dateLabel];
    maxShowCalendarViewCount = (NSInteger)((self.frame.size.height-LabelHeight)/(EventLabelHeight+1))+1;
    
    calendarCellView  = [[CalendarCellView alloc]initWithFrame:FRAME(0, 0, self.frame.size.width, self.frame.size.height-LabelHeight)];
    [self.contentView addSubview:calendarCellView];
    self.backgroundColor = [UIColor clearColor];
    
}

-(void)setCellConfigWithDate:(NSInteger)dateCount withEvent:(NSArray*)showArrays
{
    dateLabel.text = [NSString stringWithFormat:@"%02ld",dateCount];
    
    
    //如果传入的数组数大于maxShowCalendarViewCount，则显示maxShowCalendarViewCount个，反之，显示数组数
   if(showArrays.count>maxShowCalendarViewCount)
   {
       NSArray *needArray = [showArrays subarrayWithRange:NSMakeRange(0, maxShowCalendarViewCount)];
       [calendarCellView addEvent:needArray];
   }
    else
    {
        [calendarCellView addEvent:showArrays];
    }
    
    
}

-(void)awakeFromNib
{
    
}

@end
