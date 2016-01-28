//
//  YMFirstView.m
//  DouYU
//
//  Created by cym_bj on 16/1/21.
//  Copyright © 2016年 com.cym. All rights reserved.
//

#import "YMFirstView.h"
#import "YMFirst.h"
#import "UIImageView+WebCache.h"
@interface YMFirstView ()
@property (nonatomic,weak)IBOutlet UILabel *titleLB;
@property (nonatomic,weak)IBOutlet UIImageView *iconImageView;
@end
@implementation YMFirstView

+(instancetype)firstView
{
    return [[[NSBundle mainBundle]loadNibNamed:@"YMFirstView" owner:nil options:nil]lastObject];
}
-(void)awakeFromNib
{
    self.iconImageView.layer.cornerRadius=20;
    self.iconImageView.layer.masksToBounds=YES;
}
-(void)setFirst:(YMFirst *)first
{
    
    _first=first;
    
    self.titleLB.text=first.name;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:first.url] placeholderImage:[UIImage imageNamed:@"Image_column_default"]];
    
}

@end
