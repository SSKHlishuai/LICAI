//
//  OCUtils.h
//  20151231
//
//  Created by analysys on 16/1/5.
//  Copyright © 2016年 analysys. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OCUtils : NSObject

+ (UIViewController *)getCurrentVC;

+(NSDate*)getDatefromstrWithyear:(NSString*)year Andmonth:(NSString*)month;


+(NSArray*)getImageName;

+(NSArray*)getChineseName;

+(NSString*)getImageNamewithID:(NSInteger)tag;

+(NSString*)getImageChineseWithID:(NSInteger)tag;

+(NSString*)getDateToDateStr:(NSDate*)date;

+(NSDate*)getAfterDate:(NSDate*)date withCount:(NSInteger)count;

+ (NSDate *)firstDayOfMonthContainingDate:(NSDate *)date withCalendar:(NSCalendar*)calendar;

/**
 *  绘制文字
 *
 *  @param text       文字
 *  @param rect       frame
 *  @param mycolor    颜色
 *  @param myfont     字号
 *  @param mypargraph 修饰
 */
+(void)draw:(NSString*)text frame:(CGRect)rect color:(UIColor*)mycolor font:(CGFloat)myfont pargraph:(NSMutableParagraphStyle*)mypargraph;


/**
 *  绘制很多行字
 *
 *  @param titleArray 文字数组
 *  @param frameArray frame数组
 *  @param mycolor    颜色
 *  @param myfont     字号
 *  @param mypargraph 修饰
 */
+(void)drawArrays:(NSArray*)titleArray withFrameArray:(NSArray*)frameArray color:(UIColor*)mycolor font:(CGFloat)myfont pargraph:(NSMutableParagraphStyle*)mypargraph;


+(void)draw:(NSString*)text frame:(CGRect)rect color:(UIColor*)mycolor bfont:(CGFloat)myfont pargraph:(NSMutableParagraphStyle*)mypargraph;


+(NSString*)getOnemonthIncomeWithyear:(NSString*)year withMonth:(NSString*)month;

+(NSString*)getOnemonthPayWithyear:(NSString*)year withMonth:(NSString*)month;

+(NSString*)getOnemonthBalanceWithyear:(NSString*)year withMonth:(NSString*)month;

+(NSString*)getAmountIncomeWithYear:(NSString*)year;

+(NSString*)getAmountPayWithYear:(NSString*)year;

+(NSString*)getAmountBalanceWithYear:(NSString*)year;

+(NSMutableAttributedString*)getString:(NSString*)string withFrontColor:(UIColor*)color1 withBehindColor:(UIColor*)color2 withFrontLenth:(NSInteger)frontLength withFrontFont:(UIFont*)font1 withBehindFont:(UIFont*)font2;

@end
