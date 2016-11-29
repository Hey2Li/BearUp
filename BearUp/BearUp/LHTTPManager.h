//
//  LHTTPManager.h
//  BearUp
//
//  Created by Tebuy on 16/10/24.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import "LTHTTPSessionManager.h"
#define kRequestHomeArticle @"http://static.owspace.com/index.php?m=Home&c=Api&a=getList&p=1&client=iphone&page_id=0&create_time=0&iOS_version=1.0.0"


#define kRequestHomePageArticle(page,page_id,create_time) [NSString stringWithFormat:@"http://static.owspace.com/index.php?m=Home&c=Api&a=getList&p=%d&client=iphone&page_id=%d&create_time=%d&iOS_version=1.0.0",page,page_id,create_time]
@interface LHTTPManager : LTHTTPSessionManager

+ (void)GETRequsetTableWithModel:(NSString *)model Page:(NSString *)page Page_id:(NSString *)page_id Create_time:(NSString *)create_time Complete:(completeBlock)complete;

+ (void)GetRequestHomeArticle:(completeBlock)complete;

+ (void)GetRequestMoreHomeArticleWithPage:(int)page Page_id:(int)page_id Create_time:(int)create_time Complete:(completeBlock)complete;
@end
