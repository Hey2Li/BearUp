//
//  TitleView.h
//  BearUp
//
//  Created by Tebuy on 16/10/13.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleView : UIView
@property (nonatomic, copy)NSString *title;
@property (nonatomic, strong)UIButton *leftBarButton;
@property (nonatomic, strong)UIButton *rightBarButton;
@property (nonatomic, assign)BOOL isTranslucent;
@end
