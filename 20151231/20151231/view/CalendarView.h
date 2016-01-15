//
//  CalendarView.h
//  20151231
//
//  Created by analysys on 15/12/31.
//  Copyright © 2015年 analysys. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CollectionCell;
@protocol CalendarViewDelegate <NSObject>

@optional
-(void)longgestureEventView:(NSInteger)item withBGView:(UIView*)bgView;
-(void)tapEventView:(NSInteger)item;
@end

@interface CalendarView : UIView

@property (nonatomic, assign) id<CalendarViewDelegate> calendarViewDelegate;


@property (nonatomic, strong) NSString *payCountStr;
@property (nonatomic, strong) NSString *incomeCountStr;
@property (nonatomic, strong) NSString *balanceCountStr;

-(instancetype)initWithFrame:(CGRect)frame withPostx:(NSInteger)postX withDate:(NSDate*)myDate;

-(void)reloadCollectionData:(NSDate*)date withPost:(NSInteger)postX;

-(void)reloadCurrentData;
@end
