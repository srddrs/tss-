//
//  UICollectionView+EmptyData.m
//  yunlailaC
//
//  Created by admin on 16/11/17.
//  Copyright © 2016年 com.yunlaila. All rights reserved.
//

#import "UICollectionView+EmptyData.h"

@implementation UICollectionView (EmptyData)
- (void)tableViewDisplayWitMsg:(NSString *) message ifNecessaryForRowCount:(NSUInteger) rowCount
{
    if (rowCount == 0) {
        // Display a message when the table is empty
        // 没有数据的时候，UILabel的显示样式
        UIView *tipView = [UIView new];
        
        
        
        UIImageView *noDataImage  = [[UIImageView alloc] initWithFrame:CGRectMake(110*APP_DELEGATE().autoSizeScaleX, 110*APP_DELEGATE().autoSizeScaleY, 100*APP_DELEGATE().autoSizeScaleX, 115*APP_DELEGATE().autoSizeScaleY)];
        //    noDataImage.backgroundColor = [UIColor redColor];
        noDataImage.image = [UIImage imageNamed:@"icon_no_data"];
        [tipView addSubview:noDataImage];
        
        
        UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 225*APP_DELEGATE().autoSizeScaleY, 320*APP_DELEGATE().autoSizeScaleX, 30*APP_DELEGATE().autoSizeScaleY)];
        messageLabel.text = message;
        messageLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        messageLabel.textColor = [UIColor lightGrayColor];
        messageLabel.textAlignment = NSTextAlignmentCenter;
        //        [messageLabel sizeToFit];
        [tipView addSubview:messageLabel];
        
        self.backgroundView = tipView;
//        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    } else {
        self.backgroundView = nil;
//        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
}

@end
