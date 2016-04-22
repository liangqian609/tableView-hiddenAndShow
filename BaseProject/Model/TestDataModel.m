//
//  TestDataModel.m
//  BaseProject
//
//  Created by iOS开发本-(梁乾) on 16/4/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TestDataModel.h"

@implementation TestDataModel

+(instancetype)demoData
{
    TestDataModel* testData = [[TestDataModel alloc] init];
    testData.payment = @"已支付";
    testData.orderDate = @"2016-06-06";
    testData.startAddress = @"深圳大学";
    testData.destination = @"世界之窗";
    testData.passTime = @"07:00";
    testData.favourablePrice = @"5.0";
    return testData;
}
@end
