//
//  OCUtils.m
//  20151231
//
//  Created by analysys on 16/1/5.
//  Copyright © 2016年 analysys. All rights reserved.
//

#import "OCUtils.h"

@implementation OCUtils

//获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = nextResponder;
    
    return result;
}


+(NSDate*)getDatefromstrWithyear:(NSString*)year Andmonth:(NSString*)month
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *dateStr = [NSString stringWithFormat:@"%@-%@-01",year,month];
    NSDate *needDate = [formatter dateFromString:dateStr];
    return needDate;
    
}




+(NSArray*)getImageName
{
    NSString *plistStr =[[NSBundle mainBundle]pathForResource:@"typeImage" ofType:@"plist"];
    NSArray *arr = [NSArray arrayWithContentsOfFile:plistStr];
    return arr;
}

+(NSArray*)getChineseName
{
    NSString *plistStr =[[NSBundle mainBundle]pathForResource:@"StatisicalChinesePlist" ofType:@"plist"];
    NSArray *arr = [NSArray arrayWithContentsOfFile:plistStr];
    return arr;
}

+(NSString*)getImageNamewithID:(NSInteger)tag
{
    NSString *plistStr =[[NSBundle mainBundle]pathForResource:@"typeImage" ofType:@"plist"];
    NSArray *arr = [NSArray arrayWithContentsOfFile:plistStr];
    NSString *str = arr[tag];
    return str;
}

+(NSString*)getImageChineseWithID:(NSInteger)tag
{
    NSString *plistStr =[[NSBundle mainBundle]pathForResource:@"StatisicalChinesePlist" ofType:@"plist"];
    NSArray *arr = [NSArray arrayWithContentsOfFile:plistStr];
    NSString *str = arr[tag];
    return str;
}


-(BOOL)compareFirstDate:(NSDate*)firstDate withSecondDate:(NSDate*)secondDate
{
    NSDateFormatter *dateFormatter =           [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
     NSString *dateFirst = [dateFormatter stringFromDate:firstDate];
     NSString *dateSecond=[dateFormatter stringFromDate:secondDate];
     if([dateSecond isEqualToString:dateFirst])
    {
        return YES;
    }
     else{
         return  NO;
     }
}
/**
 *  创建count天数后的date
 *
 *  @param date  <#date description#>
 *  @param count <#count description#>
 *
 *  @return <#return value description#>
 */
+(NSDate*)getAfterDate:(NSDate*)date withCount:(NSInteger)count
{
    //根据已有日期创建日期
    NSTimeInterval secondsPerDay1 = 24*60*60;
    NSDate *resultDate = [date addTimeInterval:count*secondsPerDay1];
    return resultDate;
}


+(NSString*)getDateToDateStr:(NSDate*)date
{
    NSDateFormatter *dateFormatter =           [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateFirst = [dateFormatter stringFromDate:date];
    return dateFirst;

}

+ (NSDate *)firstDayOfMonthContainingDate:(NSDate *)date withCalendar:(NSCalendar*)calendar{
    NSDateComponents *comps = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:date];
    [comps setDay:1];
    return [calendar dateFromComponents:comps];
}

+(void)draw:(NSString*)text frame:(CGRect)rect color:(UIColor*)mycolor bfont:(CGFloat)myfont pargraph:(NSMutableParagraphStyle*)mypargraph
{
    [text drawInRect:rect withAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:myfont],NSFontAttributeName ,mycolor,NSForegroundColorAttributeName,mypargraph,NSParagraphStyleAttributeName,nil]];
}


+(void)draw:(NSString*)text frame:(CGRect)rect color:(UIColor*)mycolor font:(CGFloat)myfont pargraph:(NSMutableParagraphStyle*)mypargraph
{
    [text drawInRect:rect withAttributes:[NSDictionary dictionaryWithObjectsAndKeys:SYSTEM_FONT(myfont),NSFontAttributeName ,mycolor,NSForegroundColorAttributeName,mypargraph,NSParagraphStyleAttributeName,nil]];
}

+(void)drawArrays:(NSArray*)titleArray withFrameArray:(NSArray*)frameArray color:(UIColor*)mycolor font:(CGFloat)myfont pargraph:(NSMutableParagraphStyle*)mypargraph
{
    for(int i=0;i<frameArray.count;i++)
    {
        [OCUtils draw:titleArray[i] frame:[frameArray[i] CGRectValue] color:mycolor font:myfont pargraph:mypargraph];
    }
}

+(NSString*)getOnemonthIncomeWithyear:(NSString*)year withMonth:(NSString*)month
{
    NSArray *arr = [CoreDataManager getEventfromonemonth:year withMonth:month];
    float temp = 0.f;
    for(EventModel *model in arr)
    {
        if([model.eventType integerValue]==GetType)
        {
            temp += [model.payCounts floatValue];
        }
        
    }
    
    return [NSString stringWithFormat:@"%.2f",temp];
    
}
+(NSString*)getOnemonthPayWithyear:(NSString*)year withMonth:(NSString*)month
{
    NSArray *arr = [CoreDataManager getEventfromonemonth:year withMonth:month];
    float temp = 0.f;
    for(EventModel *model in arr)
    {
        if([model.eventType integerValue]==PayType)
        {
            temp += [model.payCounts floatValue];
        }
        
    }
    
    return [NSString stringWithFormat:@"%.2f",temp];

}

+(NSString*)getOnemonthBalanceWithyear:(NSString*)year withMonth:(NSString*)month
{
    NSArray *arr = [CoreDataManager getEventfromonemonth:year withMonth:month];
    float tempIncome = 0.f;
    float tempPay = 0.f;
    for(EventModel *model in arr)
    {
        if([model.eventType integerValue]==GetType)
        {
            tempIncome += [model.payCounts floatValue];
        }
        else if ([model.eventType integerValue] == PayType)
        {
            tempPay += [model.payCounts floatValue];
        }
    }
    
    
    return [NSString stringWithFormat:@"%.2f",tempIncome-tempPay];
    
}

+(NSMutableAttributedString*)getString:(NSString*)string withFrontColor:(UIColor*)color1 withBehindColor:(UIColor*)color2 withFrontLenth:(NSInteger)frontLength withFrontFont:(UIFont *)font1 withBehindFont:(UIFont *)font2
{
    NSMutableAttributedString *str =[[NSMutableAttributedString alloc]initWithString:string];
    [str addAttribute:NSFontAttributeName value:font1 range:NSMakeRange(0, frontLength)];
    [str addAttribute:NSFontAttributeName value:font2 range:NSMakeRange(frontLength, string.length-frontLength)];
    [str addAttribute:NSForegroundColorAttributeName value:color1 range:NSMakeRange(0, frontLength)];
    [str addAttribute:NSForegroundColorAttributeName value:color2 range:NSMakeRange(frontLength, string.length - frontLength)];
    return str;

}

//+(NSString*)getAmountIncomeWithYear:(NSString *)year
//{
//    
//}
//+(NSString*)getAmountPayWithYear:(NSString *)year
//{
//    
//}
//+(NSString*)getAmountBalanceWithYear:(NSString *)year
//{
//    
//}



@end
