//
//  ViewController.m
//  20151231
//
//  Created by analysys on 15/12/31.
//  Copyright © 2015年 analysys. All rights reserved.
//

#import "ViewController.h"
#import "CalendarView.h"
@interface ViewController ()
{
    CalendarView *_canlendarView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self InitilizeCalendarView];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)InitilizeCalendarView
{
    _canlendarView = [[CalendarView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    [self.view addSubview:_canlendarView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
