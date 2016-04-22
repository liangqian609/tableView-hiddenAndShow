//
//  NSObject+Parse.m
//  BaseProject
//
//  Created by tarena on 15/12/17.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "NSObject+Parse.h"

@implementation NSObject (Parse)

+ (id)parseArr:(NSArray *)arr{
    NSMutableArray *array = [NSMutableArray new];
    for (id obj in arr) {
        [array addObject:[self parse:obj]];
    }
    return [array copy];
}

+ (id)parseDic:(NSDictionary *)dic{
    id model = [self new];
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
/** 考虑key的问题 */
        key = [self replacePropertyForKey:key];
        
/** 考虑数组的问题 */
        if ([obj isKindOfClass:[NSArray class]]) {
// 由子类重写的方法中获取array的key所对应的解析类
            Class class =[self objectClassInArray][key];
            if (class) {
                obj = [class parseArr:obj];
            }
        }
        
        [model setValue:obj forKey:key];
    }];
    return model;
}
+ (id)parse:(id)responseObj{
    if ([responseObj isKindOfClass:[NSArray class]]) {
        return [self parseArr:responseObj];
    }
    if ([responseObj isKindOfClass:[NSDictionary class]]) {
        return [self parseDic:responseObj];
    }
    return responseObj;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

- (void)setNilValueForKey:(NSString *)key{}

+ (NSString *)replacePropertyForKey:(NSString *)key{
//特殊情况处理
    if ([key isEqualToString:@"id"]) return @"ID";
    if ([key isEqualToString:@"description"]) {
        return @"desc";
    }
//    ......根据具体情况 具体添加
    return key;
}
/** 不实现会报错, 此类只有子类重写才有效 */
+ (NSDictionary *)objectClassInArray{
    return nil;
}

@end












