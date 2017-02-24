//
//  SSNCountdownButton.h
//  SSNCountdownButtonDemo
//
//  Created by zhonzhon_iOS on 16/5/25.
//  Copyright © 2016年 zhonzhon_iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSNCountdownButton : UIButton
/**
 Start countdown.
 
 @param time  Countdown time seconds.
 @param normalTitle  Normal title.
 @param timeUnit  Countdown time unit.
 @param normalColor  Normal color.
 @param inColor  Countdown color.
 @param animated  Whether there is animation effect.
 */
- (void)beginCountdownWithTime:(NSInteger)time
                   normalTitle:(NSString *)normalTitle
                      timeUnit:(NSString *)timeUnit
                   normalColor:(UIColor *)normalColor
                       inColor:(UIColor *)inColor
                      animated:(BOOL)animated;

@end
