//
//  EventModel.h
//  20151231
//
//  Created by analysys on 16/1/4.
//  Copyright © 2016年 analysys. All rights reserved.
//

#import <Foundation/Foundation.h>

enum{
    PayType = 0,
    GetType
};


@interface EventModel : NSObject

@property (nonatomic, copy) NSString *payCounts;
@property (nonatomic, copy) NSString *eventName;
@property (nonatomic, copy) NSString *eventType;
@property (nonatomic, copy) NSDate *createTime;
@end
