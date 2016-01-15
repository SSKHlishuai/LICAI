//
//  AddEventViewController.m
//  20151231
//
//  Created by analysys on 16/1/5.
//  Copyright © 2016年 analysys. All rights reserved.
//

#import "AddEventViewController.h"
#import "ManageTypeAddCell.h"
#import "LSKeyboard.h"
#import "CalendarViewFlowLayout.h"
#import "AddResultView.h"

#define ManageAddCellIdentify @"manageAddCellIdentify"

@interface AddEventViewController ()<LSKeyboardDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSInteger       buttonType;   //0是支出，1是收入
    
    UICollectionView *_myCollectionV;
    NSMutableArray  *_dataArray;
    NSMutableArray  *_chineseDataArray;
    UIView          *floorView;
    AddResultView   *addResultShow;
    NSMutableAttributedString *mutableStr;
    NSInteger   _currentSelectName;
    UILabel *_headDateLabel;

}


//@property (nonatomic, assign) NSInteger currentSelectName;
@end

@implementation AddEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [[NSMutableArray alloc]init];
    _chineseDataArray = [[NSMutableArray alloc]init];
    [self getPlistData];

    //[self InitilizeTF];
    [self addShowView];
    [self createNava];
    self.view.backgroundColor = [UIColor whiteColor];
    buttonType = 0;
    
    [self InitilizeFloorView];

    _currentSelectName = 0;
    // Do any additional setup after loading the view.
}
-(void)createNava
{
    
    _headDateLabel = [[UILabel alloc]initWithFrame:FRAME(80, 20, kScreenWidth-160, NavaStatusHeight-20)];
    _headDateLabel.textAlignment= NSTextAlignmentCenter;
    _headDateLabel.textColor = HexRGB(0xffffff);
    _headDateLabel.font = [UIFont systemFontOfSize:16.f];
    [self.headView addSubview:_headDateLabel];
    
    _headDateLabel.attributedText = [OCUtils getString:[NSString stringWithFormat:@"%@年%02d月%02d日",[NSString year:self.myDate],[[NSString month:self.myDate] intValue],[[NSString day:self.myDate] intValue]] withFrontColor:HexRGB(0xffffff) withBehindColor:HexRGB(0xffffff) withFrontLenth:8 withFrontFont:[UIFont systemFontOfSize:14.f] withBehindFont:[UIFont systemFontOfSize:20.f]];

}


-(void)addShowView
{
    
    __weak typeof(self) home = self;
    addResultShow = [[[NSBundle mainBundle]loadNibNamed:@"AddResultView" owner:self options:nil]lastObject];
    addResultShow.frame = FRAME(0, 74, kScreenWidth, 80);
    [self.view addSubview:addResultShow];
    addResultShow .myBlock = ^{
        [home showKeyboard];
    };
    
    addResultShow.countLabel.text = @"¥0.00";
    addResultShow.typeImage.image = IMAGE_NAMED(_dataArray[0]);
    addResultShow.typeNameLabel.text = _chineseDataArray[0];
    
}
-(void)InitilizeFloorView
{
    floorView = [[UIView alloc]initWithFrame:FRAME(0, kScreenHeight-400, kScreenWidth, 400)];
    floorView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:floorView];
    [self InitilizeCollectionView];
    LSKeyboard *keboard = [[[NSBundle mainBundle]loadNibNamed:@"LSKeyboard" owner:self options:nil]lastObject];
    keboard.frame = FRAME(0, 200, kScreenWidth, 200);
    keboard.lskeyboardDelegate=self;
    [floorView addSubview:keboard];
    
    
    
}

-(void)InitilizeCollectionView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    _myCollectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(0,0, kScreenWidth, 200) collectionViewLayout:flowLayout];
    _myCollectionV.backgroundColor = HexRGB(0xeeeeee);
    _myCollectionV.delegate = self;
    _myCollectionV.dataSource =self;
    [floorView addSubview:_myCollectionV];
    
    [_myCollectionV registerClass:[ManageTypeAddCell class] forCellWithReuseIdentifier:ManageAddCellIdentify];
    
}

-(void)getPlistData
{
   
    [_dataArray addObjectsFromArray:[OCUtils getImageName]];
    [_chineseDataArray addObjectsFromArray:[OCUtils getChineseName]];
    
}

#pragma mark - UICollectViewDelegate

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0f;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((kScreenWidth)/5, 200/4);
}

#pragma mark - UICollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count; 
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ManageTypeAddCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ManageAddCellIdentify forIndexPath:indexPath];
    cell.imageNameStr = _dataArray[indexPath.item];
    
    if(_currentSelectName == indexPath.row)
    {
        [cell setImageBGchangeColor];
    }
    else
    {
        [cell resetColor];
    }
    
    
    
    return cell;
    
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //lastSelect = currentSelect;
    _currentSelectName = indexPath.row;
    [_myCollectionV reloadData];
    addResultShow.typeImage.image = IMAGE_NAMED(_dataArray[_currentSelectName]);
    addResultShow.typeNameLabel.text = _chineseDataArray[_currentSelectName];
    
}






-(void)changeNumber:(NSString *)item
{
    addResultShow.countLabel.text = [NSString stringWithFormat:@"¥%@",item];
}
-(void)didFinish
{
    //存储到本地
    EventModel *model = [[EventModel alloc]init];
    model.createTime = [OCUtils getDateToDateStr:self.myDate];
    model.eventType = [NSString stringWithFormat:@"%ld",[addResultShow getPITag]];
    model.eventName = addResultShow.typeNameLabel.text;
    model.payCounts = [NSString stringWithFormat:@"%@",[addResultShow.countLabel.text substringFromIndex:1]];
    model.modelId = [NSString stringWithFormat:@"%ld",_currentSelectName];
    model.createyear = [NSString stringWithFormat:@"%@",[NSString year:self.myDate]];
    model.createmonth = [NSString stringWithFormat:@"%@",[NSString month:self.myDate]];
    model.createday = [NSString stringWithFormat:@"%@",[NSString day:self.myDate]];
    [CoreDataManager saveEvent:model];
    if(self.myBlock)
    {
        self.myBlock();
    }
    [self.navigationController popToRootViewControllerAnimated:YES];

}

-(void)showKeyboard
{
    
    [UIView beginAnimations:@"" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.5f];
    
    floorView.frame = FRAME(0, kScreenHeight-400, kScreenWidth, 400);
    
    
    [UIView commitAnimations];
}
-(void)hideKeyboard
{
    [UIView beginAnimations:@"" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.5f];
    
    floorView.frame = FRAME(0, kScreenHeight-200, kScreenWidth, 400);
    
    
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
