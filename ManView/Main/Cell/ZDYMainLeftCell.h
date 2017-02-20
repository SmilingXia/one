//
//  ZDYMainLeftCell.h
//  ManView
//
//  Created by xia on 2017/1/5.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDYMainLeftCell : UITableViewCell


@property (nonatomic,strong) NSIndexPath *selfIndexPath;//当前cell的path

@property (nonatomic, strong) UIImage *cellLeftImage;//左边的图片

@property (nonatomic, assign) BOOL selectedimage;

@property (nonatomic, strong) UIImage *cellRightImage;//右边图片

@property (nonatomic, strong) NSString *cellCenterText;//中间文字

//是否显示左右边的图片
- (void)isDisplayedLeftImage:(BOOL)yesAndnoLeft andIsDisplayedRightImage:(BOOL)yesAndnoRight;

//传递当前cell的宽度与高度
- (void)setWithCellHeigth:(float)cellHeigth andCellWidth:(float)cellWidth;

@end
