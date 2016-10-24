//
//  LHTTPManager.m
//  BearUp
//
//  Created by Tebuy on 16/10/24.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import "LHTTPManager.h"

@implementation LHTTPManager
+ (void)GETRequsetTableWithModel:(NSString *)model Page:(NSString *)page Page_id:(NSString *)page_id Create_time:(NSString *)create_time Complete:(completeBlock)complete{
    LTHTTPSessionManager *manager = [LTHTTPSessionManager new];
    [manager GETWithParameters:[NSString stringWithFormat:@"http://static.owspace.com/index.php?m=Home&c=Api&a=getList&model=%@&p=%@&client=iphone&page_id=%@&create_time=%@&iOS_version=1.0.0",model,page,page_id,create_time] parameters:nil complete:complete];
}
@end
