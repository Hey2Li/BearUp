//
//  LVieoView.h
//  BearUp
//
//  Created by Tebuy on 16/10/26.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface LVieoView : UIView
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerItem *playerItem;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;
@property (nonatomic, strong) NSString *videoUrl;
@property (nonatomic, strong) UISlider *slider;//用来现实视频的播放进度
@property (nonatomic, assign) BOOL isReadToPlay;

+ (void)videoPlay;
@end
