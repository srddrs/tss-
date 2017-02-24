//
//  AppDelegate.h
//  tss
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 com.yunlaila. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLLTabBarController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic)  YLLTabBarController *tabBarVc;
@property float autoSizeScaleX;
@property float autoSizeScaleY;
- (void)storyBoradAutoLay:(UIView *)allView;
@end

