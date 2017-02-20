//
//  ZDYimageType.m
//  ManView
//
//  Created by xia on 2017/1/18.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "ZDYimageType.h"

@implementation ZDYimageType


+ (CAShapeLayer *)quanYuanjiao:(CGRect)boundS{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:boundS byRoundingCorners:UIRectCornerAllCorners cornerRadii:boundS.size];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = boundS;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    
    return maskLayer;
}

+(CAShapeLayer *)banYuanjiao:(CGRect)boundS{
    
    //CGSize boundSsize = CGSizeMake(5,0);
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:boundS byRoundingCorners:UIRectCornerAllCorners cornerRadii:boundS.size];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = boundS;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    
    return maskLayer;
}

@end
