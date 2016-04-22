//
//  NSObject+MJParse.m
//  BaseProject
//
//  Created by tarena on 15/12/17.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "NSObject+MJParse.h"

@implementation NSObject (MJParse)
/** MJExtension是从属性名 -> key */
/*
 如果 key 就是 desc, 那么下方代码自动切换为description则出错
 */
/*
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    if ([propertyName isEqualToString:@"ID"]) {
        propertyName = @"id";
    }
    if ([propertyName isEqualToString:@"desc"]) {
        propertyName = @"description";
    }
//    .......
    return propertyName;
}
*/
+ (id)parse:(id)responseObj{
    if ([responseObj isKindOfClass:[NSArray class]]) {
        return [self objectArrayWithKeyValuesArray:responseObj];
    }
    if ([responseObj isKindOfClass:[NSDictionary class]]) {
        return [self objectWithKeyValues:responseObj];
    }
    return responseObj;
}

@end












