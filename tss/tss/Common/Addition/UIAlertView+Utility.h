//
//  UIAlertView+Utility.h
//  Diancai
//
//  Created by gang.xu on 13-10-29.
//  Copyright (c) 2013年 shishike.com. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 * UIAlertView标记
 */
typedef enum _AlertView_Tag {
    AlertView_Tag_Init_System = 101,
    AlertView_Tag_Queue_Delete,
    AlertView_Tag_Queue_In,
    AlertView_Tag_Settings_Cancel_IP,
    AlertView_Tag_Settings_IP_Connect_Error,
    AlertView_Tag_Settings_Queue_Reset,
    AlertView_Tag_Booking_Back,
    AlertView_Tag_Booking_Create_Back,
    AlertView_Tag_Booking_Biz_Ok,
    AlertView_Tag_Booking_Biz_Cancel,
    AlertView_Tag_Booking_Print_Confirm,
    AlertView_Tag_Booking_No_Table_Confirm,
    AlertView_Tag_Settings_Phone_Box,
    AlertView_Tag_Pos_Get_QRCode_Error,
    AlertView_Tag_Customer_Back,
    AlertView_Tag_Customer_Create_Back,
    AlertView_Tag_Call_Confirm,
    AlertView_Tag_BLP_Connect_Confirm,
    AlertView_Tag_BLP_Disconnect_Confirm,
    AlertView_Tag_BLPrinter_Connect_Confirm,
    AlertView_Tag_BLPrinter_Disconnect_Confirm,
    AlertView_Tag_Root_Check_Version,
    AlertView_Tag_Customer_Change_Password,
    AlertView_Tag_Open_UpdateURL_Error,
    AlertView_Tag_Update_Error,
    AlertView_Tag_Booking_Conflicted,
} AlertView_Tag;

/*
 * UIAlertView扩展类
 */
@interface UIAlertView (Utility)
// 显示提示消息
+ (void)showAlert:(NSString *)message cancelButton:(NSString *)strCancel;
// 显示双按钮的提示消息
+ (void)showAlert:(NSString *)message delegate:(id)delegate cancelButton:(NSString *)strCancel otherButton:(NSString *)strOther tag:(NSInteger)tag;
// 显示带标题的双按钮的提示消息
+ (void)showAlert:(NSString *)message title:(NSString *)title delegate:(id)delegate cancelButton:(NSString *)strCancel otherButton:(NSString *)strOther tag:(NSInteger)tag;
@end
