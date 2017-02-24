//
//  YLLBaseViewController.m
//  yunlailaC
//
//  Created by admin on 16/7/11.
//  Copyright © 2016年 com.yunlaila. All rights reserved.
//

#import "YLLBaseViewController.h"

@interface YLLBaseViewController ()

@end

@implementation YLLBaseViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)])
//    {
//        self.automaticallyAdjustsScrollViewInsets = NO;
//    }
//    NSLog(@"AAA:%d",[[[[UIDevice currentDevice] systemVersion] substringToIndex:1] intValue]);
//    if (IsIOS7)
//    {
//        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
//    }
   
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = bgViewColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
