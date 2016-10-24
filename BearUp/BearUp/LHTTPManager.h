//
//  LHTTPManager.h
//  BearUp
//
//  Created by Tebuy on 16/10/24.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import "LTHTTPSessionManager.h"

@interface LHTTPManager : LTHTTPSessionManager

+ (void)GETRequsetTableWithModel:(NSString *)model Page:(NSString *)page Page_id:(NSString *)page_id Create_time:(NSString *)create_time Complete:(completeBlock)complete;
@end
