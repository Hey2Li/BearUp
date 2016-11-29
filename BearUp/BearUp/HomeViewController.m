//
//  HomeViewController.m
//  BearUp
//
//  Created by Tebuy on 16/10/13.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCollectionViewCell.h"
#import <ImageIO/ImageIO.h>
#import "HomeCellModel.h"
#import "DetailViewController.h"

@interface HomeViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *myCollectionView;
@property (nonatomic, strong) NSMutableArray *idleImages;
@property (nonatomic, strong) NSMutableArray *pullingImages;
@property (nonatomic, strong) NSMutableArray *refreshingImages;
@property (nonatomic, strong) NSMutableArray *dataMutableArray;
@end

@implementation HomeViewController

- (NSMutableArray *)dataMutableArray{
    if (!_dataMutableArray) {
        _dataMutableArray = [NSMutableArray array];
    }
    return _dataMutableArray;
}
- (NSMutableArray *)idleImages{
    if (!_idleImages) {
        _idleImages = [NSMutableArray array];
    }
    return _idleImages;
}
- (NSMutableArray *)pullingImages{
    if (!_pullingImages) {
        _pullingImages = [NSMutableArray array];
    }
    return _pullingImages;
}
- (NSMutableArray *)refreshingImages{
    if (!_refreshingImages) {
        _refreshingImages = [NSMutableArray array];
    }
    return _refreshingImages;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initWithNavi];
    [self initWithView];
    [self loadData];
}
- (void)initWithView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(kScreenWidth, kScreenHeight);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) collectionViewLayout:flowLayout];
    _myCollectionView.backgroundColor = KBackgroundColor;
    _myCollectionView.pagingEnabled = YES;
    _myCollectionView.dataSource = self;
    _myCollectionView.delegate = self;
    _myCollectionView.showsHorizontalScrollIndicator = NO;
    _myCollectionView.showsVerticalScrollIndicator = NO;
    //使视图控制器顶部不留空白
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:_myCollectionView];
    [self.view sendSubviewToBack:_myCollectionView];
    [_myCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    [_myCollectionView registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier:@"HomeCell"];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"refresh_1" ofType:@"gif"];
    NSString *pathRefreshing = [[NSBundle mainBundle]pathForResource:@"refresh_2" ofType:@"gif"];
    self.idleImages = [self praseGIFDataToImageArray:[NSData dataWithContentsOfFile:path]];
    self.refreshingImages = [self praseGIFDataToImageArray:[NSData dataWithContentsOfFile:pathRefreshing]];
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    [header setImages:self.idleImages forState:MJRefreshStateIdle];
    [header setImages:self.pullingImages forState:MJRefreshStatePulling];
    [header setImages:self.refreshingImages forState:MJRefreshStateRefreshing];
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    _myCollectionView.mj_header = header;
    
    MJRefreshFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadFooterData)];
    _myCollectionView.mj_footer = footer;
}
- (void)refreshData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_myCollectionView.mj_header endRefreshing];
    });
}
- (void)loadData{
    [LHTTPManager GetRequestHomeArticle:^(LTHttpResult result, NSString *message, id data) {
        if (result == LTHttpResultSuccess) {
            NSArray *array = [data objectForKey:@"datas"];
            [self.dataMutableArray removeAllObjects];
            for (NSDictionary *dic in array) {
                HomeCellModel *model = [HomeCellModel mj_objectWithKeyValues:dic];
                [self.dataMutableArray addObject:model];
            }
            [_myCollectionView reloadData];
        }else{
            
        }
    }];
}
- (void)loadFooterData{
    int page = (int)self.dataMutableArray.count/10 + 1;
    HomeCellModel *model = [self.dataMutableArray lastObject];
    int page_id = [model.ID intValue];
    int create_time = [model.create_time intValue];
    __weak typeof(self) weakSelf = self;
    [LHTTPManager GetRequestMoreHomeArticleWithPage:page Page_id:page_id Create_time:create_time Complete:^(LTHttpResult result, NSString *message, id data) {
        if (result == LTHttpResultSuccess) {
            NSArray *array = [data objectForKey:@"datas"];
            for (NSDictionary *dic in array) {
                HomeCellModel *model = [HomeCellModel mj_objectWithKeyValues:dic];
                [self.dataMutableArray addObject:model];
            }
            [self.myCollectionView reloadData];
            [weakSelf.myCollectionView.mj_footer endRefreshing];
        }
    }];
}
-(NSMutableArray *)praseGIFDataToImageArray:(NSData *)data;{
    NSMutableArray *frames = [[NSMutableArray alloc] init];
    CGImageSourceRef src = CGImageSourceCreateWithData((CFDataRef)data, NULL);
    CGFloat animationTime = 0.f;
    if (src) {
        size_t l = CGImageSourceGetCount(src);
        frames = [NSMutableArray arrayWithCapacity:l];
        for (size_t i = 0; i < l; i++) {
            CGImageRef img = CGImageSourceCreateImageAtIndex(src, i, NULL);
            NSDictionary *properties = (NSDictionary *)CFBridgingRelease(CGImageSourceCopyPropertiesAtIndex(src, i, NULL));
            NSDictionary *frameProperties = [properties objectForKey:(NSString *)kCGImagePropertyGIFDictionary];
            NSNumber *delayTime = [frameProperties objectForKey:(NSString *)kCGImagePropertyGIFUnclampedDelayTime];
            animationTime += [delayTime floatValue];
            if (img) {
                [frames addObject:[UIImage imageWithCGImage:img]];
                CGImageRelease(img);
            }
        }
        CFRelease(src);
    }
    return frames;
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
    return self.dataMutableArray.count?self.dataMutableArray.count:0;
}
- (UIColor *)randomColor {
    CGFloat hue = arc4random() % 256 / 256.0;
    CGFloat saturation = arc4random() % 128 / 256.0 + 0.5;
    CGFloat brightness = arc4random() % 128 / 256.0 + 0.5;
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCell" forIndexPath:indexPath];
    cell.model = self.dataMutableArray[indexPath.row];
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
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController *vc = [[DetailViewController alloc]init];
    vc.article = self.dataMutableArray[indexPath.row];
    [self.navigationController showViewController:vc sender:nil];
    NSLog(@"...CollectionCell");
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
