//
//  CalendarHandle.m
//  20151231
//
//  Created by analysys on 16/1/4.
//  Copyright © 2016年 analysys. All rights reserved.
//

#import "CalendarHandle.h"

@interface CalendarHandle ()
{
    NSCalendar *calendar;
}

@end

@implementation CalendarHandle

+(CalendarHandle*)getSelectCalendar
{
    static CalendarHandle *handle = nil;
    dispatch_once_t once ;
    dispatch_once(&once, ^{
        handle = [[CalendarHandle alloc]init];
    });
    return handle;
}

-(instancetype)init
{
    self= [super init];
    if(self)
    {
        calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSLocale *locale = [[NSLocale alloc]initWithLocaleIdentifier:@"Chinese"];
        [calendar setLocale:locale];
        [calendar setFirstWeekday:0];
    }
    return self;
}
/**
 *  根据某一个nsdate返回这个月第一天的位置
 *
 *  @param date <#date description#>
 *
 *  @return <#return value description#>
 */
+(NSInteger)getFirstPostWithDate:(NSDate*)date
{
    return [[CalendarHandle getSelectCalendar]numberOfWeeksInMonthContainingDate:date];
}




//这个月的第一天
- (NSDate *)firstDayOfMonthContainingDate:(NSDate *)date {
    NSDateComponents *comps = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:date];
    [comps setDay:1];
    return [calendar dateFromComponents:comps];
}



- (int)dayOfWeekForDate:(NSDate *)date {
    NSDateComponents *comps = [calendar components:NSWeekdayCalendarUnit fromDate:date];
    return comps.weekday;
}

- (int)weekNumberInMonthForDate:(NSDate *)date {
    NSDateComponents *comps = [calendar components:(NSWeekOfMonthCalendarUnit) fromDate:date];
    return comps.weekOfMonth;
}

- (int)numberOfWeeksInMonthContainingDate:(NSDate *)date {
    return [calendar rangeOfUnit:NSWeekCalendarUnit inUnit:NSMonthCalendarUnit forDate:date].length;
}


@end
