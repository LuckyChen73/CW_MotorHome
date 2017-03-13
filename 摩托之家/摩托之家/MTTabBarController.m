//
//  MTTabBarViewController.m
//  摩托之家
//
//  Created by chenWei on 2017/2/24.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "MTTabBarController.h"
#import "MTNavigationController.h"

@interface MTTabBarController ()

@property (nonatomic, strong) NSArray<UIViewController *> *cls;

@end

@implementation MTTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self setupUI];
    
}

#pragma mark - 创建及添加控制器
- (void)setupUI
{
    
    NSArray *clsNameList = @[@"MTNewCarViewController", @"MTUsedCarViewController", @"MTDiscovryViewController", @"MTHelpPurchaseViewController", @"MTMineViewController"];
    
    NSArray *titleName = @[@"新车", @"二手车", @"发现", @"帮买车", @"我的"];
    
    //保存控制器
    NSMutableArray<UIViewController *> *clsArr = [NSMutableArray array];
    
    for (NSInteger i = 0; i < 5; i++) {
        
        if (i < 4) {
            
            UIViewController *vc = [self makeViewControllerWithVcName:clsNameList[i] withTitle:titleName[i] withImageName:nil];
            
            [clsArr addObject:vc];
            
        }else {
            
            UIViewController *vc = [self createViewControllerWithVcName:clsNameList[i] withTitle:titleName[i] withImageName:nil];
            
            [clsArr addObject:vc];
            
            
        }
    }
    
    
    self.viewControllers = clsArr.copy;
    
}

//MARK : 不加导航控制器
- (UIViewController *)createViewControllerWithVcName:(NSString *)vcName withTitle:(NSString *)title withImageName:(NSString *)imgName
{
    Class cls = NSClassFromString(vcName);
    
    UIViewController *vc = [[cls alloc]init];
    
    //vc.view.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    vc.title = title;
    
    vc.tabBarItem.image = [UIImage imageNamed:imgName];
    
    //UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    
    return vc;
}


//MARK : 加导航控制器
- (UIViewController *)makeViewControllerWithVcName:(NSString *)vcName withTitle:(NSString *)title withImageName:(NSString *)imgName
{
    Class cls = NSClassFromString(vcName);
    
    UIViewController *vc = [[cls alloc]init];
    
    vc.view.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    vc.title = title;
    
    
    
    vc.tabBarItem.image = [UIImage imageNamed:imgName];
    
    MTNavigationController *nav = [[MTNavigationController alloc]initWithRootViewController:vc];
    
    return nav;
}
















@end
