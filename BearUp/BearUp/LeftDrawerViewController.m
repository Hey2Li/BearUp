//
//  LeftDrawerViewController.m
//  BearUp
//
//  Created by Tebuy on 16/10/12.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import "LeftDrawerViewController.h"
#import "LeftDrawerTableViewCell.h"
#import "OtherViewController.h"

@interface LeftDrawerViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIButton *BackBtn;
@property (nonatomic, strong) UIButton *SettingBtn;
@property (nonatomic, strong) UITableView *myTableView;
@end

@implementation LeftDrawerViewController
@synthesize BackBtn;
@synthesize SettingBtn;

static NSString *identifier = @"MyCell";

- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView = [UITableView new];
        _myTableView.backgroundColor = [UIColor orangeColor];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.separatorStyle = NO;
        _myTableView.scrollEnabled = NO;
        [self.view addSubview:_myTableView];
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
    self.view.backgroundColor = [UIColor orangeColor];
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
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight/4 - 30)];
    headerView.backgroundColor = [UIColor orangeColor];
    UILabel *topTitle = [UILabel new];
    topTitle.text = @"熊起";
    topTitle.textAlignment = NSTextAlignmentCenter;
    [topTitle setTextColor:[UIColor whiteColor]];
    [headerView addSubview:topTitle];
    [topTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headerView.mas_centerX);
        make.centerY.equalTo(headerView.mas_centerY).offset(-40);
        make.height.equalTo(@50);
        make.width.equalTo(@100);
    }];
    topTitle.font = [UIFont fontWithName:@"PMingLiU" size:20];
    
    UILabel *centerWord = [UILabel new];
    centerWord.textColor = [UIColor whiteColor];
    centerWord.text = @"H e l l o  W o r l d  !";
    centerWord.textAlignment = NSTextAlignmentCenter;
    centerWord.font = [UIFont fontWithName:@"Academy Engraved LET" size:11];
    [headerView addSubview:centerWord];
    [centerWord mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headerView.mas_centerX);
        make.centerY.equalTo(headerView.mas_centerY).offset(10);
        make.width.equalTo(@150);
        make.height.equalTo(@25);
    }];

    UILabel *leftLine = [UILabel new];
    UILabel *rightLine = [UILabel new];
    leftLine.backgroundColor = [UIColor colorWithWhite:1 alpha:0.2];
    rightLine.backgroundColor = [UIColor colorWithWhite:1 alpha:0.2];
    [headerView addSubview:leftLine];
    [headerView addSubview:rightLine];
    [leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.width.equalTo(@(kScreenWidth/3 - 20));
        make.left.equalTo(headerView.mas_left);
        make.centerY.equalTo(headerView.mas_centerY).offset(10);
    }];
    [rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.width.equalTo(@(kScreenWidth/3 - 20));
        make.right.equalTo(headerView.mas_right);
        make.centerY.equalTo(headerView.mas_centerY).offset(10);
    }];
    
    self.myTableView.tableHeaderView = headerView;
}

#pragma mark TableViewDelagate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LeftDrawerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[LeftDrawerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = [UIColor orangeColor];
    }
    switch (indexPath.row) {
        case 0:{
            [cell.TitleBtn setTitle:@"首 页" forState:UIControlStateNormal];
        }
            break;
        case 1:{
            [cell.TitleBtn setTitle:@"文 字" forState:UIControlStateNormal];
        }
            break;
        case 2:{
            [cell.TitleBtn setTitle:@"影 像" forState:UIControlStateNormal];
        }
            break;
        case 3:{
            [cell.TitleBtn setTitle:@"漫 画" forState:UIControlStateNormal];
        }
            break;
        case 4:{
            [cell.TitleBtn setTitle:@"搜 索" forState:UIControlStateNormal];
        }
            break;
        default:
            break;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            [self BackHome];
            break;
        case 1:{
            OtherViewController *vc = [[OtherViewController alloc]init];
            vc.number = 1;
            vc.naviTitle = @"文字";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:{
            OtherViewController *vc = [[OtherViewController alloc]init];
            vc.number = 2;
            vc.naviTitle = @"视频";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:{
            OtherViewController *vc = [[OtherViewController alloc]init];
            vc.number = 3;
            vc.naviTitle = @"声音";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
//            [self.navigationController pushViewController:[OtherViewController new] animated:YES];
            break;
    }
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    CGRect originFrame = cell.frame;
    CGRect frame = cell.frame;
    frame.origin.x = -frame.size.width;
    cell.frame = frame;
    
    NSTimeInterval duration = 0.5 + (NSTimeInterval)(indexPath.row) / 6.0;
    [UIView animateWithDuration:duration animations:^{
        cell.frame = originFrame;
    } completion:nil];
}

- (void)BackHome{
    if (self.mm_drawerController != nil) {
        [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    }
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
