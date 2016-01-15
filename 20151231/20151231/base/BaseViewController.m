//
//  BaseViewController.m
//  WCProject
//
//  Created by mc on 15/7/21.
//  Copyright (c) 2015年 mc. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
{
    UILabel *middleLabel;
    UIButton *backButton;
    UIImageView *_nodataImage;
    UILabel     *_nodataLabel;
}
@end

@implementation BaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.isLoading = NO;
    self.view.backgroundColor = HexRGB(0xffffff);
    self.navigationController.navigationBar.hidden=YES;
    [self InitilizeNav];

    // Do any additional setup after loading the view.
}

-(void)Initilize
{
    
}

-(void)InitilizeNav
{
    self.headView = [[UIImageView alloc]initWithFrame:FRAME(0, 0, kScreenWidth, 64)];
    _headView.backgroundColor = IncomeColor;
    _headView.userInteractionEnabled = YES;
    [self.view addSubview:_headView];
    middleLabel = [[UILabel alloc]initWithFrame:FRAME(kScreenWidth/4, 20, kScreenWidth/2, 44)];
    middleLabel.textAlignment = NSTextAlignmentCenter;
    middleLabel.font = SYSTEM_FONT(16.f);
    middleLabel.textColor = HexRGB(0xffffff);
    [_headView addSubview:middleLabel];
    
    backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = FRAME(0, 20, kScreenWidth/4, 44);
    [backButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [_headView addSubview:backButton];
    
    UIImageView *backimagev = [[UIImageView alloc]initWithFrame:FRAME(10, 11, 23,23.f )];
    backimagev.contentMode = UIViewContentModeScaleAspectFit;
    backimagev.image = IMAGE_NAMED(@"back_arrow");
    [backButton addSubview:backimagev];
    
    
    UIImage *nodataimage = IMAGE_NAMED(@"nodataimage");
    _nodataImage = [UIImageView imageviewWithFrame:FRAME((kScreenWidth-nodataimage.size.width)/2.f, (kScreenHeight-nodataimage.size.height)/2.f, nodataimage.size.width, nodataimage.size.height) withImage:nodataimage];
    
    _nodataLabel = [UILabel labelWithFrame:FRAME(10, _nodataImage.bottom + 10.f, kScreenWidth-20.f, 15.f) withTitle:@"" withBackground:[UIColor clearColor] withtextColor:HexRGB(0x565757) withFont:SYSTEM_FONT(14.f) withAlignment:NSTextAlignmentCenter];
    
    
}

-(void)setNodata:(NSString *)nodatastring
{
    _nodataLabel.text = nodatastring;
    [self.view addSubview:_nodataImage];
    [self.view addSubview:_nodataLabel];
}

-(void)hideNodata
{
    [_nodataLabel removeFromSuperview];
    [_nodataImage removeFromSuperview];


}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

-(void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)setMiddleTitle:(NSString *)middleTitle
{
    middleLabel.text = middleTitle;
}
-(void)hideBackbutton
{
    backButton.hidden = YES;
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
