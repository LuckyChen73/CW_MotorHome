//
//  MTCarPlayView.m
//  摩托之家
//
//  Created by chenWei on 2017/2/24.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "MTCarPlayView.h"
#import "CZCarGroup.h"
#import "CZCar.h"

@interface MTCarPlayView ()<UITableViewDataSource>

@property (nonatomic, strong) NSArray *carGroups;

@end


@implementation MTCarPlayView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:UITableViewStylePlain]) {
        
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
    //加载数据
    _carGroups = [self loadCarGroupData];
    
    self.dataSource = self;
    
}

#pragma mark -数据源方法
// 一共有多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.carGroups.count;
}

// 每一组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 取出对应组的汽车组模型
    CZCarGroup *group = self.carGroups[section];
    // 组模型中的cars数组长度代表此组的行数
    return group.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.创建一个可以重用的标识符
    static NSString *ID = @"car";
    // 2.先从tableView的缓存池去寻找可重用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 3.如果缓存池没有可以重用的cell,我们手动创建,并添加标识符
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    // 4.给cell设置数据
    // 先取出对应组的组模型
    CZCarGroup *group = self.carGroups[indexPath.section];
    // 再取出对应行的车模型
    CZCar *car = group.cars[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.textLabel.text = car.name;
    return cell;
}

// 返回每组的头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    CZCarGroup *group = self.carGroups[section];
    return group.title;
}
// 返回组的索引标题
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    // 取出模型数组中每一个模型的title属性并返回一个装有所有title值的数组
    return [self.carGroups valueForKeyPath:@"title"];
}


#pragma mark -数据懒加载
- (NSArray *)loadCarGroupData {
    // 1.读取plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_total.plist" ofType:nil];
    NSArray *dictArr = [NSArray arrayWithContentsOfFile:path];
    
    // 2.创建可变数据用来保存汽车组模型
    NSMutableArray *groupArrM = [NSMutableArray arrayWithCapacity:dictArr.count];
    // 3.遍历plist字典数组,把汽车组字典转换成汽车组模型
    for (NSDictionary *grouDict in dictArr) {
        // 3.1 汽车组模型
        CZCarGroup *group = [CZCarGroup carGroupWithDict:grouDict];
        
        // 4.取出当前组中所有汽车的字典数组
        NSArray *carDictArr = group.cars;
        // 5.创建可变数组用来保存当前组中所有的汽车模型
        NSMutableArray *carArrM = [NSMutableArray arrayWithCapacity:dictArr.count];
        
        // 6.遍历当前组所有汽车字典数组,做字典转模型
        for (NSDictionary *carDict in carDictArr) {
            // 6.1汽车模型
            CZCar *car = [CZCar carWithDict:carDict];
            // 7.把汽车模型添加到可变数组
            [carArrM addObject:car];
        }
        
        // 8.把装有当前组所有汽车的模型数组赋值给cars数组,覆盖里面之前装的字典数组
        group.cars = carArrM;
        
        // 9.把汽车组模型添加到可变数组
        [groupArrM addObject:group];
    }
    
    return groupArrM.copy;
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
