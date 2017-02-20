//
//  ZDYCourseDictVO.m
//  ManView
//
//  Created by xia on 2017/1/24.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "ZDYCourseDictVO.h"

@implementation ZDYCourseDictVO

@end

@implementation ZDYCourseInfoVO

-(NSString *)title{
    if (_title == nil) {
        return @"";
    }else{
        return [UrlNSstring decodeFromPercentEscapeString:_title];
    }
}

@end
