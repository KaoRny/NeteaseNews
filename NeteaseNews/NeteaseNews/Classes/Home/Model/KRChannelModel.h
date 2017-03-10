//
//  KRChannelModel.h
//  NeteaseNews
//
//  Created by KaoRny on 17/3/10.
//  Copyright © 2017年 KaoRny. All rights reserved.
//

#import <Foundation/Foundation.h>
//频道标签模型
@interface KRChannelModel : NSObject
//频道标签名
@property (nonatomic, copy) NSString *tname;
//频道id
@property (nonatomic, copy) NSString *tid;

//获取频道标签数据
+ (NSArray *) getChannelModelArr;
@end
