//
//  YLLWhiteNavViewController.m
//  yunlailaC
//
//  Created by admin on 16/7/12.
//  Copyright © 2016年 com.yunlaila. All rights reserved.
//

#import "YLLWhiteNavViewController.h"

@interface YLLWhiteNavViewController ()

@end

@implementation YLLWhiteNavViewController
+ (void)load
{
    UIBarButtonItem *item=[UIBarButtonItem appearanceWhenContainedIn:self, nil ];
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    dic[NSFontAttributeName]=titleFont1;
    dic[NSForegroundColorAttributeName]=fontColor;
    [item setTitleTextAttributes:dic forState:UIControlStateNormal];
    
//    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    [bar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    NSMutableDictionary *dicBar=[NSMutableDictionary dictionary];
    
    dicBar[NSFontAttributeName]=titleFont1;
    [bar setTitleTextAttributes:dic];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
