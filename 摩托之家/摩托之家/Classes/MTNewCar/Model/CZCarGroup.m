//
//  CZCarGroup.m
//  A07-汽车品牌
//
//  Created by chao on 15/8/5.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZCarGroup.h"
#import "CZCar.h"

@implementation CZCarGroup
+ (instancetype)carGroupWithDict:(NSDictionary *)dict {
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
