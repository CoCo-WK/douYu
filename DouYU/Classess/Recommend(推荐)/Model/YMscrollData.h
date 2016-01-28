//
//  YMscrollData.h
//  DouYU
//
//  Created by cym_bj on 16/1/21.
//  Copyright © 2016年 com.cym. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 
 id = 444514,
 title = "火影忍者手游版来袭",
 pic_url = "http://staticlive.douyutv.com/upload/signs/201601211501566585.jpg",
 room = 	{
 specific_status = "1",
 url = "/haimianbao",
 game_icon_url = "http://staticlive.douyutv.com/upload/game_cate/5af73a33926e701c58bc60f5d2f5f39d.jpg",
 nickname = "zhuhai9989",
 room_src = "http://staticlive.douyutv.com/upload/web_pic/201601/4/444514_1601211622_thumb.jpg",
 owner_avatar = "http://uc.douyutv.com/avatar.php?uid=26825801&size=big",
 room_name = "【屠夫宝】火影忍者手游！现金大回馈！",
 show_details = "只为娱乐！开心就好！ 45887541主播群号！
 通知：本直播间所有鱼丸收益主播一分不取！全部以Q币形式回馈给赠送过鱼丸的兄弟！主播只接受赞助！选择权全在于兄弟们！ 只限加了群的兄弟参与回馈！",
 specific_catalog = "haimianbao",
 game_name = "综合手游",
 show_time = "1453348869",
 game_url = "/directory/game/phone",
 show_status = "1",
 owner_weight = "295.6kg",
 fans = "3391",
 room_id = "444514",
 owner_uid = "26825801",
 vod_quality = "0",
 online = 6024,
 cate_id = "30",
 
 
 */
@interface YMscrollData : NSObject
@property (nonatomic,copy)NSString *ID;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *pic_url;
//@property (nonatomic,copy)NSString *ID;
//@property (nonatomic,copy)NSString *ID;
//@property (nonatomic,copy)NSString *ID;
//@property (nonatomic,copy)NSString *ID;
//@property (nonatomic,copy)NSString *ID;
//@property (nonatomic,copy)NSString *ID;
//@property (nonatomic,copy)NSString *ID;
//@property (nonatomic,copy)NSString *ID;
//@property (nonatomic,copy)NSString *ID;
//@property (nonatomic,copy)NSString *ID;
//@property (nonatomic,copy)NSString *ID;
//@property (nonatomic,copy)NSString *ID;

-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)scrollDataWithDict:(NSDictionary*)dict;

@end
