//
//  YMData.m
//  DouYU
//
//  Created by cym_bj on 16/1/20.
//  Copyright © 2016年 com.cym. All rights reserved.
//

#import "YMData.h"
#import "YMRoomlist.h"

@implementation YMData
-(instancetype)initWithDict:(NSDictionary*)dict
{
    YMData *data=[[YMData alloc]init];
    data.title=dict[@"title"];
    data.cate_id=dict[@"cate_id"];
    
    
    NSArray *roomlist=dict[@"roomlist"];
    NSMutableArray *temp=[NSMutableArray array];
    for (NSDictionary *dict in roomlist)
    {
        YMRoomlist *roomlist=[YMRoomlist romlistWithDict:dict];
        [temp addObject:roomlist];
    }
    data.roomlist=temp;
    return data;
}
+(instancetype)dataWithDict:(NSDictionary*)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
