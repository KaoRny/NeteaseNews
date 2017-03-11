//
//  KRNewsTableViewController.m
//  NeteaseNews
//
//  Created by KaoRny on 17/3/10.
//  Copyright © 2017年 KaoRny. All rights reserved.
//

#import "KRNewsTableViewController.h"
#import "KRNetworkTools.h"
#import "KRNewsModel.h"
#import "KRNewsTableViewCell.h"
@interface KRNewsTableViewController ()
//新闻列表数据源
@property (nonatomic, strong) NSArray *newsModelArr;

@end

@implementation KRNewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupTableView];
}


- (void) setupTableView
{
    //注册单元格
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"KRNewsTableViewCell" bundle:nil] forCellReuseIdentifier:@"basecell"];
}

- (void)setUrlStr:(NSString *)urlStr
{
    _urlStr = urlStr;
    
    //根据网络请求的地址加载网络数据
//    NSLog(@"%@", urlStr);
    
//    [[KRNetworkTools sharedTools] requestWithType:GET andUrlStr:@"T1348648037603/0-20.html" andParams:nil andSuccess:^(id responseObject) {
//        
//        NSLog(@"responseObject%@", responseObject);
//        
//        NSDictionary *dic = (NSDictionary *)responseObject;
//        
//        NSString *key = dic.allKeys.firstObject;
//        
//        NSArray *dicArr = [dic objectForKey:key];
//        
//        NSLog(@"%@", dicArr);
//        
//    } andFailure:^(NSError *error) {
//        
//        NSLog(@"error%@", error);
//        
//    }];
    [KRNewsModel requestNewsModelArr:urlStr andCompletionBlock:^(NSArray *modelArr) {
       
        self.newsModelArr = modelArr;
        //获取数据
        [self.tableView reloadData];
    }];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.newsModelArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KRNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basecell" forIndexPath:indexPath];
    
    KRNewsModel *model = self.newsModelArr[indexPath.row];
    //显示新闻标题
//    cell.textLabel.text = model.title;
    
    cell.newsModel = model;
    
    return cell;
}

//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

@end
