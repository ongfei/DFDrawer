//
//  MenuViewController.h
//  DFDrawer
//
//  Created by qqqq on 15/12/14.
//  Copyright © 2015年 董永飞. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kDrawerOffset 300
#define width self.view.frame.size.width
#define height  self.view.frame.size.height


@interface MenuViewController : UIViewController

@property (nonatomic, strong, readonly) UIViewController *middleVC;
@property (nonatomic, getter=isShow) BOOL showing;

- (instancetype)initWithViewController:(UIViewController *)viewController;
/**
 *  打开抽屉
 */
- (void)drawerShow;
/**
 *  关闭抽屉
 */
- (void)drawerHide;
/**
 *  刷新视图
 */
- (void)refreshView;
@end
