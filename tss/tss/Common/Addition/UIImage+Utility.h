//
//  UIImage+Utility.h
//  Keruyun
//
//  Created by gang.xu on 14-1-13.
//  Copyright (c) 2014年 shishike.com. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 * UIImage扩展类
 */
@interface UIImage (Utility)
+ (UIImage *)imageWithColor:(UIColor *)color;
// 创建指定颜色指定大小的图片
+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;
// 根据指定的尺寸合并图片
+ (UIImage *)addImage:(UIImage *)image1 andImage:(UIImage *)image2 inSize:(CGSize)size;
// 获取图片的像素值
- (unsigned char *)pixelData;
/**
 *  加载图片
 *
 *  @param name 图片名
 *
 */
+ (UIImage *)imageWithName:(NSString *)name;

//返回一张自由拉伸的图片
+ (UIImage *)resizeImagedWithName:(NSString *)name;
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;
@end
