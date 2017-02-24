//
//  UIBarButtonItem+ZC.h
//  TestUI
//
//  Created by xuyang on 16/7/4.
//  Copyright © 2016年 mobilemix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Utility)
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action;

@end

