//
//  YMProgramList.h
//  DouYU
//
//  Created by cym_bj on 16/1/22.
//  Copyright © 2016年 com.cym. All rights reserved.
//

#import <Foundation/Foundation.h>
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
@interface YMProgramList : NSObject
@property (nonatomic,copy)NSString *cate_id;
@property (nonatomic,copy)NSString *game_url;
@property (nonatomic,copy)NSString *game_name;
@property (nonatomic,copy)NSString *game_icon;
@property (nonatomic,copy)NSString *game_src;
@property (nonatomic,copy)NSString *short_name;
@property (nonatomic,copy)NSString *online_room;
@property (nonatomic,copy)NSString *online_room_ios;

-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)programListDict:(NSDictionary*)dict;



@end
