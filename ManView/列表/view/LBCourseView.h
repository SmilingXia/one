//
//  LBCourseView.h
//  ManView
//
//  Created by xia on 2017/1/23.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZDYCourseDictVO.h"

typedef NS_ENUM(NSInteger, onClickButtonType) {
    onClickButtonTypeQD = 10000,
    onClickButtonTypeQX,
};

typedef void(^ButtonReturn)(onClickButtonType,NSInteger);

@interface LBCourseView : UIView

@property (nonatomic, copy) ButtonReturn buttonReturn;

/**
 *
 */
@property (nonatomic, strong) ZDYCourseDictVO *courseDict;

@end
