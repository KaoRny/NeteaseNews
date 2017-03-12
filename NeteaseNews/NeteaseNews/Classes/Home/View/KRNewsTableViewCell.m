//
//  KRNewsTableViewCell.m
//  NeteaseNews
//
//  Created by KaoRny on 17/3/11.
//  Copyright © 2017年 KaoRny. All rights reserved.
//

#import "KRNewsTableViewCell.h"
#import <UIImageView+WebCache.h>
#import "KRPicture.h"
@interface KRNewsTableViewCell ()
//新闻图片
@property (weak, nonatomic) IBOutlet UIImageView *imgsrcImageView;
//新闻标题
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
//新闻来源
@property (weak, nonatomic) IBOutlet UILabel *lblSource;
//回复数据
@property (weak, nonatomic) IBOutlet UILabel *lblReplyCount;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *iconImagesView;

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
    
    //遍历多图数组
    for (int i = 0; i < self.iconImagesView.count; i++) {
        //获取对应的图片字典
//        NSDictionary *dic = newsModel.imgextra[i];
//        //通过key获取图片地址
//        NSString *imagePath = [dic objectForKey:@"imgsrc"];
        
        //根据下标获取对应的模型
        KRPicture *picture = newsModel.imgextra[i];
        //获取对应的imageview
        UIImageView *imageView = self.iconImagesView[i];
        //给imageView设置网络图片
//        [imageView sd_setImageWithURL:[NSURL URLWithString:imagePath] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
         [imageView sd_setImageWithURL:[NSURL URLWithString:picture.imgsrc] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    }
    
    
}


@end

