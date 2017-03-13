//
//  MTMineViewController.m
//  摩托之家
//
//  Created by chenWei on 2017/2/24.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "MTMineViewController.h"
#import "MTMineFlowLayout.h"
#import "MTHeaderView.h"
#import "MTSecondCell.h"

@interface MTMineViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDelegate>

//头部视图
@property (nonatomic, weak) MTHeaderView *headerV;




@end
//第0行 cell
//static NSString *zeroID = @"zeroID";
//第1行
static NSString *firstID = @"firstID";
//第2行
static NSString *secondID = @"secondID";



@implementation MTMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
}

- (void)setupUI
{
    //1.加载头部视图
    [self loadHeaderView];
    
    //2.创建 collectionView
    [self createCollectionView];
    
    
}

#pragma mark - 加载头部视图
- (void)loadHeaderView
{
    //加载头部视图
    UINib *nib1 = [UINib nibWithNibName:@"MTZeroCell" bundle:nil];
    MTHeaderView *headerV = [[nib1 instantiateWithOwner:nil options:nil] firstObject];
    [self.view addSubview:headerV];
    [headerV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.height.offset(130);
    }];

    //记录
    _headerV = headerV;
    
    
}

#pragma mark - 创建 collectionView
- (void)createCollectionView
{
    
    MTMineFlowLayout *layout = [[MTMineFlowLayout alloc]init];
    //创建
    UICollectionView *collV = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    collV.backgroundColor = [UIColor colorWithWhite:0.98 alpha:1];
    [self.view addSubview:collV];
    [collV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headerV.mas_bottom).offset(0);
        make.left.right.bottom.offset(0);
    }];
    
    //collV.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    collV.dataSource = self;
    collV.delegate = self;
    
    //注册 cell 加载 xib
    UINib *nib2 = [UINib nibWithNibName:@"MTFirstCell" bundle:nil];
    [collV registerNib:nib2 forCellWithReuseIdentifier: firstID];
    
    
    [collV registerClass:[MTSecondCell class] forCellWithReuseIdentifier:secondID];
    

}




#pragma mark - 实现数据源方法
//多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
//多少行
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        
        return 1;
        
    }
    
    return 10;
}
//具体的 cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //第0行
    if (indexPath.section == 0) {
        //1.创建 cell
        UICollectionViewCell *zeroCell = [collectionView dequeueReusableCellWithReuseIdentifier:firstID forIndexPath:indexPath];
        
        //2.给 cell赋值
        
        //3.返回 cell
        return zeroCell;
    }
    
    //第1行
    //1.创建 cell
    MTSecondCell *secondCell = [collectionView dequeueReusableCellWithReuseIdentifier:secondID forIndexPath:indexPath];
    //2.给 cell 赋值
    
    //3.返回 cell
    return secondCell;
    
}

#pragma mark - 返回每一个格子的真实大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // collectionVeiw的宽
    CGFloat collectionViewW = collectionView.bounds.size.width;
    
    if (indexPath.section == 0) {
        
        return CGSizeMake(collectionViewW, 120);
        
    }
//    else if (indexPath.section == 1) {
//        
//        return CGSizeMake(collectionViewW, 120);
//        
//    }
    
    return CGSizeMake(collectionViewW, 45);
    
    
}






//修改状态栏的样式
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


@end
