//
//  CalendarView.m
//  20151231
//
//  Created by analysys on 15/12/31.
//  Copyright © 2015年 analysys. All rights reserved.
//

#import "CalendarView.h"
#import "CollectionCell.h"

@interface CalendarView ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView* myCollection;
    
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
   
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];

    flowLayout.minimumLineSpacing = 1;
    flowLayout.minimumInteritemSpacing=1;
//    myCollection =[[UICollectionView alloc]init];
//    myCollection.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//    myCollection.collectionViewLayout = flowLayout;

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


-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionCell *cell = (CollectionCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    if(!cell)
    {
        cell = [[CollectionCell alloc]init];
    }
    cell.contentView.backgroundColor = [UIColor grayColor];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return CGSizeMake(self.frame.size.width/7.f-1, (self.frame.size.height-70)/6.f-1);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
