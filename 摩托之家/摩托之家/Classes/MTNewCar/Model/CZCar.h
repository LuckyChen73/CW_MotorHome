//
//  CZCar.h
//  A07-汽车品牌
//
//  Created by chao on 15/8/5.
//  Copyright (c) 2015年 itcast. All rights reserved.
/// 一个CZCar代表一辆汽车

#import <Foundation/Foundation.h>

@interface CZCar : NSObject
// 汽车的图片
@property (nonatomic, copy) NSString *icon;
// 车名
@property (nonatomic, copy) NSString *name;


+ (instancetype)carWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;


@end
