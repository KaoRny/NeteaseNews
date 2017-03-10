//
//  KRChannelModel.m
//  NeteaseNews
//
//  Created by KaoRny on 17/3/10.
//  Copyright © 2017年 KaoRny. All rights reserved.
//

#import "KRChannelModel.h"
#import <YYModel.h>
@implementation KRChannelModel

- (NSString *)description
{
    NSString *str = [NSString stringWithFormat:@"%@-%@", self.tname, self.tid];
    return str;
}

+ (NSArray *) getChannelModelArr
{
    //json路径
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil];
    //获取文件对应的json二进制数据
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    //反序列化json数据
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
    //获取tList对应的频道数组字典数据
    NSArray *channelDicArr = [dic objectForKey:@"tList"];
    //yymodel字典转模型
    NSArray *modelArr = [NSArray yy_modelArrayWithClass:[KRChannelModel class] json:channelDicArr];
    //根据模型里的tid进行排序
    modelArr = [modelArr sortedArrayUsingComparator:^NSComparisonResult(KRChannelModel *obj1, KRChannelModel *obj2) {
        //默认是升序 小到大
        return [obj1.tid compare:obj2.tid];
        
    }];
    
    return modelArr;
}

@end
