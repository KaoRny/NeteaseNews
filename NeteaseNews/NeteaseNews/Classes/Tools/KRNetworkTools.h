//
//  KRNetworkTools.h
//  NeteaseNews
//
//  Created by KaoRny on 17/3/10.
//  Copyright © 2017年 KaoRny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
//请求方式类型
typedef enum : NSUInteger {
    GET,
    POST,
    
} RequestType;

@interface KRNetworkTools : AFHTTPSessionManager

+ (instancetype)sharedTools;


/**
 通用的请求方式
 
 @param requestType 请求类型
 @param urlStr 请求地址
 @param parameters 请求参数
 @param successBlock 成功的回调
 @param failureBlock 失败的回调
 */
- (void)requestWithType:(RequestType)RequestType andUrlStr:(NSString *)urlStr andParams:(id)parameters andSuccess:(void(^)(id responseObject))successBlock andFailure:(void(^)(NSError *error))failureBlock;
@end
