//
//  BaseViewController.m
//  BearUp
//
//  Created by Tebuy on 16/10/12.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    UILabel *label = [UILabel new];
    [self.view addSubview:label];
    label.text = @"首页";
    label.font = [UIFont fontWithName:@"PMingLiU" size:30];
    label.textColor = [UIColor blackColor];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.height.equalTo(@50);
        make.width.equalTo(@50);
    }];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.backgroundColor= [UIColor redColor];
    leftBtn.titleLabel.text = @"左边";
    [leftBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:leftBtn];
    [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(50);
        make.top.equalTo(self.view.mas_top).offset(100);
        make.width.equalTo(@50);
        make.height.equalTo(@50);
    }];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    rightBtn.titleLabel.text = @"右边";
    rightBtn.backgroundColor= [UIColor redColor];
    [rightBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:rightBtn];
    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-50);
        make.top.equalTo(self.view.mas_top).offset(100);
        make.width.equalTo(@50);
        make.height.equalTo(@50);
    }];
    
    [leftBtn addTarget:self action:@selector(openLeft) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn addTarget:self action:@selector(openRight) forControlEvents:UIControlEventTouchUpInside];
}
- (void)openLeft {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

- (void)openRight {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
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
