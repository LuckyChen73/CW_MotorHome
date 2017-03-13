//
//  MTFunctionCollectionView.m
//  摩托之家
//
//  Created by chenWei on 2017/3/13.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "MTFunctionCollectionView.h"
#import "ZFBFunctionADCell.h"
#import "ZFBFunctionListCell.h"
#import "NSArray+Addition.h"

// 第0组的cell个数
#define ZFBFunctionZeroSectionCount  10

// 图片个数
#define ZFBCycleImageCount  5

@interface MTFunctionCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) NSArray *functionListData;


@end

static NSString *ZFBFunctionListCellID = @"ZFBFunctionListCellID";
static NSString *ZFBFunctionADCellID = @"ZFBFunctionADCellID";

@implementation MTFunctionCollectionView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
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

    // 1.设置背景颜色
    self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    // 2.加载数据
    self.functionListData = [self loadFunctionListData];
    
    //设置数据源
    self.dataSource = self;
    
    self.delegate = self;
    
    //设置内间距
    
    
    // 3.注册cell
    UINib *listNib = [UINib nibWithNibName:@"ZFBFunctionListCell" bundle:nil];
    [self registerNib:listNib forCellWithReuseIdentifier:ZFBFunctionListCellID];
    
    UINib *adNib = [UINib nibWithNibName:@"ZFBFunctionADCell" bundle:nil];
    [self registerNib:adNib forCellWithReuseIdentifier:ZFBFunctionADCellID];
    
    
}

#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return ZFBFunctionZeroSectionCount;
    }
    
    return 1;
    
    
    //    return self.functionListData.count - ZFBFunctionZeroSectionCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 返回第1组的广告cell
    if (indexPath.section == 0 && indexPath.row == 0) {
        ZFBFunctionADCell *adCell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFBFunctionADCellID forIndexPath:indexPath];
        adCell.imageNames = [self loadImageNames];
        return adCell;
    }
    
    
    ZFBFunctionListCell *listCell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFBFunctionListCellID forIndexPath:indexPath];
//    if (indexPath.section == 0) {
    
        listCell.functionList = self.functionListData[indexPath.item];
//    } else {
//        listCell.functionList = self.functionListData[indexPath.item + ZFBFunctionZeroSectionCount];
//    }
    return listCell;
}


// 返回每一个格子具体的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        return CGSizeMake(self.bounds.size.width, 120);
        
    }else if(indexPath.section == 0 && indexPath.row == 9) {
        
        return CGSizeMake(self.bounds.size.width, 40);
        
    }else if (indexPath.section == 1) {
        
        return CGSizeMake(self.bounds.size.width, 150);
    }
    
    CGFloat itemW = (self.bounds.size.width -  1) / 4;
    return CGSizeMake(itemW, itemW);
}

#pragma mark - 加载数据
- (NSArray *)loadFunctionListData {
    return [NSArray objectListWithPlistName:@"homeAllFunctions.plist" clsName:@"ZFBFunctionList"];
}


#pragma mark - 加载图片轮播器数据
- (NSArray *)loadImageNames {
    
    // 1.创建可变数组用来保存图片名称
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:ZFBCycleImageCount];
    for (NSInteger i = 0; i < ZFBCycleImageCount; i++) {
        [arrM addObject:@(i).description];
    }
    
    return arrM;
}




@end
