//
//  HomeCellModel.h
//  BearUp
//
//  Created by Tebuy on 16/10/25.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeCellModel : NSObject
@property (nonatomic, copy)NSString *thumbnail;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSArray *tags;
@property (nonatomic, copy)NSString *create_time;
@property (nonatomic, copy)NSString *show_uid;
@property (nonatomic, copy)NSString *lead;
@property (nonatomic, copy)NSArray *hot_comments; //这里要放评论的model
@property (nonatomic, copy)NSString *share;
@property (nonatomic, copy)NSString *html5;
@property (nonatomic, copy)NSString *video;
@property (nonatomic, copy)NSString *publish_time;
@property (nonatomic, copy)NSString *good;
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *fm_play;
@property (nonatomic, copy)NSString *category;
@property (nonatomic, copy)NSString *ID;
@property (nonatomic, copy)NSString *uid;
@property (nonatomic, copy)NSString *fm;
@property (nonatomic, copy)NSString *bookmark;
@property (nonatomic, copy)NSString *model;
@property (nonatomic, copy)NSString *tpl;
@property (nonatomic, copy)NSString *link_url;
@property (nonatomic, copy)NSString *update_time;
@property (nonatomic, copy)NSString *excerpt;
@property (nonatomic, copy)NSString *view;
@property (nonatomic, copy)NSString *avatar;
@property (nonatomic, copy)NSString *comment;
@property (nonatomic, copy)NSString *author;
@end
