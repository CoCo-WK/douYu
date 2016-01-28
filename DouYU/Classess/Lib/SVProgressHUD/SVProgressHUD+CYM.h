//
//  SVProgressHUD+CYM.h
//  自己封装加载
//
//  Created by cym_bj on 16/1/15.
//  Copyright © 2016年 com.cym. All rights reserved.
//

#import "SVProgressHUD.h"

@interface SVProgressHUD (CYM)

+(void)reveal;
+(void)revealSuccessWithStatus:(NSString*)status;
+(void)revealErrorWithStatus:(NSString*)status;
+(void)revealInfoWithStatus:(NSString*)status;
@end
