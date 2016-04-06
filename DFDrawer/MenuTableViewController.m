//
//  MenuTableViewController.m
//  DFDrawer
//
//  Created by qqqq on 15/12/14.
//  Copyright © 2015年 董永飞. All rights reserved.
//

#import "MenuTableViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "AppDelegate.h"

@interface MenuTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *menuTableView;
@property (nonatomic, strong) NSMutableArray *sourceArray;
@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    self.sourceArray = [NSMutableArray arrayWithObjects:@"绿页",@"黄页",@"蓝页",@"紫页",nil];
    self.view.backgroundColor = [UIColor redColor];
    self.menuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDrawerOffset, height) style:(UITableViewStylePlain)];
    self.menuTableView.delegate = self;
    self.menuTableView.dataSource = self;
    [self.view addSubview:self.menuTableView];
    self.menuTableView.tableHeaderView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 200)];
        view.backgroundColor = [UIColor colorWithWhite:0.400 alpha:1.000];
        view;
    });
    [super viewDidLoad];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sourceArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.sourceArray[indexPath.row];
    cell.detailTextLabel.text = @"点击查看详情";
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController *viewController;
    switch (indexPath.row) {
        case 0: {
            viewController = [FirstViewController new];
            break;
        }
        case 1: {
            viewController = [SecondViewController new];
            break;
        }
        case 2: {
            viewController = [ThirdViewController new];
            break;
        }
        case 3:{
            viewController = [FourViewController new];
            break;
        }
        default:
            break;
    }
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self.middleVC.view removeFromSuperview];
    [self setValue:navigation forKey:@"middleVC"];
    [super refreshView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
