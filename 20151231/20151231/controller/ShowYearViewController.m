//
//  ShowYearViewController.m
//  20151231
//
//  Created by analysys on 16/1/12.
//  Copyright © 2016年 analysys. All rights reserved.
//

#import "ShowYearViewController.h"
#import "ShowYearView.h"
@interface ShowYearViewController ()<ShowYearViewDelegate>
{
    UILabel *_headDateLabel;
    ShowYearView *showyear;
}
@end

@implementation ShowYearViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initilizeShowYear];
    [self createNava];
    // Do any additional setup after loading the view from its nib.
}

-(void)initilizeShowYear
{
    showyear = [[ShowYearView alloc]initWithFrame:FRAME(0, NavaStatusHeight, kScreenWidth, kScreenHeight-NavaStatusHeight)];
    showyear.showyearviewDelegate=self;
    showyear.yearStr = self.yearstr;
    showyear.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:showyear];
}

//-(void)setYearstr:(NSString *)yearstr
//{
//    _yearstr = yearstr;
////    _headDateLabel.text =
////    showyear.yearStr = yearstr;
////    [showyear setNeedsDisplay];
//}

-(void)createNava
{
    
    _headDateLabel = [[UILabel alloc]initWithFrame:FRAME(80, 20, kScreenWidth-160, NavaStatusHeight-20)];
    _headDateLabel.textAlignment= NSTextAlignmentCenter;
    _headDateLabel.textColor = HexRGB(0xffffff);
    _headDateLabel.font = [UIFont systemFontOfSize:16.f];
    _headDateLabel.text = [NSString stringWithFormat:@"%@年",self.yearstr];
    [self.headView addSubview:_headDateLabel];
    
    
}


#pragma mark - ShowYearViewDelegate
-(void)selectedRow:(NSInteger)item
{
    NSLog(@"itemt = %ld",item);
    if(item %3  == 0)
    {
        NSLog(@"%@年%02ld月收入",self.yearstr,item/3+1);
    }
    else if(item%3 == 1)
    {
        NSLog(@"%@年%02ld月支出",self.yearstr,item/3+1);
    }
    else
    {
        NSLog(@"%@年%02ld月结余",self.yearstr,item/3+1);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
