//
//  BXTabBarController.m
//  BaoXianDaiDai
//
//  Created by JYJ on 15/5/28.
//  Copyright (c) 2015年 baobeikeji.cn. All rights reserved.
//

#import "YLLTabBarController.h"

#import "WorkbenchViewController.h"
#import "OperatorViewController.h"
#import "ContactViewController.h"
#import "PersonCenterViewController.h"

#import "NSDate+Utility.h"
#import "YLLTabBar.h"

#define kTabbarHeight 49

@interface YLLTabBarController ()

@end

@implementation YLLTabBarController
+ (void)initialize {
    // 设置tabbarItem的普通文字
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [[UIColor alloc]initWithRed:113/255.0 green:109/255.0 blue:104/255.0 alpha:1];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    
    
    //设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = lvColor;
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加所有子控制器
    [self addAllChildVc];
    // 自定义tabBar
//    [self setUpTabBar];
}
#pragma mark - 自定义tabBar
- (void)setUpTabBar
{
    YLLTabBar *myTabBar = [[YLLTabBar alloc] init];
    // 更换tabBar
    [self setValue:myTabBar forKey:@"tabBar"];
}



/**
 *  添加所有的子控制器
 */
- (void)addAllChildVc {
    // 添加初始化子控制器 BXHomeViewController
    
    NSDate *date = [NSDate today];
    NSCalendar *calendar  = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar]; // 初始化日历
    NSDateComponents *comps = [[NSDateComponents alloc] init];  // 初始化日期元件
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit |NSMinuteCalendarUnit | NSSecondCalendarUnit;
    comps = [calendar components:unitFlags fromDate:date]; // 传入NSDate
    NSArray *weekArr  = @[@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六"];
    NSString *week = weekArr[[comps weekday] - 1];
    
    WorkbenchViewController *home = [[WorkbenchViewController alloc] init];
    [self addOneChildVC:home title:week imageName:@"sy_rili" selectedImageName:@"sy_rili_pitch-on"];
    
    OperatorViewController *customer = [[OperatorViewController alloc] init];
    [self addOneChildVC:customer title:@"日常操作" imageName:@"sy_caozuo" selectedImageName:@"sy_caozuo_pitch-on"];

     ContactViewController *profile = [[ContactViewController alloc]init];
    [self addOneChildVC:profile title:@"联系人" imageName:@"sy_lianxiren" selectedImageName:@"sy_lianxiren_pitch-on"];
    
    PersonCenterViewController *profile1 = [[PersonCenterViewController alloc]init];
    [self addOneChildVC:profile1 title:@"个人中心" imageName:@"sy_wo" selectedImageName:@"sy_wo_pitch-on"];
}


/**
 *  添加一个自控制器
 *
 *  @param childVc           子控制器对象
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中时的图标
 */

- (void)addOneChildVC:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    childVc.tabBarItem.title = title;
    
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    // 不要渲染
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = selectedImage;
    
//    childVc.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    childVc.navigationItem.title = title;
    
    // 添加为tabbar控制器的子控制器
    YLLNavigationController *nav = [[YLLNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

@end
