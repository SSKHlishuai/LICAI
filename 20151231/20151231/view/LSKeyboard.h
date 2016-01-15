//
//  LSKeyboard.h
//  XIBDemo
//
//  Created by analysys on 16/1/6.
//  Copyright © 2016年 analysys. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol LSKeyboardDelegate <NSObject>

-(void)changeNumber:(NSString*)item;

-(void)didFinish;

-(void)hideKeyboard;


@end


@interface LSKeyboard : UIView

@property (nonatomic, assign) id<LSKeyboardDelegate> lskeyboardDelegate;

@end
