//
//  HomeCollectionViewCell.m
//  BearUp
//
//  Created by Tebuy on 16/10/17.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import "HomeCollectionViewCell.h"

@implementation HomeCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initWithView];
    }
    return self;
}

- (void)initWithView{
    if (self.cellStyle == 0) {
        NSLog(@"");
    }
}
@end
