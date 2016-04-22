//
//  NSObject+HUD.h
//  BaseProject
//
//  Created by tarena on 15/12/17.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MBProgressHUD.h>

@interface NSObject (HUD)

/** 弹出文字提示 */
- (void)showAlert:(NSString *)text;
/** 显示忙 */
- (void)showBusy;
/** 隐藏提示 */
- (void)hideProgress;
@end











