//
//  LBSCrollViewAN.h
//  ManView
//
//  Created by xia on 2017/1/17.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZDYCourseCategoriesVO.h"

//LeftView按钮类型
typedef NS_ENUM(NSInteger, viewTypeInfo) {
    viewTypeInfoKC = 0,
    viewTypeInfoMK,
};


typedef void(^ANTouchEvent)(NSInteger);

@interface LBSCrollViewAN : UIScrollView

@property (nonatomic, strong) ZDYCourseCategoriesVO *XJFCourseCategoriesVO;

@property (nonatomic, strong) NSMutableArray *courseMokuai;

@property (nonatomic, assign) viewTypeInfo viewTypeInfo;

/**
 *  触摸view视图回调
 */
@property (nonatomic, copy) ANTouchEvent anTouchEvent;

@end
