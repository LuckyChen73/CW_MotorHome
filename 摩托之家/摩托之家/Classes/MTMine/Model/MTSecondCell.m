//
//  MTZeroZeroCell.m
//  摩托之家
//
//  Created by chenWei on 2017/2/24.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "MTSecondCell.h"

@implementation MTSecondCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupUI];
}

- (void)setupUI
{
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    
    //1.创建 uilab
    UILabel *lab = [[UILabel alloc]init];
    lab.text = @"询价记录";
    
    [self.contentView addSubview:lab];
    
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(40);
        make.centerY.offset(0);
    }];
    
    
    //2.“去签到”btn
    UIButton *btn = [[UIButton alloc]init];
    [btn setTitle:@"去签到" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.contentView addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-20);
        make.centerY.offset(0);
    }];
    
    
    //添加右侧 lab
    //UILabel *rightLab = [[UILabel alloc]init];
    
    
    
    
    
    
}







@end
