//
//  YMHttpTool.m
//  FabestCare
//
//  Created by cym_bj on 15/9/2.
//  Copyright (c) 2015年 com.cym. All rights reserved.
//

#import "YMHttpTool.h"
#import "AFNetworking.h"
#import "SVProgressHUD+CYM.h"
static bool checkNetWork;
@implementation YMHttpTool

+(void)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
   
        // 创建请求管理者
        AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.requestSerializer.timeoutInterval=30;
    [SVProgressHUD reveal];
        [mgr.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css", nil]];
    
        [mgr GET:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            // AFN请求成功时候调用block
            // 先把请求成功要做的事情，保存到这个代码块
            if (success) {
                [SVProgressHUD dismiss];
                success(responseObject);
            }
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            if (failure) {
                [SVProgressHUD revealErrorWithStatus:@"请求失败"];
                failure(error);
            }
        }];

    
    

    
}
+(void)Post:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    
    // 创建请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    [mgr.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css", nil]];
    [SVProgressHUD reveal];
    [mgr POST:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (success) {
            [SVProgressHUD dismiss];
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure) {
             [SVProgressHUD revealErrorWithStatus:@"请求失败"];
            failure(error);
        }
    }];

    
}

#pragma mark- 网络监测
+(void)checkNetWork
{
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        // 当网络状态发生改变的时候调用这个block
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWiFi:
                checkNetWork=YES;
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                checkNetWork=YES;
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
            {
                checkNetWork=NO;
               // [MBProgressHUD showError:@"无网络连接"];
                
            }
                break;
                
            case AFNetworkReachabilityStatusUnknown:
                checkNetWork=NO;
                //[MBProgressHUD showError:@"未知网络"];
                
                NSLog(@"未知网络");
                break;
            
        }
    }];
    // 开始监控
    [mgr startMonitoring];
}
+(BOOL)reachability
{
    return checkNetWork;
}
- (void)dealloc
{
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
}

@end
