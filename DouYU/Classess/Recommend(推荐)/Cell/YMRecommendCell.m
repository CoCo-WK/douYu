
//
//  YMRecommendCell.m
//  DouYU
//
//  Created by cym_bj on 16/1/20.
//  Copyright © 2016年 com.cym. All rights reserved.
//

#import "YMRecommendCell.h"
#import "YMRecomConmentCell.h"
#import "UIColor+YMHex.h"
#import "YMData.h"
@interface YMRecommendCell ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSArray *roomList;
@end
static NSString * const comConmentCell = @"YMRecomConmentCell";
@implementation YMRecommendCell

- (void)awakeFromNib {
  
    
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier])
    {
        UICollectionViewFlowLayout *flow=[[UICollectionViewFlowLayout alloc]init];
        CGFloat w=([UIScreen mainScreen].bounds.size.width-30)/2;
        CGFloat h=110;
        flow.sectionInset=UIEdgeInsetsMake(10, 10,10,10);
        flow.itemSize=CGSizeMake(w, h);
        self.collectionView=[[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flow];
        self.collectionView.dataSource=self;
        self.collectionView.delegate=self;
        [self.contentView addSubview:self.collectionView];
    
        self.collectionView.backgroundColor=[UIColor colorWithHexString:@"eeeeee"];
        
        [self.collectionView registerNib:[UINib nibWithNibName:@"YMRecomConmentCell" bundle:nil] forCellWithReuseIdentifier:comConmentCell];
        
    }
    
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
    
}
-(void)setData:(YMData *)data
{
    _data=data;
    self.roomList=data.roomlist;
    [self.collectionView reloadData];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.collectionView.frame=self.bounds;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.roomList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    YMRecomConmentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:comConmentCell forIndexPath:indexPath];
    
    cell.roomList=self.roomList[indexPath.item];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
