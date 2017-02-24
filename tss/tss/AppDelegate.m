//
//  AppDelegate.m
//  tss
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 com.yunlaila. All rights reserved.
//

#import "AppDelegate.h"
#import <PgySDK/PgyManager.h>
#import <PgyUpdate/PgyUpdateManager.h>
#import "YLLYinDaoViewController.h"

#define ScreenHeight [[UIScreen mainScreen] bounds].size.height//获取屏幕高度，兼容性测试
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width//获取屏幕宽度，兼容性测试
@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize window,tabBarVc;
- (void)initTabbar
{
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // app版本
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    // app build版本
    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
    NSLog(@"app_Version:%@",app_Version);
    NSLog(@"app_build:%@",app_build);
    //设置是否第一次登陆
    //    [NSString stringWithFormat:@"%@-everLaunched",app_Version];
    //    [NSString stringWithFormat:@"%@-firstLaunch",app_Version];
    if (![[NSUserDefaults standardUserDefaults] boolForKey:[NSString stringWithFormat:@"%@-everLaunched",app_Version]])
    {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:[NSString stringWithFormat:@"%@-everLaunched",app_Version]];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:[NSString stringWithFormat:@"%@-firstLaunch",app_Version]];
    }
    else
    {
        //        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:[NSString stringWithFormat:@"%@-firstLaunch",app_Version]];
    }
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:[NSString stringWithFormat:@"%@-firstLaunch",app_Version]])
    {
        // 这里判断是否第一次
        YLLYinDaoViewController *yinDaoVC = [[YLLYinDaoViewController alloc]init];
        self.window.rootViewController = yinDaoVC;
    }
    else
    {
        tabBarVc = [[YLLTabBarController alloc] init];
        CATransition *anim = [[CATransition alloc] init];
        anim.type = @"rippleEffect";
        anim.duration = 1.0;
        [self.window.layer addAnimation:anim forKey:nil];
        self.window.rootViewController = tabBarVc;
    }
    [self.window makeKeyAndVisible];
    
    
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    if(ScreenHeight > 480)
    {
        APP_DELEGATE().autoSizeScaleX = ScreenWidth/320;
        APP_DELEGATE().autoSizeScaleY = ScreenHeight/568;
    }else{
        APP_DELEGATE().autoSizeScaleX = 1.0;
        APP_DELEGATE().autoSizeScaleY = 1.0;
    }
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self initTabbar];
    [[IQKeyboardManager sharedManager] setToolbarManageBehaviour:IQAutoToolbarByPosition];
   
    
    if (ISAPPSTORE==0)
    {
        //    //启动基本SDK
        [[PgyManager sharedPgyManager] startManagerWithAppId:@"941fbdc4f6b2a08c1d08a2cd66ef75df"];
        //启动更新检查SDK
        [[PgyUpdateManager sharedPgyManager] startManagerWithAppId:@"941fbdc4f6b2a08c1d08a2cd66ef75df"];
        [[PgyManager sharedPgyManager] setEnableFeedback:NO];
    }

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)storyBoradAutoLay:(UIView *)allView
{
    for (UIView *temp in allView.subviews)
    {
        if (![temp isKindOfClass:[UITableView class]]&&![temp isKindOfClass:[UICollectionView class]]&&![temp isKindOfClass:[MJRefreshStateHeader class]]&&![temp isKindOfClass:[MJRefreshAutoStateFooter class]])
        {
            temp.frame = CGRectMake1(temp.frame.origin.x, temp.frame.origin.y, temp.frame.size.width, temp.frame.size.height);
        }
        
        for (UIView *temp1 in temp.subviews)
        {
            if (![temp isKindOfClass:[UITableView class]]&&![temp isKindOfClass:[UICollectionView class]]&&![temp isKindOfClass:[MJRefreshStateHeader class]]&&![temp isKindOfClass:[MJRefreshAutoStateFooter class]])
            {
                temp1.frame = CGRectMake1(temp1.frame.origin.x, temp1.frame.origin.y, temp1.frame.size.width, temp1.frame.size.height);
            }
            for (UIView *temp2 in temp1.subviews)
            {
                if (![temp isKindOfClass:[UITableView class]]&&![temp isKindOfClass:[UICollectionView class]]&&![temp isKindOfClass:[MJRefreshStateHeader class]]&&![temp isKindOfClass:[MJRefreshAutoStateFooter class]])
                {
                    temp2.frame = CGRectMake1(temp2.frame.origin.x, temp2.frame.origin.y, temp2.frame.size.width, temp2.frame.size.height);
                }
                for (UIView *temp3 in temp2.subviews)
                {
                    if (![temp isKindOfClass:[UITableView class]]&&![temp isKindOfClass:[UICollectionView class]]&&![temp isKindOfClass:[MJRefreshStateHeader class]]&&![temp isKindOfClass:[MJRefreshAutoStateFooter class]])
                    {
                        temp3.frame = CGRectMake1(temp3.frame.origin.x, temp3.frame.origin.y, temp3.frame.size.width, temp3.frame.size.height);
                    }
                }
                
            }
        }
    }
}

//修改CGRectMake
CG_INLINE CGRect
CGRectMake1(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
    CGRect rect;
    rect.origin.x = x * APP_DELEGATE().autoSizeScaleX; rect.origin.y = y * APP_DELEGATE().autoSizeScaleY;
    rect.size.width = width * APP_DELEGATE().autoSizeScaleX; rect.size.height = height * APP_DELEGATE().autoSizeScaleY;
    return rect;
}

@end
