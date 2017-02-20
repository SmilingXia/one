//
//  ZDYDateStorageDanli.m
//  ManView
//
//  Created by xia on 2017/1/12.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "ZDYDateStorageDanli.h"

@implementation ZDYDateStorageDanli

#pragma mark - 2️⃣定义一个静态的类对象
static ZDYDateStorageDanli *dateStorageDanli = nil;

#pragma mark - 3️⃣实现初始化方法并返回2️⃣实例对象
+(ZDYDateStorageDanli *)initialization{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        dateStorageDanli = [[self alloc] init];
    });
    return dateStorageDanli;
}

- (void)setXZCourse:(ZDYCourseCategoriesVO *)XZCourse{
    _XZCourse = XZCourse;
    [ZDYDateStorageDanli initialization].controllerViewTitle = _XZCourse.title;
}

@end
