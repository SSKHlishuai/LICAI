//
//  Utils.h
//  WCProject
//  UI的工具类
//  Created by mc on 15/7/27.
//  Copyright (c) 2015年 mc. All rights reserved.
//

#import <Foundation/Foundation.h>


//工具类


@interface UILabel (utils)

/**
 *  创建一个label
 *
 *  @param rect          label的frame
 *  @param myTitle       label的text
 *  @param bgcolor       label的背景色
 *  @param textColor     label的字颜色
 *  @param textFont      label的字体大小
 *  @param textAlignment label的内容位置
 *
 *  @return
 */
+(UILabel*)labelWithFrame:(CGRect)rect withTitle:(NSString*)myTitle withBackground:(UIColor*)bgcolor withtextColor:(UIColor*)textColor withFont:(UIFont*)textFont withAlignment:(NSTextAlignment)textAlignment;

@end

@interface UIButton (utils)

/**
 *  实例化一个button
 *
 *  @param rect       frame
 *  @param buttonType button类型
 *  @param bgcolor    button背景颜色
 *
 *  @return <#return value description#>
 */
+(UIButton*)buttonWithFrame:(CGRect)rect withType:(UIButtonType)buttonType withBackground:(UIColor*)bgcolor;

+(UIButton*)buttonWithFrame:(CGRect)rect withType:(UIButtonType)buttonType withBackground:(UIColor *)bgcolor withTitle:(NSString*)title withTitleColor:(UIColor*)titleColor withFont:(UIFont*)titleFont;

+(UIButton*)buttonWithFrame:(CGRect)rect withType:(UIButtonType)buttonType withBackground:(UIColor *)bgcolor withImage:(UIImage*)norImage withHighImage:(UIImage*)highImage;


@end

@interface UIView (utils)



/**
 *  实例化一个view
 *
 *  @param rect    frame
 *  @param bgcolor view背景色
 *
 *  @return
 */

+(UIView*)viewWithFrame:(CGRect)rect withBackground:(UIColor*)bgcolor;
/**
 *  生成一条线view
 *
 *  @param y     纵坐标
 *  @param width 长度
 *
 *  @return
 */
+(UIView*)getLineY:(CGFloat)y withWidth:(CGFloat)width;
+(UIView*)getLineY:(CGFloat)y withWidth:(CGFloat)width withColor:(UIColor*)bgcolor;
+(UIView*)getVerticalLineWithX:(CGFloat)x WithY:(CGFloat)y withHeight:(CGFloat)height;
+(UIView*)getVerticalLineWithX:(CGFloat)x WithY:(CGFloat)y withHeight:(CGFloat)height withColor:(UIColor*)bgcolor;
@end


@interface UIImageView (utils)


/**
 *  实例化一个imageview
 *
 *  @param rect     frame
 *  @param theImage imageview的图
 *
 *  @return
 */
+(UIImageView*)imageviewWithFrame:(CGRect)rect;
+(UIImageView*)imageviewWithFrame:(CGRect)rect withImage:(UIImage*)theImage;


@end


@interface UIScrollView (utils)
/**
 *  实例化一个scrollview
 *
 *  @param rect    frame
 *  @param bgcolor 背景色
 *
 *  @return
 */
+(UIScrollView*)scrollWithFrame:(CGRect)rect withBackground:(UIColor*)bgcolor;


@end

@interface UITableView (utils)

/**
 *  实例化一个tableview
 *
 *  @param rect       frame
 *  @param tableStyle plane 或者 group
 *  @param bgcolor    背景色
 *
 *  @return
 */
+(UITableView*)tableViewWithFrame:(CGRect)rect withTableStyle:(UITableViewStyle)tableStyle withBackground:(UIColor*)bgcolor;

@end

@interface UITextField (utils)

/**
 *  实例化一个textfield
 *
 *  @param rect        frame
 *  @param borderStyle 边框
 *  @param bgcolor     背景色
 *  @param textcolor   字色
 *  @param placeholder 提示语
 *  @param keybordType 键盘类型
 *  @param title       文本
 *  @param isclear     是否可以清楚（小叉号）
 *
 *  @return
 */
+(UITextField*)textfieldWithFrame:(CGRect)rect
                  withBorderStyle:(UITextBorderStyle)borderStyle
                   withBackground:(UIColor*)bgcolor
                    withTextColor:(UIColor*)textcolor
                  withPlaceholder:(NSString*)placeholder
                 withkeybordStyle:(UIKeyboardType)keybordType
                        withTitle:(NSString*)title
                      withIsClear:(UITextFieldViewMode)clearmode
                         withFont:(UIFont*)textfont
                 withTextaligment:(NSTextAlignment)textAlignment;

+(UITextField*)textfieldWithFrame:(CGRect)rect withTextColor:(UIColor *)textcolor withPlaceholder:(NSString *)placeholder withFont:(UIFont *)textfont;

@end




