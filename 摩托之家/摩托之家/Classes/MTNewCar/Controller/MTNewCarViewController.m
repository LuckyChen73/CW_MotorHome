//
//  MTNewCarViewController.m
//  摩托之家
//
//  Created by chenWei on 2017/2/24.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "MTNewCarViewController.h"
#import "MTCarPlayView.h"
#import "MTFunctionCollectionView.h"
#import "ZFBFunctionListFlowLayout.h"


@interface MTNewCarViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) MTCarPlayView *carplayV;

@end

@implementation MTNewCarViewController

//MARK:允许同时多个手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    ZFBFunctionListFlowLayout *layout = [[ZFBFunctionListFlowLayout alloc] init];
    
    //给 tableView 添加一个 headerview
    MTFunctionCollectionView *headerV = [[MTFunctionCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    
    
    //创建 carplayView
    MTCarPlayView *carplayV = [[MTCarPlayView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.view addSubview:carplayV];
    
    carplayV.tableHeaderView = headerV;
    
    headerV.frame = CGRectMake(0, 0, self.view.bounds.size.width, 510);
    
 
}

#pragma mark - 实现拖拽手势调用的方法
- (void)pan:(UIPanGestureRecognizer *)sender
{
    
    //1.获取手势在视图中的位置(偏移值) 偏移：translationInView:
    CGPoint offset = [sender translationInView:sender.view];
    
    //    NSLog(@"%f",offset.y);
    
    //2.清零（复位）
    [sender setTranslation:CGPointZero inView:sender.view];
    
    //3.把偏移值的y值 + 当前topView的高度得到要变化的高度
    CGFloat height = offset.y + _topV.bounds.size.height;
    
    //4.判断计算的高度是否<64或者>123,如果是，则return，不改变高度
    if (height < NAV_HEIGHT) {
        
        return;
    }
    
//    //y值变化多少，头部视图高度也要变化
//    //5.更新topView的高度约束
//    [_topV mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_offset(height);
//    }];
//    
    //让计算提前
    [self.view layoutIfNeeded];
    
    
    //拖拽改变导航条透明度
    //可移动的高度
    CGFloat offsetH = TOPV_HEIGHT - NAV_HEIGHT;
    
    //取到导航控制器的起初透明度属性
    CGFloat oldAlpha = self.navigationController.navigationBar.alpha;
    
    //1.先取出每个点占用的alpha比例
    CGFloat alpha = oldAlpha - offset.y * 1 / offsetH;
    
    self.navigationController.navigationBar.alpha = alpha;
    
 
}

@end
