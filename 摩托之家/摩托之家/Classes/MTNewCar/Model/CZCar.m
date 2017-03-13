//
//  CZCar.m
//  A07-汽车品牌
//
//  Created by chao on 15/8/5.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZCar.h"

@implementation CZCar
+ (instancetype)carWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}


- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
