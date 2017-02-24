//
//  AppTool.h
//  yunlailaC
//
//  Created by admin on 16/7/11.
//  Copyright © 2016年 com.yunlaila. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppTool : NSObject
+ (UIImage *)createImageWithColor: (UIColor *) color andRect:(CGRect)rect;
+ (UIImage *)getCurrentImage:(UIView *)view;
+ (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur;
//弹出登录
+ (BOOL)validateMobile:(NSString *)mobileNum;
+ (BOOL)isMobile:(NSString *)no;
+ (void)presentDengLu:(UIViewController *)viewController;
+ (BOOL)validateIDCardNumber:(NSString *)value;
+ (NSString *)isBankCardNum:(NSString *)bankCardNum;

+ (NSString *)getApplicationName;
+ (NSString *)getApplicationScheme;
@end
