//
//  AddEventViewController.m
//  20151231
//
//  Created by analysys on 16/1/5.
//  Copyright © 2016年 analysys. All rights reserved.
//

#import "AddEventViewController.h"

@interface AddEventViewController ()
{
    UITextField     *moneyCountTF;
    UITextField     *eventNameTF;
    NSInteger       buttonType;   //0是支出，1是收入
}
@end

@implementation AddEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self InitilizeTF];
    [self createNav];
    self.view.backgroundColor = [UIColor whiteColor];
    buttonType = 0;
    
    // Do any additional setup after loading the view.
}


-(void)InitilizeTF
{
    moneyCountTF = [UITextField textfieldWithFrame:FRAME(0 , NavaStatusHeight + 10, kScreenWidth-100  , 44) withTextColor:[UIColor redColor] withPlaceholder:@"0.00" withFont:[UIFont systemFontOfSize:14]];
    moneyCountTF.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:moneyCountTF];
    
    
    eventNameTF = [UITextField textfieldWithFrame:FRAME(0 , moneyCountTF.bottom, kScreenWidth   , 44) withTextColor:[UIColor blackColor] withPlaceholder:@"购物" withFont:[UIFont systemFontOfSize:14]];
    [self.view addSubview:eventNameTF];
    
    
    UIButton *typeButton = [UIButton buttonWithFrame:FRAME(kScreenWidth-100, moneyCountTF.top+10, 60, 24) withType:UIButtonTypeCustom withBackground:[UIColor redColor] withTitle:@"支出" withTitleColor:HexRGB(0xffffff) withFont:Label_font(14.f)];
    [typeButton addTarget:self action:@selector(typeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:typeButton];
    
    
    
    
    
}


-(void)createNav
{
    UIButton *rightButton = [UIButton buttonWithFrame:FRAME(kScreenWidth-100, 20, 60, 44) withType:UIButtonTypeCustom withBackground:[UIColor whiteColor]];
    [rightButton addTarget:self action:@selector(doneClick) forControlEvents:UIControlEventTouchUpInside];
    [self.headView addSubview:rightButton];
}


-(void)doneClick
{
    //存储到本地
    EventModel *model = [[EventModel alloc]init];
    model.createTime = [NSDate date];
    model.eventType = [NSString stringWithFormat:@"%ld",buttonType];
    model.eventName = eventNameTF.text;
    model.payCounts = [NSString stringWithFormat:@"%@",moneyCountTF.text];
    
    [CoreDataManager saveEvent:model];
    
    
    
    
}
-(void)typeBtnClick:(UIButton*)button
{
    if(buttonType == 0)
    {
        [button setTitle:@"收入" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor greenColor];
        buttonType =1;
        
    }
    else
    {
        [button setTitle:@"支出 " forState:UIControlStateNormal];
        button.backgroundColor = [UIColor redColor];
        buttonType = 0;
    }
    NSLog(@"%@",[CoreDataManager getAllEvent]);
    [CoreDataManager getAllEvent];
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
