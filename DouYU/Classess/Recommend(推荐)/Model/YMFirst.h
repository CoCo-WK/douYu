//
//  YMFirst.h
//  DouYU
//
//  Created by cym_bj on 16/1/21.
//  Copyright © 2016年 com.cym. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 
 status = "0",
 sort = "0",
 ctime = "1435646550",
 id = "12",
 admin = "tangyi",
 push_ios = "1",
 push_android = "1",
 mobile_switch = "1",
 related_id = "",
 name = "御宅达人",
 url = "http://staticlive.douyutv.com/upload/room_tag/fcd0ed3ceef8e6d87f46351b53c78b90.jpg",

 
 */
@interface YMFirst : NSObject
@property (nonatomic,copy)NSString *status;
@property (nonatomic,copy)NSString *sort;
@property (nonatomic,copy)NSString *ctime;
@property (nonatomic,copy)NSString *ID;
@property (nonatomic,copy)NSString *admin;
@property (nonatomic,copy)NSString *push_ios;
@property (nonatomic,copy)NSString *push_android;
@property (nonatomic,copy)NSString *mobile_switch;
@property (nonatomic,copy)NSString *related_id;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *url;

-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)firstWithDict:(NSDictionary*)dict;
@end
