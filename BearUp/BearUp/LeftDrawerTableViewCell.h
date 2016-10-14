//
//  LeftDrawerTableViewCell.h
//  BearUp
//
//  Created by Tebuy on 16/10/14.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftDrawerTableViewCell : UITableViewCell
@property (nonatomic, strong) UIButton *TitleBtn;
@property (nonatomic, copy) void (^leftDrawerBtnClick)();//button点击的block
@end
