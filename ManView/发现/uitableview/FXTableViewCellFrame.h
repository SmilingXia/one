//
//  FXTableViewCellHeigth.h
//  ManView
//
//  Created by xia on 2017/3/2.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FXDataSourceModel.h"
#import "XJFCommonmacro.h"
#import "UrlNSstring.h"

@interface FXTableViewCellFrame : NSObject

/**
 *  头像的frame
 */
@property (nonatomic, assign) CGRect avatarViewFrame;
/**
 *  用户昵称的frame
 */
@property (nonatomic, assign) CGRect labelNameFrame;
/**
 *  日期的frame
 */
@property (nonatomic, assign) CGRect labelDataFrame;
/**
 *  内容的frame
 */
@property (nonatomic, assign) CGRect labelContenFrame;
/**
 *  分割线的frame
 */
@property (nonatomic, assign) CGRect dividingLineFrame;
/**
 *  右边图片的frame
 */
@property (nonatomic, assign) CGRect rightImageViewFrame;

/**
 *  整个cell的高度
 */
@property (nonatomic, assign) CGFloat cellHeight;

/**
 *  数据模型
 */
@property (nonatomic, strong) FXDataSourceModel *fxDataSourceModel;

@end
