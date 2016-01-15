//
//  EventModel.h
//  20151231
//
//  Created by analysys on 16/1/4.
//  Copyright © 2016年 analysys. All rights reserved.
//

#import <Foundation/Foundation.h>

enum{
    GetType = 0,
    PayType
};


@interface EventModel : NSObject

@property (nonatomic, copy) NSString *payCounts;
@property (nonatomic, copy) NSString *eventName;
@property (nonatomic, copy) NSString *eventType;
@property (nonatomic, copy) NSString *createTime;
@property (nonatomic, copy) NSString *modelId;
@property (nonatomic, copy) NSString *createyear;
@property (nonatomic, copy) NSString *createmonth;
@property (nonatomic, copy) NSString *createday;
@end
