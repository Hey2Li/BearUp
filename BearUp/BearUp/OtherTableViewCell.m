//
//  OtherTableViewCell.m
//  BearUp
//
//  Created by Tebuy on 16/10/20.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import "OtherTableViewCell.h"

@implementation OtherTableViewCell

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
    UIImageView *imageView = [UIImageView new];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.mas_top).offset(10);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.width.equalTo(@(kScreenWidth/3));
    }];
    imageView.backgroundColor = [UIColor lightGrayColor];
    self.LeftimgaeView = imageView;
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.font = kWordFont(20);
    titleLabel.text = @"一场流动的盛宴";
    titleLabel.textColor = [UIColor blackColor];
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView.mas_right).offset(10);
        make.width.equalTo(@200);
        make.centerY.equalTo(self.mas_centerY).offset(-10);
        make.height.equalTo(@30);
    }];
    self.titleLabel = titleLabel;
    
    UILabel *nameLabel = [UILabel new];
    nameLabel.font = kWordFont(14);
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.text = @"熊起";
    [self addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel.mas_left);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.height.equalTo(@20);
        make.width.equalTo(@100);
    }];
    self.nameLabel = nameLabel;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
