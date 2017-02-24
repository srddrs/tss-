//
//  BXTabBar.m
//  IrregularTabBar
//
//  Created by JYJ on 16/5/3.
//  Copyright © 2016年 baobeikeji. All rights reserved.
//

#import "YLLTabBar.h"
#import "YLLTabBarBigButton.h"
//#import "SendOutGoodsViewController.h"

@interface YLLTabBar ()
/** bigButton */
@property (nonatomic, strong) YLLTabBarBigButton *bigButton;
@end

@implementation YLLTabBar
- (YLLTabBarBigButton *)bigButton {
    if (!_bigButton) {
        YLLTabBarBigButton *bigButton = [[YLLTabBarBigButton alloc] init];
        [bigButton setImage:[UIImage imageNamed:@"zhuye_fahuo"] forState:UIControlStateNormal];
        [bigButton setImage:[UIImage imageNamed:@"zhuye_fahuo"] forState:UIControlStateHighlighted];
        [bigButton addTarget:self action:@selector(bigButtonClick) forControlEvents:UIControlEventTouchUpInside];
        self.bigButton = bigButton;
    }
    return _bigButton;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.bigButton];
    }
    return self;
}

#warning TODO 点击按钮需要做的事情
- (void)bigButtonClick {
  
//    SendOutGoodsViewController *SendOutGoodsVC = [[SendOutGoodsViewController alloc] init];
//    YLLNavigationController *navVc = [[YLLNavigationController alloc] initWithRootViewController:SendOutGoodsVC];
//    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:navVc animated:YES completion:nil];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //设置bigButton的frame
    CGRect rect = self.bounds;
    CGFloat w = rect.size.width / self.items.count - 1;
    self.bigButton.frame = CGRectInset(rect, 2 * w, 0-12);
    [self bringSubviewToFront:self.bigButton];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.clipsToBounds || self.hidden || (self.alpha == 0.f)) {
        return nil;
    }
    
    // 因为按钮内部imageView突出
    CGPoint newPoint = [self convertPoint:point toView:self.bigButton.imageView];
    
    if ( [self.bigButton.imageView pointInside:newPoint withEvent:event]) { // 点属于按钮范围
        return self.bigButton;
        
    }else{
        return [super hitTest:point withEvent:event];
    }


    return [super hitTest:point withEvent:event];
}

@end
