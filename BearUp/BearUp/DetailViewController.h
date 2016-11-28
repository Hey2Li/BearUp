//
//  DetailViewController.h
//  BearUp
//
//  Created by Tebuy on 16/11/28.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "TitleView.h"
#import "HomeCellModel.h"

@interface DetailViewController : UIViewController <UIWebViewDelegate, UIScrollViewDelegate>
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) MPMoviePlayerController *MPMovie;
@property (nonatomic, strong) TitleView *titleView;
@property (nonatomic, strong) HomeCellModel *article;
@end
