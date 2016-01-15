//
//  CollectionCell.m
//  20151231
//
//  Created by analysys on 15/12/31.
//  Copyright © 2015年 analysys. All rights reserved.
//

#import "CollectionCell.h"
#import "CalendarCellView.h"
#import "AddEventViewController.h"
#define LabelHeight     20.f
#define EventLabelHeight  15.f

@interface CollectionCell ()
{
    UILabel     *dateLabel;
    CalendarCellView *calendarCellView;
    NSInteger   maxShowCalendarViewCount;
    NSInteger   currentLongClickCellItem;
    
    
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
    dateLabel.font = [UIFont boldSystemFontOfSize:14.f];
    [self.contentView addSubview:dateLabel];
    maxShowCalendarViewCount = (NSInteger)((self.frame.size.height-LabelHeight)/(EventLabelHeight+1))+1;
    
    calendarCellView  = [[CalendarCellView alloc]initWithFrame:FRAME(0, dateLabel.bottom, self.frame.size.width, self.frame.size.height-LabelHeight)];
    [self.contentView addSubview:calendarCellView];
    self.backgroundColor = [UIColor clearColor];
    
    UILongPressGestureRecognizer * longPressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(cellLongPress:)];
    longPressGesture.numberOfTapsRequired=0;
    longPressGesture.numberOfTouchesRequired=1;
    longPressGesture.minimumPressDuration=1.f;
//    longPressGesture
    [self.contentView addGestureRecognizer:longPressGesture];
    
    UIView *lineV = [UIView viewWithFrame:FRAME(0, 0, 1, self.height) withBackground:HexRGB(0xbfe0ef)];
    [self.contentView addSubview:lineV];
    UIView *lineH = [UIView viewWithFrame:FRAME(0, self.height-1, self.width, 1) withBackground:HexRGB(0xbfe0ef)];
    [self.contentView addSubview:lineH];

    
    
}

-(void)cellLongPress:(UILongPressGestureRecognizer*)gesture
{
    if(currentLongClickCellItem==0)return;

    NSLog(@"curr = %d",currentLongClickCellItem);
    if(gesture.state == UIGestureRecognizerStateBegan)
    {
        

        UIWindow *window=[UIApplication sharedApplication].keyWindow;
        UIView *backgroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        backgroundView.backgroundColor=[UIColor clearColor];
        backgroundView.alpha=1;
        
        CGRect oldframe;
        oldframe = [self convertRect:self.bounds toView:window];
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:oldframe];
        imageView.backgroundColor = IncomeColor;
        [backgroundView addSubview:imageView];
        [window addSubview:backgroundView];
        [UIView animateWithDuration:0.3 animations:^{
            
            imageView.frame=CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
            backgroundView.alpha=1;
        } completion:^(BOOL finished) {
            
            if([self.collectionCellDelegate respondsToSelector:@selector(longgestureEvent:withView:)])
            {
                [self.collectionCellDelegate longgestureEvent:currentLongClickCellItem withView:backgroundView];
            }

        }];

    }
   
}
-(void)setnull
{
    currentLongClickCellItem=0;
    dateLabel.text = @"";
    [calendarCellView addEvent:nil];

}
-(void)setCellConfigWithDate:(NSInteger)dateCount withEvent:(NSArray*)showArrays withItem:(NSInteger)item
{
    
    currentLongClickCellItem = dateCount;
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
