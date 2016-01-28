
//
//  YMBaseNavagationViewController.m
//  DouYU
//
//  Created by cym_bj on 16/1/20.
//  Copyright © 2016年 com.cym. All rights reserved.
//

#import "YMBaseNavagationViewController.h"
#import "UIColor+YMHex.h"

@interface YMBaseNavagationViewController ()

@end

@implementation YMBaseNavagationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
+(void)initialize
{
    UINavigationBar *navigation=[UINavigationBar appearance];
    navigation.barTintColor=[UIColor colorWithHexString:@"f56f22"];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//状态栏为白色
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
