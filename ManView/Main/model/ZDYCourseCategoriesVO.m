//
//  ZDYCourseCategoriesVO.m
//  ManView
//
//  Created by xia on 2017/1/13.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "ZDYCourseCategoriesVO.h"

@implementation ZDYMenLeiVO

@end

@implementation ZDYCourseCategoriesVO

-(NSString *)title{
    if (_title == nil) {
        return @"";
    }else{
        return [UrlNSstring decodeFromPercentEscapeString:_title];
    }
}

@end

@implementation ZDYCourseVO

-(NSString *)title{
    if (_title == nil) {
        return @"";
    }else{
        return [UrlNSstring decodeFromPercentEscapeString:_title];
    }
}

@end

