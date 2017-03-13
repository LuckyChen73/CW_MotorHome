//
//  CZCarGroup.h
//  A07-汽车品牌
//
//  Created by chao on 15/8/5.
//  Copyright (c) 2015年 itcast. All rights reserved.
/// 一个CZCarGroup代表一组汽车

#import <Foundation/Foundation.h>

@interface CZCarGroup : NSObject
// 组标题
@property (nonatomic, copy) NSString *title;
// 汽车数组(不能装字典,应该装汽车模型)
@property (nonatomic, strong) NSArray *cars;

+ (instancetype)carGroupWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
