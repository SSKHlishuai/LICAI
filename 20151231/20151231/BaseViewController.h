//
//  BaseViewController.h
//  WCProject
//
//  Created by mc on 15/7/21.
//  Copyright (c) 2015年 mc. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BaseViewController : UIViewController

@property (nonatomic,strong)    UIView      *headView;
@property (nonatomic,copy)      NSString    *middleTitle;
@property (nonatomic)   BOOL    isLoading;

/**
 *  隐藏navigationbar上的返回按键
 */
-(void)hideBackbutton;
/**
 *  返回按键的触发方法
 */
-(void)backClick;



-(void)Initilize;
/**
 *  当页面无数据
    显示的界面
 *
 *  @param nodatastring 显示的label的text
 */
-(void)setNodata:(NSString*)nodatastring;

/**
 *  隐藏无数据控件
 */
-(void)hideNodata;

@end
