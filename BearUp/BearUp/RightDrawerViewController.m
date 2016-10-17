//
//  RightDrawerViewController.m
//  BearUp
//
//  Created by Tebuy on 16/10/12.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import "RightDrawerViewController.h"
#import "LeftDrawerTableViewCell.h"

@interface RightDrawerViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIButton *BackBtn;
@property (nonatomic, strong) UIButton *SettingBtn;
@property (nonatomic, strong) UITableView *myTableView;
@end

@implementation RightDrawerViewController
@synthesize BackBtn;
@synthesize SettingBtn;

- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView = [UITableView new];
        _myTableView.backgroundColor = RGBCOLOR(38, 38, 38);
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.separatorStyle = NO;
        _myTableView.scrollEnabled = NO;
        [self.view addSubview:_myTableView];
        [self.view sendSubviewToBack:_myTableView];
        [_myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_left);
            make.right.equalTo(self.view.mas_right);
            make.top.equalTo(self.view.mas_top).offset(64);
            make.bottom.equalTo(self.view.mas_bottom);
        }];
    }
    return _myTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBCOLOR(38, 38, 38);
    [self initWithView];
}
- (void)initWithView{
    BackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    SettingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *backImg = [UIImage imageNamed:@"Esc"];
    UIImage *settingImg = [UIImage imageNamed:@"Settings"];
    
    backImg = [backImg imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    settingImg = [settingImg imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [BackBtn setTintColor:[UIColor whiteColor]];
    [SettingBtn setTintColor:[UIColor whiteColor]];
    
    [BackBtn setImage:backImg forState:UIControlStateNormal];
    [SettingBtn setImage:settingImg forState:UIControlStateNormal];
    [BackBtn addTarget:self action:@selector(BackHome) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:BackBtn];
    [self.view addSubview:SettingBtn];
    
    [BackBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(28);
        make.top.equalTo(self.view.mas_top).offset(30);
        make.height.equalTo(@30);
        make.width.equalTo(@30);
    }];
    
    [SettingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-28);
        make.top.equalTo(BackBtn.mas_top);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];

    //tableView头视图
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight/4)];
    headerView.backgroundColor = RGBCOLOR(38, 38, 38);
    
    UIImageView *headSculpture = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    headSculpture.image = [UIImage imageNamed:@"avatar_photo"];
    headSculpture.layer.masksToBounds = YES;
    headSculpture.layer.cornerRadius = 40;
    headSculpture.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [headerView addSubview:headSculpture];
    [headSculpture mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headerView.mas_centerX);
        make.centerY.equalTo(headerView.mas_centerY);
        make.width.equalTo(@80);
        make.height.equalTo(@80);
    }];
    
    UIButton *LoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [LoginBtn setTitle:@"登录" forState:UIControlStateNormal];
    LoginBtn.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightUltraLight];
    [LoginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [headerView addSubview:LoginBtn];
    [LoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headerView.mas_centerX);
        make.bottom.equalTo(headerView.mas_bottom);
        make.width.equalTo(@80);
        make.height.equalTo(@40);
    }];
    
    self.myTableView.tableHeaderView = headerView;
}
#pragma mark TableViewDelagate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"MyCell";
    LeftDrawerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[LeftDrawerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = RGBCOLOR(38, 38, 38);
    }
    cell.leftDrawerBtnClick = ^{
        NSLog(@"点击了..");
    };
    switch (indexPath.row) {
        case 0:{
            [cell.TitleBtn setTitle:@"消 息" forState:UIControlStateNormal];
        }
            break;
        case 1:{
            [cell.TitleBtn setTitle:@"收 藏" forState:UIControlStateNormal];
        }
            break;
        case 2:{
            [cell.TitleBtn setTitle:@"离 线" forState:UIControlStateNormal];
        }
            break;
        case 3:{
            
            [cell.TitleBtn setTitle:@"笔 记" forState:UIControlStateNormal];
        }
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    CGRect originFrame = cell.frame;
    CGRect frame = cell.frame;
    frame.origin.x = frame.size.width;
    cell.frame = frame;
    
    NSTimeInterval duration = 0.5 + (NSTimeInterval)(indexPath.row) / 6.0;
    [UIView animateWithDuration:duration animations:^{
        cell.frame = originFrame;
    } completion:nil];
}

- (void)btnAnimation{
    [UIView animateWithDuration:0.6 animations:^{
        BackBtn.transform = CGAffineTransformIdentity;//恢复原状
        SettingBtn.transform = CGAffineTransformIdentity;
        BackBtn.alpha = 1;
        SettingBtn.alpha = 1;
    }];
}
- (void)viewWillAppear:(BOOL)animated {
    [self prepareForAnimation];
    [self.myTableView reloadData];
}
- (void)viewDidAppear:(BOOL)animated{
    [self btnAnimation];
}
//动画前的准备
- (void)prepareForAnimation {
    BackBtn.transform = CGAffineTransformMakeScale(0.1, 0.1);//缩小至0.1倍
    SettingBtn.transform = CGAffineTransformMakeScale(0.1, 0.1);
    BackBtn.alpha = 0;
    SettingBtn.alpha = 0;
}

- (void)BackHome{
    if (self.mm_drawerController != nil) {
        [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
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
