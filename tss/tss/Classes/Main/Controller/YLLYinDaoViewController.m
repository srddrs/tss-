//
//  YLLYinDaoViewController.m
//  yunlailaC
//
//  Created by admin on 16/8/5.
//  Copyright © 2016年 com.yunlaila. All rights reserved.
//

#import "YLLYinDaoViewController.h"
#import "YLLTabBarController.h"

@interface YLLYinDaoViewController ()<UIScrollViewDelegate>
{
    UIScrollView *scrollView;
    UIButton *submitBtn;
    
}

@end

@implementation YLLYinDaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView
{
    

    submitBtn = [[UIButton alloc] initWithFrame: CGRectMake(35*APP_DELEGATE().autoSizeScaleX, 485*APP_DELEGATE().autoSizeScaleY, 250*APP_DELEGATE().autoSizeScaleX, 34*APP_DELEGATE().autoSizeScaleY)];
    [submitBtn setTitle:@"立即体验" forState:UIControlStateNormal];
    [submitBtn setTitle:@"立即体验" forState:UIControlStateHighlighted];
    [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [submitBtn setBackgroundImage:[UIImage imageNamed:@"anniu"] forState:UIControlStateNormal];
    [submitBtn setBackgroundImage:[UIImage imageNamed:@"anniu"] forState:UIControlStateHighlighted];
    [submitBtn addTarget:self
                  action:@selector(goToHome:)
        forControlEvents:UIControlEventTouchUpInside];
    submitBtn.titleLabel.font = viewFont1;

    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT)];
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*3, SCREENH_HEIGHT);
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    NSArray *picArr = @[@"引导1",@"引导2",@"引导3"];
    for (int i = 0; i < 3; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREENH_HEIGHT)];
        [imageView setImage:[UIImage imageNamed:picArr[i]]];
        imageView.userInteractionEnabled = YES;
        [scrollView addSubview:imageView];
        if (i == 2) {
            [imageView addSubview:submitBtn];
            submitBtn.alpha = 0;
        }
        
    }
    scrollView.showsVerticalScrollIndicator = FALSE;//隐藏滚动条
    scrollView.showsHorizontalScrollIndicator = FALSE;//隐藏滚动条
    scrollView.bounces = NO;//没有弹性
    [self.view addSubview:scrollView];
    //    [scrollView setCanCancelContentTouches:NO];
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)_scrollView
{
    
    int currentPage = scrollView.contentOffset.x/SCREEN_WIDTH;
    if (currentPage==2)
    {
        NSLog(@"按钮出现");
//        scrollView.scrollEnabled = NO;
        [UIView animateWithDuration:1 animations:^{
            submitBtn.alpha = 1;
        } completion:^(BOOL finished) {
//             scrollView.scrollEnabled = YES;
        }];
    }
    else
    {
        NSLog(@"按钮消失");
         submitBtn.alpha = 0;
    }
}

- (void)goToHome:(UIButton *)sender
{
    //    self.view.window.backgroundColor = [UIColor whiteColor];
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // app版本
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    // app build版本
    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
    
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:[NSString stringWithFormat:@"%@-firstLaunch",app_Version]];
    
    self.view.window.rootViewController = [[YLLTabBarController alloc]init];
    
   
}

@end
