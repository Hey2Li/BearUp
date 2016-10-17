//
//  LaunchViewController.m
//  BearUp
//
//  Created by Tebuy on 16/10/13.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import "LaunchViewController.h"
#import "HomeDrawerViewController.h"
#import "BaseNavigationController.h"

@interface LaunchViewController ()

@end

@implementation LaunchViewController
{
    NSTimer *_timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.backImage = [UIImageView new];
    self.backImage.backgroundColor = [UIColor clearColor];
    self.frontImage = [UIImageView new];
    self.frontImage.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.backImage];
    self.backImage.contentMode = UIViewContentModeScaleAspectFit;
    [self.backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.width.equalTo(@(kScreenHeight + 40));
        make.height.equalTo(@(kScreenHeight + 40));
    }];
    [self.view addSubview:self.frontImage];
    [self.frontImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    [self.view bringSubviewToFront:self.frontImage];
    //根据机型判断分辨率
    NSString *device;
    if (kScreenHeight == 736) {
        device = @"6p";
    }else if (kScreenHeight == 667){
        device = @"6";
    }else if (kScreenHeight == 568){
        device = @"5";
    }else{
        device = @"4";
    }
    [self launchBegin:device];
    _timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(launchFinish) userInfo:nil repeats:NO];
}
- (BOOL)prefersStatusBarHidden{
    return YES;
}
- (void)launchBegin:(NSString *)device{
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"ruban%@",device]];
    self.frontImage.image = image;
    [self setBackground];
}
- (void)setBackground{
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"images.plist"];
    //    如果沙盒里存在，从沙盒加载，并且开始动画
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSString *imgUrl = array[arc4random_uniform((int)array.count)];
        self.backImage.alpha = 0;
        [self.backImage sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL){
            [UIView animateWithDuration:0.5 animations:^{
                _backImage.alpha = 1;
            } completion:^(BOOL finished) {
                [self animation];
            }];
        }];
    }
    //没有就从网络请求数据
    else {
        [self requestData:path];
    }

}
//请求背景图片网址数据
- (void)requestData:(NSString *)path {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    NSURL *url = [NSURL URLWithString:@"http://static.owspace.com/static/picture_list.txt"];
    __weak typeof(self) weakSelf = self;
    NSURLSessionDataTask *task = [manager dataTaskWithRequest:[NSURLRequest requestWithURL:url] completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if ([[responseObject objectForKey:@"status"] isEqualToString:@"ok"]) {
            NSArray *array = [responseObject objectForKey:@"images"];
            //            把数据写入沙盒
            [array writeToFile:path atomically:YES];
            [weakSelf setBackground];
        }
    }];
    [task resume];
}
- (void)animation {
    [_timer invalidate];
    [UIView animateWithDuration:2.5 animations:^{
        self.backImage.transform = CGAffineTransformMakeTranslation(-20, 0);
    } completion:^(BOOL finished) {
        [self launchFinish];
    }];
}
- (void)launchFinish{
    [UIView animateWithDuration:1 animations:^{
        self.view.alpha = 0;
        self.view.window.rootViewController = [[BaseNavigationController alloc]initWithRootViewController:[HomeDrawerViewController new]];
    } completion:^(BOOL finished) {
       
    }];
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
