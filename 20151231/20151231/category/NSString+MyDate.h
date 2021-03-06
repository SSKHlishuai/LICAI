//
//  NSString+MyDate.h
//  MyDateDemo
//
//  Created by 学之网研发 on 14-5-13.
//  Copyright (c) 2014年 学之网研发. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MyDate)

//返回时间戳
-(NSString*)timeStamp:(NSDate*)parameterDate;

//返回当前时间的字符串 例 20150403020111
+(NSString*)returnCreateTime:(NSDate *)date;


//返回分钟：秒钟   例子  10:43
-(NSString*)hourToMinutes:(NSDate*)parameterDate;
//返回 月： 日期  例子  5月15日
-(NSString*)monthToDays:(NSDate*)parameterDate;
//返回 年 ： 月： 日期  例子  5月15日
-(NSString*)yearToMonthToDays:(NSDate*)parameterDate;
//返回：今天4:32
- (NSString *)todayHourAndMinute;
//返回某个月的天数
-(NSString*)nowMonthDays:(NSDate*)parameterDate;

//根据生日返回岁数
+(NSString*)age:(NSDate*)birthdayDate;

//返回年份
+(NSString*)year:(NSDate*)parameterDate;
//返回月份
+(NSString*)month:(NSDate*)parameterDate;
//返回星期
+(NSString*)week:(NSDate*)parameterDate;
//返回日期
+(NSString*)day:(NSDate*)parameterDate;
//返回小时
+(NSString*)hour:(NSDate*)parameterDate;
//返回分钟
-(NSString*)minuts:(NSDate*)parameterDate;
//返回秒
-(NSString*)second:(NSDate*)parameterDate;
- (NSString *)hourAndMinute;
- (NSString *)monthAndDayTimeNO;
-(NSString*)AM_PM_Time;

- (NSString *)yearAndmonthAndDayTimeNO;

+ (NSInteger)getCountWeekBetweenDate:(NSDate *)date withBugetDay:(NSString *)bugetDay;//返回两天之间  星期一的数量

+(NSInteger)getCountDayBetweenDate:(NSDate *)date withBugetDay:(NSString *)bugetDay;


@end
