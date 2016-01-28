//
//  YMRecommendViewController.m
//  DouYU
//
//  Created by cym_bj on 16/1/20.
//  Copyright © 2016年 com.cym. All rights reserved.
//

#import "YMRecommendViewController.h"
#import "YMHttpTool.h"
#import "NSString+Times.h"
#import "YMData.h"
#import "YMHeadView.h"
#import "YMRecommendCell.h"
#import "UIColor+YMHex.h"
#import "YMFirst.h"
#import "YMFirstCell.h"
#import "SDCycleScrollView.h"
#import "YMscrollData.h"
#import "YMPlayViewController.h"
@interface YMRecommendViewController ()<SDCycleScrollViewDelegate>
/**
 *  其它cell的数据
 */
@property (nonatomic,strong)NSMutableArray *datas;
/**
 *  第一行cell的数据
 */
@property (nonatomic,strong)NSMutableArray *firstDatas;
/**
 *  轮播图
 */
@property (nonatomic,strong)SDCycleScrollView *scrollView;
/**
 *  轮播图片
 */
@property (nonatomic,strong)NSMutableArray *scrollImages;
/**
 *  轮播标题
 */
@property (nonatomic,strong)NSMutableArray *scrolltitles;
/**
 *  轮播图数据
 */
@property (nonatomic,strong)NSMutableArray *scrollDatas;

@end

@implementation YMRecommendViewController

-(NSMutableArray *)scrollImages
{
    if (_scrollImages==nil)
    {
        _scrollImages=[NSMutableArray array];
    }
    return _scrollImages;
}
-(NSMutableArray *)scrolltitles
{
    if (_scrolltitles==nil)
    {
        _scrolltitles=[NSMutableArray array];
    }
    return _scrolltitles;
}
-(NSMutableArray *)scrollDatas
{
    if (_scrollDatas==nil)
    {
        _scrollDatas=[NSMutableArray array];
    }
    return _scrollDatas;
}
-(NSMutableArray *)datas
{
    if (_datas==nil)
    {
        _datas=[NSMutableArray array];
    }
    return _datas;
}
-(NSMutableArray *)firstDatas
{
    if (_firstDatas==nil)
    {
        _firstDatas=[NSMutableArray array];
    }
    return _firstDatas;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor=[UIColor colorWithHexString:@"eeeeee"];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    // 1、设置导航
    [self setNavigation];
    
    
    //2、轮播图
    self.scrollView=[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 150) delegate:self placeholderImage:[UIImage imageNamed:@"Image_column_default"]];
    self.scrollView.pageControlAliment=SDCycleScrollViewPageContolAlimentRight;
    self.scrollView.currentPageDotColor=[UIColor orangeColor];
    
    self.tableView.tableHeaderView=self.scrollView;
    
    //3、加载数据
    [self loadData];
    

}
#pragma mark - 设置导航
-(void)setNavigation
{
    
    // 1、左
    
    
    // 2、标题
    
    UIImageView *loginView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo"]];
    self.navigationItem.titleView=loginView;
    
    //3、右
    
    
    
    
    
}
#pragma mark - 加载数据
-(void)loadData
{
    
    //1、轮播图数据
    NSDictionary *parameteiDic=@{@"aid":@"ios",@"auth":@"97d9e4d3e9dfab80321d11df5777a107",@"client_sys":@"ios",@"time":[NSString GetNowTimes]};
    [YMHttpTool GET:TOP_URl parameters:parameteiDic success:^(id responseObject) {
        
        
        NSArray *data=responseObject[@"data"];
        for (NSDictionary *dict in data)
        {
            YMscrollData *data=[YMscrollData scrollDataWithDict:dict];
            
            [self.scrollDatas addObject:data];
            [self.scrollImages addObject:data.pic_url];
            [self.scrolltitles addObject:data.title];
        }
        
        self.scrollView.imageURLStringsGroup=self.scrollImages;
        self.scrollView.titlesGroup=self.scrolltitles;
        
        
        
        
    } failure:^(NSError *error) {
        
    }];
    
    
    //2、
    //第一行 uiscrollview 的内容
    NSString *firstURL=[NSString stringWithFormat:@"%@%@",first_URL,[NSString GetNowTimes]];
   // NSLog(@"%@",firstURL);
    [YMHttpTool GET:firstURL parameters:nil success:^(id responseObject) {
        
        
        
        NSArray *result=responseObject[@"data"][@"result"];
        
        for (NSDictionary *dict in result)
        {
            YMFirst *first=[YMFirst firstWithDict:dict];
            
            [self.firstDatas addObject:first];
        }
        
        NSIndexPath *index=[NSIndexPath indexPathForRow:0 inSection:0];//刷新
        [self.tableView reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationNone];
        
        
        
    } failure:^(NSError *error) {
        
    }];
    
    
    // 3、
    // 其它cell的内容
    NSString *url=[NSString stringWithFormat:@"%@%@",CHANEL_URl,[NSString GetNowTimes]];
    [YMHttpTool GET:url parameters:nil success:^(NSDictionary * responseObject) {
        
        //NSLog(@"%@",responseObject);
        
        NSArray *data=responseObject[@"data"];
        for (NSDictionary *dict in data)
        {
            YMData *data=[YMData dataWithDict:dict];
            [self.datas addObject:data];
        }
        [self.tableView reloadData];
        
        
    } failure:^(NSError *error) {
        
    }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.datas.count+1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==0)
    {
        return nil;
    }
    
    
    YMHeadView *headView=[YMHeadView headView];
    headView.bounds=CGRectMake(0, 0, self.view.bounds.size.width, 30);
    YMData *data=self.datas[section-1];
    headView.titleLB.text=data.title;
    return headView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0)
    {
        return 0;
    }
    else
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        
        return 110;
    }
    else
    return 250;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.section==0)
    {
        static NSString *ID=@"first";
        YMFirstCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
        if (cell==nil)
        {
            cell=[[YMFirstCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
       
        cell.firstData=self.firstDatas;
        
        return cell;
    }
    else
    {
        
        static NSString *ID=@"YMRecommendCell";
        YMRecommendCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
        if (cell==nil)
        {
            cell=[[YMRecommendCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        
        cell.data=self.datas[indexPath.section-1];
        
            return cell;
        
    }
    
    
    
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"%ld",index);
    
    YMPlayViewController *playVC=[[YMPlayViewController alloc]init];
    
    [playVC setHidesBottomBarWhenPushed:YES];
   
    [self.navigationController pushViewController:playVC animated:YES];
    
    
}
@end
