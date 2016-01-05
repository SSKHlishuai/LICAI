//
//  CoreDataManager.h
//  20151231
//
//  Created by analysys on 16/1/5.
//  Copyright © 2016年 analysys. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EventModel.h"
@interface CoreDataManager : NSObject


+(void)saveEvent:(EventModel*)model;


+(NSArray*)getAllEvent;


@end
