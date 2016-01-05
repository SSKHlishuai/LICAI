//
//  CalendarView.m
//  20151231
//
//  Created by analysys on 15/12/31.
//  Copyright © 2015年 analysys. All rights reserved.
//

#import "CalendarView.h"
#import "CollectionCell.h"

#import "CalendarViewFlowLayout.h"

#import "CalendarHandle.h"

@interface CalendarView ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,CollectionCellDelegate>
{
    UICollectionView* myCollection;
    NSDate      *currentSelectDate;     //当前显示的月份
    NSInteger   firstDayPostx;          //第一天是周几
    NSInteger   monthDayCounts;         //当前月份的天数
    UILabel     *payCountLabel;         //支出
    UILabel     *incomeCountLabel;      //收入
    UILabel     *balanceCountLabel;     //结余
    
}




@end

@implementation CalendarView


-(instancetype)init
{
    self = [super init];
    if(self)
    {
        
    }
    return self;
}


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self InitilizeCollectionView];
    }
    
    return self;
}


-(void)InitilizeCollectionView
{
    /*
     初始化UICollectionView相关信息,
     初始化UICollectionViewFlowLayout相关信息,
     minimumLineSpacing,minimumInteritemSpacing是处理科目框框之间的间距
     */
   
    CalendarViewFlowLayout *flowLayout=[[CalendarViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];

    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing=0;
    myCollection= [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-70) collectionViewLayout:flowLayout];
    myCollection.layer.masksToBounds = YES;

    myCollection.backgroundColor = [UIColor whiteColor];
    myCollection.delegate=self;
    myCollection.dataSource =self;
    myCollection.bounces = YES;
    
//    myCollection.scrollEnabled = YES;
    [myCollection registerClass:[CollectionCell class] forCellWithReuseIdentifier:@"CollectionCell"];
    [self addSubview:myCollection];
    
    currentSelectDate = [NSDate date];
    firstDayPostx = [CalendarHandle getFirstPostWithDate:currentSelectDate];
    NSString *str = @"";
    str = [str nowMonthDays:currentSelectDate];
    monthDayCounts = [str integerValue];
    
    [self InitilizeShowLabel];
    
    
}

-(void)InitilizeShowLabel
{
    UILabel *label1 = [UILabel labelWithFrame:FRAME(0, myCollection.bottom, kScreenWidth/3.f, 30) withTitle:@"收入" withBackground:HexRGB(0xffffff) withtextColor:IncomeColor withFont:SYSTEM_FONT(20.f) withAlignment:NSTextAlignmentCenter];
    [self addSubview:label1];
    
    
    UILabel *label2 = [UILabel labelWithFrame:FRAME(kScreenWidth/3, myCollection.bottom, kScreenWidth/3.f, 30) withTitle:@"支出" withBackground:HexRGB(0xffffff) withtextColor:PayColor withFont:SYSTEM_FONT(20.f) withAlignment:NSTextAlignmentCenter];
    [self addSubview:label2];
    
    UILabel *label3 = [UILabel labelWithFrame:FRAME(kScreenWidth*2/3, myCollection.bottom, kScreenWidth/3.f, 30) withTitle:@"结余" withBackground:HexRGB(0xffffff) withtextColor:HexRGB(0x2fad9f) withFont:SYSTEM_FONT(20.f) withAlignment:NSTextAlignmentCenter];
    [self addSubview:label3];
    
    
    incomeCountLabel = [UILabel labelWithFrame:FRAME(0, label1.bottom, kScreenWidth/3.f, 30) withTitle:@"0.00" withBackground:HexRGB(0xffffff) withtextColor:IncomeColor withFont:SYSTEM_FONT(20.f) withAlignment:NSTextAlignmentCenter];
    [self addSubview:incomeCountLabel];
    
    payCountLabel =[UILabel labelWithFrame:FRAME(kScreenWidth/3, label2.bottom, kScreenWidth/3.f, 30) withTitle:@"0.00" withBackground:HexRGB(0xffffff) withtextColor:PayColor withFont:SYSTEM_FONT(20.f) withAlignment:NSTextAlignmentCenter];
    
    [self addSubview:payCountLabel];
    
    balanceCountLabel =[UILabel labelWithFrame:FRAME(kScreenWidth*2/3, label3.bottom, kScreenWidth/3.f, 30) withTitle:@"0.00" withBackground:HexRGB(0xffffff) withtextColor:HexRGB(0x2fad9f) withFont:SYSTEM_FONT(20.f) withAlignment:NSTextAlignmentCenter];
    [self addSubview:balanceCountLabel];
    
}


#pragma Setting Function

-(void)setPayCountStr:(NSString *)payCountStr
{
    payCountLabel.text=payCountStr;
}

-(void)setIncomeCountStr:(NSString *)incomeCountStr
{
    incomeCountLabel.text = incomeCountStr;
}
-(void)setBalanceCountStr:(NSString *)balanceCountStr
{
    balanceCountLabel.text = balanceCountStr;
}

#pragma mark - collectionView delegate

//设置分区
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

//每个分区上的元素个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 42;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * CellIdentifier = @"CollectionCell";
    CollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.collectionCellDelegate=self;
    cell.contentView.layer.borderWidth=0.5;
    cell.contentView.layer.borderColor=  HexRGB(0xbfe4e1).CGColor;

    if(indexPath.item>=35)
    {
        UIView *line = [UIView viewWithFrame:FRAME(0, cell.height-1, cell.width, 0.5) withBackground:HexRGB(0xbfe4e1)];
        [cell.contentView addSubview:line];
    }
    
    if(firstDayPostx<(indexPath.item+2)&&(indexPath.item+2-firstDayPostx)<= monthDayCounts)
    {
        [cell setCellConfigWithDate:indexPath.item+2-firstDayPostx withEvent:nil withItem:indexPath.item];

    }
    else
    {
        
    }


    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return CGSizeMake((self.frame.size.width)/7.f, (self.frame.size.height-70)/6.f);
}



-(void)longgestureEvent:(NSInteger)item withView:(UIView *)bgview
{
    if([self.calendarViewDelegate respondsToSelector:@selector(longgestureEventView:withBGView:)])
    {
        [self.calendarViewDelegate longgestureEventView:item withBGView:bgview];
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
