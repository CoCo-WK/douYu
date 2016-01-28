//
//  YMRecomConmentCell.m
//  DouYU
//
//  Created by cym_bj on 16/1/21.
//  Copyright © 2016年 com.cym. All rights reserved.
//

#import "YMRecomConmentCell.h"
#import "UIImageView+WebCache.h"
#import "YMRoomlist.h"
@interface YMRecomConmentCell ()
@property (nonatomic,weak)IBOutlet UILabel *titleLB;
@property (nonatomic,weak)IBOutlet UIImageView *iconImageView;
@property (nonatomic,weak)IBOutlet UILabel *nicknameLB;
@property (nonatomic,weak)IBOutlet UIButton *onlineBtn;
@end
@implementation YMRecomConmentCell

- (void)awakeFromNib {
    
    
    self.onlineBtn.userInteractionEnabled=NO;
}
-(void)setRoomList:(YMRoomlist *)roomList
{
   
    _roomList=roomList;
    self.titleLB.text=roomList.room_name;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:roomList.room_src] placeholderImage:[UIImage imageNamed:@"Image_column_default"]];
    
    self.nicknameLB.text=roomList.nickname;
    NSString *onlineStr=nil;
    if (roomList.online>=10000)
    {
        CGFloat online=(CGFloat)roomList.online/10000;
        onlineStr=[NSString stringWithFormat:@"%.1f万",online];
    }
    else
    {
        onlineStr=[NSString stringWithFormat:@"%ld",(long)roomList.online];
    }
   
    [self.onlineBtn setTitle:onlineStr forState:UIControlStateNormal];
    
    
}

@end
