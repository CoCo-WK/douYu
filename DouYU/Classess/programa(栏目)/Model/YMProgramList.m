//
//  YMProgramList.m
//  DouYU
//
//  Created by cym_bj on 16/1/22.
//  Copyright © 2016年 com.cym. All rights reserved.
//
/*
 
 cate_id = "1",
 game_url = "/directory/game/LOL",
 game_name = "英雄联盟",
 game_icon = "http://staticlive.douyutv.com/upload/game_cate/8edf7d73a5643356721e1c18a84e06d8.jpg",
 game_src = "http://staticlive.douyutv.com/upload/game_cate/c543faae97189c529c37b7741906d5a1.jpg",
 short_name = "LOL",
 online_room = "617",
 online_room_ios = "77",
 
 */
#import "YMProgramList.h"

@implementation YMProgramList
-(instancetype)initWithDict:(NSDictionary*)dict
{
    YMProgramList *list=[[YMProgramList alloc]init];
    list.cate_id=dict[@"cate_id"];
    list.game_url=dict[@"game_url"];
    list.game_name=dict[@"game_name"];
    list.game_icon=dict[@"game_icon"];
    list.game_src=dict[@"game_src"];
    list.short_name=dict[@"short_name"];
    list.online_room=dict[@"online_room_ios"];
    
    return list;
}
+(instancetype)programListDict:(NSDictionary*)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
