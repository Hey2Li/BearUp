//
//  LeftDrawerTableViewCell.m
//  BearUp
//
//  Created by Tebuy on 16/10/14.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import "LeftDrawerTableViewCell.h"

@implementation LeftDrawerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initWithView];
    }
    return self;
}
- (void)initWithView{
//    self.contentView.backgroundColor = [UIColor blackColor];
    self.selectionStyle = NO;
    self.TitleBtn.backgroundColor = RGBCOLOR(38, 38, 38);
    self.TitleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.TitleBtn.titleLabel.font = [UIFont fontWithName:@"PMingLiU" size:30];
    [self.TitleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.contentView addSubview:self.TitleBtn];
    [self.TitleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.equalTo(@(188));
        make.top.equalTo(self.contentView.mas_top);
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
    [self.TitleBtn setTitle:@"文  字" forState:UIControlStateNormal];
    self.TitleBtn.userInteractionEnabled = NO;
    [self.TitleBtn addTarget:self action:@selector(leftDrawerClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)leftDrawerClick{
    self.leftDrawerBtnClick();
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
