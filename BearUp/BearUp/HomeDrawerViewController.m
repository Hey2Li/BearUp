//
//  HomeDrawerViewController.m
//  BearUp
//
//  Created by Tebuy on 16/10/12.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import "HomeDrawerViewController.h"
#import "BaseViewController.h"
#import "HomeViewController.h"
#import "LeftDrawerViewController.h"
#import "RightDrawerViewController.h"
#import "MMExampleDrawerVisualStateManager.h"

@interface HomeDrawerViewController ()

@end

@implementation HomeDrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.maximumLeftDrawerWidth = kScreenWidth;
    self.maximumRightDrawerWidth = kScreenWidth;
    self.showsShadow = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    //设置滑动样式
   [[MMExampleDrawerVisualStateManager sharedManager] setLeftDrawerAnimationType:MMDrawerAnimationTypeParallax];
    [[MMExampleDrawerVisualStateManager sharedManager] setRightDrawerAnimationType:MMDrawerAnimationTypeParallax];
    [self setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    self.animationVelocity = 600;
    [self setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
         MMDrawerControllerDrawerVisualStateBlock block;
         block = [[MMExampleDrawerVisualStateManager sharedManager]
                  drawerVisualStateBlockForDrawerSide:drawerSide];
         if(block){
             block(drawerController, drawerSide, percentVisible);
         }
     }];
    if (self.centerViewController == nil) {
        self.centerViewController = [HomeViewController new];
    }
    if (self.rightDrawerViewController == nil) {
        self.rightDrawerViewController = [RightDrawerViewController new];
    }
    if (self.leftDrawerViewController == nil) {
        self.leftDrawerViewController = [LeftDrawerViewController new];
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
