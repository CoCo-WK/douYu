//
//  YMBaseTabBarController.m
//  DouYU
//
//  Created by cym_bj on 16/1/20.
//  Copyright © 2016年 com.cym. All rights reserved.
//

#import "YMBaseTabBarController.h"
#import "YMRecommendViewController.h"
#import "YMProgramaViewController.h"
#import "YMLiveViewController.h"
#import "YMMineViewController.h"
#import "YMBaseNavagationViewController.h"
#import "UIColor+YMHex.h"
@interface YMBaseTabBarController ()

@end

@implementation YMBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //添加控制 器
    //1 、推荐
    YMRecommendViewController *recomVC=[[YMRecommendViewController alloc]init];
    [self addChildVC:recomVC title:@"推荐" imageName:@"btn_home_normal" selectImageName:@"btn_home_selected"];
 
    // 2、栏目
    YMProgramaViewController *progVC=[[YMProgramaViewController alloc]init];
    [self addChildVC:progVC title:@"栏目" imageName:@"btn_column_normal" selectImageName:@"btn_column_selected"];
    
    // 3、直播
    YMLiveViewController *liveVC=[[YMLiveViewController alloc]init];
    [self addChildVC:liveVC title:@"直播" imageName:@"btn_live_normal" selectImageName:@"btn_live_selected"];
    
    // 4、我的
    YMMineViewController *mineVC=[[YMMineViewController alloc]init];
    [self addChildVC:mineVC title:@"我的" imageName:@"btn_user_normal" selectImageName:@"btn_user_selected"];
}

+(void)initialize
{
    UITabBarItem *barBarItem=[UITabBarItem appearance];
    //设置选中文字的颜色
    NSDictionary *dict=@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"f56f22"]
                         };
    [barBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
    
}
-(void)addChildVC:(UIViewController*)VC title:(NSString*)title imageName:(NSString*)imageName selectImageName:(NSString*)selectImageName
{
    
    
    YMBaseNavagationViewController *naVC=[[YMBaseNavagationViewController alloc]initWithRootViewController:VC];
    
    naVC.tabBarItem.title=title;
    naVC.tabBarItem.image=[UIImage imageNamed:imageName];
    UIImage *selectImage=[UIImage imageNamed:selectImageName];
    naVC.tabBarItem.selectedImage=[selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBar.tintColor=[UIColor colorWithHexString:@"808080"];
    [self addChildViewController:naVC];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
