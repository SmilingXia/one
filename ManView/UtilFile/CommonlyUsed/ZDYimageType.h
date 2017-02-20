//
//  ZDYimageType.h
//  ManView
//
//  Created by xia on 2017/1/18.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZDYimageType : NSObject

/**
 *  全圆
 */
+ (CAShapeLayer *)quanYuanjiao:(CGRect)boundS;

/**
 *  半圆
 */
+ (CAShapeLayer *)banYuanjiao:(CGRect)boundS;

@end
