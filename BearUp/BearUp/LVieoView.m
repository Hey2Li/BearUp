//
//  LVieoView.m
//  BearUp
//
//  Created by Tebuy on 16/10/26.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import "LVieoView.h"

@implementation LVieoView
//懒加载进度条
- (UISlider *)slider{
    if (!_slider) {
        _slider = [[UISlider alloc]initWithFrame:CGRectMake(0, self.bounds.origin.y - 30, self.bounds.size.width, self.bounds.size.height)];
        [self addSubview:_slider];
        [_slider addTarget:self action:@selector(sliderAction) forControlEvents:UIControlEventTouchUpInside|UIControlEventTouchCancel|UIControlEventTouchUpOutside];
    }
    return _slider;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
 */
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.playerItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:@"http://baobab.wdjcdn.com/1455782903700jy.mp4"]];
        self.player = [AVPlayer playerWithPlayerItem:self.playerItem];
        self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        [self.playerLayer setFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        [self.layer addSublayer:self.playerLayer];
        [self.playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
        [self.playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}
- (void)sliderAction{
    //slider的value值为视频的时间
    float seconds =self.slider.value;
    //让视频从指定的CMTime对象处播放。
    CMTime startTime = CMTimeMakeWithSeconds(seconds,self.playerItem.currentTime.timescale);
    //让视频从指定处播放
    [self.player seekToTime:startTime completionHandler:^(BOOL finished) {
        if(finished) {
        [self videoPlay];
        }
    }];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    //取出status的新值
//    AVPlayerItemStatus status = [change[NSKeyValueChangeNewKey]intValue];
//    switch(status){
//        case AVPlayerItemStatusFailed:
//            NSLog(@"item 有误");
//            self.isReadToPlay = NO;
//            break;
//        case AVPlayerItemStatusReadyToPlay:
//            NSLog(@"准好播放了");
//            self.isReadToPlay = YES;
//            self.slider.maximumValue = self.playerItem.duration.value/self.playerItem.duration.timescale;
//            break;
//        case AVPlayerItemStatusUnknown:
//            NSLog(@"视频资源出现未知错误");
//            self.isReadToPlay = NO;
//            break;
//        default:
//            break;
//    }//移除监听（观察者）
//
//    [object removeObserver:self forKeyPath:@"status"];
}
+ (void)videoPlay{
    [[self alloc]videoPlay];
}
- (void)videoPlay{
    if(self.isReadToPlay) {
        [self.player play];
    }else{
        NSLog(@"视频正在加载中");
    }
}
@end
