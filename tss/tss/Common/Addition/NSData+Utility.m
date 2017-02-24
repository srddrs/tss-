//
//  NSData+Utility.m
//  Keruyun
//
//  Created by gang.xu on 14-3-20.
//  Copyright (c) 2014年 shishike.com. All rights reserved.
//

#import "NSData+Utility.h"
#import <CommonCrypto/CommonDigest.h>

#define CHUNK_SIZE 1024

@implementation NSData (Utility)

// MD5加密
- (NSString *)md5FromData
{
    CC_MD5_CTX md5_ctx;
    CC_MD5_Init(&md5_ctx);
    
    int counter = 0;
    int len = [self length];
    NSData* filedata;
    while ((len-counter) > 0) {
        filedata = [self subdataWithRange:NSMakeRange(counter,((len-counter)<CHUNK_SIZE)?(len-counter):CHUNK_SIZE)];
        CC_MD5_Update(&md5_ctx, [filedata bytes], [filedata length]);
        counter += CHUNK_SIZE;
    }
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(result, &md5_ctx);
    NSMutableString *hash = [NSMutableString string];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    {
        [hash appendFormat:@"%02x",result[i]];
    }
    return [hash lowercaseString];
}

@end
