//
//  SSNCountdownButton.m
//  SSNCountdownButtonDemo
//
//  Created by zhonzhon_iOS on 16/5/25.
//  Copyright © 2016年 zhonzhon_iOS. All rights reserved.
//

#import "SSNCountdownButton.h"

@implementation SSNCountdownButton

- (void)beginCountdownWithTime:(NSInteger)time
                   normalTitle:(NSString *)normalTitle
                      timeUnit:(NSString *)timeUnit
                   normalColor:(UIColor *)normalColor
                       inColor:(UIColor *)inColor
                      animated:(BOOL)animated{
    if (timeUnit == nil) {
        timeUnit = @"";
    }
    __block NSInteger number = time;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //创建一个定时起源
    dispatch_source_t source = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    //设置回调时间间隔
    int64_t interval = (int64_t)(1 * NSEC_PER_SEC);
    //设置定时器开始时间
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC));
    
    //启动计时器
    //参数1：timer
    //参数2：开始时间
    //参数3：时间间隔
    //参数4：0
    dispatch_source_set_timer(source, start, interval, 0);
    
    //设置回调事件，即每次定时器触发的处理时间
    dispatch_source_set_event_handler(source, ^{
        number--;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.enabled = NO;
            self.userInteractionEnabled = NO;
            [self setTitle:[NSString stringWithFormat:@"%zi%@",number,timeUnit] forState:UIControlStateDisabled];
            [self setBackgroundColor:inColor];
        });
        //运行到第0秒则取消计时器
        if (number == 0) {
            dispatch_source_cancel(source);
            NSLog(@"Cancle timer.");
            dispatch_async(dispatch_get_main_queue(), ^{
                self.enabled = YES;
                self.userInteractionEnabled = YES;
                [self setBackgroundColor:normalColor];
            });
        }else{
            if (animated) {
                [self scaleAnimationWithLayer:self.titleLabel.layer andScale:@[[NSNumber numberWithFloat:0],[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:1.5],[NSNumber numberWithFloat:2.0]]];
            }
        }
    });
    
    //启动定时器
    dispatch_resume(source);
}
- (void)scaleAnimationWithLayer:(CALayer *)layer andScale:(NSArray *)scales{
    CFTimeInterval beginTime = CACurrentMediaTime();
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.keyTimes = @[scales[0], scales[1], scales[2]];
    scaleAnimation.values = @[scales[2], scales[3], scales[4]];
    scaleAnimation.duration = 1.0;
    
    CAKeyframeAnimation *opacityAnimaton = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimaton.keyTimes = @[scales[0], scales[1], scales[2]];
    opacityAnimaton.values = @[scales[2], scales[3], scales[4]];
    opacityAnimaton.duration = 1.0;
    
    CAAnimationGroup *animation = [CAAnimationGroup animation];
    
    animation.animations = @[scaleAnimation, opacityAnimaton];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration = 1.0;
    animation.removedOnCompletion = false;
    
    animation.beginTime = beginTime;
    [layer addAnimation:animation forKey:@"animation"];
}
@end
