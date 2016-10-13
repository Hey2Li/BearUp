//
//  BaseNavigationController.h
//  BearUp
//
//  Created by Tebuy on 16/10/12.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavigationController : UINavigationController<UINavigationControllerDelegate>
@property (nonatomic, strong)UIView *myNavigationBar;
@end
