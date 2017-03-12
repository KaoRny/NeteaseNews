//
//  KRChannelLable.m
//  NeteaseNews
//
//  Created by KaoRny on 17/3/10.
//  Copyright © 2017年 KaoRny. All rights reserved.
//

#import "KRChannelLable.h"

@implementation KRChannelLable

- (void)setPercent:(CGFloat)percent
{
    _percent = percent;
    // Percent取值范围0-1
    self.textColor = [UIColor colorWithRed:percent green:0 blue:0 alpha:1];
    //  计算缩放比,最小的缩放比就是1
    CGFloat currentPercent = 1 + percent * .3;
    self.transform = CGAffineTransformMakeScale(currentPercent, currentPercent);
}

@end
