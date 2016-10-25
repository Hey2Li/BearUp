//
//  OtherViewController.m
//  BearUp
//
//  Created by Tebuy on 16/10/20.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import "OtherViewController.h"
#import "OtherTableViewCell.h"
#import "TitleView.h"
#import "LHTTPManager.h"

@interface OtherViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) TitleView *titleView;
@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) NSMutableArray *dataMutableArray;
@end

@implementation OtherViewController
@synthesize myTableView;

- (NSMutableArray *)dataMutableArray{
    if (!_dataMutableArray) {
        _dataMutableArray = [NSMutableArray array];
    }
    return _dataMutableArray;
}
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewDidLoad {
    if (self.naviTitle) {
        self.title = self.naviTitle;
    }
    [super viewDidLoad];
    [self initWithView];
    [self initWithNavi];
    [self loadData];
}
- (void)initWithView{
    myTableView = [UITableView new];
    myTableView.backgroundColor = [UIColor whiteColor];
    myTableView.dataSource = self;
    myTableView.delegate = self;
    [self.view addSubview:myTableView];
    [myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(UIEdgeInsetsMake(44, 0, 0, 0));
    }];
}
- (void)initWithNavi {
    _titleView = [[TitleView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    _titleView.isTranslucent = NO;
    _titleView.backgroundColor = KBackgroundColor;
    switch (self.number) {
        case 1:
            _titleView.title = @"文字";
            break;
        case 2:
            _titleView.title = @"视频";
            break;
        case 3:
            _titleView.title = @"声音";
            break;
    }
    [self.view addSubview:_titleView];
    
    UIImage *back = [UIImage imageNamed:@"back_gray"];
    back = [back imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backBtn setImage:back forState:UIControlStateNormal];
    [_backBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [_backBtn setTintColor:[UIColor whiteColor]];
    [_titleView setLeftBarButton:_backBtn];
}
- (void)back:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)loadData{
    if (self.number) {
        [LHTTPManager GETRequsetTableWithModel:[NSString stringWithFormat:@"%ld",(long)self.number] Page:@"0" Page_id:@"0" Create_time:@"0" Complete:^(LTHttpResult result, NSString *message, id data) {
            if (result ==LTHttpResultSuccess) {
                [self.dataMutableArray removeAllObjects];
                self.dataMutableArray = [NSMutableArray arrayWithArray:data[@"datas"]];
                [myTableView reloadData];
            }else{
                
            }
        }];
    }
}
#pragma mark - tableviewDeleagate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataMutableArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OtherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"otherCell"];
    if (!cell) {
        cell = [[OtherTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"otherCell"];
    }
    if (self.dataMutableArray) {
        NSDictionary *dataDic = self.dataMutableArray[indexPath.row];
        [cell.LeftimgaeView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",dataDic[@"thumbnail"]]]];
        cell.titleLabel.text = [NSString stringWithFormat:@"%@",dataDic[@"title"]];
        cell.nameLabel.text = [NSString stringWithFormat:@"%@",dataDic[@"author"]];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}
- (UIColor *)randomColor {
    CGFloat hue = arc4random() % 256 / 256.0;
    CGFloat saturation = arc4random() % 128 / 256.0 + 0.5;
    CGFloat brightness = arc4random() % 128 / 256.0 + 0.5;
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
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
