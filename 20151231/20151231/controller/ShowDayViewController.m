//
//  ShowDayViewController.m
//  20151231
//
//  Created by analysys on 16/1/12.
//  Copyright © 2016年 analysys. All rights reserved.
//

#import "ShowDayViewController.h"
#import "ShowDetailCell.h"
@interface ShowDayViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *myTable;
    NSMutableArray *_dataArray;
    UILabel *_headDateLabel;
}
@end

@implementation ShowDayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNava];
    //[self InitilizeTable];
    // Do any additional setup after loading the view.
}



#pragma mark - InitilizeTable
-(void)createNava
{
    
    _headDateLabel = [[UILabel alloc]initWithFrame:FRAME(80, 20, kScreenWidth-160, NavaStatusHeight-20)];
    _headDateLabel.textAlignment= NSTextAlignmentCenter;
    _headDateLabel.textColor = HexRGB(0xffffff);
    _headDateLabel.font = [UIFont systemFontOfSize:16.f];
    [self.headView addSubview:_headDateLabel];
}
-(void)InitilizeTable
{
    myTable = [[UITableView alloc]initWithFrame:FRAME(0, NavaStatusHeight, kScreenWidth, kScreenHeight-NavaStatusHeight) style:UITableViewStylePlain];
    myTable.delegate=self;
    myTable.dataSource=self;
    myTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:myTable];
}

-(void)setSelectDate:(NSDate*)selectDate
{
    if(!_dataArray)
    {
        _dataArray = [[NSMutableArray alloc]init];
        [self InitilizeTable];
    }
    
    [_dataArray removeAllObjects];
    
    
    [_dataArray addObjectsFromArray:[CoreDataManager getOneDay:selectDate]];
    [myTable reloadData];
    _headDateLabel.attributedText = [OCUtils getString:[NSString stringWithFormat:@"%@年%02d月%02d日",[NSString year:selectDate],[[NSString month:selectDate] intValue],[[NSString day:selectDate] intValue]] withFrontColor:HexRGB(0xffffff) withBehindColor:HexRGB(0xffffff) withFrontLenth:8 withFrontFont:[UIFont systemFontOfSize:14.f] withBehindFont:[UIFont systemFontOfSize:20.f]];
}



#pragma mark - UITableViewDelegate && UITableViewDatasource

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentify = @"showCellidentify";
    ShowDetailCell *cell  =[tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if(!cell)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ShowDetailCell" owner:self options:nil]lastObject];
    }
    EventModel *model = [_dataArray objectAtIndex:indexPath.row];
    NSString *string =[NSString stringWithFormat:@"%@  %@",model.payCounts,model.eventName];
    cell.countANameLabel.attributedText = [OCUtils getString:string withFrontColor:HexRGB(0x333333) withBehindColor:HexRGB(0x999999) withFrontLenth:model.payCounts.length withFrontFont:Label_font(19.f) withBehindFont:Label_font(12.f)];
    int temp = 0;
    for(NSString *str in [OCUtils getChineseName])
    {
        if([str isEqualToString:model.eventName])
        {
            break;
        }
        temp++;
    }
    
    NSString *imagename =  [[OCUtils getImageName] objectAtIndex:temp];
    cell.eventImage.image = IMAGE_NAMED(imagename);
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65.f;
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
