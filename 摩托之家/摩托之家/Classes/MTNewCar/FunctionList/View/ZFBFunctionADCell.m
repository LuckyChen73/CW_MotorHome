//
//  ZFBFunctionADCell.m
//  07-功能列表
//
//  Created by HM09 on 17/1/16.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "ZFBFunctionADCell.h"
#import "ZFBCycleView.h"

@interface ZFBFunctionADCell ()
@property (weak, nonatomic) IBOutlet ZFBCycleView *cycleView;

@end
@implementation ZFBFunctionADCell

- (void)setImageNames:(NSArray *)imageNames {
    _imageNames = imageNames;
    
    self.cycleView.imageNames = imageNames;
}

@end
