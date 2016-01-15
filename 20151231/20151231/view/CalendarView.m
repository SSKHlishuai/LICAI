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


-(instancetype)initWithFrame:(CGRect)frame withPostx:(NSInteger)postX withDate:(NSDate*)myDate
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self InitilizeCollectionView:postX withDate:myDate];
    }
    
    return self;
}


-(void)InitilizeCollectionView:(NSInteger)postX withDate:(NSDate*)myDate
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
    [myCollection registerClass:[CollectionCell class] forCellWithReuseIdentifier:@"CollectionCell"];
    [self addSubview:myCollection];
    
    currentSelectDate = myDate;
    firstDayPostx = postX;
    NSString *str = @"";
    str = [str nowMonthDays:currentSelectDate];
    monthDayCounts = [str integerValue];
    
    NSLog(@"firstDayPost = %ld,%@",firstDayPostx,currentSelectDate);

    [self InitilizeShowLabel];
    
    
}

-(void)reloadCurrentData
{
    [myCollection reloadData];
}



-(void)reloadCollectionData:(NSDate*)date withPost:(NSInteger)postX
{
    currentSelectDate = date;
    firstDayPostx = postX;//[CalendarHandle getFirstPostWithDate:currentSelectDate];
    NSLog(@"firstDayPost = %ld,%@",firstDayPostx,currentSelectDate);
    NSString *str = @"";
    str = [str nowMonthDays:currentSelectDate];
    monthDayCounts = [str integerValue];
    [myCollection reloadData];
}
-(void)InitilizeShowLabel
{
    
    UIImageView *image1 = [UIImageView imageviewWithFrame:FRAME(kScreenWidth/6.f-18, myCollection.bottom+10, 14, 14) withImage:IMAGE_NAMED(@"calendar_income")];
    [self addSubview:image1];
    
    UILabel *label1 = [UILabel labelWithFrame:FRAME(kScreenWidth/6.f, myCollection.bottom+8, kScreenWidth/6.f, 20) withTitle:@"收入" withBackground:HexRGB(0xffffff) withtextColor:IncomeColor withFont:[UIFont boldSystemFontOfSize:12.f] withAlignment:NSTextAlignmentLeft];
    [self addSubview:label1];
    
    
    UIImageView *image2 = [UIImageView imageviewWithFrame:FRAME(kScreenWidth/6.f-18+kScreenWidth/3.f, myCollection.bottom+10, 14, 14) withImage:IMAGE_NAMED(@"calendar_pay")];
    [self addSubview:image2];
    UILabel *label2 = [UILabel labelWithFrame:FRAME(kScreenWidth/3+kScreenWidth/6.f, myCollection.bottom+8, kScreenWidth/6.f, 20) withTitle:@"支出" withBackground:HexRGB(0xffffff) withtextColor:PayColor withFont:[UIFont boldSystemFontOfSize:12.f] withAlignment:NSTextAlignmentLeft];
    [self addSubview:label2];
    
    UIImageView *image3 = [UIImageView imageviewWithFrame:FRAME(kScreenWidth/6.f-18+kScreenWidth*2/3.f, myCollection.bottom+10, 14, 14) withImage:IMAGE_NAMED(@"calendar_balance")];
    [self addSubview:image3];
    UILabel *label3 = [UILabel labelWithFrame:FRAME(kScreenWidth*2/3+kScreenWidth/6.f, myCollection.bottom+8, kScreenWidth/6.f, 20) withTitle:@"结余" withBackground:HexRGB(0xffffff) withtextColor:HexRGB(0x2fc1ae) withFont:[UIFont boldSystemFontOfSize:12.f] withAlignment:NSTextAlignmentLeft];
    [self addSubview:label3];
    
    
    incomeCountLabel = [UILabel labelWithFrame:FRAME(0, label1.bottom, kScreenWidth/3.f, 30) withTitle:[OCUtils getOnemonthIncomeWithyear:[NSString year:currentSelectDate] withMonth:[NSString month:currentSelectDate]] withBackground:HexRGB(0xffffff) withtextColor:IncomeColor withFont:SYSTEM_FONT(16) withAlignment:NSTextAlignmentCenter];
    [self addSubview:incomeCountLabel];
    
    payCountLabel =[UILabel labelWithFrame:FRAME(kScreenWidth/3, label2.bottom, kScreenWidth/3.f, 30) withTitle:[OCUtils getOnemonthPayWithyear:[NSString year:currentSelectDate] withMonth:[NSString month:currentSelectDate]] withBackground:HexRGB(0xffffff) withtextColor:PayColor withFont:SYSTEM_FONT(16) withAlignment:NSTextAlignmentCenter];
    
    [self addSubview:payCountLabel];
    
    balanceCountLabel =[UILabel labelWithFrame:FRAME(kScreenWidth*2/3, label3.bottom, kScreenWidth/3.f, 30) withTitle:[OCUtils getOnemonthBalanceWithyear:[NSString year:currentSelectDate] withMonth:[NSString month:currentSelectDate]] withBackground:HexRGB(0xffffff) withtextColor:HexRGB(0x2fc1ae) withFont:SYSTEM_FONT(16) withAlignment:NSTextAlignmentCenter];
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
    
    if(firstDayPostx<(indexPath.item+2)&&(indexPath.item+2-firstDayPostx)<= monthDayCounts)
    {
        [cell setCellConfigWithDate:indexPath.item+2-firstDayPostx withEvent:[CoreDataManager getOneDay:[OCUtils getAfterDate:currentSelectDate withCount:indexPath.item+1-firstDayPostx]] withItem:indexPath.item];

//        NSLog(@"%d",indexPath.item+2-firstDayPostx)
    }
    else
    {
        [cell setnull];
    }


    return cell;
}



-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(firstDayPostx<(indexPath.item+2)&&(indexPath.item+2-firstDayPostx)<= monthDayCounts)
    {
        if([self.calendarViewDelegate respondsToSelector:@selector(tapEventView:)])
        {
            [self.calendarViewDelegate tapEventView:indexPath.item+2-firstDayPostx];
        }
    }
    
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NSInteger height =(self.frame.size.height-70)/6;
    float f =(self.frame.size.width)/7.f;
    
    
    return CGSizeMake(floorf(f * 100)/100.f, height);
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
