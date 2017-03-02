//
//  FXTableViewCellHeigth.m
//  ManView
//
//  Created by xia on 2017/3/2.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "FXTableViewCellFrame.h"

static float imageHeigth = 50.0f;
static float imageWidth = 50.0f;
static float rightimageWidth = 20.0f;
static float labelNameHeigth = 20.0f;
static float dividingLineHeigth = 0.5f;
static float cellTopMargin = 20.0f;
static float cellBottomMargin = 20.0f;
static float contentLeftMargin = 30.0f;
static float padding = 10.0f;

@implementation FXTableViewCellFrame

- (void)setFxDataSourceModel:(FXDataSourceModel *)fxDataSourceModel{
    _fxDataSourceModel = fxDataSourceModel;
    //头像
    self.avatarViewFrame = CGRectMake(padding, cellTopMargin, imageWidth, imageHeigth);
    
    //昵称
    // 昵称的x = 头像最大的x + 间隙
    CGFloat nameXmargin = CGRectGetMaxX(self.avatarViewFrame) + padding;
    self.labelNameFrame = CGRectMake(nameXmargin, cellTopMargin,SCREEN_W - nameXmargin - rightimageWidth - padding, labelNameHeigth);
    
    //时间
    CGFloat dataYmargin = CGRectGetMaxY(self.labelNameFrame) + padding;
    self.labelDataFrame = CGRectMake(nameXmargin, dataYmargin, SCREEN_W - nameXmargin - rightimageWidth - padding, labelNameHeigth);
    
    //内容 高度根据文字内容来进行计算
    CGFloat contenYmargin = CGRectGetMaxY(self.avatarViewFrame) + padding;
    NSString *contentText = [self.fxDataSourceModel.text stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    CGFloat contentH = [UrlNSstring labHeigth:contentText andFont:ZDYTextFont(15.0f) andMargin:(rightimageWidth + contentLeftMargin + padding)];
    self.labelContenFrame = CGRectMake(contentLeftMargin, contenYmargin, SCREEN_W - rightimageWidth - padding - contentLeftMargin, contentH);
    
    //分割的frame - dividingLineFrame
    CGFloat lineYmargin = CGRectGetMaxY(self.labelContenFrame) + cellBottomMargin;
    self.dividingLineFrame = CGRectMake(0, lineYmargin, SCREEN_W, dividingLineHeigth);
    
    //计算整个cell的高度
    self.cellHeight = CGRectGetMaxY(self.dividingLineFrame);
    
    //右边图片的frame
    self.rightImageViewFrame = CGRectMake(SCREEN_W - rightimageWidth, 0, rightimageWidth, self.cellHeight - dividingLineHeigth);
}

@end
