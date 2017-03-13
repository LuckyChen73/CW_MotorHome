//
//  MTFirstOtherCell.m
//  摩托之家
//
//  Created by chenWei on 2017/2/25.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "MTFirstOtherCell.h"

@implementation MTFirstOtherCell

-(instancetype)init{
    
    if (self = [super init]) {
        
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
    //间距
    CGFloat margin = 10;
    
    //MARK: 1- 创建子控件
    //1.创建imgV
    UIImageView *imgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"m_2_100"]];
    [self.contentView addSubview:imgV];
    
    
    //2.创建详情描述
    UILabel *detailLab = [[UILabel alloc]init];
    detailLab.text = @"奔驰 E350(进口)17款 尊雅型";
    detailLab.numberOfLines = 0;
    
    [self.contentView addSubview:detailLab];
    
    
    //3.价格
    UILabel *priceLab = [[UILabel alloc]init];
    priceLab.text = @"88.8万";
    priceLab.textColor = [UIColor redColor];
    priceLab.font = [UIFont systemFontOfSize:15];
    
    [self.contentView addSubview:priceLab];
    
    //4.年份和里程lab
    UILabel *yearLab = [[UILabel alloc]init];
    priceLab.text = @"2017/10万公里";
    priceLab.font = [UIFont systemFontOfSize:16];
    priceLab.textColor = [UIColor lightGrayColor];
    
    [self.contentView addSubview:yearLab];
    
    
    //5.销售地点
    UILabel *dressLab = [[UILabel alloc]init];
    dressLab.text = @"北京商家";
    dressLab.textColor = [UIColor lightGrayColor];
    dressLab.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:dressLab];
    
    
    //MARK: 2- 添加约束
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset(margin);
        make.bottom.offset(-margin);
        make.size.mas_offset(CGSizeMake(120, 100));
    }];

    [detailLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imgV.mas_right).offset(margin);
        make.top.equalTo(imgV.mas_top).offset(0);
        make.right.offset(-margin);
    }];
    
    [yearLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(detailLab.mas_left).offset(0);
        make.bottom.equalTo(imgV.mas_bottom).offset(0);
    }];
    
    
    
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
