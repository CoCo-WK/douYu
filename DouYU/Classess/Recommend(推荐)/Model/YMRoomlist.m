//
//  YMRoomlist.m
//  DouYU
//
//  Created by cym_bj on 16/1/21.
//  Copyright © 2016年 com.cym. All rights reserved.
//
/*
 
 
 
 room_id = "316336",
 subject = "",
 vod_quality = "0",
 online = 146609,
 game_name = "英雄联盟",
 room_name = "回国服前10，直播排队",
 specific_catalog = "",
 show_time = "1453333956",
 show_status = "1",
 url = "/316336",
 child_id = "28",
 game_url = "/directory/game/LOL",
 specific_status = "0",
 owner_uid = "20142797",
 room_src = "http://staticlive.douyutv.com/upload/web_pic/201601/6/316336_1601210954_thumb.jpg",
 nickname = "吾单丶丶丶",
 cate_id = "1",
 
 */

#import "YMRoomlist.h"

@implementation YMRoomlist
-(instancetype)initWithDict:(NSDictionary*)dict
{
    YMRoomlist *roomlist=[[YMRoomlist alloc]init];
    roomlist.room_id=dict[@"room_id"];
    roomlist.subject=dict[@"subject"];
    roomlist.vod_quality=dict[@"vod_quality"];
    roomlist.online=[dict[@"online"]integerValue];
    roomlist.game_name=dict[@"game_name"];
    roomlist.specific_catalog=dict[@"specific_catalog"];
    roomlist.show_time=dict[@"show_time"];
    roomlist.show_status=dict[@"show_status"];
    roomlist.url=dict[@"url"];
    roomlist.game_url=dict[@"game_url"];
    roomlist.specific_status=dict[@"specific_status"];
    roomlist.owner_uid=dict[@"owner_uid"];
    roomlist.room_src=dict[@"room_src"];
    roomlist.room_id=dict[@"room_id"];
    roomlist.nickname=dict[@"nickname"];
    roomlist.cate_id=dict[@"cate_id"];
    roomlist.room_name=dict[@"room_name"];
    
    return roomlist;
}
+(instancetype)romlistWithDict:(NSDictionary*)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
