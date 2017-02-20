//
//  XJFCourseButtonData.h
//  ManView
//
//  Created by xia on 2017/1/24.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "JSONModel.h"

@interface XJFCourseButtonData : JSONModel

/**
 * 按钮类型
 */
@property (nonatomic, assign) int btnType;

/**
 * 按钮标题
 */
@property (nonatomic, copy) NSString *btnName;

/**
 * 按钮上小图标
 */
@property (nonatomic, copy) NSString *btnImgName;

/**
 * 点击状态下 按钮上小图标
 */
@property (nonatomic, copy) NSString *btnImgName2;


@end
