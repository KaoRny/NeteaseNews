//
//  KRHomeController.m
//  NeteaseNews
//
//  Created by KaoRny on 17/3/10.
//  Copyright © 2017年 KaoRny. All rights reserved.
//

#import "KRHomeController.h"
#import "KRChannelModel.h"
#import "KRChannelLable.h"
@interface KRHomeController ()<UICollectionViewDelegate, UICollectionViewDataSource>
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
    
      //  iOS7 提供的,如果有导航栏显示的滚动的视图(UITextView, UITableView, UICollectionView, UIScrollView)内容会自动往下偏移64, 设置no表示不让其偏移
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self requestChannelData];
    
    [self setupNewsCollectionView];
}

//请求频道数据
- (void) requestChannelData
{
    //    //  json文件路径
    //    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil];
    //
    //    //  获取文件对应的json的二进制数据
    //    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    //
    //    //  反序列化json数据
    //    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:NULL];
    //    //  获取tlist对应的频道数组字典数据
    //    NSArray *channelDicArray = [dic objectForKey:@"tList"];
    //    //  使用YYModel完成字典转模型的操作
    //    NSArray *modelArray = [NSArray yy_modelArrayWithClass:[ChannelModel class] json:channelDicArray];
    //    for (ChannelModel *model in modelArray) {
    //        NSLog(@"%@", model);
    //    }
    //记录频道的数据源
    self.channelModelArr = [KRChannelModel getChannelModelArr];
//    NSLog(@"%@", self.channelModelArr);
    //lable大小
    CGFloat lableW = 80;
    CGFloat lableH = 44;
    //遍历频道模型数组 创建对应的lable
    for (int i = 0; i < self.channelModelArr.count; i++) {
        //获取对应的模型数据
        KRChannelModel *model = self.channelModelArr[i];
        //创建频道lable
        KRChannelLable *channelLable = [[KRChannelLable alloc] initWithFrame:CGRectMake(lableW * i, 0, lableW, lableH)];
        channelLable.text = model.tname;
        //设置文字大小 和居中方式
        channelLable.font = [UIFont systemFontOfSize:15];
        channelLable.textAlignment = NSTextAlignmentCenter;
        [self.channelScrollView addSubview:channelLable];
    }
    
    //设置scrollView内容大小 高度写0也可以 默认是44
    self.channelScrollView.contentSize = CGSizeMake(lableW * self.channelModelArr.count, lableH);
    //取消滚动条
    self.channelScrollView.showsVerticalScrollIndicator = NO;
    self.channelScrollView.showsHorizontalScrollIndicator = NO;

}

//设置新闻视图
- (void)setupNewsCollectionView
{
    //代理和数据源
    self.homeCollectionView.dataSource = self;
    self.homeCollectionView.delegate = self;
    //设置item大小
    self.homeFlowLayout.itemSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height - 44 - 64);
    //滚动方向
    self.homeFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //间距
    self.homeFlowLayout.minimumLineSpacing = 0;
    self.homeFlowLayout.minimumInteritemSpacing = 0;
    //分页效果
    self.homeCollectionView.pagingEnabled = YES;
    //去掉弹簧效果
    self.homeCollectionView.bounces = NO;
    //取消滚动条
    self.homeCollectionView.showsHorizontalScrollIndicator = NO;
    self.homeCollectionView.showsVerticalScrollIndicator = NO;
    
    //  ios 10 提供了一个预加载, 预加载提供collectionview的性能,提起给会把下一个显示的cell给你准备好.
//    self.homeCollectionView.prefetchingEnabled = YES;
}

# pragma mark - 数据源
//行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.channelModelArr.count;
}

//cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"newsCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1];
    
    
    return cell;
}
@end
