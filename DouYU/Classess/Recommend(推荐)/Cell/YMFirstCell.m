//
//  YMFirstCell.m
//  DouYU
//
//  Created by cym_bj on 16/1/21.
//  Copyright © 2016年 com.cym. All rights reserved.
//

#import "YMFirstCell.h"
#import "YMFirst.h"
#import "YMFirstView.h"
@interface YMFirstCell ()
@property (nonatomic,strong)UIScrollView *scrollView;
@end
@implementation YMFirstCell

- (void)awakeFromNib {
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self==[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        
        self.scrollView=[[UIScrollView alloc]init];
        self.scrollView.frame=CGRectMake(0, 0, self.bounds.size.width, 110);
        self.scrollView.backgroundColor=[UIColor whiteColor];
        self.scrollView.showsHorizontalScrollIndicator=NO;
        self.scrollView.showsVerticalScrollIndicator=NO;
        self.scrollView.bounces=NO;
       [self.contentView addSubview:self.scrollView];
    
    }
    return self;
}
-(void)setFirstData:(NSArray *)firstData
{
    _firstData=firstData;
    
    NSInteger count=firstData.count;
   
    
    CGFloat H=110;
    CGFloat W=self.bounds.size.width/3;
    CGFloat Y=0;
    CGFloat X=0;
    for (int i=0; i<count; i++)
    {
        
        YMFirstView *firstView=[YMFirstView firstView];
        X=W*i;
       
        firstView.frame=CGRectMake(X, Y, W, H);
        firstView.first=self.firstData[i];
        [self.scrollView addSubview:firstView];
        
        
    }
    self.scrollView.contentSize=CGSizeMake(W*count, 0);
    
    
    
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
