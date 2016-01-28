//
//  YMData.h
//  DouYU
//
//  Created by cym_bj on 16/1/20.
//  Copyright © 2016年 com.cym. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YMData : NSObject
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *cate_id;
@property (nonatomic,strong)NSArray *roomlist;
-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)dataWithDict:(NSDictionary*)dict;
@end
