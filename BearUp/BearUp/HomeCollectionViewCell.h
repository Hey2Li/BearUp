//
//  HomeCollectionViewCell.h
//  BearUp
//
//  Created by Tebuy on 16/10/17.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCellModel.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

typedef NS_ENUM(NSInteger, HomeCollectionCellStyle) {
    CellStyleNone = 0,
    CellStyleVideo,
    CellStyleMusic,
};
@interface HomeCollectionViewCell : UICollectionViewCell
@property (nonatomic, assign) HomeCollectionCellStyle cellStyle;
@property (nonatomic, strong) UIImageView *bannerImgaeView;
@property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UILabel *authorLabel;
@property (nonatomic, strong) UIButton *commentBtn;
@property (nonatomic, strong) UIButton *likeBtn;
@property (nonatomic, strong) UILabel *readCountLabel;
@property (nonatomic, strong) NSURL *videoUrl;
@property (nonatomic, strong) UIButton *controlBtn;
@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;//视频播放器



@property (nonatomic, strong) HomeCellModel *model;
@end
