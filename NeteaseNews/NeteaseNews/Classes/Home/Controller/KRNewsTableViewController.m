//
//  KRNewsTableViewController.m
//  NeteaseNews
//
//  Created by KaoRny on 17/3/10.
//  Copyright © 2017年 KaoRny. All rights reserved.
//

#import "KRNewsTableViewController.h"
#import "KRNetworkTools.h"
@interface KRNewsTableViewController ()

@end

@implementation KRNewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)setUrlStr:(NSString *)urlStr
{
    _urlStr = urlStr;
    
    //根据网络请求的地址加载网络数据
    NSLog(@"%@", urlStr);
    
    [[KRNetworkTools sharedTools] requestWithType:GET andUrlStr:@"T1348648037603/0-20.html" andParams:nil andSuccess:^(id responseObject) {
        
        NSLog(@"responseObject%@", responseObject);
        
        NSDictionary *dic = (NSDictionary *)responseObject;
        
        NSString *key = dic.allKeys.firstObject;
        
        NSArray *dicArr = [dic objectForKey:key];
        
    } andFailure:^(NSError *error) {
        
        NSLog(@"error%@", error);
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/


@end
