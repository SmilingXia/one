//
//  ZDYNotificationCenter.m
//  ManView
//
//  Created by xia on 2017/1/17.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "ZDYNotificationCenter.h"
#import "XJFCommonmacro.h"
#import "ZDYDateStorageDanli.h"

@implementation ZDYNotificationCenter

+ (void)updateCourse:(NSDictionary *)sender{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:ZDY_GX_KECHENG_MENLEI object:nil userInfo:sender];
}

@end
