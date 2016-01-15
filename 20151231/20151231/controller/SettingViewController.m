//
//  SettingViewController.m
//  20151231
//
//  Created by analysys on 16/1/14.
//  Copyright © 2016年 analysys. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNava];
    // Do any additional setup after loading the view.
}

-(void)createNava
{
    UILabel *label1 = [[UILabel alloc]initWithFrame:FRAME(80, 20, kScreenWidth-160, NavaStatusHeight-20)];
    label1.textAlignment= NSTextAlignmentCenter;
    label1.textColor = HexRGB(0xffffff);
    label1.font = [UIFont systemFontOfSize:16.f];
    label1.text = @"设置";
    [self.headView addSubview:label1];
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
