//
//  LHTTPManager.h
//  BearUp
//
//  Created by Tebuy on 16/10/24.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import "LTHTTPSessionManager.h"
#define kRequestHomeArticle @"http://static.owspace.com/index.php?m=Home&c=Api&a=getList&p=1&client=iphone&page_id=0&create_time=0&iOS_version=1.0.0"
@interface LHTTPManager : LTHTTPSessionManager

+ (void)GETRequsetTableWithModel:(NSString *)model Page:(NSString *)page Page_id:(NSString *)page_id Create_time:(NSString *)create_time Complete:(completeBlock)complete;

+ (void)GetRequestHomeArticle:(completeBlock)complete;
@end
