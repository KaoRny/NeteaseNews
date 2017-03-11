//
//  KRNewsTableViewCell.h
//  NeteaseNews
//
//  Created by KaoRny on 17/3/11.
//  Copyright © 2017年 KaoRny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KRNewsModel.h"
@interface KRNewsTableViewCell : UITableViewCell

//数据源绑定
@property (nonatomic, strong) KRNewsModel *newsModel;


@end
