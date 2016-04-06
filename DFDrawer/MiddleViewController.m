//
//  MiddleViewController.m
//  DFDrawer
//
//  Created by qqqq on 15/12/14.
//  Copyright © 2015年 董永飞. All rights reserved.
//

#import "MiddleViewController.h"
#import "AppDelegate.h"

@interface MiddleViewController ()

@end

@implementation MiddleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"品红页";
    self.view.backgroundColor = [UIColor magentaColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"➡️" style:(UIBarButtonItemStylePlain) target:self action:@selector(open:)];
}
- (void)open:(UIBarButtonItem *)bar {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    MenuTableViewController *menuVC = appDelegate.menuVC;
    if (menuVC.showing) {
        [menuVC drawerHide];
        return;
    }else {
        [menuVC drawerShow];
    }
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
