//
//  ViewController.m
//  20151231
//
//  Created by analysys on 15/12/31.
//  Copyright © 2015年 analysys. All rights reserved.
//

#import "ViewController.h"
#import "CalendarView.h"
#import "AddEventViewController.h"
#import "SiglerowPopPickerview.h"
#import "ShowYearViewController.h"
#import "ZBFallenBricksAnimator.h"
#import "ShowDayViewController.h"
#import "SettingViewController.h"
@interface ViewController ()<CalendarViewDelegate,SiglerowPopPicerviewDelegate,UINavigationControllerDelegate>
{
    CalendarView *_canlendarView;
    UIView    *_toolbar;
    UIButton    *_headDateButton;
    UILabel     *_headDateLabel;
    NSDate      *selectDate;
    
    NSCalendar *calendar;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.navigationController.delegate=self;
    selectDate = [NSDate date];
    [SiglerowPopPickerview shareInstance].delegate=self;
    [self InitilizeCalendarView];
    [self InitilizeToolbar];
    [self createNava];
}

#pragma mark - 初始化

-(void)createNava
{
    [self hideBackbutton];
    _headDateLabel = [[UILabel alloc]initWithFrame:FRAME(0, 0, kScreenWidth-160, NavaStatusHeight-20)];
    _headDateLabel.textAlignment= NSTextAlignmentCenter;
    
    _headDateButton = [UIButton buttonWithFrame:FRAME(80, 20, kScreenWidth-160, NavaStatusHeight-20) withType:UIButtonTypeCustom withBackground:[UIColor clearColor]];
    [self.headView addSubview:_headDateButton];
    [_headDateButton addSubview:_headDateLabel];
    _headDateLabel.attributedText=[OCUtils getString:[NSString stringWithFormat:@"%@年%02d月",[NSString year:[NSDate date]],[[NSString month:[NSDate date]] intValue]] withFrontColor:HexRGB(0xffffff) withBehindColor:HexRGB(0xffffff) withFrontLenth:5 withFrontFont:[UIFont systemFontOfSize:14] withBehindFont:[UIFont systemFontOfSize:20]];
    
    [_headDateButton addTarget:self action:@selector(changeDate) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *rightButton = [UIButton buttonWithFrame:FRAME(kScreenWidth-60, 20, 40, 44) withType:UIButtonTypeCustom withBackground:[UIColor clearColor]];
    [rightButton setImage:IMAGE_NAMED(@"setting") forState:UIControlStateNormal];
    rightButton.imageView.contentMode = UIViewContentModeCenter;
    [self.headView addSubview:rightButton];
    [rightButton addTarget:self action:@selector(pushSetting) forControlEvents:UIControlEventTouchUpInside];

}
-(void)InitilizeCalendarView
{
    calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSLocale *locale = [[NSLocale alloc]initWithLocaleIdentifier:@"Chinese"];
    [calendar setLocale:locale];
    [calendar setFirstWeekday:0];
    selectDate =[OCUtils firstDayOfMonthContainingDate:[NSDate date] withCalendar:calendar];
    NSInteger ss =  [calendar components:NSWeekdayCalendarUnit fromDate:selectDate].weekday;
    _canlendarView = [[CalendarView alloc]initWithFrame:CGRectMake(0, NavaStatusHeight+27, self.view.frame.size.width, self.view.frame.size.height-NavaStatusHeight-27)withPostx:ss withDate:selectDate];
    _canlendarView.calendarViewDelegate=self;
    [self.view addSubview:_canlendarView];
    
    //尝试添加左滑和右滑
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe:)];
    [leftSwipe setDirection:UISwipeGestureRecognizerDirectionLeft];
    [_canlendarView addGestureRecognizer:leftSwipe];
    leftSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe:)];
    [leftSwipe setDirection:UISwipeGestureRecognizerDirectionRight];
    [_canlendarView addGestureRecognizer:leftSwipe];
    
    
}

-(void)InitilizeToolbar
{
    _toolbar = [[UIView alloc]initWithFrame:FRAME(0, 64, self.view.frame.size.width, 27.f)];
    _toolbar.backgroundColor = HexRGB(0xdff4fe);
    [self.view addSubview:_toolbar];
    NSArray *weekNo = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    for(int i=0 ; i<7 ; i++)
    {
        UILabel *label = [UILabel labelWithFrame:FRAME(kScreenWidth/7.f*i, 5, kScreenWidth/7.f-10, 17.f) withTitle:weekNo[i] withBackground:[UIColor clearColor] withtextColor:HexRGB(0x222222) withFont:[UIFont systemFontOfSize:13.f] withAlignment:NSTextAlignmentRight];
        [_toolbar addSubview:label];
    }
}



#pragma mark - 长按cell
-(void)longgestureEventView:(NSInteger)item withBGView:(UIView *)bgView
{
    AddEventViewController *addEvc = [[AddEventViewController alloc]init];
    addEvc.myBlock = ^{
        [_canlendarView reloadCurrentData];
    };
    addEvc.myDate = [OCUtils getAfterDate:selectDate withCount:item-1];
    [self.navigationController pushViewController:addEvc animated:NO];
    [bgView removeFromSuperview];

}

-(void)tapEventView:(NSInteger)item
{
    ShowDayViewController *showday = [[ShowDayViewController alloc]init];
    [self.navigationController pushViewController:showday animated:YES];
    [showday setSelectDate:[OCUtils getAfterDate:selectDate withCount:item-1]];
}

-(void)pushSetting
{
    SettingViewController *setting = [[SettingViewController alloc]init];
    [self.navigationController pushViewController:setting animated:YES];
}

-(void)changeDate
{
    //[[SiglerowPopPickerview shareInstance]showWithYear:[NSString year:selectDate] withMonth:[NSString month:selectDate]];
    ShowYearViewController *show = [[ShowYearViewController alloc]init];
    [self.navigationController pushViewController:show animated:YES];
    show.yearstr = [NSString year:selectDate];
//    [YYClipImageTool addToCurrentView:show.view clipImage:nil backgroundImage:nil];
}
- (NSDate *)nextMonth:(NSDate *)date {
    NSString *str = @"";
    str= [str nowMonthDays:date];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:[str integerValue]];
    return [calendar dateByAddingComponents:comps toDate:date options:0];
}

-(NSDate*)lastMonth:(NSDate*)date
{
    NSDateFormatter *dateFormatter =           [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSInteger resultmonthInteger = [[NSString month:date]integerValue]-1;
    NSInteger resultYearInteger = [[NSString year:date]integerValue];
    if(resultmonthInteger == 0)
    {
        resultmonthInteger = 12;
        resultYearInteger -= 1;
    }
    NSDate *resultDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%ld-%02ld-%02ld",resultYearInteger,resultmonthInteger,[[NSString day:date] integerValue]]];
    return resultDate;
    

}

-(void)swipe:(UISwipeGestureRecognizer*)gesture
{
    if(gesture.direction == UISwipeGestureRecognizerDirectionRight)
    {
        NSLog(@"last date");
        selectDate = [self lastMonth:selectDate];
        NSInteger ss =  [calendar components:NSWeekdayCalendarUnit fromDate:selectDate].weekday;
        
        [_canlendarView reloadCollectionData:selectDate withPost:ss];
        
    }
    else
    {
        NSLog(@"next date");
        selectDate = [self nextMonth:selectDate];
        NSInteger ss =  [calendar components:NSWeekdayCalendarUnit fromDate:selectDate].weekday;

        [_canlendarView reloadCollectionData:selectDate withPost:ss];
    }
    
    _headDateLabel.attributedText=[OCUtils getString:[NSString stringWithFormat:@"%@年%02d月",[NSString year:selectDate],[[NSString month:selectDate] intValue]] withFrontColor:HexRGB(0xffffff) withBehindColor:HexRGB(0xffffff) withFrontLenth:5 withFrontFont:[UIFont systemFontOfSize:14] withBehindFont:[UIFont systemFontOfSize:20]];

}


#pragma mark - SigierowPop
-(void)didselect:(NSString *)year withMonth:(NSString *)month
{
    NSMutableAttributedString *str =[[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@年%@月",year,month]];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, 5)];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(5, str.length-5)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, str.length)];
    _headDateLabel.attributedText=str;
    
    selectDate = [OCUtils getDatefromstrWithyear:year Andmonth:month];
    NSInteger ss =  [calendar components:NSWeekdayCalendarUnit fromDate:selectDate].weekday;
    [_canlendarView reloadCollectionData:selectDate withPost:ss];
    
}

#pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    NSObject <UIViewControllerAnimatedTransitioning> *animator;
    
    animator = [[ZBFallenBricksAnimator alloc] init];
    
    return animator;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
