//
//  OtherTableViewCell.h
//  BearUp
//
//  Created by Tebuy on 16/10/20.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCellModel.h"

@interface OtherTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *LeftimgaeView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) HomeCellModel *article;
@end
