//
//  YMFirst.m
//  DouYU
//
//  Created by cym_bj on 16/1/21.
//  Copyright © 2016年 com.cym. All rights reserved.
//

#import "YMFirst.h"

@implementation YMFirst
-(instancetype)initWithDict:(NSDictionary*)dict
{
    YMFirst *first=[[YMFirst alloc]init];
    first.status=dict[@"status"];
    first.sort=dict[@"sort"];
    first.ctime=dict[@"ctime"];
    first.ID=dict[@"id"];
    first.admin=dict[@"admin"];
    first.push_ios=dict[@"push_ios"];
    first.push_android=dict[@"push_android"];
    first.mobile_switch=dict[@"mobile_switch"];
    first.related_id=dict[@"related_id"];
    first.name=dict[@"name"];
    first.url=dict[@"url"];
    
    
    return first;
}
+(instancetype)firstWithDict:(NSDictionary*)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
