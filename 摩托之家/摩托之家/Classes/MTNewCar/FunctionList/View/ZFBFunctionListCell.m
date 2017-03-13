//
//  ZFBFunctionListCell.m
//  07-功能列表
//
//  Created by HM09 on 17/1/16.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "ZFBFunctionListCell.h"
#import "ZFBFunctionList.h"

@interface ZFBFunctionListCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
@implementation ZFBFunctionListCell

- (void)setFunctionList:(ZFBFunctionList *)functionList {
    _functionList = functionList;
    
    self.iconView.image = [UIImage imageNamed:functionList.icon];
    self.nameLabel.text = functionList.name;
}

@end
