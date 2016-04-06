//
//  MenuViewController.m
//  DFDrawer
//
//  Created by qqqq on 15/12/14.
//  Copyright © 2015年 董永飞. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;

@end

@implementation MenuViewController


- (instancetype)initWithViewController:(UIViewController *)viewController {
    self = [super init];
    if (self) {
        _middleVC = viewController;
       
    }
    return self;
}
- (BOOL)isShow {
    if(self.middleVC.view.frame.origin.x == 0) {
        return NO;
    }
    return YES;
}
- (void)viewSlide:(UIPanGestureRecognizer *)sender {
    CGFloat senderX;
    if (!self.panGesture.enabled) {
        senderX = [sender translationInView:sender.view].x;
    }else {
        senderX = kDrawerOffset + [sender translationInView:sender.view].x;
    }
    if (sender.state == UIGestureRecognizerStateEnded || senderX < 0) {
        if (senderX > kDrawerOffset / 2) {
            [self drawerShow];
        }else {
            [self drawerHide];
        }
    }else {
        if (senderX > kDrawerOffset) {
            return;
        }
        [self.middleVC.view setFrame:CGRectMake(senderX, 0, width, height)];

    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshView];
}
- (void)refreshView {
    [self.view addSubview:self.middleVC.view];
    self.view.backgroundColor = [UIColor cyanColor];
    //屏幕边缘滑动手势
    UIScreenEdgePanGestureRecognizer *screenEdgePan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(viewSlide:)];
    screenEdgePan.edges = UIRectEdgeLeft;
    [self.middleVC.view addGestureRecognizer:screenEdgePan];
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(viewSlide:)];
    [self.middleVC.view addGestureRecognizer:self.panGesture];
    self.panGesture.enabled = NO;

}
- (void)drawerShow {
    self.panGesture.enabled = YES;
    [UIView animateWithDuration:0.5 animations:^{
        [self.middleVC.view setFrame:CGRectMake(kDrawerOffset, 0, width, height)];
    }];
}
- (void)drawerHide {
    self.panGesture.enabled = NO;
    [UIView animateWithDuration:0.5 animations:^{
        [self.middleVC.view setFrame:CGRectMake(0, 0, width, height)];
    }];
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
