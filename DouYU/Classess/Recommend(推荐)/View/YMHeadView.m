//
//  YMHeadView.m
//  DouYU
//
//  Created by cym_bj on 16/1/20.
//  Copyright © 2016年 com.cym. All rights reserved.
//

#import "YMHeadView.h"

@implementation YMHeadView
+(instancetype)headView
{
    return [[[NSBundle mainBundle]loadNibNamed:@"YMHeadView" owner:nil options:nil]lastObject];
}
@end
