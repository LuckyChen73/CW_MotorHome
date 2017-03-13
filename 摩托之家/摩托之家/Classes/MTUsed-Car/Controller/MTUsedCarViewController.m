//
//  MTUsedCarViewController.m
//  摩托之家
//
//  Created by chenWei on 2017/2/24.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "MTUsedCarViewController.h"


@interface MTUsedCarViewController ()<UITableViewDataSource>

@end

//重用标识
static NSString *zeroRid = @"zeroRid";
static NSString *otherRid = @"otherRid";

@implementation MTUsedCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    
}

- (void)setupUI
{
    //1.创建头部视图
    
    //2.创建 tableView
    UITableView *tabV = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    tabV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tabV];
    [tabV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.offset(0);
    }];
    
    //给 tableView 设置数据源
    tabV.dataSource = self;
    
    //注册 cell
    [tabV registerClass:[UITableViewCell class] forCellReuseIdentifier:zeroRid];
    
    UINib *nib = [UINib nibWithNibName:@"MTFirstSectionCell" bundle:nil];
    // = [[nib instantiateWithOwner:nil options:nil] firstObject];
    [tabV registerNib:nib forCellReuseIdentifier:otherRid];
    
    
}

#pragma mark - 实现数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.如果是第0个 cell
    if (indexPath.row == 0) {
        //1.创建 cell
        UITableViewCell *zeroCell = [tableView dequeueReusableCellWithIdentifier:zeroRid forIndexPath:indexPath];

        //2.给 cell赋值
        zeroCell.textLabel.text = @"第0个";
        
        //3.返回 cell
        return zeroCell;
    }
    
    //1.创建 cell
    UITableViewCell *otherCell = [tableView dequeueReusableCellWithIdentifier:zeroRid forIndexPath:indexPath];
    
    //2.给 cell赋值
    otherCell.textLabel.text = @"其他的";
    
    //3.返回 cell
    return otherCell;
    
    
    
}










@end
