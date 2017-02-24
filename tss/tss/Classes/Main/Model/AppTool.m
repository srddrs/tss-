
//
//  AppTool.m
//  yunlailaC
//
//  Created by admin on 16/7/11.
//  Copyright © 2016年 com.yunlaila. All rights reserved.
//

#import "AppTool.h"
#import <Accelerate/Accelerate.h>
@implementation AppTool

+ (UIImage *) createImageWithColor: (UIColor *) color andRect:(CGRect)rect
{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (UIImage *)getCurrentImage:(UIView *)view
{
    UIGraphicsBeginImageContext(view.bounds.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}

+ (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur
{
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    int boxSize = (int)(blur * 100);
    boxSize = boxSize - (boxSize % 2) + 1;
    
    CGImageRef img = image.CGImage;
    
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    
    void *pixelBuffer;
    
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) *
                         CGImageGetHeight(img));
    
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    error = vImageBoxConvolve_ARGB8888(&inBuffer,
                                       &outBuffer,
                                       NULL,
                                       0,
                                       0,
                                       boxSize,
                                       boxSize,
                                       NULL,
                                       kvImageEdgeExtend);
    
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(
                                             outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    CFRelease(inBitmapData);
    
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    
    return returnImage;
}


+ (BOOL)validateMobile:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[0-9])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */

//    NSString *PHS = @"^(010|02\\d|0[3-9]\\d{2})?\\d{6,8}$";
    
     NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
//    //用于匹配手机号码
//    private final static String REGEX_MOBILEPHONE = "^0?1[3458]\\d{9}$";
//    
//    //用于匹配固定电话号码
//    private final static String REGEX_FIXEDPHONE = "^(010|02\\d|0[3-9]\\d{2})?\\d{6,8}$";
//    
//    //用于获取固定电话中的区号
//    private final static String REGEX_ZIPCODE = "^(010|02\\d|0[3-9]\\d{2})\\d{6,8}$";

    
    
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    if ([regextestmobile evaluateWithObject:mobileNum] == YES)
    {
        NSLog(@"aaaaaa");
    }
    if ([regextestcm evaluateWithObject:mobileNum] == YES)
    {
        NSLog(@"bbbbbb");
    }
    if ([regextestct evaluateWithObject:mobileNum] == YES)
    {
        NSLog(@"cccccc");
    }
    if ([regextestcu evaluateWithObject:mobileNum] == YES)
    {
        NSLog(@"ddddddd");
    }
    if ([regextestphs evaluateWithObject:mobileNum] == YES)
    {
        NSLog(@"eeeeeee");
    }
    
//     NSPredicate *regextestsp = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", sp];
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES)
        || ([regextestphs evaluateWithObject:mobileNum] == YES)
//        || ([regextestsp evaluateWithObject:mobileNum] == YES)
        )
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (BOOL)isMobile:(NSString *)no
{
    NSString *mobile = @"^0?1[3458]\\d{9}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobile];
    if ([regextestmobile evaluateWithObject:no] == YES)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (void)presentDengLu:(UIViewController *)viewController
{
    LoginViewController *vc = [[LoginViewController alloc] init];
    vc.title = @"登录";
    YLLWhiteNavViewController *nav = [[YLLWhiteNavViewController alloc] initWithRootViewController:vc];
     nav.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [viewController presentViewController:nav animated:NO completion:nil];
    
}

+ (BOOL)validateIDCardNumber:(NSString *)cardNo
{
    if (cardNo.length != 18) {
        return  NO;
    }
    NSArray* codeArray = [NSArray arrayWithObjects:@"7",@"9",@"10",@"5",@"8",@"4",@"2",@"1",@"6",@"3",@"7",@"9",@"10",@"5",@"8",@"4",@"2", nil];
    NSDictionary* checkCodeDic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"1",@"0",@"X",@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2", nil]  forKeys:[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil]];
    
    NSScanner* scan = [NSScanner scannerWithString:[cardNo substringToIndex:17]];
    
    int val;
    BOOL isNum = [scan scanInt:&val] && [scan isAtEnd];
    if (!isNum) {
        return NO;
    }
    int sumValue = 0;
    
    for (int i =0; i<17; i++) {
        sumValue+=[[cardNo substringWithRange:NSMakeRange(i , 1) ] intValue]* [[codeArray objectAtIndex:i] intValue];
    }
    
    NSString* strlast = [checkCodeDic objectForKey:[NSString stringWithFormat:@"%d",sumValue%11]];
    
    if ([strlast isEqualToString: [[cardNo substringWithRange:NSMakeRange(17, 1)]uppercaseString]]) {
        return YES;
    }
    return  NO;
}

+ (NSString *)isBankCardNum:(NSString *)bankCardNum {
    if (bankCardNum.length == 0 || bankCardNum.length < 16 || bankCardNum.length > 19 ) {
        return @"银行卡位数不正确";
    }
    int oddsum = 0;     //奇数求和
    int evensum = 0;    //偶数求和
    int allsum = 0;
    int cardNoLength = (int)[bankCardNum length];
    int lastNum = [[bankCardNum substringFromIndex:cardNoLength-1] intValue];
    
    bankCardNum = [bankCardNum substringToIndex:cardNoLength - 1];
    for (int i = cardNoLength -1 ; i >= 1;i--) {
        NSString *tmpString = [bankCardNum substringWithRange:NSMakeRange(i-1, 1)];
        int tmpVal = [tmpString intValue];
        if (cardNoLength % 2 ==1 ) {
            if((i % 2) == 0){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }else{
            if((i % 2) == 1){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }
    }
    allsum = oddsum + evensum;
    allsum += lastNum;
    if((allsum % 10) == 0) {
        NSString * bankBin = [bankCardNum substringToIndex:6];
        NSString * ehgitBin = [bankCardNum substringToIndex:8];
        NSString * bankBinPath =  [[NSBundle mainBundle]pathForAuxiliaryExecutable:@"WPBankBins.plist"];
        NSString * bankNamePath = [[NSBundle mainBundle]pathForAuxiliaryExecutable:@"WPBankNames.plist"];
        NSArray * bankBins = [NSArray arrayWithContentsOfFile:bankBinPath];
        NSArray * bankNames = [NSArray arrayWithContentsOfFile:bankNamePath];
        for (int i = 0; i < bankBins.count; i++) {
            if ([bankBin isEqualToString:bankBins[i]]||[ehgitBin isEqualToString:bankBins[i]]) {
                return bankNames[i];
                break;
            }
        }
        return @"未收录的卡";
    } else {
        return @"不是正确格式的银行卡";
    }
}

#pragma mark - Handle URL Scheme

+ (NSString *)getApplicationName
{
    NSDictionary *bundleInfo = [[NSBundle mainBundle] infoDictionary];
    NSLog(@"%@",[bundleInfo valueForKey:@"CFBundleDisplayName"] ?: [bundleInfo valueForKey:@"CFBundleName"]);
    return [bundleInfo valueForKey:@"CFBundleDisplayName"] ?: [bundleInfo valueForKey:@"CFBundleName"];
}

+ (NSString *)getApplicationScheme
{
    NSDictionary *bundleInfo    = [[NSBundle mainBundle] infoDictionary];
    NSString *bundleIdentifier  = [[NSBundle mainBundle] bundleIdentifier];
    NSArray *URLTypes           = [bundleInfo valueForKey:@"CFBundleURLTypes"];
    
    NSString *scheme;
    for (NSDictionary *dic in URLTypes)
    {
        NSString *URLName = [dic valueForKey:@"CFBundleURLName"];
        if ([URLName isEqualToString:bundleIdentifier])
        {
            scheme = [[dic valueForKey:@"CFBundleURLSchemes"] objectAtIndex:0];
            break;
        }
    }
    NSLog(@"%@",scheme);
    return scheme;
}

//
//
//验证数字：^[0-9]*$
//验证n位的数字：^\d{n}$
//验证至少n位数字：^\d{n,}$
//验证m-n位的数字：^\d{m,n}$
//
//验证数字和小数点:^[0-9]+([.]{0}|[.]{1}[0-9]+)$
//验证零和非零开头的数字：^(0|[1-9][0-9]*)$
//验证有两位小数的正实数：^[0-9]+(.[0-9]{2})?$
//验证有1-3位小数的正实数：^[0-9]+(.[0-9]{1,3})?$
//验证非零的正整数：^\+?[1-9][0-9]*$
//验证非零的负整数：^\-[1-9][0-9]*$
//验证非负整数（正整数 + 0）  ^\d+$
//验证非正整数（负整数 + 0）  ^((-\d+)|(0+))$
//验证长度为3的字符：^.{3}$
//验证由26个英文字母组成的字符串：^[A-Za-z]+$
//验证由26个大写英文字母组成的字符串：^[A-Z]+$
//验证由26个小写英文字母组成的字符串：^[a-z]+$
//验证由数字和26个英文字母组成的字符串：^[A-Za-z0-9]+$
//验证由数字、26个英文字母或者下划线组成的字符串：^\w+$
//验证用户密码:^[a-zA-Z]\w{5,17}$ 正确格式为：以字母开头，长度在6-18之间，只能包含字符、数字和下划线。
//验证是否含有 ^%&',;=?$\" 等字符：[^%&',;=?$\x22]+
//验证汉字：^[\u4e00-\u9fa5],{0,}$
//验证Email地址：^\w+[-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$
//验证InternetURL：^http://([\w-]+\.)+[\w-]+(/[\w-./?%&=]*)?$ ；^[a-zA-z]+://(w+(-w+)*)(.(w+(-w+)*))*(?S*)?$
//验证电话号码：^(\(\d{3,4}\)|\d{3,4}-)?\d{7,8}$：--正确格式为：XXXX-XXXXXXX，XXXX-XXXXXXXX，XXX-XXXXXXX，XXX-XXXXXXXX，XXXXXXX，XXXXXXXX。
//
//验证电话号码及手机:（\d{3}-\d{8}|\d{4}-\d{7}）｜（^((\(\d{3}\))|(\d{3}\-))?13\d{9}|15[89]\d{8}$）
//验证身份证号（15位或18位数字）：^\d{15}|\d{}18$
//验证一年的12个月：^(0?[1-9]|1[0-2])$ 正确格式为：“01”-“09”和“1”“12”
//验证一个月的31天：^((0?[1-9])|((1|2)[0-9])|30|31)$    正确格式为：01、09和1、31。
//整数：^-?\d+$
//非负浮点数（正浮点数 + 0）：^\d+(\.\d+)?$
//正浮点数   ^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$
//非正浮点数（负浮点数 + 0） ^((-\d+(\.\d+)?)|(0+(\.0+)?))$
//负浮点数  ^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$
//浮点数  ^(-?\d+)(\.\d+)?$

@end
