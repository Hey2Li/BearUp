//
//  DetailViewController.m
//  BearUp
//
//  Created by Tebuy on 16/11/28.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
}
- (void)initWithView{
    self.titleView = [[TitleView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    self.titleView.backgroundColor = [UIColor colorWithRed:24/255.0 green:24/255.0 blue:24/255.0 alpha:0];
    self.titleView.isTranslucent = YES;
    [self.view addSubview:self.titleView];
    
    self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *back = [UIImage imageNamed:@"back_gray"];
    back = [back imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.backBtn setImage:back forState:UIControlStateNormal];
    [self.backBtn setTintColor:[UIColor whiteColor]];
    [self.titleView setLeftBarButton:self.backBtn];
    [self.backBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)back:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)setArticle:(HomeCellModel *)article{
    if (article != nil) {
        _article = article;
        [self setLayout];
        [self initWithView];
    }
}
- (void)setLayout{
    NSInteger model;
    if (_article != nil) {
        model = [_article.model integerValue];
    }else{
        model = 0;
    }
    switch (model) {
        case 1:
            [self notNeedPlayLayout];
            break;
        case 2:
            [self needPlayLayout:[NSURL URLWithString:_article.video]];
            break;
        case 3:
            [self needPlayLayout:[NSURL URLWithString:_article.fm]];
            break;
        case 4:
            [self notNeedPlayLayout];
            break;
        default:
        
            break;
    }
}
//设置不需要播放器的布局
- (void)notNeedPlayLayout{
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    NSString *urlStr;
    if (_article != nil) {
        urlStr = [_article.html5 stringByAppendingString:@"?client=iOS"];
    }else{
        
    }
    self.webView.delegate = self;
    self.webView.scrollView.delegate = self;
    self.webView.scrollView.bounces = NO;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
    [self.view addSubview:self.webView];
}
//需要播放器的布局
- (void)needPlayLayout:(NSURL *)url{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight * 0.4)];
    imageView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    [imageView sd_setImageWithURL:[NSURL URLWithString:_article.thumbnail]];
    [imageView setUserInteractionEnabled:YES];
    [self.view addSubview:imageView];
    [UIView animateWithDuration:0.5 animations:^{
        imageView.transform = CGAffineTransformIdentity;
    }];
    self.MPMovie = [[MPMoviePlayerController alloc]initWithContentURL:url];
    if ([_article.model integerValue] == 2) {
        self.MPMovie.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight * 0.4);
    }else{
        self.MPMovie.view.frame = CGRectMake(0, kScreenHeight * 0.4 - 40, kScreenWidth, 40);
    }
    [self.MPMovie prepareToPlay];
    [imageView addSubview:self.MPMovie.view];
    
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, kScreenHeight * 0.4, kScreenWidth, kScreenHeight * 0.6)];
    [self.view addSubview:self.webView];
    self.webView.delegate = self;
    self.webView.scrollView.bounces = NO;
    NSString *urlStr = [_article.html5 stringByAppendingString:@"?client=iOS"];
    NSURL *html5 = [NSURL URLWithString:urlStr];
    [self.webView loadRequest:[NSURLRequest requestWithURL:html5]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//根据滑动的y轴偏移量调整导航栏的透明度
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset_Y = scrollView.contentOffset.y;
    offset_Y = offset_Y > 100 ? offset_Y - 100 : 0;
    CGFloat alpha = offset_Y / 200.0;
    self.titleView.backgroundColor = [UIColor colorWithRed:24/255.0 green:24/255.0 blue:24/255.0 alpha:alpha];
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
