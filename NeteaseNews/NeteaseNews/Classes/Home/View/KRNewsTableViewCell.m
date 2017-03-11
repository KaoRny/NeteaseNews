//
//  KRNewsTableViewCell.m
//  NeteaseNews
//
//  Created by KaoRny on 17/3/11.
//  Copyright © 2017年 KaoRny. All rights reserved.
//

#import "KRNewsTableViewCell.h"
#import <UIImageView+WebCache.h>
@interface KRNewsTableViewCell ()
//新闻图片
@property (weak, nonatomic) IBOutlet UIImageView *imgsrcImageView;
//新闻标题
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
//新闻来源
@property (weak, nonatomic) IBOutlet UILabel *lblSource;
//回复数据
@property (weak, nonatomic) IBOutlet UILabel *lblReplyCount;

@end

@implementation KRNewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    //  设置安装图片原始比例显示,但是会有图片超出情况
    self.imgsrcImageView.contentMode = UIViewContentModeScaleAspectFill;
    //超出部分裁剪
    self.imgsrcImageView.clipsToBounds = YES;
    
}

- (void)setNewsModel:(KRNewsModel *)newsModel
{
    _newsModel = newsModel;
    
    //新闻图片
    [self.imgsrcImageView sd_setImageWithURL:[NSURL URLWithString:newsModel.imgsrc] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    //标题
    self.lblTitle.text = newsModel.title;
    //来源
    self.lblSource.text = newsModel.source;
    //回复数
    self.lblReplyCount.text = [NSString stringWithFormat:@"%zd", newsModel.replyCount];
    
}


@end
