//
//  HomeCollectionViewCell.m
//  BearUp
//
//  Created by Tebuy on 16/10/17.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import "HomeCollectionViewCell.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@implementation HomeCollectionViewCell
{
    AVPlayer *_avPlayer;//播放器
    AVPlayerLayer *_avPlayerLayer;//播放界面
    AVPlayerItem *_avPlayerItem;//播放item
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initWithView];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)initWithView{
    UIImageView *bannerView = [UIImageView new];
    bannerView.image = [UIImage imageNamed:@"exporte"];
    [self addSubview:bannerView];
    [bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.width.equalTo(@(kScreenWidth));
        make.height.equalTo(@(kScreenHeight/3 + 50));
    }];
    self.bannerImgaeView = bannerView;
    
    UIView *tipView = [UIView new];
    tipView.backgroundColor = RGBCOLOR(254, 194, 84);
    [self addSubview:tipView];
    [tipView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bannerView.mas_bottom);
        make.height.equalTo(@3);
        make.width.equalTo(@(kScreenWidth));
        make.left.equalTo(self.mas_left);
    }];
    
    UILabel *tipLabel = [UILabel new];
    [tipLabel setText:@"TO LISTEN"];
    [tipLabel setTextAlignment:NSTextAlignmentCenter];
    [tipLabel setBackgroundColor:RGBCOLOR(254, 194, 84)];
    [tipLabel setTextColor:[UIColor whiteColor]];
    [tipLabel setFont:[UIFont systemFontOfSize:10.0f]];
    [self addSubview:tipLabel];
    [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tipView.mas_bottom);
        make.height.equalTo(@12);
        make.width.equalTo(@70);
        make.centerX.equalTo(self.mas_centerX);
    }];
    self.tipLabel = tipLabel;
    
    UILabel *titleLabel = [UILabel new];
    [titleLabel setText:@"熊起全球趣闻"];
    [titleLabel setTextColor:[UIColor blackColor]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setFont:[UIFont fontWithName:@"PMingLiU" size:32]];
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(tipLabel.mas_bottom);
        make.height.equalTo(@(kScreenHeight/5));
    }];
    self.titleLabel = titleLabel;
    
    UILabel *detailLabel = [UILabel new];
    detailLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    [detailLabel setTextAlignment:NSTextAlignmentCenter];
    [detailLabel setText:@"日前，渝万高铁首次载客试运行。全长约248公里的渝万高铁，使重庆主城至万州的距离缩短为一小时。待新建郑万铁路开通后，重庆市民乘坐动车组赴京将取道渝万铁路、郑万铁路、京广铁路，全程铁路旅行时间也将由现在的12小时缩短至8小时。渝万高铁将让三峡游更加经济、便捷。经济分析人士称，万州作为渝东北三峡沿线库区的中心点，必将成为三峡旅游的重要枢纽。万州港可停靠万吨级大型游轮，可成为重要的三峡游发客地；"];
    detailLabel.numberOfLines = 0;
    [detailLabel setTextColor:[UIColor blackColor]];
    [detailLabel setFont:[UIFont fontWithName:@"PMingLiU" size:15]];
    [self addSubview:detailLabel];
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(50);
        make.right.equalTo(self.mas_right).offset(-50);
        make.top.equalTo(titleLabel.mas_bottom);
        make.height.equalTo(@(kScreenHeight/5));
    }];
    [self setSpaceAttribute:detailLabel];
    self.detailLabel = detailLabel;
    
    UIView *bottomView = [UIView new];
    [self addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(detailLabel.mas_bottom);
        make.height.equalTo(@80);
    }];
    UILabel *lineLabel = [UILabel new];
    [bottomView addSubview:lineLabel];
    lineLabel.backgroundColor = [UIColor lightGrayColor];
    [lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bottomView.mas_centerX);
        make.height.equalTo(@1);
        make.width.equalTo(@(kScreenWidth/3));
        make.top.equalTo(bottomView.mas_centerY);
    }];
    
    UILabel *authorLabel = [UILabel new];
    [authorLabel setText:@"熊起家"];
    [authorLabel setFont:[UIFont fontWithName:@"PMingLiU" size:16]];
    [authorLabel setTextAlignment:NSTextAlignmentCenter];
    [bottomView addSubview:authorLabel];
    [authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bottomView.mas_centerX);
        make.height.equalTo(@20);
        make.width.equalTo(@100);
        make.top.equalTo(lineLabel.mas_bottom).offset(10);
    }];
    self.authorLabel = authorLabel;
    
    UIView *lastBottomView = [UIView new];
    [self addSubview:lastBottomView];
    lastBottomView.backgroundColor = [UIColor whiteColor];
    [lastBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(bottomView.mas_bottom);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    UIButton *commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [commentBtn setImage:[UIImage imageNamed:@"评论"] forState:UIControlStateNormal];
    [commentBtn setTitleColor:RGBCOLOR(67, 67, 67) forState:UIControlStateNormal];
    [commentBtn setTitle:@" 43" forState:UIControlStateNormal];
    commentBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [commentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [lastBottomView addSubview:commentBtn];
    [commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lastBottomView.mas_left).offset(10);
        make.centerY.equalTo(lastBottomView.mas_centerY);
        make.height.equalTo(@30);
        make.width.equalTo(@40);
    }];
    self.commentBtn = commentBtn;
    
    UIButton *likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [likeBtn setImage:[UIImage imageNamed:@"喜欢"] forState:UIControlStateNormal];
    [likeBtn setTitleColor:RGBCOLOR(67, 67, 67) forState:UIControlStateNormal];
    [likeBtn setTitle:@" 13" forState:UIControlStateNormal];
    likeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [likeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [lastBottomView addSubview:likeBtn];
    [likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(commentBtn.mas_right).offset(10);
        make.centerY.equalTo(lastBottomView.mas_centerY);
        make.height.equalTo(@30);
        make.width.equalTo(@40);
    }];
    
    UILabel *readCountLabel = [UILabel new];
    [readCountLabel setText:@"阅读数：100W"];
    [readCountLabel setFont:[UIFont fontWithName:@"PMingLiU" size:13]];
    [readCountLabel setTextColor:[UIColor blackColor]];
    [self addSubview:readCountLabel];
    [readCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(lastBottomView.mas_right);
        make.centerY.equalTo(lastBottomView.mas_centerY);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
    self.readCountLabel = readCountLabel;
}
- (void)setModel:(HomeCellModel *)model{
    _model = model;
    if (model) {
        [self.bannerImgaeView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.thumbnail]] placeholderImage:[UIImage imageNamed:@"exporte"]];
        self.tipLabel.text = [NSString stringWithFormat:@" %@",model.category];
//        [self setTipLabelAttribute];
        self.titleLabel.text = [self _clearLineBreak:model.title];
        self.detailLabel.text = model.excerpt;
        [self setSpaceAttribute:self.titleLabel];
        [self setSpaceAttribute:self.detailLabel];
        self.authorLabel.text = model.author;
        self.readCountLabel.text = [NSString stringWithFormat:@"阅读数：%@",model.view];
        [self.commentBtn setTitle:model.comment forState:UIControlStateNormal];
        [self.likeBtn setTitle:model.good forState:UIControlStateNormal];
        self.videoUrl = [NSURL URLWithString:model.video];
        switch ([model.model integerValue]) {
            case 1:
                break;
            case 2:
                break;
            case 3:
                break;
            default:
                break;
        }
    }
}
//清除掉字符串结尾的换行符
- (NSString *)_clearLineBreak:(NSString *)string {
    NSString *subStrng = [string substringWithRange:NSMakeRange(string.length - 2, 2)];
    if ([subStrng isEqualToString:@"\r\n"]) {
        string = [string substringWithRange:NSMakeRange(0, string.length - 2)];
    }
    return string;
}

- (void)setTipLabelAttribute {
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc]initWithString:self.tipLabel.text];
    [attrString addAttribute:NSKernAttributeName value:@5 range:NSMakeRange(0, attrString.length)];
    self.tipLabel.attributedText = attrString;
}
//设置传入label的段间距为12
- (void)setSpaceAttribute:(UILabel *)label {
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc]initWithString:label.text];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    [style setLineSpacing:12];
    [style setAlignment:NSTextAlignmentCenter];
    [attrString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, attrString.length)];
    label.attributedText = attrString;
}
@end
