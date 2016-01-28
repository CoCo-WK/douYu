
//
//  YMscrollData.m
//  DouYU
//
//  Created by cym_bj on 16/1/21.
//  Copyright © 2016年 com.cym. All rights reserved.
//

#import "YMscrollData.h"

@implementation YMscrollData
-(instancetype)initWithDict:(NSDictionary*)dict
{
    YMscrollData *scrollData=[[YMscrollData alloc]init];
    scrollData.ID=[NSString stringWithFormat:@"%@",dict[@"id"]];
    scrollData.title=dict[@"title"];
    scrollData.pic_url=dict[@"pic_url"];
    
    return scrollData;
}
+(instancetype)scrollDataWithDict:(NSDictionary*)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
