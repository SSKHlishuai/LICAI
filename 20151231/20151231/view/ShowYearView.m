//
//  ShowYearView.m
//  20151231
//
//  Created by analysys on 16/1/12.
//  Copyright © 2016年 analysys. All rights reserved.
//

#import "ShowYearView.h"

#define DefaultWidth    30.f

@interface ShowYearView ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView *myCollection;
}
@end

@implementation ShowYearView

-(instancetype)initWithFrame:(CGRect)frame
{
    self= [super initWithFrame:frame];
    if(self)
    {
        [self initilizeCollection];
        self.yearStr = @"2015";
    }
    return self;
}
-(void)initilizeCollection
{
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing=0;
    myCollection= [[UICollectionView alloc]initWithFrame:CGRectMake(DefaultWidth, DefaultWidth, kScreenWidth-DefaultWidth, self.height-DefaultWidth) collectionViewLayout:flowLayout];
    myCollection.layer.masksToBounds = YES;
    
    myCollection.backgroundColor = [UIColor clearColor];
    myCollection.delegate=self;
    myCollection.dataSource =self;
    myCollection.bounces = YES;
    [myCollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"showyearcollectionidentify"];
    [self addSubview:myCollection];

}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    //边框颜色
    CGContextRef  context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, HexRGB(0xd6f2fe).CGColor);
    
    CGContextFillRect(context, FRAME(0, 0, kScreenWidth, DefaultWidth));
    
    CGContextFillRect(context, FRAME(0, DefaultWidth, DefaultWidth, self.height-DefaultWidth));
    
    //斜线
    CGContextBeginPath(context);
    CGPoint point1 = CGPointMake(0, 0);
    CGContextSetStrokeColorWithColor(context, HexRGB(0xcccccc).CGColor);
    CGContextSetLineWidth(context, 0.5);
    CGContextMoveToPoint(context, point1.x, point1.y);
    CGContextAddLineToPoint(context, DefaultWidth, DefaultWidth);
    CGContextStrokePath(context);
    
    
    NSMutableParagraphStyle *parag = [[NSMutableParagraphStyle alloc]init];
    parag.alignment = NSTextAlignmentCenter;

    //收入，支出，结余

    UIImage *incomeIMG =IMAGE_NAMED(@"calendar_income");
    [incomeIMG drawInRect:FRAME(DefaultWidth+(kScreenWidth-DefaultWidth)/3-14.f-50, (DefaultWidth-14)/2.f, 14, 14)];
    [OCUtils draw:@"收入" frame:FRAME(DefaultWidth+(kScreenWidth-DefaultWidth)/3-50, (DefaultWidth-14)/2.f, DefaultWidth, DefaultWidth) color:IncomeColor bfont:12.f pargraph:parag];
    
    UIImage *payIMG =IMAGE_NAMED(@"calendar_pay");
    [payIMG drawInRect:FRAME(DefaultWidth+(kScreenWidth-DefaultWidth)/3*2-14.f-50, (DefaultWidth-14)/2.f, 14, 14)];
    [OCUtils draw:@"支出" frame:FRAME(DefaultWidth+(kScreenWidth-DefaultWidth)/3*2-50, (DefaultWidth-14)/2.f, DefaultWidth, DefaultWidth) color:PayColor bfont:12.f pargraph:parag];

    UIImage *balanceIMG =IMAGE_NAMED(@"calendar_balance");
    [balanceIMG drawInRect:FRAME(DefaultWidth+(kScreenWidth-DefaultWidth)-14.f-50, (DefaultWidth-14)/2.f, 14, 14)];
    [OCUtils draw:@"结余" frame:FRAME(DefaultWidth+(kScreenWidth-DefaultWidth)-50, (DefaultWidth-14)/2.f, DefaultWidth, DefaultWidth) color:HexRGB(0x2fc1ae) bfont:12.f pargraph:parag];


    for(int i=0;i<3;i++)
    {
        CGContextBeginPath(context);
        CGContextSetStrokeColorWithColor(context, HexRGB(0xcccccc).CGColor);
        CGContextSetLineWidth(context, 0.5);
        CGContextMoveToPoint(context, DefaultWidth+(kScreenWidth-DefaultWidth)/3*(i+1), DefaultWidth );
        CGContextAddLineToPoint(context, DefaultWidth+(kScreenWidth-DefaultWidth)/3*(i+1), self.height);
        CGContextStrokePath(context);
        

    }
    
    NSMutableArray *monthArray= [NSMutableArray array];
    for(int i=0;i<12;i++)
    {
        NSValue *value = [NSValue valueWithCGRect:FRAME(10, DefaultWidth + (self.height-DefaultWidth)/13.5f*i, DefaultWidth-20, (self.height-DefaultWidth)/13.5f)];
        [monthArray addObject:value];
        
        CGContextBeginPath(context);
        CGContextSetStrokeColorWithColor(context, HexRGB(0xcccccc).CGColor);
        CGContextSetLineWidth(context, 0.5);
        CGContextMoveToPoint(context, DefaultWidth, DefaultWidth + (self.height-DefaultWidth)/13.5f*(i+1));
        CGContextAddLineToPoint(context, kScreenWidth, DefaultWidth + (self.height-DefaultWidth)/13.5f*(i+1));
        CGContextStrokePath(context);

        
    }
    NSValue *value1 = [NSValue valueWithCGRect:FRAME(10, DefaultWidth + (self.height-DefaultWidth)/13.5f*12+20, DefaultWidth-20, (self.height-DefaultWidth)/13.5f*1.5-20)];
    [monthArray addObject:value1];
    NSArray *array1 = @[@"一月",@"二月",@"三月",@"四月",@"五月",@"六月",@"七月",@"八月",@"九月",@"十月",@"十一月",@"十二月",@"总结"];

    [OCUtils drawArrays:array1 withFrameArray:monthArray color:HexRGB(0x999999) font:10.f pargraph:parag];
    
    parag.alignment = NSTextAlignmentRight;
    float incomeAmout = 0.f , payAmount = 0.f, balanceAmount = 0.f;

    for(int i=0;i<12;i++)
    {
        NSString* income =[OCUtils getOnemonthIncomeWithyear:self.yearStr withMonth:[NSString stringWithFormat:@"%d",i+1]];
        [OCUtils draw:income frame:FRAME(DefaultWidth+1, DefaultWidth+1+(self.height-DefaultWidth)/13.5*i+(self.height-DefaultWidth)/13.5-2-18, (kScreenWidth-DefaultWidth)/3.f-2-10, 18) color:IncomeColor font:14.f pargraph:parag];
        incomeAmout += [income floatValue];
        
        NSString *pay = [OCUtils getOnemonthPayWithyear:self.yearStr withMonth:[NSString stringWithFormat:@"%d",i+1]];
        [OCUtils draw:pay frame:FRAME(DefaultWidth+1+(kScreenWidth-DefaultWidth)/3.f, DefaultWidth+1+(self.height-DefaultWidth)/13.5*i+(self.height-DefaultWidth)/13.5-2-18, (kScreenWidth-DefaultWidth)/3.f-2-10, 18) color:PayColor font:14.f pargraph:parag];
        payAmount += [pay floatValue];
        
        
        
        NSString *balance =[OCUtils getOnemonthBalanceWithyear:self.yearStr withMonth:[NSString stringWithFormat:@"%d",i+1]];
        [OCUtils draw:balance frame:FRAME(DefaultWidth+1+(kScreenWidth-DefaultWidth)/3.f*2, DefaultWidth+1+(self.height-DefaultWidth)/13.5*i+(self.height-DefaultWidth)/13.5-2-18, (kScreenWidth-DefaultWidth)/3.f-2-10, 18) color:HexRGB(0x2fc1ae) font:14.f pargraph:parag];
        balanceAmount += [balance floatValue];
    }
    
    [OCUtils draw:[NSString stringWithFormat:@"%.2f",incomeAmout] frame:FRAME(DefaultWidth+1, self.height-20.f, (kScreenWidth-DefaultWidth)/3.f-2-10, 18) color:IncomeColor font:14.f pargraph:parag];
    
    
    [OCUtils draw:[NSString stringWithFormat:@"%.2f",payAmount] frame:FRAME(DefaultWidth+1+(kScreenWidth-DefaultWidth)/3.f, self.height-20.f, (kScreenWidth-DefaultWidth)/3.f-2-10, 18) color:PayColor font:14.f pargraph:parag];
    
    [OCUtils draw:[NSString stringWithFormat:@"%.2f",balanceAmount] frame:FRAME(DefaultWidth+1+(kScreenWidth-DefaultWidth)/3.f*2, self.height-20.f, (kScreenWidth-DefaultWidth)/3.f-2-10, 18) color:HexRGB(0x2fc1ae) font:14.f pargraph:parag];

    
}

#pragma mark - UICollectionDelegate

#pragma mark - collectionView delegate

//设置分区
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

//每个分区上的元素个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 39;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * CellIdentifier = @"showyearcollectionidentify";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];

    return cell;
}



-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.showyearviewDelegate respondsToSelector:@selector(selectedRow:)])
    {
        [self.showyearviewDelegate selectedRow:indexPath.row];
    }
    NSLog(@"%d",indexPath.row);
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{

    if(indexPath.row<=35)
    {
        float height =(self.height-DefaultWidth)/13.5;
        float f =(kScreenWidth-DefaultWidth)/3.f;
        
        
        return CGSizeMake(floorf(f * 100)/100.f, height);

    }
    else
    {
        float height =(self.height-DefaultWidth)/13.5*1.5;
        float f =(kScreenWidth-DefaultWidth)/3.f;
        
        
        return CGSizeMake(floorf(f * 100)/100.f, height);
    }
}


@end
