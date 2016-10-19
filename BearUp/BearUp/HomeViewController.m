//
//  HomeViewController.m
//  BearUp
//
//  Created by Tebuy on 16/10/13.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCollectionViewCell.h"

@interface HomeViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *myCollectionView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self initWithNavi];
    [self initWithView];
}
- (void)initWithView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(kScreenWidth, kScreenHeight);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) collectionViewLayout:flowLayout];
    _myCollectionView.backgroundColor = [UIColor blackColor];
    _myCollectionView.pagingEnabled = YES;
    _myCollectionView.dataSource = self;
    _myCollectionView.delegate = self;
    _myCollectionView.showsHorizontalScrollIndicator = NO;
    _myCollectionView.showsVerticalScrollIndicator = NO;
    //    使视图控制器顶部不留空白
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:_myCollectionView];
    [self.view sendSubviewToBack:_myCollectionView];
    [_myCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    [_myCollectionView registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier:@"HomeCell"];
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

#pragma mark - UICollectionDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}
- (UIColor *)randomColor {
    CGFloat hue = arc4random() % 256 / 256.0;
    CGFloat saturation = arc4random() % 128 / 256.0 + 0.5;
    CGFloat brightness = arc4random() % 128 / 256.0 + 0.5;
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCell" forIndexPath:indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(kScreenWidth, kScreenHeight);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
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
