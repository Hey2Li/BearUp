//
//  HomeViewController.m
//  BearUp
//
//  Created by Tebuy on 16/10/13.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self initWithNavi];
}
- (void)initWithNavi{
    _navigationView = [[TitleView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    _navigationView.backgroundColor = [UIColor clearColor];
    _navigationView.title = @"熊 起";
    _navigationView.isTranslucent = YES;
    
    UIButton *listBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    listBtn.frame = CGRectMake(0, 0, 40, 40);
    UIImage *listImg = [UIImage imageNamed:@"导航"];
    listImg = [listImg imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [listBtn setImage:listImg forState:UIControlStateNormal];
    [listBtn setTintColor:[UIColor whiteColor]];
    [listBtn addTarget:self action:@selector(openLeft) forControlEvents:UIControlEventTouchUpInside];
    _navigationView.leftBarButton = listBtn;
    
    UIButton *personBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    personBtn.frame = CGRectMake(0, 0, 40, 40);
    UIImage *personImg = [UIImage imageNamed:@"Profile"];
    personImg = [personImg imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [personBtn setImage:personImg forState:UIControlStateNormal];
    [personBtn setTintColor:[UIColor whiteColor]];
    [personBtn addTarget:self action:@selector(openRight) forControlEvents:UIControlEventTouchUpInside];
    _navigationView.rightBarButton = personBtn;
    
    [self.view addSubview:_navigationView];
}

#pragma mark - ButtonAction

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
