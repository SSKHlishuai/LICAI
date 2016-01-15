//
//  AddResultView.m
//  20151231
//
//  Created by analysys on 16/1/11.
//  Copyright © 2016年 analysys. All rights reserved.
//

#import "AddResultView.h"



@interface AddResultView ()
{
    NSInteger   PITag;
}
@end
@implementation AddResultView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)ShowKeyBoard:(id)sender {
    if(self.myBlock)
    {
        self.myBlock();
    }
}
- (IBAction)changeBtntype:(UIButton*)sender {
    if([sender.backgroundColor isEqual:PayColor])
    {
        sender.backgroundColor = IncomeColor;
        [sender setTitle:@"收入" forState:UIControlStateNormal];
        self.countLabel.textColor = IncomeColor;
        PITag = ButtonIncomeTag;
    }
    else
    {
        sender.backgroundColor = PayColor;
        [sender setTitle:@"支出" forState:UIControlStateNormal];
        self.countLabel.textColor = PayColor;
        PITag = ButtonPayTag;
    }
}



-(void)awakeFromNib
{
    self.layer.borderColor = [HexRGB(0xcccccc)CGColor];
    self.layer.borderWidth = 1.f;
//    self.typeNameLabel.textColor = PayColor;
    self.countLabel.textColor = PayColor;
    self.typeButton.backgroundColor = PayColor;
    
    UIView *lineview = [UIView viewWithFrame:FRAME(0, 39, self.width, 1.f) withBackground:HexRGB(0xcccccc)];
    [self addSubview:lineview];
    
    PITag = ButtonPayTag;
}

-(NSInteger)getPITag
{
    return PITag;
}

@end
