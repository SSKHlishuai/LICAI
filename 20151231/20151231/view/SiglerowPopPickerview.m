//
//  SiglerowPopPickerview.m
//  WCProject
//
//  Created by mc on 15/8/5.
//  Copyright (c) 2015年 mc. All rights reserved.
//  弹出一个pickerview

#import "SiglerowPopPickerview.h"

#define SiglerowViewHeight  199.f

@interface SiglerowPopPickerview ()<UIPickerViewDataSource,UIPickerViewDelegate>
{
    UIControl       *_myControls;
    UIPickerView    *_pickerView;
    UIToolbar       *toobar;
    NSInteger       currentYear;
    NSInteger       currentMonth;

}
@end

@implementation SiglerowPopPickerview
{
    UIWindow *keywindow;

}

static SiglerowPopPickerview *_popView;

+(SiglerowPopPickerview*)shareInstance
{
    if(!_popView)
    {
        static dispatch_once_t token;
        dispatch_once(&token, ^{
            _popView = [[SiglerowPopPickerview alloc]initWithFrame:FRAME(0, kScreenHeight, kScreenWidth, SiglerowViewHeight)];
        });
        
    }
    return _popView;
}


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self InitilizeControls];
    }
    return self;
}

-(void)InitilizeControls
{
    
    _myControls = [[UIControl alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _myControls.backgroundColor = HexRGBA(0x111111, .5);
    keywindow = [[UIApplication sharedApplication]keyWindow];
    _pickerView = [[UIPickerView alloc]initWithFrame:FRAME(0, 44, kScreenWidth, 155.f)];
    _pickerView.delegate=self;
    _pickerView.backgroundColor = HexRGB(0xffffff);
    _pickerView.dataSource=self;
    
    
    toobar =  [[UIToolbar alloc]initWithFrame:FRAME(0, 0, kScreenWidth, 44)];
    toobar.backgroundColor = HexRGB(0xfafafa);
    UIButton *leftButton = [UIButton buttonWithFrame:FRAME(1, 0, 60, 44) withType:UIButtonTypeCustom withBackground:[UIColor clearColor]withTitle:@"取消" withTitleColor:HexRGB(0x6f7070) withFont:SYSTEM_FONT(14.f)];
    [leftButton addTarget:self action:@selector(controlClick:) forControlEvents:UIControlEventTouchUpInside];
    leftButton.tag = 333;
    UIButton *rightButton = [UIButton buttonWithFrame:FRAME(kScreenWidth-61.f, 0, 60, 44) withType:UIButtonTypeCustom withBackground:[UIColor clearColor]withTitle:@"确定" withTitleColor:HexRGB(0x6f7070) withFont:SYSTEM_FONT(14.f)];
    [rightButton addTarget:self action:@selector(controlClick:) forControlEvents:UIControlEventTouchUpInside];
    rightButton.tag = 444;
    [toobar addSubview:leftButton];
    [toobar addSubview:rightButton];
    [self addSubview:toobar];
    [self addSubview:_pickerView];
}


-(void)controlClick:(UIButton*)sender
{
    if(sender.tag == 333)
    {
        [[SiglerowPopPickerview shareInstance]hideView];

    }
    else
    {
        if([[[SiglerowPopPickerview shareInstance]delegate] respondsToSelector:@selector(didselect:withMonth:)])
        {
            [[SiglerowPopPickerview shareInstance]hideView];

            [[[SiglerowPopPickerview shareInstance]delegate] didselect:[NSString stringWithFormat:@"%ld",currentYear] withMonth:[NSString stringWithFormat:@"%02ld",currentMonth]];

        }
    }
}

-(void)showWithYear:(NSString *)year withMonth:(NSString *)month
{
    [keywindow addSubview:_myControls];
    [keywindow addSubview:[SiglerowPopPickerview shareInstance]];
    
    currentYear = [year integerValue];
    currentMonth = [month integerValue];
    [_pickerView reloadAllComponents];
    [_pickerView selectRow:currentYear-2010 inComponent:0 animated:YES];
    [_pickerView selectRow:currentMonth-1 inComponent:1 animated:year];
    
    [UIView animateWithDuration:.3f animations:^{
        [SiglerowPopPickerview shareInstance].top =kScreenHeight -SiglerowViewHeight;
    }];
}

-(void)hideView
{
    [UIView animateWithDuration:.3f animations:^{
        [SiglerowPopPickerview shareInstance].top =kScreenHeight;
    }completion:^(BOOL finished) {
        [[SiglerowPopPickerview shareInstance]removeFromSuperview];
        
        [_myControls removeFromSuperview];
    }];
    
   
    
}


#pragma mark - UIPickerViewDelegate && UIPickerViewDatasource
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component==0)
    {
        return 20;
    }
    else
    {
        return 12;
    }
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *dd;
    if(component==0)
    {
        dd = [NSString stringWithFormat:@"%ld年",2010+row];
    }
    else
    {
        dd = [NSString stringWithFormat:@"%ld月",row+1];
    }
    return dd;

}

//-(UIView*)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
//{
//    if (!view) {
//        view = [[UIView alloc] initWithFrame:FRAME(0, 0, kScreenWidth, 30.f)];
//        UILabel *label = [[UILabel alloc]initWithFrame:FRAME(0, 0, kScreenWidth, 30.f)];
//        label.font = SYSTEM_FONT(16.f);
//        label.textAlignment = NSTextAlignmentCenter;
//        label.tag = 1000;
//        label.textColor = HexRGB(0x898989);
//        [view addSubview:label];
//    }
//    UILabel *label = (UILabel*)[view viewWithTag:1000];
//    
//    if(component==0)
//    {
//        label.text = [NSString stringWithFormat:@"%ld",2000+row];
//    }
//    else
//    {
//        label.text = [NSString stringWithFormat:@"%ld",row+1];
//    }
//    
//    
//    return view;
//}
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 30.f;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component == 0)
    {
        currentYear = row+2010;
    }
    else
    {
        currentMonth = row+1;
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
