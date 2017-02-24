//
//  UILabel+Utility.m
//  TestUI
//
//  Created by xuyang on 16/7/5.
//  Copyright © 2016年 mobilemix. All rights reserved.
//

#import "UILabel+Utility.h"

@implementation UILabel (Utility)
- (CGSize)boundingRectWithSize:(CGSize)size
{
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    
    CGSize retSize = [self.text boundingRectWithSize:size
                                             options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    
    return retSize;
}
@end
