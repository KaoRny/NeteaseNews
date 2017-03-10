//
//  KRNewsCollectionViewCell.m
//  NeteaseNews
//
//  Created by KaoRny on 17/3/10.
//  Copyright © 2017年 KaoRny. All rights reserved.
//

#import "KRNewsCollectionViewCell.h"
#import "KRNewsTableViewController.h"
@implementation KRNewsCollectionViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    //创建新闻列表控制器
    KRNewsTableViewController *tableVC = [KRNewsTableViewController new];
    [self.contentView addSubview:tableVC.tableView];
    //设置大小
    tableVC.tableView.frame = self.contentView.bounds;
    //颜色
    tableVC.tableView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1];
    
}

@end
