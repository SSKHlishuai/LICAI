//
//  ShowYearView.h
//  20151231
//
//  Created by analysys on 16/1/12.
//  Copyright © 2016年 analysys. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ShowYearViewDelegate <NSObject>

@optional
-(void)selectedRow:(NSInteger)item;

@end

@interface ShowYearView : UIView
@property (nonatomic, strong) NSString *yearStr;
@property (nonatomic, assign) id<ShowYearViewDelegate> showyearviewDelegate;
@end
