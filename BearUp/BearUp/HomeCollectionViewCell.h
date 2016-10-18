//
//  HomeCollectionViewCell.h
//  BearUp
//
//  Created by Tebuy on 16/10/17.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CellStyle) {
    CellStyleNone = 0,
    CellStyleVideo,
    CellStyleMusic,
};
@interface HomeCollectionViewCell : UICollectionViewCell
@property (nonatomic, assign) CellStyle *cellStyle;
@end
