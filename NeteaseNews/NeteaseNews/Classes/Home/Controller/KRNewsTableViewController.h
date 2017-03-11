//
//  KRNewsTableViewController.h
//  NeteaseNews
//
//  Created by KaoRny on 17/3/10.
//  Copyright © 2017年 KaoRny. All rights reserved.
//

#import <UIKit/UIKit.h>
//新闻列表的tableview
@interface KRNewsTableViewController : UITableViewController
//请求地址
@property (nonatomic, copy) NSString *urlStr;

@end
