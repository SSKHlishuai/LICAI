//
//  AddEventViewController.h
//  20151231
//
//  Created by analysys on 16/1/5.
//  Copyright © 2016年 analysys. All rights reserved.
//

#import "BaseViewController.h"
typedef void(^reloadPrevious) (void);

@interface AddEventViewController : BaseViewController

@property (nonatomic, strong) reloadPrevious myBlock;
@property (nonatomic, strong) NSDate *myDate;

@end
