//
//  KRNewsCollectionViewCell.m
//  NeteaseNews
//
//  Created by KaoRny on 17/3/10.
//  Copyright © 2017年 KaoRny. All rights reserved.
//

#import "KRNewsCollectionViewCell.h"
#import "KRNewsTableViewController.h"

@interface KRNewsCollectionViewCell ()

@property (nonatomic, strong) KRNewsTableViewController *tableVC;

@end

@implementation KRNewsCollectionViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    //创建新闻列表控制器
    self.tableVC = [KRNewsTableViewController new];
    [self.contentView addSubview:self.tableVC.tableView];
    //设置大小
    self.tableVC.tableView.frame = self.contentView.bounds;
    //颜色
    self.tableVC.tableView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1];
    
}

- (void)setUrlStr:(NSString *)urlStr
{
    _urlStr = urlStr;
    
    self.tableVC.urlStr = urlStr;
}

@end
