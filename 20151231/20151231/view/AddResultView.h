//
//  AddResultView.h
//  20151231
//
//  Created by analysys on 16/1/11.
//  Copyright © 2016年 analysys. All rights reserved.
//

#import <UIKit/UIKit.h>

enum
{
    ButtonIncomeTag = 0,
    ButtonPayTag = 1
};

typedef void(^showKeyBoard) (void);


@interface AddResultView : UIView
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *typeImage;
@property (weak, nonatomic) IBOutlet UIButton *typeButton;
@property (strong,nonatomic)showKeyBoard myBlock;


-(NSInteger)getPITag;

@end
