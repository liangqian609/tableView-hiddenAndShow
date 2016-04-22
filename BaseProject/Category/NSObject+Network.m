//
//  NSObject+Network.m
//  BaseProject
//
//  Created by tarena on 15/12/16.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "NSObject+Network.h"

@implementation NSObject (Network)

+ (AFHTTPSessionManager *)sharedAFManager{
    static AFHTTPSessionManager *manager =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager=[AFHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval=30;
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/json",@"text/javascript",@"text/plain",@"image/jpeg", nil];
//        [manager.requestSerializer setValue:nil forHTTPHeaderField:nil];
    });
    return manager;
}


+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void (^)(id, NSError *))completionHandle{
    return [[self sharedAFManager] GET:path parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        completionHandle(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        completionHandle(nil, error);
    }];
}

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void (^)(id, NSError *))completionHandle{
    return [[self sharedAFManager] POST:path parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        completionHandle(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        completionHandle(nil, error);
    }];
}

@end














