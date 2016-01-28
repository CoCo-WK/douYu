//
//  YMProgramaCell.m
//  DouYU
//
//  Created by cym_bj on 16/1/22.
//  Copyright © 2016年 com.cym. All rights reserved.
//

#import "YMProgramaCell.h"
#import "YMProgramList.h"
#import "UIImageView+WebCache.h"
@interface YMProgramaCell ()
@property (nonatomic,weak)IBOutlet UIImageView *iconImageView;
@property (nonatomic,weak)IBOutlet UILabel *titleLB;
@end
@implementation YMProgramaCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setList:(YMProgramList *)list
{
    _list=list;
    NSLog(@"%@",list.game_src);
    NSString *imageName=list.game_src;
    imageName=[imageName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:[UIImage imageNamed:@"Image_column_default"]];
    self.titleLB.text=list.game_name;
    
}
@end
