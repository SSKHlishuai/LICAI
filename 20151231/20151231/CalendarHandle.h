//
//  CalendarHandle.h
//  20151231
//
//  Created by analysys on 16/1/4.
//  Copyright © 2016年 analysys. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalendarHandle : NSObject

+(CalendarHandle*)getSelectCalendar;

+(NSInteger)getFirstPostWithDate:(NSDate*)date;
@end
