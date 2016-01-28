//
//  YMProgramaViewController.m
//  DouYU
//
//  Created by cym_bj on 16/1/20.
//  Copyright © 2016年 com.cym. All rights reserved.
//

#import "YMProgramaViewController.h"
#import "UIColor+YMHex.h"
#import "YMProgramaCell.h"
#import "NSString+Times.h"
#import "YMHttpTool.h"
#import "YMProgramList.h"


#define URL @"http://www.douyutv.com/api/v1/game?aid=ios&auth=3f252c3294b31a61fbdd890a45609549&client_sys=ios&time="
@interface YMProgramaViewController ()
@property (nonatomic,strong)NSMutableArray *programList;
@end

@implementation YMProgramaViewController

static NSString * const ProgramaViewCell = @"ProgramaViewCell";
-(NSMutableArray *)programList
{
    if (_programList==nil)
    {
        _programList=[NSMutableArray array];
    }
    return _programList;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.collectionView.backgroundColor=[UIColor colorWithHexString:@"eeeeee"];

   [self.collectionView registerNib:[UINib nibWithNibName:@"YMProgramaCell" bundle:nil] forCellWithReuseIdentifier:ProgramaViewCell];
    
     NSString *firstURL=[NSString stringWithFormat:@"%@%@",URL,[NSString GetNowTimes]];
    
    
    [YMHttpTool GET:firstURL parameters:nil success:^(id responseObject) {
        
        NSLog(@"%@",responseObject);
        
        NSArray *data=responseObject[@"data"];
        
        for (NSDictionary *dict in data)
        {
            YMProgramList *list=[YMProgramList programListDict:dict];
            [self.programList addObject:list];
        }
        [self.collectionView reloadData];
    } failure:^(NSError *error) {
        
    }];
    
    
    
    
}
-(instancetype)init
{
    UICollectionViewFlowLayout *flow=[[UICollectionViewFlowLayout alloc]init];
    
    CGFloat W=([UIScreen mainScreen].bounds.size.width-40)/3;
    CGFloat H=150;
    flow.sectionInset=UIEdgeInsetsMake(10, 10, 10, 10);
    flow.itemSize=CGSizeMake(W, H);
    
    return [self initWithCollectionViewLayout:flow];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.programList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YMProgramaCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ProgramaViewCell forIndexPath:indexPath];
    YMProgramList *list=self.programList[indexPath.item];
    cell.list=list;
    
    return cell;
}



@end
