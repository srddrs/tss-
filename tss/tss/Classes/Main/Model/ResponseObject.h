//
//  ResponseObject.h
//  yunlailaC
//
//  Created by admin on 16/7/20.
//  Copyright © 2016年 com.yunlaila. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface global : NSObject
@property (strong, nonatomic) NSNumber *flag;
@property (copy, nonatomic) NSString *message;
@end

@interface response : NSObject
@property (strong, nonatomic) NSNumber *flag;
@property (copy, nonatomic) NSString *message;
@property (strong, nonatomic) NSNumber *length;
@property (strong, nonatomic) NSNumber *total;
@property (strong, nonatomic) NSArray *items;
@end


@interface ResponseObject : NSObject
@property (strong, nonatomic) global *global;
@property (strong, nonatomic) NSArray *responses;
@end
