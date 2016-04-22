//
//  AppDelegate+Category.m
//  BaseProject
//
//  Created by tarena on 15/12/16.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "AppDelegate+Category.h"
//电池条上网络活动提示(菊花转动)
#import <AFNetworkActivityIndicatorManager.h>

@implementation AppDelegate (Category)
- (void)initializeWithApplication:(UIApplication *)application{
//  注册DDLog
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
//当使用AF发送网络请求时,只要有网络操作,那么在状态栏(电池条)wifi符号旁边显示  菊花提示
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
//能够检测当前网络是wifi,蜂窝网络,没有网
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
// 网络发生变化时 会触发这里的代码
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWiFi:
                DDLogVerbose(@"当前是wifi环境");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                DDLogVerbose(@"当前无网络");
                break;
            case AFNetworkReachabilityStatusUnknown:
                DDLogVerbose(@"当前网络未知");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                DDLogVerbose(@"当前是蜂窝网络");
                break;
            default:
                break;
        }
    }];
//开启网络检测
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
//网络活动发生变化时,会发送下方key 的通知,可以在通知中心中添加检测
//AFNetworkingReachabilityDidChangeNotification
    /*
    [[NSNotificationCenter defaultCenter] addObserver:nil selector:nil name:AFNetworkingReachabilityDidChangeNotification object:nil];
     */
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"000000000000000000");
    
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end











