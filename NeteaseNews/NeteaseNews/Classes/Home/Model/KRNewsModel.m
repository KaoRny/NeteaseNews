//
//  KRNewsModel.m
//  NeteaseNews
//
//  Created by KaoRny on 17/3/11.
//  Copyright © 2017年 KaoRny. All rights reserved.
//

#import "KRNewsModel.h"
#import "KRNetworkTools.h"
#import <YYModel.h>
#import "KRPicture.h"
@implementation KRNewsModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"imgextra" : [KRPicture class]};
}

//根据指定的请求地址获取新闻数据
+ (void)requestNewsModelArr:(NSString *)urlStr andCompletionBlock:(void(^)(NSArray *modelArr))completionBlock
{
    [[KRNetworkTools sharedTools] requestWithType:GET andUrlStr:urlStr andParams:nil andSuccess:^(id responseObject) {
        
//        NSLog(@"responseObject%@", responseObject);
        
        NSDictionary *dic = (NSDictionary *)responseObject;
        //字典里面只有一个key 获取字典里面的key
        NSString *key = dic.allKeys.firstObject;
        //通过key获取新闻的数组字典
        NSArray *dicArr = [dic objectForKey:key];
        
        NSArray *modelArr = [NSArray yy_modelArrayWithClass:[KRNewsModel class] json:dicArr];
//        NSLog(@"当前线程: %@", [NSThread currentThread]);
        //回调模型数据 AFN是回到主线程回调的v
        completionBlock(modelArr);
        
        
    } andFailure:^(NSError *error) {
        
        NSLog(@"error%@", error);
        
    }];
}

@end
