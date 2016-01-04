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

@interface CalendarView ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView* myCollection;
    NSDate      *currentSelectDate;     //当前显示的月份
    NSInteger   firstDayPostx;          //第一天是周几
    NSInteger   monthDayCounts;         //当前月份的天数
    
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
    myCollection= [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:flowLayout];
    myCollection.layer.masksToBounds = NO;
    myCollection.layer.cornerRadius = 5;
    myCollection.backgroundColor = [UIColor clearColor];
    myCollection.delegate=self;
    myCollection.dataSource =self;
    myCollection.bounces = NO;
    
    myCollection.scrollEnabled = YES;
    [myCollection registerClass:[CollectionCell class] forCellWithReuseIdentifier:@"CollectionCell"];
    [self addSubview:myCollection];
    
    currentSelectDate = [NSDate date];
    firstDayPostx = [CalendarHandle getFirstPostWithDate:currentSelectDate];
    NSString *str = @"";
    str = [str nowMonthDays:currentSelectDate];
    monthDayCounts = [str integerValue];
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
    cell.contentView.layer.borderWidth=0.5;
    cell.contentView.layer.borderColor=  HexRGB(0xbfe4e1).CGColor;

    
    if(firstDayPostx<(indexPath.item+2)&&(indexPath.item+2-firstDayPostx)<= monthDayCounts)
    {
        [cell setCellConfigWithDate:indexPath.item+2-firstDayPostx withEvent:nil];

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


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
