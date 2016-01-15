//
//  SiglerowPopPickerview.h
//  WCProject
//  弹出视图pickerview自定义
//  Created by mc on 15/8/5.
//  Copyright (c) 2015年 mc. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SiglerowPopPicerviewDelegate <NSObject>

-(void)didselect:(NSString*)year withMonth:(NSString*)month;

@end


@interface SiglerowPopPickerview : UIView

@property (nonatomic,assign)id<SiglerowPopPicerviewDelegate>delegate;

+(SiglerowPopPickerview*)shareInstance;
-(void)showWithYear:(NSString*)year withMonth:(NSString*)month;
-(void)hideView;
@end
