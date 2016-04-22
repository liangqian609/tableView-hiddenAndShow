//
//  TestDataModel.h
//  BaseProject
//
//  Created by iOS开发本-(梁乾) on 16/4/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseModel.h"

@interface TestDataModel : BaseModel
@property (nonatomic, copy) NSString* payment;
@property (nonatomic, copy) NSString* orderDate;
@property (nonatomic, copy) NSString* startAddress;
@property (nonatomic, copy) NSString* destination;
@property (nonatomic, copy) NSString* passTime;
@property (nonatomic, copy) NSString* favourablePrice;


+(instancetype)demoData;
@end
