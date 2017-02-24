//
//  UICollectionView+EmptyData.h
//  yunlailaC
//
//  Created by admin on 16/11/17.
//  Copyright © 2016年 com.yunlaila. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (EmptyData)
- (void)tableViewDisplayWitMsg:(NSString *) message ifNecessaryForRowCount:(NSUInteger) rowCount;

@end
