//
//  KRNetworkTools.m
//  NeteaseNews
//
//  Created by KaoRny on 17/3/10.
//  Copyright © 2017年 KaoRny. All rights reserved.
//

#import "KRNetworkTools.h"

@implementation KRNetworkTools

+ (instancetype)sharedTools
{
    static KRNetworkTools *tools;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools = [[KRNetworkTools alloc] initWithBaseURL:[NSURL URLWithString:@"http://c.m.163.com/nc/article/list/"]];
    });
    
    return tools;
}

/**
 通用的请求方式
 
 @param requestType 请求类型
 @param urlStr 请求地址
 @param parameters 请求参数
 @param successBlock 成功的回调
 @param failureBlock 失败的回调
 */
- (void)requestWithType:(RequestType)RequestType andUrlStr:(NSString *)urlStr andParams:(id)parameters andSuccess:(void(^)(id responseObject))successBlock andFailure:(void(^)(NSError *error))failureBlock
{
    
    if (RequestType == GET) {
        [self GET:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
//            NSLog(@"responseObject%@", responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
//            NSLog(@"error%@", error);
            
        }];

    }
    else
    {
        
        [self POST:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSLog(@"responseObject%@", responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            NSLog(@"error%@", error);
            
        }];
    }
    
}

@end
