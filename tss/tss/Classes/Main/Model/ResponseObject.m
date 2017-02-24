//
//  ResponseObject.m
//  yunlailaC
//
//  Created by admin on 16/7/20.
//  Copyright © 2016年 com.yunlaila. All rights reserved.
//

#import "ResponseObject.h"

#define YYModelSynthCoderAndHash \
- (void)encodeWithCoder:(NSCoder *)aCoder { [self yy_modelEncodeWithCoder:aCoder]; } \
- (id)initWithCoder:(NSCoder *)aDecoder { return [self yy_modelInitWithCoder:aDecoder]; } \
- (id)copyWithZone:(NSZone *)zone { return [self yy_modelCopy]; } \
- (NSUInteger)hash { return [self yy_modelHash]; } \
- (BOOL)isEqual:(id)object { return [self yy_modelIsEqual:object]; }

@implementation global
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"flag" : @"flag",
             @"message" : @"message" };
}
YYModelSynthCoderAndHash
@end

@implementation response
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"flag" : @"flag",
             @"message" : @"message",
             @"length" : @"length",
             @"total" : @"total",
             @"items" : @"items" };
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    
    if (![dic isKindOfClass:[NSDictionary class]])
    {
        return NO;
    }
    else if(![[dic objectForKey:@"items"] isKindOfClass:[NSArray class]])
    {
        return NO;
    }
    else if([[dic objectForKey:@"items"] count]==0)
    {
        return NO;
    }
    
    return YES;
}
YYModelSynthCoderAndHash
@end

@implementation ResponseObject
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"global" : [global class],
             @"responses" : [response class] };
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    
    if (![dic isKindOfClass:[NSDictionary class]])
    {
        return NO;
    }
    else if(![[dic objectForKey:@"global"] isKindOfClass:[NSDictionary class]])
    {
        return NO;
    }
    else if(![[dic objectForKey:@"responses"] isKindOfClass:[NSArray class]])
    {
        return NO;
    }
    
    return YES;
}

YYModelSynthCoderAndHash
@end
