//
//  YMRoomlist.h
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
#import <Foundation/Foundation.h>

@interface YMRoomlist : NSObject

@property (nonatomic,copy)NSString *room_id;
@property (nonatomic,copy)NSString *subject;
@property (nonatomic,copy)NSString *vod_quality;
@property (nonatomic,assign)NSInteger online;
@property (nonatomic,copy)NSString *game_name;
@property (nonatomic,copy)NSString *room_name;
@property (nonatomic,copy)NSString *specific_catalog;
@property (nonatomic,copy)NSString *show_time;
@property (nonatomic,copy)NSString *show_status;
@property (nonatomic,copy)NSString *url;
@property (nonatomic,copy)NSString *child_id;
@property (nonatomic,copy)NSString *game_url;
@property (nonatomic,copy)NSString *specific_status;
@property (nonatomic,copy)NSString *owner_uid;
@property (nonatomic,copy)NSString *room_src;
@property (nonatomic,copy)NSString *nickname;
@property (nonatomic,copy)NSString *cate_id;
-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)romlistWithDict:(NSDictionary*)dict;


@end
