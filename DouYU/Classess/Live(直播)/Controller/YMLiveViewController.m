
//
//  YMLiveViewController.m
//  DouYU
//
//  Created by cym_bj on 16/1/20.
//  Copyright © 2016年 com.cym. All rights reserved.
//

#import "YMLiveViewController.h"
#import "YMHttpTool.h"
#import "NSString+Times.h"
#import "YMRoomlist.h"
#import "YMRecomConmentCell.h"
#import "UIColor+YMHex.h"
#import "MJRefresh.h"
@interface YMLiveViewController ()
{
    NSInteger offset;
}
/**
 *  列表数据
 */
@property (nonatomic,strong)NSMutableArray *lists;
@end

@implementation YMLiveViewController

static NSString * const liveCell = @"YMRecomConmentCell";
-(NSMutableArray *)lists
{
    if (_lists==nil)
    {
        _lists=[NSMutableArray array];
    }
    return _lists;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.collectionView.backgroundColor=[UIColor colorWithHexString:@"eeeeee"];
    
     [self.collectionView registerNib:[UINib nibWithNibName:@"YMRecomConmentCell" bundle:nil] forCellWithReuseIdentifier:liveCell];
    
   
    offset=0;
    
    self.collectionView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self.collectionView.mj_header beginRefreshing];
    self.collectionView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}
#pragma mark - 加载新数据
-(void)loadNewData
{
    
    offset=0;
    
    
    NSString *time=[NSString GetNowTimes];
    
    NSDictionary *parameters=@{@"offset":@(offset),@"time":time};
    
    // [NSString stringWithFormat:@"%@&offset=%@&time=%@",URL,URL_a,URL_b]
   
    [YMHttpTool GET:liveListURL parameters:parameters success:^(id responseObject) {
         [self.lists removeAllObjects];
        
        [self.collectionView.mj_header endRefreshing];
        NSArray *data=responseObject[@"data"];
        
        for (NSDictionary *dict in data)
        {
            YMRoomlist *room=[YMRoomlist romlistWithDict:dict];
            //NSLog(@"%@",room);
            [self.lists addObject:room];
            
        }
        [self.collectionView reloadData];
        
        
    } failure:^(NSError *error) {
         [self.collectionView.mj_header endRefreshing];
    }];

    
}
-(void)loadMoreData
{
    offset+=20;
    
    
    NSString *time=[NSString GetNowTimes];
    
    NSDictionary *parameters=@{@"offset":@(offset),@"time":time};
    
    // [NSString stringWithFormat:@"%@&offset=%@&time=%@",URL,URL_a,URL_b]
    
    [YMHttpTool GET:liveListURL parameters:parameters success:^(id responseObject) {
        
        [self.collectionView.mj_footer endRefreshing];
        NSArray *data=responseObject[@"data"];
        
        for (NSDictionary *dict in data)
        {
            YMRoomlist *room=[YMRoomlist romlistWithDict:dict];
            //NSLog(@"%@",room);
            [self.lists addObject:room];
            
        }
        [self.collectionView reloadData];
        
        
    } failure:^(NSError *error) {
         [self.collectionView.mj_header endRefreshing];
        
    }];

}

-(instancetype)init
{
    UICollectionViewFlowLayout *flow=[[UICollectionViewFlowLayout alloc]init];
    CGFloat w=([UIScreen mainScreen].bounds.size.width-30)/2;
    CGFloat h=110;
    flow.sectionInset=UIEdgeInsetsMake(10, 10,10,10);
    flow.itemSize=CGSizeMake(w, h);

    return [self initWithCollectionViewLayout:flow];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.lists.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    YMRecomConmentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:liveCell forIndexPath:indexPath];
    

    YMRoomlist *roomList=self.lists[indexPath.item];
   
    
    cell.roomList=roomList;
    return cell;

}



@end
