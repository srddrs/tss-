//
//  UIAlertView+Utility.m
//  Diancai
//
//  Created by gang.xu on 13-10-29.
//  Copyright (c) 2013年 shishike.com. All rights reserved.
//

#import "UIAlertView+Utility.h"

@implementation UIAlertView (Utility)

// 显示提示消息
+ (void)showAlert:(NSString *)message cancelButton:(NSString *)strCancel;
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:strCancel
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

// 显示双按钮的提示消息
+ (void)showAlert:(NSString *)message delegate:(id)delegate cancelButton:(NSString *)strCancel otherButton:(NSString *)strOther tag:(NSInteger)tag
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:message
                                                   delegate:delegate
                                          cancelButtonTitle:strCancel
                                          otherButtonTitles:strOther,nil];
    alert.tag = tag;
    [alert show];
    [alert release];
}

// 显示带标题的双按钮的提示消息
+ (void)showAlert:(NSString *)message title:(NSString *)title delegate:(id)delegate cancelButton:(NSString *)strCancel otherButton:(NSString *)strOther tag:(NSInteger)tag
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:delegate
                                          cancelButtonTitle:strCancel
                                          otherButtonTitles:strOther,nil];
    alert.tag = tag;
    [alert show];
    [alert release];
}

@end
