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
@interface ViewController ()<CalendarViewDelegate>
{
    CalendarView *_canlendarView;
    UIToolbar    *_toolbar;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self InitilizeCalendarView];
    [self InitilizeToolbar];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)InitilizeCalendarView
{
    _canlendarView = [[CalendarView alloc]initWithFrame:CGRectMake(0, 104, self.view.frame.size.width, self.view.frame.size.height-104)];
    _canlendarView.calendarViewDelegate=self;
    [self.view addSubview:_canlendarView];
}

-(void)InitilizeToolbar
{
    _toolbar = [[UIToolbar alloc]initWithFrame:FRAME(0, 64, self.view.frame.size.width, 40.f)];
    _toolbar.backgroundColor = HexRGB(0xd7f1fe);
    [self.view addSubview:_toolbar];
    NSArray *weekNo = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    for(int i=0 ; i<7 ; i++)
    {
        UILabel *label = [UILabel labelWithFrame:FRAME(kScreenWidth/7.f*i, 0, kScreenWidth/7.f-10, 40.f) withTitle:weekNo[i] withBackground:[UIColor clearColor] withtextColor:HexRGB(0x314044) withFont:[UIFont systemFontOfSize:13.f] withAlignment:NSTextAlignmentRight];
        [_toolbar addSubview:label];
    }
}
-(void)longgestureEventView:(NSInteger)item withBGView:(UIView *)bgView
{
    AddEventViewController *addEvc = [[AddEventViewController alloc]init];
    [self.navigationController pushViewController:addEvc animated:NO];
    [bgView removeFromSuperview];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
