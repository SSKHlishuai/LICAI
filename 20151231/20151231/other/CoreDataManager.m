//
//  CoreDataManager.m
//  20151231
//
//  Created by analysys on 16/1/5.
//  Copyright © 2016年 analysys. All rights reserved.
//

#import "CoreDataManager.h"
#import "AppDelegate.h"
@implementation CoreDataManager

+(void)saveEvent:(EventModel*)model
{
    AppDelegate *appdelegate = [[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context = [appdelegate managedObjectContext];
    
    NSManagedObject *newContact = [NSEntityDescription insertNewObjectForEntityForName:@"PREvent" inManagedObjectContext:context];
    
    [newContact setValue:model.eventName forKey:@"eventName"];
    [newContact setValue:model.eventType forKey:@"eventType"];
    [newContact setValue:model.payCounts forKey:@"moneyCount"];
    [newContact setValue:model.createTime forKey:@"createTime"];
    
    NSError *error;
    [context save:&error];
}


+(NSArray*)getAllEvent
{
    AppDelegate *appdelegate = [[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context = [appdelegate managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"PREvent" inManagedObjectContext:context];
    
    [fetchRequest setEntity:entity];
    
    NSError *error;
    NSArray *fetchObjects = [context executeFetchRequest:fetchRequest error:&error];
    NSMutableArray *result = [NSMutableArray array];
    for(NSManagedObject *object in fetchObjects)
    {
        EventModel *model = [[EventModel alloc]init];
        model.eventName = [object valueForKey:@"eventName"];
        model.createTime = [object valueForKey:@"createTime"];
        model.eventType = [object valueForKey:@"eventType"];
        model.payCounts = [object valueForKey:@"moneyCount"];
        [result addObject:model];
    }
    return result;

}

@end
