//
//  KRHomeController.m
//  NeteaseNews
//
//  Created by KaoRny on 17/3/10.
//  Copyright © 2017年 KaoRny. All rights reserved.
//

#import "KRHomeController.h"
#import "KRChannelModel.h"
@interface KRHomeController ()
//频道标签视图
@property (weak, nonatomic) IBOutlet UIScrollView *channelScrollView;
//新闻视图
@property (weak, nonatomic) IBOutlet UICollectionView *homeCollectionView;
//布局对象
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *homeFlowLayout;
//频道数据源
@property (nonatomic, strong) NSArray *channelModelArr;
@end

@implementation KRHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestChannelData];
}

- (void) requestChannelData
{
    self.channelModelArr = [KRChannelModel getChannelModelArr];
    NSLog(@"%@", self.channelModelArr);
}
@end
